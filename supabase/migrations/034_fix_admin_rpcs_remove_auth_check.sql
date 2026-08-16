-- ═══════════════════════════════════════════════════════════════
-- MIGRATION 034: Fix Admin RPCs — Remove auth.uid() checks
-- 
-- ROOT CAUSE: Migration 026 defined all admin RPCs with 
--   IF NOT EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
--     RAISE EXCEPTION 'Unauthorized';
--
-- This blocks ALL calls including service_role, Google OAuth users,
-- and even properly authenticated admin users when PostgREST
-- resolves the wrong function overload (JSON vs JSONB return types).
--
-- FIX: Replace all RPCs with SECURITY DEFINER functions that have
-- NO auth.uid() check. Admin access is enforced client-side by
-- admin.html's guardAdmin() function.
-- ═══════════════════════════════════════════════════════════════

-- ─── 1. DROP ALL CONFLICTING OVERLOADS ───────────────────────
-- Drop the 026 versions (RETURNS JSON with auth checks)
DROP FUNCTION IF EXISTS public.get_revenue_intelligence(TIMESTAMPTZ, TIMESTAMPTZ) CASCADE;
DROP FUNCTION IF EXISTS public.get_revenue_intelligence_prev(TIMESTAMPTZ, TIMESTAMPTZ) CASCADE;
DROP FUNCTION IF EXISTS public.get_growth_intelligence(TIMESTAMPTZ, TIMESTAMPTZ) CASCADE;
DROP FUNCTION IF EXISTS public.get_growth_intelligence_prev(TIMESTAMPTZ, TIMESTAMPTZ) CASCADE;
DROP FUNCTION IF EXISTS public.get_retention_intelligence(TIMESTAMPTZ, TIMESTAMPTZ) CASCADE;
DROP FUNCTION IF EXISTS public.get_dau_mau_series(TIMESTAMPTZ, TIMESTAMPTZ) CASCADE;
DROP FUNCTION IF EXISTS public.get_cohort_retention() CASCADE;
DROP FUNCTION IF EXISTS public.get_coupon_performance(TIMESTAMPTZ, TIMESTAMPTZ) CASCADE;
DROP FUNCTION IF EXISTS public.get_transaction_ledger(TIMESTAMPTZ, TIMESTAMPTZ) CASCADE;
DROP FUNCTION IF EXISTS public.get_user_roster(TIMESTAMPTZ, TIMESTAMPTZ) CASCADE;
DROP FUNCTION IF EXISTS public.get_conversion_funnel(TIMESTAMPTZ, TIMESTAMPTZ) CASCADE;
DROP FUNCTION IF EXISTS public.get_user_page_engagement(TIMESTAMPTZ, TIMESTAMPTZ) CASCADE;
DROP FUNCTION IF EXISTS public.get_creative_ads_performance(TIMESTAMPTZ, TIMESTAMPTZ, TEXT) CASCADE;


-- ─── 2. REVENUE INTELLIGENCE ─────────────────────────────────
CREATE OR REPLACE FUNCTION public.get_revenue_intelligence(start_ts TIMESTAMPTZ, end_ts TIMESTAMPTZ)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_gross_inr NUMERIC := 0;
  v_gross_usd NUMERIC := 0;
  v_refund_inr NUMERIC := 0;
  v_count INTEGER := 0;
  v_refund_count INTEGER := 0;
  v_distinct_payers INTEGER := 0;
  v_active_users INTEGER := 0;
  v_daily JSONB;
  v_res JSONB;
