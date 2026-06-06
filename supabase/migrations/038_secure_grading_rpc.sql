-- ═══════════════════════════════════════════════════════════════
-- Migration: 038_secure_grading_rpc.sql
-- Description: 1. Updates get_user_page_engagement to securely filter
--                 unverified client-side metrics for new logs.
--              2. Creates public.get_user_progress RPC to securely sync
--                 and restore student progress across devices.
-- ═══════════════════════════════════════════════════════════════

-- 1. Secure get_user_page_engagement by overriding it
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
  IF NOT EXISTS (
    SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin'
  ) THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  RETURN QUERY
  WITH

  -- Strip page_url to bare filename: /any/path/day01.html → day01.html
  norm_views AS (
    SELECT
      pv.user_id                              AS uid,
      pv.session_id,
      CASE
        WHEN pv.page_url = '/' THEN 'index.html'
        ELSE REGEXP_REPLACE(pv.page_url, '^.+/', '')
      END AS page_key
    FROM public.page_views pv
    WHERE pv.created_at BETWEEN start_ts AND end_ts
      AND pv.user_id IS NOT NULL
      AND pv.page_url IS NOT NULL
  ),

  norm_logs AS (
    SELECT
      al.user_id                              AS uid,
      al.event_type,
      al.created_at,
      CASE
        WHEN COALESCE(NULLIF(al.metadata->>'page_url', ''), NULLIF(al.page_url, ''), '') = '/' THEN 'index.html'
        ELSE REGEXP_REPLACE(
          COALESCE(
            NULLIF(al.metadata->>'page_url', ''),
            NULLIF(al.page_url, ''),
            ''
          ), '^.+/', ''
        )
      END AS page_key,
      al.metadata
    FROM public.activity_logs al
    WHERE al.created_at BETWEEN start_ts AND end_ts
      AND al.user_id IS NOT NULL
  ),

  -- Visits count
  visits_agg AS (
    SELECT
      nv.uid,
      nv.page_key,
      COUNT(*) AS visits
    FROM norm_views nv
    WHERE nv.page_key IS NOT NULL AND nv.page_key <> ''
    GROUP BY nv.uid, nv.page_key
  ),

  -- Time spent Strategy A: notebook_state_synctimer
  sync_time AS (
    SELECT
      nl.uid,
      nl.page_key,
      MAX(COALESCE(NULLIF(nl.metadata->>'active_seconds', '')::NUMERIC, 0)) AS total_secs
    FROM norm_logs nl
    WHERE nl.event_type = 'notebook_state_sync'
      AND nl.page_key IS NOT NULL AND nl.page_key <> ''
      AND nl.metadata->>'active_seconds' IS NOT NULL
    GROUP BY nl.uid, nl.page_key
  ),

  -- Time spent Strategy B: sessions
  session_time AS (
    SELECT
      ps.uid,
      ps.page_key,
      SUM(ps.max_secs) AS total_secs
    FROM (
      SELECT
        nl.uid,
        nl.page_key,
        COALESCE(nl.metadata->>'session_id', nl.uid::text || '_' || nl.page_key) AS sess_id,
        MAX(
          GREATEST(
            COALESCE(NULLIF(nl.metadata->>'active_seconds',   '')::NUMERIC, 0),
            COALESCE(NULLIF(nl.metadata->>'duration_seconds', '')::NUMERIC, 0)
          )
        ) AS max_secs
      FROM norm_logs nl
      WHERE nl.event_type IN ('session_heartbeat', 'session_end')
        AND nl.page_key IS NOT NULL AND nl.page_key <> ''
        AND (
          nl.metadata->>'active_seconds'   IS NOT NULL OR
          nl.metadata->>'duration_seconds' IS NOT NULL
        )
        AND COALESCE(nl.metadata->>'session_id', '') NOT LIKE 'notebook_sync_%'
      GROUP BY nl.uid, nl.page_key, COALESCE(nl.metadata->>'session_id', nl.uid::text || '_' || nl.page_key)
    ) ps
    GROUP BY ps.uid, ps.page_key
  ),

  -- Combined Time spent
  time_agg AS (
    SELECT
      COALESCE(st.uid, tt.uid)             AS uid,
      COALESCE(st.page_key, tt.page_key)   AS page_key,
      GREATEST(
        COALESCE(st.total_secs, 0),
        COALESCE(tt.total_secs, 0)
      ) AS time_spent_seconds
    FROM sync_time st
    FULL OUTER JOIN session_time tt
      ON tt.uid = st.uid AND tt.page_key = st.page_key
  ),

  -- Questions Solved: Source A (historical sync before June 1, 2026 only)
  sync_questions AS (
    SELECT
      nl.uid,
      nl.page_key,
      MAX(
        CASE 
          WHEN nl.created_at >= '2026-06-01'::TIMESTAMPTZ THEN 0
          ELSE COALESCE(NULLIF(nl.metadata->>'solved_count', '')::INTEGER, 0)
        END
      ) AS solved
    FROM norm_logs nl
    WHERE nl.event_type = 'notebook_state_sync'
      AND nl.page_key IS NOT NULL AND nl.page_key <> ''
      AND nl.metadata->>'solved_count' IS NOT NULL
    GROUP BY nl.uid, nl.page_key
  ),

  -- Questions Solved: Source B (cryptographically verified individual solves)
  individual_questions AS (
    SELECT
      nl.uid,
      nl.page_key,
      COUNT(DISTINCT COALESCE(nl.metadata->>'question_id', nl.metadata->>'cell_id')) AS solved
    FROM norm_logs nl
    WHERE nl.event_type IN ('question_solved', 'exercise_completed', 'answer_submitted', 'quiz_completed')
      AND nl.page_key IS NOT NULL AND nl.page_key <> ''
      AND (nl.metadata->>'question_id' IS NOT NULL OR nl.metadata->>'cell_id' IS NOT NULL)
    GROUP BY nl.uid, nl.page_key
  ),

  -- Combined Questions Solved
  questions_agg AS (
    SELECT
      COALESCE(sq.uid, iq.uid)             AS uid,
      COALESCE(sq.page_key, iq.page_key)   AS page_key,
      GREATEST(
        COALESCE(sq.solved, 0),
        COALESCE(iq.solved, 0)
      ) AS questions_solved
    FROM sync_questions sq
    FULL OUTER JOIN individual_questions iq
      ON iq.uid = sq.uid AND iq.page_key = sq.page_key
  ),

  -- Improve clicks
  improve_clicks_agg AS (
    SELECT
      nl.uid,
      nl.page_key,
      GREATEST(
        COUNT(*) FILTER (WHERE nl.event_type = 'challenge_started'),
        MAX(COALESCE(NULLIF(nl.metadata->>'improve_clicks', '')::INTEGER, 0))
          FILTER (WHERE nl.event_type = 'notebook_state_sync')
      ) AS improve_score_clicks
    FROM norm_logs nl
    WHERE nl.event_type IN ('challenge_started', 'notebook_state_sync')
      AND nl.page_key IS NOT NULL AND nl.page_key <> ''
    GROUP BY nl.uid, nl.page_key
  ),

  -- Current Marks (Score)
  current_marks_agg AS (
    SELECT
      nl.uid,
      nl.page_key,
      MAX(
        CASE
          WHEN nl.created_at >= '2026-06-01'::TIMESTAMPTZ THEN 0
          ELSE COALESCE(NULLIF(nl.metadata->>'best_score', '')::NUMERIC, 0)
        END
      ) AS current_marks
    FROM norm_logs nl
    WHERE nl.event_type = 'notebook_state_sync'
      AND nl.page_key IS NOT NULL AND nl.page_key <> ''
      AND nl.metadata->>'best_score' IS NOT NULL
    GROUP BY nl.uid, nl.page_key
  ),

  -- Merge metrics
  all_pages AS (
    SELECT va.uid, va.page_key FROM visits_agg      va
    UNION
    SELECT ta.uid, ta.page_key FROM time_agg        ta
    UNION
    SELECT qa.uid, qa.page_key FROM questions_agg   qa
    UNION
    SELECT ia.uid, ia.page_key FROM improve_clicks_agg ia
    UNION
    SELECT ca.uid, ca.page_key FROM current_marks_agg  ca
  ),

  user_pages AS (
    SELECT
      ap.uid,
      ap.page_key,
      COALESCE(va.visits,                  0)   AS visits,
      COALESCE(ta.time_spent_seconds,      0)   AS time_spent,
      COALESCE(qa.questions_solved,        0)   AS questions_solved,
      COALESCE(ia.improve_score_clicks,    0)   AS improve_score_clicks,
      GREATEST(
        COALESCE(ca.current_marks,           0),
        -- For new verified logs, calculate XP score securely from valid individual solves
        COALESCE(qa.questions_solved,        0) * (1000.0 / 1540.0)
      ) AS current_marks
    FROM all_pages ap
    LEFT JOIN visits_agg         va ON va.uid = ap.uid AND va.page_key = ap.page_key
    LEFT JOIN time_agg           ta ON ta.uid = ap.uid AND ta.page_key = ap.page_key
    LEFT JOIN questions_agg      qa ON qa.uid = ap.uid AND qa.page_key = ap.page_key
    LEFT JOIN improve_clicks_agg ia ON ia.uid = ap.uid AND ia.page_key = ap.page_key
    LEFT JOIN current_marks_agg  ca ON ca.uid = ap.uid AND ca.page_key = ap.page_key
  ),

  aggregated_metrics AS (
    SELECT
      up.uid,
      jsonb_object_agg(
        up.page_key,
        jsonb_build_object(
          'visits',               up.visits,
          'time_spent_seconds',   up.time_spent,
          'questions_solved',     up.questions_solved,
          'improve_score_clicks', up.improve_score_clicks,
          'current_marks',        up.current_marks
        )
      ) AS metrics
    FROM user_pages up
    GROUP BY up.uid
  ),

  user_profiles AS (
    SELECT
      p.id           AS uid,
      p.full_name    AS p_name,
      p.email        AS p_email,
      p.country      AS p_country,
      p.created_at   AS p_signed_up,
      GREATEST(
        (SELECT MAX(al2.created_at) FROM public.activity_logs al2 WHERE al2.user_id = p.id),
        (SELECT MAX(pv2.created_at) FROM public.page_views    pv2 WHERE pv2.user_id = p.id)
      )              AS p_last_seen,
      COALESCE((
        SELECT CASE WHEN pu.status = 'completed' THEN 'paid' ELSE pu.status END
        FROM public.purchases pu
        WHERE pu.user_id = p.id
        ORDER BY pu.created_at DESC
        LIMIT 1
      ), 'free')     AS p_plan
    FROM public.profiles p
    WHERE p.email IS NOT NULL
  )

  SELECT
    prf.uid                                AS user_id,
    COALESCE(prf.p_name, '')               AS full_name,
    COALESCE(prf.p_email, '')              AS email,
    prf.p_country                          AS country,
    prf.p_plan                             AS plan,
    prf.p_signed_up                        AS signed_up_at,
    prf.p_last_seen                        AS last_seen_at,
    COALESCE(am.metrics, '{}'::JSONB)      AS page_metrics
  FROM user_profiles prf
  LEFT JOIN aggregated_metrics am ON am.uid = prf.uid
  ORDER BY prf.p_last_seen DESC NULLS LAST,
           prf.p_signed_up  DESC NULLS LAST;

