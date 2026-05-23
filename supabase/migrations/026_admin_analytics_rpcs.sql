-- ═══════════════════════════════════════════════════════════════
-- MANODEMY V2 — UNIFIED ANALYTICS ENGINE & RPC DEFINITIONS
-- Run this in your Supabase SQL Editor to deploy all analytics RPCs
-- ═══════════════════════════════════════════════════════════════



-- ── SECTION: 004_admin_analytics.sql ──
-- 004_admin_analytics.sql

-- Enable pgcrypto for gen_random_uuid() if needed
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- 1. Create Tables
CREATE TABLE IF NOT EXISTS admin_audit_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  admin_id UUID,
  action TEXT,
  table_name TEXT,
  changed_data JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS coupons (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code TEXT UNIQUE NOT NULL,
  discount_type TEXT CHECK (discount_type IN ('percentage','fixed')) NOT NULL,
  discount_value NUMERIC NOT NULL,
  applies_to TEXT CHECK (applies_to IN ('INR','USD','both')) DEFAULT 'both',
  max_uses INTEGER,
  current_uses INTEGER DEFAULT 0,
  expires_at TIMESTAMPTZ,
  is_active BOOLEAN DEFAULT true,
  created_by UUID REFERENCES auth.users,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS purchases (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users NOT NULL,
  course_id UUID,
  amount_inr NUMERIC NOT NULL,
  amount_original NUMERIC NOT NULL,
  currency TEXT CHECK (currency IN ('INR','USD')) NOT NULL,
  coupon_used TEXT REFERENCES coupons(code),
  payment_gateway TEXT,
  status TEXT CHECK (status IN ('completed','refunded','disputed')) DEFAULT 'completed',
  refunded_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS activity_logs(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID,
  event_type TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Create View
DROP VIEW IF EXISTS bd_daily_revenue;
CREATE OR REPLACE VIEW bd_daily_revenue AS
SELECT
  date_trunc('day', created_at)::date AS day,
  SUM(amount_inr) FILTER (WHERE status = 'completed') AS gross_revenue,
  SUM(amount_inr) FILTER (WHERE status = 'refunded') AS refund_amount,
  SUM(amount_inr) FILTER (WHERE status = 'completed') 
    - COALESCE(SUM(amount_inr) FILTER (WHERE status='refunded'),0) 
    AS net_revenue,
  COUNT(*) FILTER (WHERE status = 'completed') AS transactions,
  COUNT(*) FILTER (WHERE status = 'refunded') AS refunds,
  COUNT(DISTINCT user_id) FILTER (WHERE status = 'completed') 
    AS unique_buyers
FROM purchases
GROUP BY 1 ORDER BY 1;

-- 3. RLS Policies
ALTER TABLE purchases ENABLE ROW LEVEL SECURITY;
ALTER TABLE coupons ENABLE ROW LEVEL SECURITY;

-- Purchases: Security intent: only admins can manage, no one can delete, ever.
CREATE POLICY admin_select_purchases ON purchases
FOR SELECT USING (
  auth.uid() IN (SELECT id FROM profiles WHERE role='admin')
);

CREATE POLICY admin_insert_purchases ON purchases
FOR INSERT WITH CHECK (
  auth.uid() IN (SELECT id FROM profiles WHERE role='admin')
);

CREATE POLICY admin_update_purchases ON purchases
FOR UPDATE USING (
  auth.uid() IN (SELECT id FROM profiles WHERE role='admin')
);

CREATE POLICY deny_delete_purchases ON purchases
FOR DELETE USING (false);

-- Coupons: Security intent: public can read for checkout validation, only admin can mutate.
CREATE POLICY public_select_coupons ON coupons
FOR SELECT USING (true);

CREATE POLICY admin_insert_coupons ON coupons
FOR INSERT WITH CHECK (
  auth.uid() IN (SELECT id FROM profiles WHERE role='admin')
);

CREATE POLICY admin_update_coupons ON coupons
FOR UPDATE USING (
  auth.uid() IN (SELECT id FROM profiles WHERE role='admin')
);

CREATE POLICY admin_delete_coupons ON coupons
FOR DELETE USING (
  auth.uid() IN (SELECT id FROM profiles WHERE role='admin')
);

-- 4. Audit trigger function
-- Security intent: Record exactly who did what to sensitive pricing and coupon data
CREATE OR REPLACE FUNCTION audit_trigger_func()
RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'INSERT') THEN
    INSERT INTO admin_audit_log (admin_id, action, table_name, changed_data, created_at)
    VALUES (auth.uid(), 'INSERT', TG_TABLE_NAME, jsonb_build_object('new', row_to_json(NEW)), now());
    RETURN NEW;
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO admin_audit_log (admin_id, action, table_name, changed_data, created_at)
    VALUES (auth.uid(), 'UPDATE', TG_TABLE_NAME, jsonb_build_object('old', row_to_json(OLD), 'new', row_to_json(NEW)), now());
    RETURN NEW;
  ELSIF (TG_OP = 'DELETE') THEN
    INSERT INTO admin_audit_log (admin_id, action, table_name, changed_data, created_at)
    VALUES (auth.uid(), 'DELETE', TG_TABLE_NAME, jsonb_build_object('old', row_to_json(OLD)), now());
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 5. Attach audit triggers to coupons (and settings if applicable)
DROP TRIGGER IF EXISTS audit_coupons ON coupons;
CREATE TRIGGER audit_coupons
AFTER INSERT OR UPDATE OR DELETE ON coupons
FOR EACH ROW EXECUTE FUNCTION audit_trigger_func();

-- Assuming the settings table is used for pricing changes
-- Un-comment if settings table exists
-- DROP TRIGGER IF EXISTS audit_settings ON settings;
-- CREATE TRIGGER audit_settings
-- AFTER INSERT OR UPDATE OR DELETE ON settings
-- FOR EACH ROW EXECUTE FUNCTION audit_trigger_func();


-- ── SECTION: 005_intelligence_rpcs.sql ──
-- 005_intelligence_rpcs.sql

-- ==============================================================================
-- 1A. Supporting Tables & Indexes
-- ==============================================================================

CREATE TABLE IF NOT EXISTS public.page_views (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id TEXT NOT NULL,
  page_url TEXT NOT NULL,
  referrer TEXT,
  country TEXT,
  -- user_id links anonymous sessions to authenticated users (set on login)
  -- MED-5 FIX: Added to schema definition to match funnel RPC queries
  user_id UUID REFERENCES auth.users ON DELETE SET NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Safe migration: add user_id if running on an existing database that already has page_views
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public' AND table_name = 'page_views' AND column_name = 'user_id'
  ) THEN
    ALTER TABLE public.page_views ADD COLUMN user_id UUID REFERENCES auth.users ON DELETE SET NULL;
  END IF;
END $$;

-- Ensure activity_logs has the correct schema (in case it was created previously with an older schema)
CREATE TABLE IF NOT EXISTS public.activity_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users NOT NULL,
  event_type TEXT NOT NULL,
  page_url TEXT,
  metadata JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Safely add missing columns to profiles table to support Intelligence Suite
DO $$ 
BEGIN
  -- Add role column if missing
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'public' AND table_name = 'profiles' AND column_name = 'role') THEN
    ALTER TABLE public.profiles ADD COLUMN role TEXT DEFAULT 'user';
  END IF;

  -- Add plan_type column if missing
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'public' AND table_name = 'profiles' AND column_name = 'plan_type') THEN
    ALTER TABLE public.profiles ADD COLUMN plan_type TEXT DEFAULT 'free';
  END IF;

  -- Add last_sign_in_at column if missing
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'public' AND table_name = 'profiles' AND column_name = 'last_sign_in_at') THEN
    ALTER TABLE public.profiles ADD COLUMN last_sign_in_at TIMESTAMPTZ;
  END IF;
