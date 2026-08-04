-- ============================================================================
-- 008_user_roster_rpc.sql  v6.1 — Fixed ambiguous column reference
-- ============================================================================

DROP FUNCTION IF EXISTS public.get_user_roster(TIMESTAMPTZ, TIMESTAMPTZ);

CREATE OR REPLACE FUNCTION public.get_user_roster(
  start_ts TIMESTAMPTZ DEFAULT '2000-01-01'::TIMESTAMPTZ,
  end_ts   TIMESTAMPTZ DEFAULT '2099-01-01'::TIMESTAMPTZ
)
RETURNS TABLE (
  user_id          UUID,
  full_name        TEXT,
  email            TEXT,
  country          TEXT,
  signed_up_at     TIMESTAMPTZ,
  last_seen_at     TIMESTAMPTZ,
  total_time_secs  BIGINT,
  total_spent_inr  NUMERIC,
  purchase_count   BIGINT,
  purchase_status  TEXT,
  coupon_used      TEXT,
  total_visits     BIGINT
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  -- Admin gate
  IF NOT EXISTS (
    SELECT 1 FROM public.profiles pr WHERE pr.id = auth.uid() AND pr.role = 'admin'
  ) THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  RETURN QUERY
  WITH
  -- ── Visit Count from page_views (new engine — user attributed)
  pv_visits AS (
    SELECT
      pv.user_id                    AS uid,
      COUNT(DISTINCT pv.session_id) AS visits
    FROM public.page_views pv
    WHERE pv.user_id IS NOT NULL
    GROUP BY pv.user_id
  ),

  -- ── Legacy Visit Count from activity_logs (session_start events)
  -- Only used for users who have NO rows in page_views
  al_visits AS (
    SELECT
      al.user_id                              AS uid,
      COUNT(DISTINCT al.metadata->>'session_id') AS visits
    FROM public.activity_logs al
    WHERE al.event_type = 'session_start'
      AND al.metadata->>'session_id' IS NOT NULL
      AND NOT EXISTS (
        SELECT 1 FROM public.page_views pv2
        WHERE pv2.user_id = al.user_id
      )
    GROUP BY al.user_id
  ),

  -- ── Combine both sources
  all_visits AS (
    SELECT uid, visits FROM pv_visits
    UNION ALL
    SELECT uid, visits FROM al_visits
  ),
  agg_visits AS (
    SELECT uid, SUM(visits)::BIGINT AS total_v
    FROM all_visits
    GROUP BY uid
  ),

  -- ── Time Spent: active seconds from session_end events (market standard)
  time_spent AS (
    SELECT
      al.user_id                                             AS uid,
      COALESCE(
        SUM(
          CASE
            WHEN al.metadata->>'duration_seconds' ~ '^[0-9]+$'
            THEN (al.metadata->>'duration_seconds')::BIGINT
            ELSE 0
          END
        ) FILTER (WHERE al.event_type = 'session_end'),
        0
      )::BIGINT                                              AS active_secs,
      MAX(al.created_at)                                    AS last_seen
    FROM public.activity_logs al
    GROUP BY al.user_id
  )

  SELECT
    p.id                                                                AS user_id,
    COALESCE(p.full_name, '')                                          AS full_name,
    COALESCE(p.email, '')                                              AS email,
    p.country                                                          AS country,
    p.created_at                                                       AS signed_up_at,

    -- last_seen: most recent activity timestamp, fallback to Supabase last_sign_in_at
    COALESCE(ts.last_seen, p.last_sign_in_at)                         AS last_seen_at,

    -- active time in seconds from session_end events
    COALESCE(ts.active_secs, 0)                                        AS total_time_secs,

    COALESCE(SUM(pur.amount_inr) FILTER (
      WHERE pur.status IN ('completed', 'paid', 'captured', 'successful')
    ), 0)                                                               AS total_spent_inr,

    COUNT(pur.id) FILTER (
      WHERE pur.status IN ('completed', 'paid', 'captured', 'successful')
    )                                                                   AS purchase_count,

    CASE
      WHEN COUNT(pur.id) FILTER (WHERE pur.status = 'refunded') > 0 THEN 'refunded'
      WHEN COUNT(pur.id) FILTER (
        WHERE pur.status IN ('completed', 'paid', 'captured', 'successful')
      ) > 0 THEN 'paid'
      ELSE 'free'
    END                                                                 AS purchase_status,

    MAX(pur.coupon_used) FILTER (
      WHERE pur.coupon_used IS NOT NULL
    )                                                                   AS coupon_used,

    COALESCE(av.total_v, 0)                                            AS total_visits

  FROM public.profiles p
  LEFT JOIN time_spent ts       ON ts.uid = p.id
  LEFT JOIN agg_visits av       ON av.uid = p.id
  LEFT JOIN public.purchases pur ON pur.user_id = p.id
  WHERE p.created_at >= start_ts AND p.created_at <= end_ts
  GROUP BY
    p.id, p.full_name, p.email, p.country,
    p.last_sign_in_at, p.created_at,
    ts.last_seen, ts.active_secs, av.total_v
  ORDER BY p.created_at DESC;
END;
$$;

REVOKE ALL ON FUNCTION public.get_user_roster(TIMESTAMPTZ, TIMESTAMPTZ) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.get_user_roster(TIMESTAMPTZ, TIMESTAMPTZ) TO authenticated;