END;
$$;


-- 2. Create the get_user_progress RPC function
CREATE OR REPLACE FUNCTION public.get_user_progress()
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_user_id UUID;
  v_result JSONB;
BEGIN
  v_user_id := auth.uid();
  IF v_user_id IS NULL THEN
    RETURN '{}'::jsonb;
  END IF;

  WITH raw_solves AS (
    -- Get individual cryptographically verified solves
    SELECT
      (metadata->>'day_id') AS day_id,
      metadata->>'question_id' AS question_id
    FROM public.activity_logs
    WHERE user_id = v_user_id
      AND event_type = 'question_solved'
      AND (metadata->>'day_id') IS NOT NULL
      AND (metadata->>'question_id') IS NOT NULL
  ),
  state_sync_solves AS (
    -- Get the latest notebook_state_sync event per day
    SELECT DISTINCT ON (metadata->>'day_id')
      (metadata->>'day_id') AS day_id,
      metadata->'solved_cells' AS solved_cells_json,
      created_at
    FROM public.activity_logs
    WHERE user_id = v_user_id
      AND event_type = 'notebook_state_sync'
      AND (metadata->>'day_id') IS NOT NULL
    ORDER BY (metadata->>'day_id'), created_at DESC
  ),
  expanded_sync AS (
    -- Expand the JSON array of solved cells from the latest sync log (pre June 1 2026 only)
    SELECT 
      s.day_id,
      cell_id::text AS question_id
    FROM state_sync_solves s,
    jsonb_array_elements_text(s.solved_cells_json) AS cell_id
    WHERE s.created_at < '2026-06-01'::TIMESTAMPTZ
  ),
  union_solves AS (
    SELECT day_id, question_id FROM raw_solves
    UNION
    SELECT day_id, question_id FROM expanded_sync
  ),
  day_summary AS (
    SELECT
      day_id,
      coalesce(array_agg(question_id), '{}'::text[]) AS solved_cells,
      count(question_id)::integer AS solved_count
    FROM union_solves
    GROUP BY day_id
  )
  SELECT jsonb_object_agg(
    day_id,
    jsonb_build_object(
      'solved_cells', solved_cells,
      'solved_count', solved_count
    )
  ) INTO v_result
  FROM day_summary;

  RETURN COALESCE(v_result, '{}'::jsonb);
END;
$$;

REVOKE ALL ON FUNCTION public.get_user_progress() FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.get_user_progress() TO authenticated;