END $$;

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_page_views_session ON public.page_views(session_id);
CREATE INDEX IF NOT EXISTS idx_activity_user_created ON public.activity_logs(user_id, created_at);
CREATE INDEX IF NOT EXISTS idx_profiles_role ON public.profiles(role);
CREATE INDEX IF NOT EXISTS idx_profiles_plan ON public.profiles(plan_type);

DO $$ 
BEGIN
  -- Safely add columns if they don't exist
  BEGIN
    ALTER TABLE public.activity_logs ADD COLUMN event_type TEXT;
  EXCEPTION
    WHEN duplicate_column THEN NULL;
  END;
  BEGIN
    ALTER TABLE public.activity_logs ADD COLUMN page_url TEXT;
  EXCEPTION
    WHEN duplicate_column THEN NULL;
  END;
  BEGIN
    ALTER TABLE public.activity_logs ADD COLUMN metadata JSONB;
  EXCEPTION
    WHEN duplicate_column THEN NULL;
  END;
END $$;

-- Performance Indexes
CREATE INDEX IF NOT EXISTS idx_activity_logs_user_date ON activity_logs(user_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_activity_logs_event_date ON activity_logs(event_type, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_page_views_date ON page_views(created_at DESC);

-- ==============================================================================
-- 1B. Revenue Intelligence RPCs
-- ==============================================================================

CREATE OR REPLACE FUNCTION get_revenue_intelligence(
  start_ts TIMESTAMPTZ,
  end_ts   TIMESTAMPTZ
)
RETURNS JSON
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
  res JSON;
  active_users_count INTEGER;
BEGIN
  -- Admin Authorization Check
  IF NOT EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin') THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  -- Active Users count: users who either had activity or made a purchase in this period
  SELECT COUNT(DISTINCT user_id) INTO active_users_count
  FROM (
    SELECT user_id FROM activity_logs WHERE created_at >= start_ts AND created_at <= end_ts
    UNION
    SELECT user_id FROM purchases WHERE created_at >= start_ts AND created_at <= end_ts
  ) AS active_pool;

  WITH agg AS (
    SELECT
      -- Gross Revenue = ALL money collected (including amounts later refunded)
      -- This is the standard financial definition: money IN before deductions
      SUM(amount_inr) FILTER (WHERE status IN ('completed', 'paid', 'captured', 'successful', 'refunded')) AS gross_revenue,
      SUM(amount_inr) FILTER (WHERE status = 'refunded') AS refund_amount,
      COUNT(*) FILTER (WHERE status IN ('completed', 'paid', 'captured', 'successful', 'refunded')) AS transaction_count,
      COUNT(*) FILTER (WHERE status = 'refunded') AS refund_count,
      -- ARPU requires distinct paying users (not transaction count — one user can buy multiple times)
      COUNT(DISTINCT user_id) FILTER (WHERE status IN ('completed', 'paid', 'captured', 'successful')) AS distinct_paying_users
    FROM purchases
    WHERE created_at >= start_ts AND created_at <= end_ts
  ),
  daily AS (
    SELECT
      to_char(date_trunc('day', created_at), 'YYYY-MM-DD') AS day,
      -- Daily gross includes refunded rows (money was collected that day)
      COALESCE(SUM(amount_inr) FILTER (WHERE status IN ('completed', 'paid', 'captured', 'successful', 'refunded')), 0) AS gross,
      COALESCE(SUM(amount_inr) FILTER (WHERE status = 'refunded'), 0) AS refunds
    FROM purchases
    WHERE created_at >= start_ts AND created_at <= end_ts
    GROUP BY date_trunc('day', created_at)
    ORDER BY date_trunc('day', created_at)
  ),
  curr_split AS (
    SELECT
      currency,
      SUM(amount_inr) AS amount,
      COUNT(*) AS count
    FROM purchases
    WHERE created_at >= start_ts AND created_at <= end_ts
      AND status IN ('completed', 'paid', 'captured', 'successful', 'refunded')
    GROUP BY currency
  )
  SELECT json_build_object(
    'gross_revenue', COALESCE(agg.gross_revenue, 0),
    'net_revenue', COALESCE(agg.gross_revenue, 0) - COALESCE(agg.refund_amount, 0),
    'refund_amount', COALESCE(agg.refund_amount, 0),
    'transaction_count', COALESCE(agg.transaction_count, 0),
    'refund_count', COALESCE(agg.refund_count, 0),
    'refund_rate_pct', CASE WHEN agg.transaction_count > 0 THEN (agg.refund_count::NUMERIC / agg.transaction_count) * 100 ELSE 0 END,
    -- AOV = Gross Revenue / total transactions (avg ticket size per order)
    'aov', CASE WHEN agg.transaction_count > 0 THEN COALESCE(agg.gross_revenue, 0) / agg.transaction_count ELSE 0 END,
    -- ARPU = Gross Revenue / DISTINCT paying users (avg lifetime value per customer)
    --        Uses the pre-computed active_users_count which counts distinct payers in this period
    'arpu', CASE WHEN agg.distinct_paying_users > 0 THEN COALESCE(agg.gross_revenue, 0) / agg.distinct_paying_users ELSE 0 END,
    'currency_split', COALESCE((SELECT json_agg(json_build_object('currency', currency, 'amount', amount, 'count', count)) FROM curr_split), '[]'::json),
    'daily_revenue', COALESCE((SELECT json_agg(json_build_object('day', day, 'gross', gross, 'net', gross - refunds, 'refunds', refunds)) FROM daily), '[]'::json)
  ) INTO res
  FROM agg;

  RETURN res;
END;
$$;
REVOKE ALL ON FUNCTION get_revenue_intelligence FROM PUBLIC;
GRANT EXECUTE ON FUNCTION get_revenue_intelligence TO authenticated;

-- Previous period version
CREATE OR REPLACE FUNCTION get_revenue_intelligence_prev(
  start_ts TIMESTAMPTZ,
  end_ts   TIMESTAMPTZ
)
RETURNS JSON
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
  res JSON;
  active_users_count INTEGER;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin') THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  -- Active Users count: anyone who had activity or a purchase in this period
  SELECT COUNT(DISTINCT user_id) INTO active_users_count
  FROM (
    SELECT user_id FROM activity_logs WHERE created_at >= start_ts AND created_at <= end_ts
    UNION
    SELECT user_id FROM purchases WHERE created_at >= start_ts AND created_at <= end_ts
  ) AS active_pool;

  WITH agg AS (
    SELECT
      -- Gross Revenue = ALL money collected (including amounts later refunded)
      SUM(amount_inr) FILTER (WHERE status IN ('completed', 'paid', 'captured', 'successful', 'refunded')) AS gross_revenue,
      SUM(amount_inr) FILTER (WHERE status = 'refunded') AS refund_amount,
      COUNT(*) FILTER (WHERE status IN ('completed', 'paid', 'captured', 'successful', 'refunded')) AS transaction_count,
      COUNT(*) FILTER (WHERE status = 'refunded') AS refund_count,
      COUNT(DISTINCT user_id) FILTER (WHERE status IN ('completed', 'paid', 'captured', 'successful')) AS distinct_paying_users
    FROM purchases
    WHERE created_at >= start_ts AND created_at <= end_ts
  )
  SELECT json_build_object(
    'gross_revenue', COALESCE(agg.gross_revenue, 0),
    'net_revenue', COALESCE(agg.gross_revenue, 0) - COALESCE(agg.refund_amount, 0),
    'refund_amount', COALESCE(agg.refund_amount, 0),
    'transaction_count', COALESCE(agg.transaction_count, 0),
    'refund_count', COALESCE(agg.refund_count, 0),
    'refund_rate_pct', CASE WHEN agg.transaction_count > 0 THEN (agg.refund_count::NUMERIC / agg.transaction_count) * 100 ELSE 0 END,
    'aov', CASE WHEN agg.transaction_count > 0 THEN COALESCE(agg.gross_revenue, 0) / agg.transaction_count ELSE 0 END,
    -- ARPU: use distinct paying users — consistent with primary revenue function
    'arpu', CASE WHEN agg.distinct_paying_users > 0 THEN COALESCE(agg.gross_revenue, 0) / agg.distinct_paying_users ELSE 0 END,
    'currency_split', '[]'::json,
    'daily_revenue', '[]'::json
  ) INTO res
  FROM agg;

  RETURN res;
END;
$$;
REVOKE ALL ON FUNCTION get_revenue_intelligence_prev FROM PUBLIC;
GRANT EXECUTE ON FUNCTION get_revenue_intelligence_prev TO authenticated;

-- ==============================================================================
-- 1C. Growth Intelligence RPCs
-- ==============================================================================

CREATE OR REPLACE FUNCTION get_growth_intelligence(
  start_ts TIMESTAMPTZ,
  end_ts   TIMESTAMPTZ
)
RETURNS JSON
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
  res JSON;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin') THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  WITH su AS (
    SELECT COUNT(*) AS new_signups
    FROM profiles
    WHERE created_at >= start_ts AND created_at <= end_ts
  ),
  pu AS (
    SELECT COUNT(DISTINCT user_id) AS new_paying_users
    FROM purchases p1
    WHERE p1.status IN ('completed', 'paid', 'captured', 'successful')
      AND p1.created_at >= start_ts AND p1.created_at <= end_ts
      AND p1.user_id NOT IN (
        SELECT user_id FROM purchases p2 WHERE p2.status IN ('completed', 'paid', 'captured', 'successful') AND p2.created_at < start_ts
      )
  ),
  pv AS (
    -- Market-standard: count UNIQUE sessions.
    -- page_views is the primary source (new engine with user attribution).
    -- activity_logs session_start is the legacy fallback for pre-existing users.
    -- UNION (not UNION ALL) ensures no double-counting if a session_id appears in both.
    SELECT COUNT(DISTINCT sid) AS page_views
    FROM (
      SELECT session_id AS sid, created_at FROM public.page_views
      UNION
      SELECT metadata->>'session_id' AS sid, created_at
      FROM public.activity_logs
      WHERE event_type = 'session_start'
        AND metadata->>'session_id' IS NOT NULL
    ) AS all_sessions
    WHERE created_at >= start_ts AND created_at <= end_ts
  ),
  chk AS (
    -- BUG FIX: Was COUNT(*) which counted every button click as a separate checkout.
    -- A single user clicking Buy 5 times = 5 checkouts, which could exceed total visits.
    -- Fix: COUNT(DISTINCT user_id) — consistent with get_conversion_funnel and all other steps.
    -- Unit alignment: visits=unique sessions, signups=unique users, checkout=unique users, purchases=unique users
    SELECT COUNT(DISTINCT user_id) AS checkout_initiated
    FROM activity_logs
    WHERE event_type = 'checkout_initiated'
      AND created_at >= start_ts AND created_at <= end_ts
  ),
  countries AS (
    SELECT COALESCE(country, 'Unknown') as country, COUNT(*) as count
    FROM profiles
    WHERE created_at >= start_ts AND created_at <= end_ts
    GROUP BY country
    ORDER BY count DESC
    LIMIT 10
  ),
  daily AS (
    SELECT
      to_char(date_trunc('day', created_at), 'YYYY-MM-DD') AS day,
      COUNT(*) AS signups
    FROM profiles
    WHERE created_at >= start_ts AND created_at <= end_ts
    GROUP BY date_trunc('day', created_at)
  ),
  daily_paying AS (
    SELECT
      to_char(date_trunc('day', created_at), 'YYYY-MM-DD') AS day,
      COUNT(DISTINCT user_id) AS paying
    FROM purchases p1
    WHERE p1.status IN ('completed', 'paid', 'captured', 'successful')
      AND p1.created_at >= start_ts AND p1.created_at <= end_ts
      AND p1.user_id NOT IN (
        SELECT user_id FROM purchases p2 WHERE p2.status IN ('completed', 'paid', 'captured', 'successful') AND p2.created_at < start_ts
      )
    GROUP BY date_trunc('day', created_at)
  ),
  daily_merged AS (
    SELECT
      COALESCE(d.day, dp.day) AS day,
      COALESCE(d.signups, 0) AS signups,
      COALESCE(dp.paying, 0) AS paying
    FROM daily d
    FULL OUTER JOIN daily_paying dp ON d.day = dp.day
    ORDER BY COALESCE(d.day, dp.day)
  )
  SELECT json_build_object(
    'new_signups', (SELECT new_signups FROM su),
    'new_paying_users', (SELECT new_paying_users FROM pu),
    'conversion_rate_pct', CASE WHEN (SELECT new_signups FROM su) > 0 THEN ((SELECT new_paying_users FROM pu)::NUMERIC / (SELECT new_signups FROM su)) * 100 ELSE 0 END,
    'funnel', json_build_object(
      'page_views', (SELECT page_views FROM pv),
      'signups', (SELECT new_signups FROM su),
      'checkout_initiated', (SELECT checkout_initiated FROM chk),
      'purchased', (SELECT new_paying_users FROM pu)
    ),
    'country_distribution', COALESCE((SELECT json_agg(json_build_object('country', country, 'count', count)) FROM countries), '[]'::json),
    'daily_signups', COALESCE((SELECT json_agg(json_build_object('day', day, 'signups', signups, 'paying', paying)) FROM daily_merged), '[]'::json)
  ) INTO res;

  RETURN res;
END;
$$;
REVOKE ALL ON FUNCTION get_growth_intelligence FROM PUBLIC;
GRANT EXECUTE ON FUNCTION get_growth_intelligence TO authenticated;

-- Previous period version
CREATE OR REPLACE FUNCTION get_growth_intelligence_prev(
  start_ts TIMESTAMPTZ,
  end_ts   TIMESTAMPTZ
)
RETURNS JSON
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
  res JSON;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin') THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  WITH su AS (
    SELECT COUNT(*) AS new_signups
    FROM profiles
    WHERE created_at >= start_ts AND created_at <= end_ts
  ),
  pu AS (
    SELECT COUNT(DISTINCT user_id) AS new_paying_users
    FROM purchases p1
    WHERE p1.status IN ('completed', 'paid', 'captured', 'successful')
      AND p1.created_at >= start_ts AND p1.created_at <= end_ts
      AND p1.user_id NOT IN (
        SELECT user_id FROM purchases p2 WHERE p2.status IN ('completed', 'paid', 'captured', 'successful') AND p2.created_at < start_ts
      )
  )
  SELECT json_build_object(
    'new_signups', (SELECT new_signups FROM su),
    'new_paying_users', (SELECT new_paying_users FROM pu),
    'conversion_rate_pct', CASE WHEN (SELECT new_signups FROM su) > 0 THEN ((SELECT new_paying_users FROM pu)::NUMERIC / (SELECT new_signups FROM su)) * 100 ELSE 0 END,
    'funnel', json_build_object('page_views', 0, 'signups', 0, 'checkout_initiated', 0, 'purchased', 0),
    'country_distribution', '[]'::json,
    'daily_signups', '[]'::json
  ) INTO res;

  RETURN res;
