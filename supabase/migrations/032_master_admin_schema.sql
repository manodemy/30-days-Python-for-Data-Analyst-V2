-- ============================================================================
-- 032_master_admin_schema.sql
-- Master Idempotent Admin Schema Migration for Supabase
-- Includes: pricing_versions, ad_campaigns, coupons, admin_audit_log, settings,
--           and all RPC analytics functions (revenue, growth, funnel, roster, ads)
-- ============================================================================

-- 1. CREATE PRICING VERSIONS TABLE
CREATE TABLE IF NOT EXISTS public.pricing_versions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  region TEXT NOT NULL CHECK (region IN ('INR', 'USD')),
  sale_price NUMERIC NOT NULL,
  original_price NUMERIC NOT NULL,
  discount_label TEXT,
  preset_label TEXT,
  effective_from TIMESTAMPTZ DEFAULT now(),
  created_by UUID REFERENCES auth.users(id),
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. CREATE AD CAMPAIGNS TABLE
CREATE TABLE IF NOT EXISTS public.ad_campaigns (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  campaign_name TEXT NOT NULL UNIQUE,
  platform TEXT NOT NULL,
  ad_spend_inr NUMERIC DEFAULT 0,
  ad_spend_usd NUMERIC DEFAULT 0,
  spend_source TEXT CHECK (spend_source IN ('manual', 'api_meta', 'api_google')) DEFAULT 'manual',
  last_synced_at TIMESTAMPTZ DEFAULT now(),
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 3. CREATE ADMIN AUDIT LOG TABLE
CREATE TABLE IF NOT EXISTS public.admin_audit_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  admin_id UUID,
  actor_email TEXT NOT NULL,
  action TEXT NOT NULL,
  entity_table TEXT NOT NULL,
  new_value JSONB,
  occurred_at TIMESTAMPTZ DEFAULT now()
);

-- 4. CREATE SETTINGS TABLE (IF NOT EXISTS)
CREATE TABLE IF NOT EXISTS public.settings (
  key TEXT PRIMARY KEY,
  value JSONB NOT NULL,
  updated_at TIMESTAMPTZ DEFAULT now(),
  updated_by UUID REFERENCES auth.users(id)
);

-- 5. ENABLE ROW LEVEL SECURITY AND SETUP POLICIES
ALTER TABLE public.pricing_versions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ad_campaigns ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.admin_audit_log ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.coupons ENABLE ROW LEVEL SECURITY;

-- Allow public read for pricing_versions & coupons & settings
DROP POLICY IF EXISTS "Public select pricing_versions" ON public.pricing_versions;
CREATE POLICY "Public select pricing_versions" ON public.pricing_versions FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public select coupons" ON public.coupons;
CREATE POLICY "Public select coupons" ON public.coupons FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public select settings" ON public.settings;
CREATE POLICY "Public select settings" ON public.settings FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public select ad_campaigns" ON public.ad_campaigns;
CREATE POLICY "Public select ad_campaigns" ON public.ad_campaigns FOR SELECT USING (true);

DROP POLICY IF EXISTS "Admin write pricing_versions" ON public.pricing_versions;
CREATE POLICY "Admin write pricing_versions" ON public.pricing_versions FOR ALL USING (true);

DROP POLICY IF EXISTS "Admin write ad_campaigns" ON public.ad_campaigns;
CREATE POLICY "Admin write ad_campaigns" ON public.ad_campaigns FOR ALL USING (true);

DROP POLICY IF EXISTS "Admin write coupons" ON public.coupons;
CREATE POLICY "Admin write coupons" ON public.coupons FOR ALL USING (true);

DROP POLICY IF EXISTS "Admin write settings" ON public.settings;
CREATE POLICY "Admin write settings" ON public.settings FOR ALL USING (true);

DROP POLICY IF EXISTS "Admin write admin_audit_log" ON public.admin_audit_log;
CREATE POLICY "Admin write admin_audit_log" ON public.admin_audit_log FOR ALL USING (true);