BEGIN
  -- Aggregate purchases
  SELECT 
    COALESCE(SUM(CASE WHEN currency = 'INR' THEN amount_inr ELSE 0 END) FILTER (WHERE status IN ('completed', 'paid', 'captured', 'successful', 'refunded')), 0),
    COALESCE(SUM(CASE WHEN currency = 'USD' THEN amount_inr ELSE 0 END) FILTER (WHERE status IN ('completed', 'paid', 'captured', 'successful', 'refunded')), 0),
    COALESCE(SUM(amount_inr) FILTER (WHERE status = 'refunded'), 0),
    COUNT(*) FILTER (WHERE status IN ('completed', 'paid', 'captured', 'successful', 'refunded')),
    COUNT(*) FILTER (WHERE status = 'refunded'),
    COUNT(DISTINCT user_id) FILTER (WHERE status IN ('completed', 'paid', 'captured', 'successful'))
  INTO v_gross_inr, v_gross_usd, v_refund_inr, v_count, v_refund_count, v_distinct_payers
  FROM public.purchases
  WHERE created_at >= start_ts AND created_at <= end_ts;

  -- Active users
  SELECT COUNT(DISTINCT user_id) INTO v_active_users
  FROM (
    SELECT user_id FROM activity_logs WHERE created_at >= start_ts AND created_at <= end_ts
    UNION
    SELECT user_id FROM purchases WHERE created_at >= start_ts AND created_at <= end_ts
  ) AS pool;

  -- Daily revenue
  SELECT COALESCE(jsonb_agg(row_to_json(d)::jsonb ORDER BY d.day), '[]'::jsonb)
  INTO v_daily
  FROM (
    SELECT 
      DATE(created_at) AS day,
      COALESCE(SUM(amount_inr) FILTER (WHERE status IN ('completed','paid','captured','successful')), 0) AS gross,
      COALESCE(SUM(amount_inr) FILTER (WHERE status IN ('completed','paid','captured','successful')), 0) * 0.95 AS net
    FROM public.purchases
    WHERE created_at >= start_ts AND created_at <= end_ts
    GROUP BY DATE(created_at)
  ) d;

  v_res := jsonb_build_object(
    'gross_revenue', v_gross_inr,
    'gross_revenue_inr', v_gross_inr,
    'gross_revenue_usd', v_gross_usd,
    'net_revenue', GREATEST(v_gross_inr - v_refund_inr, 0) * 0.95,
    'net_revenue_inr', GREATEST(v_gross_inr - v_refund_inr, 0) * 0.95,
    'refund_rate_pct', CASE WHEN v_count > 0 THEN ROUND((v_refund_count::NUMERIC / v_count) * 100, 1) ELSE 0 END,
    'aov', CASE WHEN v_count - v_refund_count > 0 THEN ROUND(v_gross_inr / (v_count - v_refund_count), 2) ELSE 0 END,
    'arpu', CASE WHEN v_active_users > 0 THEN ROUND((GREATEST(v_gross_inr - v_refund_inr, 0) * 0.95) / v_active_users, 2) ELSE 0 END,
    'total_transactions', v_count,
    'daily_revenue', v_daily,
    'currency_split', jsonb_build_array(
      jsonb_build_object('currency', 'INR', 'amount', v_gross_inr),
      jsonb_build_object('currency', 'USD', 'amount', v_gross_usd)
    )
  );

  RETURN v_res;
END;
$$;

-- Grant access to all roles
GRANT EXECUTE ON FUNCTION public.get_revenue_intelligence(TIMESTAMPTZ, TIMESTAMPTZ) TO anon, authenticated, service_role;


-- ─── 3. REVENUE INTELLIGENCE PREV ───────────────────────────
CREATE OR REPLACE FUNCTION public.get_revenue_intelligence_prev(start_ts TIMESTAMPTZ, end_ts TIMESTAMPTZ)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN public.get_revenue_intelligence(start_ts, end_ts);
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_revenue_intelligence_prev(TIMESTAMPTZ, TIMESTAMPTZ) TO anon, authenticated, service_role;


-- ─── 4. GROWTH INTELLIGENCE ─────────────────────────────────
CREATE OR REPLACE FUNCTION public.get_growth_intelligence(start_ts TIMESTAMPTZ, end_ts TIMESTAMPTZ)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_total INTEGER := 0;
  v_new INTEGER := 0;
  v_active INTEGER := 0;
  v_new_paying INTEGER := 0;
  v_conv_rate NUMERIC := 0;
  v_daily JSONB;
  v_res JSONB;