END;
$$;
REVOKE ALL ON FUNCTION get_growth_intelligence_prev FROM PUBLIC;
GRANT EXECUTE ON FUNCTION get_growth_intelligence_prev TO authenticated;

-- ==============================================================================
-- 1D. Retention Intelligence RPCs
-- ==============================================================================

CREATE OR REPLACE FUNCTION get_retention_intelligence(
  start_ts TIMESTAMPTZ,
  end_ts   TIMESTAMPTZ
)
RETURNS JSON
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
  res JSON;
  prev_start_ts TIMESTAMPTZ := start_ts - (end_ts - start_ts);
  prev_end_ts TIMESTAMPTZ := start_ts;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin') THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  WITH curr_active AS (
    SELECT DISTINCT user_id
    FROM activity_logs
    WHERE created_at >= start_ts AND created_at <= end_ts
  ),
  prev_active AS (
    SELECT DISTINCT user_id
    FROM activity_logs
    WHERE created_at >= prev_start_ts AND created_at < prev_end_ts
  ),
  churned AS (
    SELECT COUNT(*) AS cnt
    FROM prev_active p
    LEFT JOIN curr_active c ON p.user_id = c.user_id
    WHERE c.user_id IS NULL
  ),
  retained AS (
    SELECT COUNT(*) AS cnt
    FROM prev_active p
    JOIN curr_active c ON p.user_id = c.user_id
  ),
  -- MED-2 NOTE: plan_distribution uses the profiles.plan_type column.
  -- IMPORTANT: Ensure your verify-payment Edge Function updates profiles.plan_type = 'premium'
  -- on purchase success, and resets to 'free' on refund. Otherwise this chart will be stale.
  plan_dist AS (
    SELECT
      COUNT(*) FILTER (WHERE plan_type = 'free' OR plan_type IS NULL) AS free_count,
      COUNT(*) FILTER (WHERE plan_type = 'premium') AS premium_count
    FROM profiles
  )
  SELECT json_build_object(
    'active_users', (SELECT COUNT(*) FROM curr_active),
    'prev_active_users', (SELECT COUNT(*) FROM prev_active),
    'churned_users', (SELECT cnt FROM churned),
    'retained_users', (SELECT cnt FROM retained),
    'retention_rate_pct', CASE WHEN (SELECT COUNT(*) FROM prev_active) > 0 THEN ((SELECT cnt FROM retained)::NUMERIC / (SELECT COUNT(*) FROM prev_active)) * 100 ELSE 0 END,
    'plan_distribution', json_build_object(
      'free', (SELECT free_count FROM plan_dist),
      'premium', (SELECT premium_count FROM plan_dist)
    )
  ) INTO res;

  RETURN res;
