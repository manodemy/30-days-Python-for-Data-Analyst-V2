-- ============================================================================
-- 031_admin_performance_indexes.sql
-- Master-Hardened Performance Indexes, RLS Policies, & Read-Only Schema Checks
-- ============================================================================

-- 1. PRICING VERSIONS TABLE (If not present)
CREATE TABLE IF NOT EXISTS public.pricing_versions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  region TEXT NOT NULL CHECK (region IN ('INR', 'USD')),
  sale_price NUMERIC NOT NULL,
  original_price NUMERIC NOT NULL,
  discount_label TEXT,
  preset_label TEXT,
  admin_email TEXT,
  published_by UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  effective_from TIMESTAMPTZ DEFAULT now(),
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. ENABLE ROW LEVEL SECURITY & DEFINE RLS POLICIES FOR PRICING & ADS
ALTER TABLE public.pricing_versions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ad_campaigns ENABLE ROW LEVEL SECURITY;

-- Scoped Read Policies (Public read for landing page & admin)
DROP POLICY IF EXISTS "Public pricing_versions read" ON public.pricing_versions;
CREATE POLICY "Public pricing_versions read" ON public.pricing_versions FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public ad_campaigns read" ON public.ad_campaigns;
CREATE POLICY "Public ad_campaigns read" ON public.ad_campaigns FOR SELECT USING (true);

-- Admin Write Policies (Restricted to authenticated admin users)
DROP POLICY IF EXISTS "Admin write pricing_versions" ON public.pricing_versions;
CREATE POLICY "Admin write pricing_versions" ON public.pricing_versions 
  FOR ALL USING (
    auth.role() = 'authenticated' AND (
      (auth.jwt() ->> 'email') IN ('manodamy25@gmail.com') OR 
      (auth.jwt() -> 'user_metadata' ->> 'role') IN ('admin', 'instructor')
    )
  );

DROP POLICY IF EXISTS "Admin write ad_campaigns" ON public.ad_campaigns;
CREATE POLICY "Admin write ad_campaigns" ON public.ad_campaigns 
  FOR ALL USING (
    auth.role() = 'authenticated' AND (
      (auth.jwt() ->> 'email') IN ('manodamy25@gmail.com') OR 
      (auth.jwt() -> 'user_metadata' ->> 'role') IN ('admin', 'instructor')
    )
  );

-- 3. COMPOSITE PERFORMANCE INDEXES FOR HEAVY RPCs
-- Index for Transaction Ledger & Revenue Intelligence queries
CREATE INDEX IF NOT EXISTS idx_purchases_created_status 
  ON public.purchases (created_at DESC, status);

-- Index for Payment Idempotency Lookups
CREATE INDEX IF NOT EXISTS idx_purchases_gateway_id 
  ON public.purchases (gateway_payment_id) 
  WHERE gateway_payment_id IS NOT NULL;

-- Index for Fast Dual Attribution Campaign Queries
CREATE INDEX IF NOT EXISTS idx_purchases_last_touch_campaign 
  ON public.purchases (last_touch_campaign) 
  WHERE last_touch_campaign IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_purchases_first_touch_campaign 
  ON public.purchases (first_touch_campaign) 
  WHERE first_touch_campaign IS NOT NULL;

-- Index for Pricing Versions Lookups
CREATE INDEX IF NOT EXISTS idx_pricing_versions_region_effective 
  ON public.pricing_versions (region, effective_from DESC);

-- Index for Ad Campaigns Name Lookups
CREATE INDEX IF NOT EXISTS idx_ad_campaigns_name 
  ON public.ad_campaigns (campaign_name);

-- 4. LIGHTWEIGHT READ-ONLY SCHEMA HEALTH CHECK RPC
CREATE OR REPLACE FUNCTION public.check_admin_schema_health()
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_030_applied BOOLEAN := false;
  v_031_applied BOOLEAN := false;
BEGIN
  -- Check if migration 030 RPC exists
  SELECT EXISTS (
    SELECT 1 FROM pg_proc p 
    JOIN pg_namespace n ON p.pronamespace = n.oid 
    WHERE n.nspname = 'public' AND p.proname = 'get_creative_ads_performance'
  ) INTO v_030_applied;

  -- Check if migration 031 pricing_versions table exists
  SELECT EXISTS (
    SELECT 1 FROM information_schema.tables 
    WHERE table_schema = 'public' AND table_name = 'pricing_versions'
  ) INTO v_031_applied;

  RETURN jsonb_build_object(
    'migration_030', v_030_applied,
    'migration_031', v_031_applied,
    'schema_version', '031',
    'checked_at', now()
  );
END;
$$;