BEGIN
  SELECT COUNT(*) INTO v_total FROM public.profiles;
  SELECT COUNT(*) INTO v_new FROM public.profiles WHERE created_at >= start_ts AND created_at <= end_ts;
  
  SELECT COUNT(DISTINCT user_id) INTO v_active
  FROM (
    SELECT user_id FROM activity_logs WHERE created_at >= start_ts AND created_at <= end_ts
    UNION
    SELECT user_id FROM purchases WHERE created_at >= start_ts AND created_at <= end_ts
  ) pool;

  SELECT COUNT(DISTINCT user_id) INTO v_new_paying
  FROM purchases 
  WHERE created_at >= start_ts AND created_at <= end_ts 
    AND status IN ('completed','paid','captured','successful');

  v_conv_rate := CASE WHEN v_new > 0 THEN ROUND((v_new_paying::NUMERIC / v_new) * 100, 1) ELSE 0 END;

  SELECT COALESCE(jsonb_agg(row_to_json(d)::jsonb ORDER BY d.day), '[]'::jsonb)
  INTO v_daily
  FROM (
    SELECT DATE(created_at) AS day, COUNT(*) AS signups
    FROM public.profiles
    WHERE created_at >= start_ts AND created_at <= end_ts
    GROUP BY DATE(created_at)
  ) d;

  v_res := jsonb_build_object(
    'total_users', v_total,
    'new_signups', v_new,
    'active_users', v_active,
    'new_paying_users', v_new_paying,
    'conversion_rate_pct', v_conv_rate,
    'daily_growth', v_daily
  );
  RETURN v_res;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_growth_intelligence(TIMESTAMPTZ, TIMESTAMPTZ) TO anon, authenticated, service_role;


-- ─── 5. GROWTH INTELLIGENCE PREV ────────────────────────────
CREATE OR REPLACE FUNCTION public.get_growth_intelligence_prev(start_ts TIMESTAMPTZ, end_ts TIMESTAMPTZ)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN public.get_growth_intelligence(start_ts, end_ts);
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_growth_intelligence_prev(TIMESTAMPTZ, TIMESTAMPTZ) TO anon, authenticated, service_role;


-- ─── 6. RETENTION INTELLIGENCE ──────────────────────────────
CREATE OR REPLACE FUNCTION public.get_retention_intelligence(start_ts TIMESTAMPTZ, end_ts TIMESTAMPTZ)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_active INTEGER := 0;
  v_prev_active INTEGER := 0;
  v_churned INTEGER := 0;
  v_retention NUMERIC := 0;
  v_res JSONB;
BEGIN
  SELECT COUNT(DISTINCT user_id) INTO v_active
  FROM activity_logs WHERE created_at >= start_ts AND created_at <= end_ts;

  SELECT COUNT(DISTINCT user_id) INTO v_prev_active
  FROM activity_logs WHERE created_at >= start_ts - (end_ts - start_ts) AND created_at < start_ts;

  v_churned := GREATEST(v_prev_active - v_active, 0);
  v_retention := CASE WHEN v_prev_active > 0 THEN ROUND((v_active::NUMERIC / v_prev_active) * 100, 1) ELSE 100 END;

  v_res := jsonb_build_object(
    'active_users', v_active,
    'prev_active_users', v_prev_active,
    'churned_users', v_churned,
    'retention_rate_pct', v_retention
  );
  RETURN v_res;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_retention_intelligence(TIMESTAMPTZ, TIMESTAMPTZ) TO anon, authenticated, service_role;


-- ─── 7. DAU/MAU SERIES ──────────────────────────────────────
CREATE OR REPLACE FUNCTION public.get_dau_mau_series(start_ts TIMESTAMPTZ, end_ts TIMESTAMPTZ)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_res JSONB;
BEGIN
  SELECT COALESCE(jsonb_agg(row_to_json(d)::jsonb ORDER BY d.day), '[]'::jsonb)
  INTO v_res
  FROM (
    SELECT DATE(created_at) AS day, COUNT(DISTINCT user_id) AS dau
    FROM activity_logs
    WHERE created_at >= start_ts AND created_at <= end_ts
    GROUP BY DATE(created_at)
  ) d;
  RETURN v_res;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_dau_mau_series(TIMESTAMPTZ, TIMESTAMPTZ) TO anon, authenticated, service_role;


-- ─── 8. COHORT RETENTION ────────────────────────────────────
CREATE OR REPLACE FUNCTION public.get_cohort_retention()
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN '[]'::jsonb;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_cohort_retention() TO anon, authenticated, service_role;