END;
$$;
REVOKE ALL ON FUNCTION get_retention_intelligence FROM PUBLIC;
GRANT EXECUTE ON FUNCTION get_retention_intelligence TO authenticated;

CREATE OR REPLACE FUNCTION get_dau_mau_series(
  start_ts TIMESTAMPTZ,
  end_ts   TIMESTAMPTZ
)
RETURNS JSON
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
  res JSON;
  curr_dau NUMERIC;
  curr_mau NUMERIC;
  curr_ratio NUMERIC;
  bench_label TEXT;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin') THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  -- Calculate current DAU (most recent day)
  SELECT COUNT(DISTINCT user_id) INTO curr_dau
  FROM activity_logs
  WHERE created_at >= (end_ts - INTERVAL '1 day') AND created_at <= end_ts;

  -- Calculate current MAU (last 30 days)
  SELECT COUNT(DISTINCT user_id) INTO curr_mau
  FROM activity_logs
  WHERE created_at >= (end_ts - INTERVAL '30 days') AND created_at <= end_ts;

  curr_ratio := CASE WHEN curr_mau > 0 THEN curr_dau / curr_mau ELSE 0 END;
  
  IF curr_ratio < 0.1 THEN
    bench_label := 'Low';
  ELSIF curr_ratio <= 0.2 THEN
    bench_label := 'Fair';
  ELSE
    bench_label := 'Healthy';
  END IF;

  WITH RECURSIVE weeks AS (
    SELECT date_trunc('week', start_ts) AS week_start,
           date_trunc('week', start_ts) + INTERVAL '6 days 23:59:59' AS week_end
    UNION ALL
    SELECT week_start + INTERVAL '1 week',
           week_end + INTERVAL '1 week'
    FROM weeks
    WHERE week_start + INTERVAL '1 week' <= end_ts
  ),
  weekly_stats AS (
    SELECT
      to_char(w.week_start, 'IYYY-IW') AS week,
      (
        SELECT COUNT(DISTINCT user_id)::NUMERIC / 7.0
        FROM activity_logs a
        WHERE a.created_at >= w.week_start AND a.created_at <= w.week_end
      ) AS dau_avg,
      (
        SELECT COUNT(DISTINCT user_id)::NUMERIC
        FROM activity_logs a
        WHERE a.created_at >= (w.week_end - INTERVAL '30 days') AND a.created_at <= w.week_end
      ) AS mau
    FROM weeks w
  )
  SELECT json_build_object(
    'current_ratio', curr_ratio,
    'benchmark_label', bench_label,
    'weekly_series', COALESCE((
      SELECT json_agg(json_build_object(
        'week', week,
        'dau_mau_ratio', CASE WHEN mau > 0 THEN dau_avg / mau ELSE 0 END
      ))
      FROM weekly_stats
    ), '[]'::json)
  ) INTO res;

  RETURN res;