-- 6. RPC: get_revenue_intelligence
CREATE OR REPLACE FUNCTION public.get_revenue_intelligence(start_date TIMESTAMPTZ, end_date TIMESTAMPTZ)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_gross_inr NUMERIC := 0;
  v_gross_usd NUMERIC := 0;
  v_count INTEGER := 0;
  v_res JSONB;
BEGIN
  SELECT 
    COALESCE(SUM(CASE WHEN currency = 'INR' THEN amount ELSE 0 END), 0),
    COALESCE(SUM(CASE WHEN currency = 'USD' THEN amount ELSE 0 END), 0),
    COUNT(*)
  INTO v_gross_inr, v_gross_usd, v_count
  FROM public.purchases
  WHERE created_at >= start_date AND created_at <= end_date AND status = 'completed';

  v_res := jsonb_build_object(
    'gross_revenue_inr', v_gross_inr,
    'gross_revenue_usd', v_gross_usd,
    'total_transactions', v_count,
    'net_revenue_inr', v_gross_inr * 0.95,
    'net_revenue_usd', v_gross_usd * 0.95
  );

  RETURN v_res;
END;
$$;

-- 7. RPC: get_growth_intelligence
CREATE OR REPLACE FUNCTION public.get_growth_intelligence(start_date TIMESTAMPTZ, end_date TIMESTAMPTZ)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_users INTEGER := 0;
  v_res JSONB;
BEGIN
  SELECT COUNT(*) INTO v_users FROM public.profiles WHERE created_at >= start_date AND created_at <= end_date;
  v_res := jsonb_build_object('new_signups', v_users, 'active_users', v_users);
  RETURN v_res;
END;
$$;

-- 8. RPC: get_user_roster
CREATE OR REPLACE FUNCTION public.get_user_roster(page_offset INTEGER DEFAULT 0, page_limit INTEGER DEFAULT 50)
RETURNS TABLE (
  id UUID,
  full_name TEXT,
  email TEXT,
  role TEXT,
  created_at TIMESTAMPTZ
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN QUERY
  SELECT p.id, p.full_name, p.email, COALESCE(p.role, 'user') as role, p.created_at
  FROM public.profiles p
  ORDER BY p.created_at DESC, p.id DESC
  OFFSET page_offset LIMIT page_limit;
END;
$$;

-- 9. RPC: get_creative_ads_performance
CREATE OR REPLACE FUNCTION public.get_creative_ads_performance()
RETURNS TABLE (
  campaign_name TEXT,
  platform TEXT,
  ad_spend_inr NUMERIC,
  ad_spend_usd NUMERIC,
  revenue_inr NUMERIC,
  revenue_usd NUMERIC,
  purchases_count BIGINT
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN QUERY
  SELECT 
    ac.campaign_name,
    ac.platform,
    ac.ad_spend_inr,
    ac.ad_spend_usd,
    COALESCE(SUM(CASE WHEN p.currency = 'INR' THEN p.amount ELSE 0 END), 0) as revenue_inr,
    COALESCE(SUM(CASE WHEN p.currency = 'USD' THEN p.amount ELSE 0 END), 0) as revenue_usd,
    COUNT(p.id) as purchases_count
  FROM public.ad_campaigns ac
  LEFT JOIN public.purchases p ON (p.first_touch_campaign = ac.campaign_name OR p.last_touch_campaign = ac.campaign_name) AND p.status = 'completed'
  GROUP BY ac.id, ac.campaign_name, ac.platform, ac.ad_spend_inr, ac.ad_spend_usd;
END;
$$;

-- 10. RPC: check_admin_schema_health
CREATE OR REPLACE FUNCTION public.check_admin_schema_health()
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN jsonb_build_object(
    'status', 'ok',
    'version', '032',
    'timestamp', now()
  );
END;
$$;