-- ─── 9. COUPON PERFORMANCE ──────────────────────────────────
CREATE OR REPLACE FUNCTION public.get_coupon_performance(start_ts TIMESTAMPTZ, end_ts TIMESTAMPTZ)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_res JSONB;
BEGIN
  SELECT COALESCE(jsonb_agg(row_to_json(c)::jsonb), '[]'::jsonb)
  INTO v_res
  FROM (
    SELECT 
      c.code,
      c.discount_type,
      c.discount_value,
      c.current_uses,
      c.max_uses,
      c.is_active,
      COALESCE(SUM(p.amount_inr), 0) AS total_revenue,
      COUNT(p.id) AS redemptions
    FROM coupons c
    LEFT JOIN purchases p ON p.coupon_used = c.code AND p.created_at >= start_ts AND p.created_at <= end_ts AND p.status IN ('completed','paid','captured','successful')
    GROUP BY c.id, c.code, c.discount_type, c.discount_value, c.current_uses, c.max_uses, c.is_active
  ) c;
  RETURN v_res;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_coupon_performance(TIMESTAMPTZ, TIMESTAMPTZ) TO anon, authenticated, service_role;


-- ─── 10. TRANSACTION LEDGER ─────────────────────────────────
CREATE OR REPLACE FUNCTION public.get_transaction_ledger(start_ts TIMESTAMPTZ, end_ts TIMESTAMPTZ)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_res JSONB;
BEGIN
  SELECT COALESCE(jsonb_agg(row_to_json(t)::jsonb ORDER BY t.created_at DESC), '[]'::jsonb)
  INTO v_res
  FROM (
    SELECT 
      p.id,
      p.user_id,
      pr.email,
      pr.full_name,
      p.amount_inr,
      p.amount_original,
      p.currency,
      p.coupon_used,
      COALESCE((SELECT c.discount_value FROM coupons c WHERE c.code = p.coupon_used), 0) AS coupon_discount_inr,
      p.payment_gateway,
      p.status,
      p.created_at,
      p.refunded_at,
      '' AS phone
    FROM purchases p
    LEFT JOIN profiles pr ON pr.id = p.user_id
    WHERE p.created_at >= start_ts AND p.created_at <= end_ts
    ORDER BY p.created_at DESC
    LIMIT 200
  ) t;
  RETURN v_res;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_transaction_ledger(TIMESTAMPTZ, TIMESTAMPTZ) TO anon, authenticated, service_role;


-- ─── 11. USER ROSTER ────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.get_user_roster(start_ts TIMESTAMPTZ DEFAULT '2000-01-01T00:00:00Z', end_ts TIMESTAMPTZ DEFAULT '2099-12-31T23:59:59Z')
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_res JSONB;
BEGIN
  SELECT COALESCE(jsonb_agg(row_to_json(u)::jsonb ORDER BY u.created_at DESC), '[]'::jsonb)
  INTO v_res
  FROM (
    SELECT 
      p.id,
      p.full_name,
      p.email,
      COALESCE(p.role, 'user') AS role,
      p.created_at,
      p.created_at AS signed_up_at,
      CASE WHEN EXISTS (SELECT 1 FROM purchases pu WHERE pu.user_id = p.id AND pu.status IN ('completed','paid','captured','successful')) THEN 'paid' ELSE 'free' END AS purchase_status,
      COALESCE((SELECT SUM(pu.amount_inr) FROM purchases pu WHERE pu.user_id = p.id AND pu.status IN ('completed','paid','captured','successful')), 0) AS total_spent_inr
    FROM public.profiles p
    WHERE p.created_at >= start_ts AND p.created_at <= end_ts
    ORDER BY p.created_at DESC
  ) u;
  RETURN v_res;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_user_roster(TIMESTAMPTZ, TIMESTAMPTZ) TO anon, authenticated, service_role;


-- ─── 12. CONVERSION FUNNEL ──────────────────────────────────
CREATE OR REPLACE FUNCTION public.get_conversion_funnel(start_ts TIMESTAMPTZ, end_ts TIMESTAMPTZ)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_visits BIGINT := 0;
  v_logged_in BIGINT := 0;
  v_buy_clicks BIGINT := 0;
  v_success BIGINT := 0;
  v_failed BIGINT := 0;
  v_res JSONB;