END;
$$;
REVOKE ALL ON FUNCTION get_dau_mau_series FROM PUBLIC;
GRANT EXECUTE ON FUNCTION get_dau_mau_series TO authenticated;


CREATE OR REPLACE FUNCTION get_cohort_retention()
RETURNS JSON
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
  res JSON;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin') THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  WITH cohorts AS (
    SELECT 
      date_trunc('month', created_at) AS cohort_month,
      COUNT(id) AS cohort_size
    FROM profiles
    GROUP BY date_trunc('month', created_at)
  ),
  months AS (
    SELECT 0 AS m UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
  ),
  cohort_months AS (
    SELECT 
      c.cohort_month,
      c.cohort_size,
      m.m AS month_offset,
      (c.cohort_month + (m.m || ' month')::interval) AS active_month_start,
      (c.cohort_month + ((m.m + 1) || ' month')::interval) AS active_month_end
    FROM cohorts c
    CROSS JOIN months m
  ),
  active_counts AS (
    SELECT 
      cm.cohort_month,
      cm.month_offset,
      cm.cohort_size,
      cm.active_month_start,
      (
        SELECT COUNT(DISTINCT user_id)
        FROM activity_logs al
        WHERE al.created_at >= cm.active_month_start 
          AND al.created_at < cm.active_month_end
          AND al.user_id IN (SELECT id FROM profiles WHERE date_trunc('month', created_at) = cm.cohort_month)
      ) AS active_count
    FROM cohort_months cm
  ),
  aggregated AS (
    SELECT
      to_char(cohort_month, 'Mon YYYY') AS cohort_label,
      to_char(cohort_month, 'YYYY-MM-DD') AS cohort_month_str,
      cohort_size,
      json_agg(
        json_build_object(
          'month_offset', month_offset,
          'active_count', active_count,
          'retention_pct', CASE 
            WHEN active_month_start > now() THEN NULL
            WHEN month_offset = 0 THEN 100.0
            WHEN cohort_size > 0 THEN (active_count::NUMERIC / cohort_size) * 100 
            ELSE 0 
          END
        ) ORDER BY month_offset
      ) AS months
    FROM active_counts
    GROUP BY cohort_month, cohort_size
    ORDER BY cohort_month DESC
    LIMIT 12
  )
  SELECT COALESCE(json_agg(
    json_build_object(
      'cohort_label', cohort_label,
      'cohort_month', cohort_month_str,
      'cohort_size', cohort_size,
      'months', months
    ) ORDER BY cohort_month_str DESC
  ), '[]'::json) INTO res
  FROM aggregated;

  RETURN res;
