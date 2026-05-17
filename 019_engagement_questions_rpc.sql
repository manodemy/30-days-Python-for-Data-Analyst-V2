-- ============================================================================
-- 019_engagement_questions_rpc.sql
-- Extends get_user_page_engagement to include questions_solved per page.
-- Drop old version and recreate with questions_solved in page_metrics JSONB.
-- ============================================================================

DROP FUNCTION IF EXISTS public.get_user_page_engagement(TIMESTAMPTZ, TIMESTAMPTZ);

CREATE OR REPLACE FUNCTION public.get_user_page_engagement(
  start_ts TIMESTAMPTZ DEFAULT '2000-01-01'::TIMESTAMPTZ,
  end_ts   TIMESTAMPTZ DEFAULT '2099-01-01'::TIMESTAMPTZ
)
RETURNS TABLE (
  user_id      UUID,
  full_name    TEXT,
  email        TEXT,
  country      TEXT,
  plan         TEXT,
  signed_up_at TIMESTAMPTZ,
  last_seen_at TIMESTAMPTZ,
  page_metrics JSONB
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  -- Admin gate
  IF NOT EXISTS (
    SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin'
  ) THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  RETURN QUERY
  WITH

  -- ── 1. Visits per user per page ──────────────────────────────────────────
  visits_agg AS (
    SELECT
      pv.user_id,
      pv.page_url,
      COUNT(DISTINCT pv.session_id) AS visits
    FROM public.page_views pv
    WHERE pv.created_at BETWEEN start_ts AND end_ts
      AND pv.user_id IS NOT NULL
    GROUP BY pv.user_id, pv.page_url
  ),

  -- ── 2. Time spent per user per page ──────────────────────────────────────
  time_agg AS (
    SELECT
      sess_times.user_id,
      sess_times.page_url,
      SUM(sess_times.time_s) AS time_spent
    FROM (
      SELECT
        al.user_id,
        al.page_url,
        al.metadata->>'session_id'                              AS sess,
        MAX((al.metadata->>'active_seconds')::numeric)          AS time_s
      FROM public.activity_logs al
      WHERE al.event_type IN ('session_heartbeat', 'session_end')
        AND al.created_at BETWEEN start_ts AND end_ts
        AND al.user_id IS NOT NULL
        AND al.metadata->>'active_seconds' IS NOT NULL
      GROUP BY al.user_id, al.page_url, al.metadata->>'session_id'
    ) sess_times
    GROUP BY sess_times.user_id, sess_times.page_url
  ),

  -- ── 3. Questions solved per user per page ─────────────────────────────────
  -- Counts distinct question_id submissions from activity_logs
  -- event_type = 'question_solved' or 'exercise_completed'
  questions_agg AS (
    SELECT
      al.user_id,
      al.page_url,
      COUNT(DISTINCT COALESCE(al.metadata->>'question_id', al.metadata->>'exercise_id', al.id::text)) AS questions_solved
    FROM public.activity_logs al
    WHERE al.event_type IN ('question_solved', 'exercise_completed', 'answer_submitted', 'quiz_completed')
      AND al.created_at BETWEEN start_ts AND end_ts
      AND al.user_id IS NOT NULL
    GROUP BY al.user_id, al.page_url
  ),

  -- ── 4. Union all pages per user ──────────────────────────────────────────
  all_pages AS (
    SELECT user_id, page_url FROM visits_agg
    UNION
    SELECT user_id, page_url FROM time_agg
    UNION
    SELECT user_id, page_url FROM questions_agg
  ),

  -- ── 5. Merge all metrics ─────────────────────────────────────────────────
  user_pages AS (
    SELECT
      ap.user_id       AS uid,
      ap.page_url,
      COALESCE(va.visits, 0)             AS visits,
      COALESCE(ta.time_spent, 0)         AS time_spent,
      COALESCE(qa.questions_solved, 0)   AS questions_solved
    FROM all_pages ap
    LEFT JOIN visits_agg    va ON va.user_id = ap.user_id AND va.page_url = ap.page_url
    LEFT JOIN time_agg      ta ON ta.user_id = ap.user_id AND ta.page_url = ap.page_url
    LEFT JOIN questions_agg qa ON qa.user_id = ap.user_id AND qa.page_url = ap.page_url
    WHERE ap.page_url IS NOT NULL
  ),

  -- ── 6. Aggregate metrics into JSONB per user ──────────────────────────────
  aggregated_metrics AS (
    SELECT
      uid,
      jsonb_object_agg(
        page_url,
        jsonb_build_object(
          'visits',            visits,
          'time_spent_seconds', time_spent,
          'questions_solved',   questions_solved
        )
      ) AS page_metrics
    FROM user_pages
    GROUP BY uid
  ),

  -- ── 7. User profiles ──────────────────────────────────────────────────────
  user_profiles AS (
    SELECT
      p.id                                                                    AS uid,
      p.full_name,
      p.email,
      p.country,
      p.created_at                                                             AS signed_up_at,
      (SELECT MAX(created_at) FROM public.activity_logs WHERE user_id = p.id) AS last_seen_at,
      COALESCE((
        SELECT CASE WHEN status = 'completed' THEN 'paid' ELSE status END
        FROM public.purchases
        WHERE user_id = p.id
        ORDER BY created_at DESC LIMIT 1
      ), 'free')                                                               AS plan
    FROM public.profiles p
  )

  SELECT
    prf.uid,
    COALESCE(prf.full_name, ''),
    COALESCE(prf.email, ''),
    prf.country,
    prf.plan,
    prf.signed_up_at,
    prf.last_seen_at,
    COALESCE(am.page_metrics, '{}'::jsonb) AS page_metrics
  FROM user_profiles prf
  LEFT JOIN aggregated_metrics am ON am.uid = prf.uid
  ORDER BY prf.last_seen_at DESC NULLS LAST;
END;
$$;

REVOKE ALL ON FUNCTION public.get_user_page_engagement(TIMESTAMPTZ, TIMESTAMPTZ) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.get_user_page_engagement(TIMESTAMPTZ, TIMESTAMPTZ) TO authenticated;