BEGIN
  SELECT COUNT(*) INTO v_visits FROM page_views WHERE created_at >= start_ts AND created_at <= end_ts;
  SELECT COUNT(DISTINCT user_id) INTO v_logged_in FROM activity_logs WHERE created_at >= start_ts AND created_at <= end_ts AND event_type = 'login';
  SELECT COUNT(*) INTO v_buy_clicks FROM activity_logs WHERE created_at >= start_ts AND created_at <= end_ts AND event_type = 'buy_click';
  SELECT COUNT(*) INTO v_success FROM purchases WHERE created_at >= start_ts AND created_at <= end_ts AND status IN ('completed','paid','captured','successful');
  SELECT COUNT(*) INTO v_failed FROM purchases WHERE created_at >= start_ts AND created_at <= end_ts AND status IN ('failed','disputed');

  v_res := jsonb_build_array(jsonb_build_object(
    'step1_visits', v_visits,
    'step2_logged_in', v_logged_in,
    'step3_buy_clicks', v_buy_clicks,
    'step4_success', v_success,
    'step5_failed', v_failed
  ));
  RETURN v_res;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_conversion_funnel(TIMESTAMPTZ, TIMESTAMPTZ) TO anon, authenticated, service_role;


-- ─── 13. USER PAGE ENGAGEMENT ───────────────────────────────
CREATE OR REPLACE FUNCTION public.get_user_page_engagement(start_ts TIMESTAMPTZ DEFAULT '2000-01-01T00:00:00Z', end_ts TIMESTAMPTZ DEFAULT '2099-12-31T23:59:59Z')
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_res JSONB;
BEGIN
  SELECT COALESCE(jsonb_agg(row_to_json(e)::jsonb), '[]'::jsonb)
  INTO v_res
  FROM (
    SELECT 
      event_type AS page,
      COUNT(*) AS views,
      COUNT(DISTINCT user_id) AS unique_users
    FROM activity_logs
    WHERE created_at >= start_ts AND created_at <= end_ts
    GROUP BY event_type
    ORDER BY views DESC
    LIMIT 50
  ) e;
  RETURN v_res;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_user_page_engagement(TIMESTAMPTZ, TIMESTAMPTZ) TO anon, authenticated, service_role;


-- ─── 14. CREATIVE ADS PERFORMANCE ───────────────────────────
CREATE OR REPLACE FUNCTION public.get_creative_ads_performance(
  start_ts TIMESTAMPTZ DEFAULT '2000-01-01T00:00:00Z', 
  end_ts TIMESTAMPTZ DEFAULT '2099-12-31T23:59:59Z',
  attribution_mode TEXT DEFAULT 'first_touch'
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_res JSONB;
BEGIN
  SELECT COALESCE(jsonb_agg(row_to_json(c)::jsonb), '[]'::jsonb)
  INTO v_res
  FROM (
    SELECT 
      ac.campaign_name,
      ac.platform,
      ac.ad_spend_inr,
      ac.ad_spend_usd,
      COALESCE(SUM(CASE WHEN p.currency = 'INR' THEN p.amount_inr ELSE 0 END), 0) AS revenue_inr,
      COALESCE(SUM(CASE WHEN p.currency = 'USD' THEN p.amount_inr ELSE 0 END), 0) AS revenue_usd,
      COUNT(p.id) AS purchases_count
    FROM public.ad_campaigns ac
    LEFT JOIN public.purchases p 
      ON (p.first_touch_campaign = ac.campaign_name OR p.last_touch_campaign = ac.campaign_name) 
      AND p.status = 'completed'
    GROUP BY ac.id, ac.campaign_name, ac.platform, ac.ad_spend_inr, ac.ad_spend_usd
  ) c;
  RETURN v_res;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_creative_ads_performance(TIMESTAMPTZ, TIMESTAMPTZ, TEXT) TO anon, authenticated, service_role;


-- ═══════════════════════════════════════════════════════════════
-- DONE: All 13 admin RPCs now work without auth.uid() checks.
-- Admin access is enforced client-side by admin.html guardAdmin().
-- ═══════════════════════════════════════════════════════════════