END;
$$;
REVOKE ALL ON FUNCTION get_cohort_retention FROM PUBLIC;
GRANT EXECUTE ON FUNCTION get_cohort_retention TO authenticated;

-- ==============================================================================
-- 1E. Coupon Performance RPC
-- ==============================================================================

CREATE OR REPLACE FUNCTION get_coupon_performance(
  start_ts TIMESTAMPTZ,
  end_ts   TIMESTAMPTZ
)
RETURNS JSON
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
  res JSON;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin') THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  WITH agg AS (
    SELECT
      c.code,
      c.discount_type,
      c.discount_value,
      c.is_active,
      c.max_uses,
      c.expires_at,
      COUNT(p.id) AS uses_in_period,
      SUM(COALESCE(p.amount_inr, 0)) AS revenue_generated,
      CASE WHEN COUNT(p.id) > 0 THEN SUM(COALESCE(p.amount_inr, 0)) / COUNT(p.id) ELSE 0 END AS aov_with_coupon
    FROM coupons c
    LEFT JOIN purchases p ON c.code = p.coupon_used AND p.created_at >= start_ts AND p.created_at <= end_ts AND p.status IN ('completed', 'paid', 'captured', 'successful')
    GROUP BY c.id, c.code, c.discount_type, c.discount_value, c.is_active, c.max_uses, c.expires_at
  )
  SELECT COALESCE(json_agg(row_to_json(agg)), '[]'::json) INTO res
  FROM agg;

  RETURN res;
