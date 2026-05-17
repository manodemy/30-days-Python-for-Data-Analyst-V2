-- ============================================================================
-- 021_engagement_all_users.sql
-- GUARANTEED to return ALL users in profiles table, even with zero engagement.
-- 
-- KEY FIXES vs previous versions:
--   1. ALL users from profiles always appear (LEFT JOIN guarantees this)
--   2. Both active_seconds (heartbeat) AND duration_seconds (session_end) captured
--   3. page_url normalized to bare filename (day01.html not /manodemy_web/day01.html)
--   4. Users with no engagement get page_metrics = {} and still appear
--   5. date range params only filter activity — profile list is never filtered
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
  -- Admin gate: must be authenticated as an admin
  IF NOT EXISTS (
    SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin'
  ) THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  RETURN QUERY
  WITH

  -- ── 1. Normalize page_url to bare filename ───────────────────────────────
  --    /manodemy_web/day01.html  →  day01.html
  --    /day01.html               →  day01.html
  --    day01.html                →  day01.html (unchanged)
  norm_views AS (
    SELECT
      user_id,
      session_id,
      REGEXP_REPLACE(page_url, '^.+/', '')  AS page_key,
      created_at
    FROM public.page_views
    WHERE created_at BETWEEN start_ts AND end_ts
      AND user_id IS NOT NULL
      AND page_url IS NOT NULL
  ),

  norm_logs AS (
    SELECT
      user_id,
      event_type,
      -- page_url in metadata takes priority (telemetry writes it there too)
      REGEXP_REPLACE(
        COALESCE(
          NULLIF(metadata->>'page_url', ''),
          NULLIF(page_url, ''),
          ''
        ),
        '^.+/', ''
      ) AS page_key,
      metadata
    FROM public.activity_logs
    WHERE created_at BETWEEN start_ts AND end_ts
      AND user_id IS NOT NULL
  ),

  -- ── 2. Visits = distinct sessions per user per page ──────────────────────
  visits_agg AS (
    SELECT
      user_id,
      page_key,
      COUNT(DISTINCT session_id) AS visits
    FROM norm_views
    WHERE page_key IS NOT NULL AND page_key <> ''
    GROUP BY user_id, page_key
  ),

  -- ── 3. Time spent: take MAX(active_seconds OR duration_seconds) per session
  --       then SUM across all sessions for that page.
  --       This correctly handles both heartbeat events and session_end events.
  time_agg AS (
    SELECT
      user_id,
      page_key,
      SUM(best_secs) AS time_spent_seconds
    FROM (
      SELECT
        user_id,
        page_key,
        COALESCE(metadata->>'session_id', gen_random_uuid()::text) AS sess_id,
        GREATEST(
          COALESCE(NULLIF(metadata->>'active_seconds',   '')::NUMERIC, 0),
          COALESCE(NULLIF(metadata->>'duration_seconds', '')::NUMERIC, 0)
        ) AS best_secs
      FROM norm_logs
      WHERE event_type IN ('session_heartbeat', 'session_end')
        AND page_key IS NOT NULL AND page_key <> ''
        AND (
          metadata->>'active_seconds'   IS NOT NULL OR
          metadata->>'duration_seconds' IS NOT NULL
        )
    ) per_session
    GROUP BY user_id, page_key
  ),

  -- ── 4. Questions solved per user per page ─────────────────────────────────
  questions_agg AS (
    SELECT
      user_id,
      page_key,
      COUNT(*) AS questions_solved
    FROM norm_logs
    WHERE event_type IN ('question_solved', 'exercise_completed', 'answer_submitted', 'quiz_completed')
      AND page_key IS NOT NULL AND page_key <> ''
    GROUP BY user_id, page_key
  ),

  -- ── 5. Union all page keys that have ANY data ─────────────────────────────
  all_pages AS (
    SELECT user_id, page_key FROM visits_agg
    UNION
    SELECT user_id, page_key FROM time_agg
    UNION
    SELECT user_id, page_key FROM questions_agg
  ),

  -- ── 6. Merge metrics, defaulting to 0 ────────────────────────────────────
  user_pages AS (
    SELECT
      ap.user_id                              AS uid,
      ap.page_key,
      COALESCE(va.visits, 0)                  AS visits,
      COALESCE(ta.time_spent_seconds, 0)      AS time_spent,
      COALESCE(qa.questions_solved, 0)        AS questions_solved
    FROM all_pages ap
    LEFT JOIN visits_agg    va ON va.user_id = ap.user_id AND va.page_key = ap.page_key
    LEFT JOIN time_agg      ta ON ta.user_id = ap.user_id AND ta.page_key = ap.page_key
    LEFT JOIN questions_agg qa ON qa.user_id = ap.user_id AND qa.page_key = ap.page_key
  ),

  -- ── 7. Roll up into JSONB per user ────────────────────────────────────────
  aggregated_metrics AS (
    SELECT
      uid,
      jsonb_object_agg(
        page_key,
        jsonb_build_object(
          'visits',             visits,
          'time_spent_seconds', time_spent,
          'questions_solved',   questions_solved
        )
      ) AS page_metrics
    FROM user_pages
    GROUP BY uid
  ),

  -- ── 8. ALL profiles — never filtered, always full list ───────────────────
  user_profiles AS (
    SELECT
      p.id           AS uid,
      p.full_name,
      p.email,
      p.country,
      p.created_at   AS signed_up_at,
      -- Last seen = most recent activity from either table (all-time, not date filtered)
      GREATEST(
        (SELECT MAX(created_at) FROM public.activity_logs WHERE user_id = p.id),
        (SELECT MAX(created_at) FROM public.page_views     WHERE user_id = p.id)
      )              AS last_seen_at,
      -- Plan from latest purchase
      COALESCE((
        SELECT CASE WHEN status = 'completed' THEN 'paid' ELSE status END
        FROM public.purchases
        WHERE user_id = p.id
        ORDER BY created_at DESC
        LIMIT 1
      ), 'free')     AS plan
    FROM public.profiles p
    -- Only exclude system/admin accounts from the engagement view
    WHERE p.email IS NOT NULL
  )

  -- ── 9. Final join: ALL users LEFT JOIN metrics (zeros if no data) ─────────
  SELECT
    prf.uid                                             AS user_id,
    COALESCE(prf.full_name, '')                         AS full_name,
    COALESCE(prf.email, '')                             AS email,
    prf.country,
    prf.plan,
    prf.signed_up_at,
    prf.last_seen_at,
    COALESCE(am.page_metrics, '{}'::JSONB)              AS page_metrics
  FROM user_profiles prf
  LEFT JOIN aggregated_metrics am ON am.uid = prf.uid
  ORDER BY prf.last_seen_at DESC NULLS LAST,
           prf.signed_up_at  DESC NULLS LAST;

END;
$$;

-- Permissions
REVOKE ALL ON FUNCTION public.get_user_page_engagement(TIMESTAMPTZ, TIMESTAMPTZ) FROM PUBLIC;
GRANT  EXECUTE ON FUNCTION public.get_user_page_engagement(TIMESTAMPTZ, TIMESTAMPTZ) TO authenticated;