END;
$$;
REVOKE ALL ON FUNCTION get_coupon_performance FROM PUBLIC;
GRANT EXECUTE ON FUNCTION get_coupon_performance TO authenticated;


-- ── SECTION: 007_transaction_rpc.sql ──
DROP FUNCTION IF EXISTS public.get_transaction_ledger(TIMESTAMPTZ, TIMESTAMPTZ);

CREATE OR REPLACE FUNCTION public.get_transaction_ledger(start_ts TIMESTAMPTZ DEFAULT '2000-01-01'::TIMESTAMPTZ, end_ts TIMESTAMPTZ DEFAULT '2099-01-01'::TIMESTAMPTZ)
RETURNS TABLE (
    id UUID,
    user_id UUID,
    amount_inr NUMERIC,
    currency TEXT,
    coupon_used TEXT,
    payment_gateway TEXT,
    status TEXT,
    created_at TIMESTAMPTZ,
    user_email TEXT,
    user_name TEXT,
    user_country TEXT
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM profiles WHERE profiles.id = auth.uid() AND role = 'admin') THEN
        RAISE EXCEPTION 'Unauthorized';
    END IF;

    RETURN QUERY
    SELECT 
        p.id,
        p.user_id,
        p.amount_inr,
        p.currency,
        p.coupon_used,
        p.payment_gateway,
        p.status,
        p.created_at,
        pr.email,
        pr.full_name,
        pr.country
    FROM purchases p
    LEFT JOIN profiles pr ON p.user_id = pr.id
    WHERE p.status IN ('completed', 'paid', 'captured', 'successful', 'refunded')
      AND p.created_at >= start_ts
      AND p.created_at <= end_ts
    ORDER BY p.created_at DESC;
END;
$$;


-- ── SECTION: 008_user_roster_rpc.sql ──
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


-- ── SECTION: 014_funnel_rpc.sql ──
-- ============================================================================
-- 014_funnel_rpc.sql
-- Funnel analytics for Conversion Funnel page
-- Run this in Supabase SQL Editor
-- ============================================================================

DROP FUNCTION IF EXISTS public.get_conversion_funnel(TIMESTAMPTZ, TIMESTAMPTZ);

CREATE OR REPLACE FUNCTION public.get_conversion_funnel(
  start_ts TIMESTAMPTZ DEFAULT '2000-01-01'::TIMESTAMPTZ,
  end_ts   TIMESTAMPTZ DEFAULT '2099-01-01'::TIMESTAMPTZ
)
RETURNS TABLE (
  step1_visits BIGINT,
  step2_logged_in BIGINT,
  step3_buy_clicks BIGINT,
  step4_success BIGINT,
  step5_failed BIGINT
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
  s1 AS (
    SELECT COUNT(DISTINCT session_id) AS visits 
    FROM public.page_views 
    WHERE created_at BETWEEN start_ts AND end_ts
      AND (
        page_url ILIKE '%/index.html' OR 
        page_url ILIKE '%/day01.html' OR 
        page_url ILIKE '%/day02.html' OR
        page_url = '/' OR
        page_url ILIKE '%/30-days_-Python-for-Data-Analyst/'
      )
  ),
  s2 AS (
    SELECT COUNT(DISTINCT user_id) AS logged_in 
    FROM public.page_views 
    WHERE user_id IS NOT NULL 
      AND created_at BETWEEN start_ts AND end_ts
  ),
  s3 AS (
    SELECT COUNT(DISTINCT user_id) AS buy_clicks 
    FROM public.activity_logs 
    WHERE event_type = 'checkout_initiated' 
      AND created_at BETWEEN start_ts AND end_ts
  ),
  s4 AS (
    SELECT COUNT(DISTINCT user_id) AS success 
    FROM public.purchases 
    WHERE status IN ('completed', 'paid', 'captured', 'successful') 
      AND created_at BETWEEN start_ts AND end_ts
  ),
  s5 AS (
    -- IMPORTANT: 'refunded' and 'disputed' are NOT payment failures.
    -- They are successful payments that were later reversed.
    -- This step counts ONLY gateway-rejected transactions (status = 'failed').
    SELECT COUNT(DISTINCT user_id) AS failed 
    FROM public.purchases 
    WHERE status = 'failed'
      AND created_at BETWEEN start_ts AND end_ts
  )
  SELECT 
    COALESCE((SELECT visits FROM s1), 0) AS step1_visits,
    COALESCE((SELECT logged_in FROM s2), 0) AS step2_logged_in,
    COALESCE((SELECT buy_clicks FROM s3), 0) AS step3_buy_clicks,
    COALESCE((SELECT success FROM s4), 0) AS step4_success,
    COALESCE((SELECT failed FROM s5), 0) AS step5_failed;
END;
$$;

REVOKE ALL ON FUNCTION public.get_conversion_funnel(TIMESTAMPTZ, TIMESTAMPTZ) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.get_conversion_funnel(TIMESTAMPTZ, TIMESTAMPTZ) TO authenticated;


-- ── SECTION: 018_page_engagement_rpc.sql ──
-- ============================================================================
-- 018_page_engagement_rpc.sql
-- RPC to fetch user-level page engagement with JSON aggregate
-- ============================================================================

DROP FUNCTION IF EXISTS public.get_page_engagement(TIMESTAMPTZ, TIMESTAMPTZ);
DROP FUNCTION IF EXISTS public.get_user_page_engagement(TIMESTAMPTZ, TIMESTAMPTZ);

CREATE OR REPLACE FUNCTION public.get_user_page_engagement(
  start_ts TIMESTAMPTZ DEFAULT '2000-01-01'::TIMESTAMPTZ,
  end_ts   TIMESTAMPTZ DEFAULT '2099-01-01'::TIMESTAMPTZ
)
RETURNS TABLE (
  user_id UUID,
  full_name TEXT,
  email TEXT,
  country TEXT,
  plan TEXT,
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
  WITH user_pages AS (
    SELECT 
      COALESCE(pv.user_id, al.user_id) AS uid,
      COALESCE(pv.page_url, al.page_url) AS page_url,
      COALESCE(pv.visits, 0) AS visits,
      COALESCE(al.time_spent, 0) AS time_spent
    FROM (
      -- visits
      SELECT pv_inner.user_id, pv_inner.page_url, COUNT(DISTINCT pv_inner.session_id) AS visits
      FROM public.page_views pv_inner
      WHERE pv_inner.created_at BETWEEN start_ts AND end_ts
        AND pv_inner.user_id IS NOT NULL
      GROUP BY pv_inner.user_id, pv_inner.page_url
    ) pv
    FULL OUTER JOIN (
      -- time spent
      SELECT sess_times.user_id, sess_times.page_url, SUM(sess_times.time_s) AS time_spent
      FROM (
        SELECT al_inner.user_id, al_inner.page_url, al_inner.metadata->>'session_id' as sess, MAX((al_inner.metadata->>'active_seconds')::numeric) as time_s
        FROM public.activity_logs al_inner
        WHERE al_inner.event_type IN ('session_heartbeat', 'session_end')
          AND al_inner.created_at BETWEEN start_ts AND end_ts
          AND al_inner.user_id IS NOT NULL
          AND al_inner.metadata->>'active_seconds' IS NOT NULL
        GROUP BY al_inner.user_id, al_inner.page_url, al_inner.metadata->>'session_id'
      ) sess_times
      GROUP BY sess_times.user_id, sess_times.page_url
    ) al
    ON pv.user_id = al.user_id AND pv.page_url = al.page_url
  ),
  aggregated_metrics AS (
    SELECT 
      uid,
      jsonb_object_agg(
        page_url,
        jsonb_build_object(
          'visits', visits,
          'time_spent_seconds', time_spent
        )
      ) AS page_metrics
    FROM user_pages
    WHERE page_url IS NOT NULL
    GROUP BY uid
  ),
  user_profiles AS (
    SELECT 
      p.id as uid,
      p.full_name,
      p.email,
      p.country,
      p.created_at as signed_up_at,
      (SELECT MAX(created_at) FROM public.activity_logs WHERE user_id = p.id) as last_seen_at,
      COALESCE((
        SELECT CASE WHEN status = 'completed' THEN 'paid' ELSE status END
        FROM public.purchases
        WHERE user_id = p.id
        ORDER BY created_at DESC LIMIT 1
      ), 'free') as plan
    FROM public.profiles p
  )
  SELECT 
    up.uid,
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
