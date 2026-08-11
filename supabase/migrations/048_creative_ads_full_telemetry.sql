-- 048_creative_ads_full_telemetry.sql
-- Full Telemetry, Primary Key Campaign ID, Click Tracking & Comprehensive Ad Intelligence RPC

-- 1. ENHANCE AD CAMPAIGNS TABLE
CREATE TABLE IF NOT EXISTS public.ad_campaigns (
  campaign_id TEXT PRIMARY KEY DEFAULT ('CMP-' || upper(substring(replace(gen_random_uuid()::text, '-', ''), 1, 6))),
  campaign_name TEXT NOT NULL UNIQUE,
  platform TEXT NOT NULL,
  start_date TIMESTAMPTZ DEFAULT now(),
  target_url TEXT,
  ad_spend_inr NUMERIC DEFAULT 0,
  ad_spend_usd NUMERIC DEFAULT 0,
  spend_source TEXT DEFAULT 'manual',
  coupon_attached TEXT,
  creative_id TEXT,
  last_synced_at TIMESTAMPTZ DEFAULT now(),
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Ensure missing columns exist if table pre-existed
DO $$ 
BEGIN
  BEGIN ALTER TABLE public.ad_campaigns ADD COLUMN campaign_id TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.ad_campaigns ADD COLUMN start_date TIMESTAMPTZ DEFAULT now(); EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.ad_campaigns ADD COLUMN target_url TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.ad_campaigns ADD COLUMN coupon_attached TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.ad_campaigns ADD COLUMN creative_id TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
END $$;

-- Populate campaign_id if null
UPDATE public.ad_campaigns 
SET campaign_id = 'CMP-' || upper(substring(replace(id::text, '-', ''), 1, 6))
WHERE campaign_id IS NULL;

-- 2. CREATE CAMPAIGN CLICKS TELEMETRY TABLE
CREATE TABLE IF NOT EXISTS public.campaign_clicks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  campaign_name TEXT NOT NULL,
  visitor_id TEXT NOT NULL,
  source TEXT,
  user_agent TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_campaign_clicks_campaign_name ON public.campaign_clicks(campaign_name);
CREATE INDEX IF NOT EXISTS idx_campaign_clicks_visitor_id ON public.campaign_clicks(visitor_id);

-- 3. ENSURE PROFILES HAS FIRST/LAST TOUCH CAMPAIGN COLUMNS
DO $$ 
BEGIN
  BEGIN ALTER TABLE public.profiles ADD COLUMN first_touch_campaign TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.profiles ADD COLUMN last_touch_campaign TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
END $$;

-- 4. RLS POLICIES FOR CAMPAIGN CLICKS & AD CAMPAIGNS
ALTER TABLE public.ad_campaigns ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.campaign_clicks ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Public select ad_campaigns" ON public.ad_campaigns;
CREATE POLICY "Public select ad_campaigns" ON public.ad_campaigns FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public insert ad_campaigns" ON public.ad_campaigns;
CREATE POLICY "Public insert ad_campaigns" ON public.ad_campaigns FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Public update ad_campaigns" ON public.ad_campaigns;
CREATE POLICY "Public update ad_campaigns" ON public.ad_campaigns FOR UPDATE USING (true);

DROP POLICY IF EXISTS "Public insert campaign_clicks" ON public.campaign_clicks;
CREATE POLICY "Public insert campaign_clicks" ON public.campaign_clicks FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Admin full campaign_clicks" ON public.campaign_clicks;
CREATE POLICY "Admin full campaign_clicks" ON public.campaign_clicks FOR ALL USING (true);

-- 5. RPC FUNCTION TO TRACK CLICK
CREATE OR REPLACE FUNCTION public.track_campaign_click(
  p_campaign TEXT,
  p_visitor_id TEXT,
  p_source TEXT DEFAULT NULL
)
RETURNS VOID AS $$
BEGIN
  IF p_campaign IS NOT NULL AND TRIM(p_campaign) <> '' AND p_visitor_id IS NOT NULL THEN
    INSERT INTO public.campaign_clicks (campaign_name, visitor_id, source)
    VALUES (LOWER(TRIM(p_campaign)), LOWER(TRIM(p_visitor_id)), LOWER(TRIM(COALESCE(p_source, 'direct'))));
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, pg_temp;

-- 6. RPC FUNCTION GET_AD_INTELLIGENCE_V2
CREATE OR REPLACE FUNCTION public.get_ad_intelligence_v2(
  start_ts TIMESTAMPTZ DEFAULT '2000-01-01 00:00:00+00',
  end_ts TIMESTAMPTZ DEFAULT '2099-12-31 23:59:59+00'
)
RETURNS TABLE (
  campaign_id TEXT,
  campaign_name TEXT,
  platform TEXT,
  start_date TIMESTAMPTZ,
  target_url TEXT,
  total_visits BIGINT,
  unique_visitors BIGINT,
  total_signins BIGINT,
  total_purchases BIGINT,
  gross_revenue_inr NUMERIC,
  discounts_inr NUMERIC,
  net_revenue_inr NUMERIC,
  reconciled_ad_spend_inr NUMERIC,
  net_roas NUMERIC
) AS $$
BEGIN
  RETURN QUERY
  WITH all_campaign_keys AS (
    SELECT DISTINCT LOWER(TRIM(ac.campaign_name)) AS c_name FROM public.ad_campaigns ac WHERE ac.campaign_name IS NOT NULL
    UNION
    SELECT DISTINCT LOWER(TRIM(cc.campaign_name)) AS c_name FROM public.campaign_clicks cc WHERE cc.campaign_name IS NOT NULL AND cc.created_at BETWEEN start_ts AND end_ts
    UNION
    SELECT DISTINCT LOWER(TRIM(p.first_touch_campaign)) AS c_name FROM public.purchases p WHERE p.first_touch_campaign IS NOT NULL AND p.created_at BETWEEN start_ts AND end_ts
    UNION
    SELECT DISTINCT LOWER(TRIM(prof.first_touch_campaign)) AS c_name FROM public.profiles prof WHERE prof.first_touch_campaign IS NOT NULL AND prof.created_at BETWEEN start_ts AND end_ts
  ),
  clicks_summary AS (
    SELECT 
      LOWER(TRIM(cc.campaign_name)) AS c_name,
      COUNT(cc.id)::BIGINT AS visits,
      COUNT(DISTINCT cc.visitor_id)::BIGINT AS unq_visitors
    FROM public.campaign_clicks cc
    WHERE cc.created_at BETWEEN start_ts AND end_ts
    GROUP BY LOWER(TRIM(cc.campaign_name))
  ),
  profiles_summary AS (
    SELECT 
      LOWER(TRIM(prof.first_touch_campaign)) AS c_name,
      COUNT(prof.id)::BIGINT AS signins
    FROM public.profiles prof
    WHERE prof.created_at BETWEEN start_ts AND end_ts AND prof.first_touch_campaign IS NOT NULL
    GROUP BY LOWER(TRIM(prof.first_touch_campaign))
  ),
  purchases_summary AS (
    SELECT 
      LOWER(TRIM(p.first_touch_campaign)) AS c_name,
      COUNT(p.id)::BIGINT AS purchases_count,
      ROUND(SUM(COALESCE(p.amount_inr, 0)), 2) AS gross_rev,
      ROUND(SUM(CASE WHEN LOWER(COALESCE(c.discount_type, '')) = 'percentage' THEN (COALESCE(p.amount_inr, 0) * (COALESCE(c.discount_value, 0) / 100.0)) ELSE COALESCE(c.discount_value, 0) END), 2) AS total_disc,
      ROUND(AVG(COALESCE(p.fx_rate_used, 83.0)), 2) AS avg_fx
    FROM public.purchases p
    LEFT JOIN public.coupons c ON UPPER(TRIM(c.code)) = UPPER(TRIM(p.coupon_used))
    WHERE p.created_at BETWEEN start_ts AND end_ts AND p.first_touch_campaign IS NOT NULL AND p.status = 'completed'
    GROUP BY LOWER(TRIM(p.first_touch_campaign))
  )
  SELECT 
    COALESCE(ac.campaign_id, ('CMP-' || UPPER(SUBSTRING(REPLACE(c_keys.c_name, ' ', ''), 1, 6))))::TEXT AS campaign_id,
    c_keys.c_name::TEXT AS campaign_name,
    COALESCE(ac.platform, 'organic')::TEXT AS platform,
    COALESCE(ac.start_date, ac.created_at, now())::TIMESTAMPTZ AS start_date,
    COALESCE(ac.target_url, 'https://www.manodemy.com/?utm_campaign=' || c_keys.c_name)::TEXT AS target_url,
    COALESCE(cs.visits, 0)::BIGINT AS total_visits,
    COALESCE(cs.unq_visitors, 0)::BIGINT AS unique_visitors,
    COALESCE(prs.signins, 0)::BIGINT AS total_signins,
    COALESCE(ps.purchases_count, 0)::BIGINT AS total_purchases,
    COALESCE(ps.gross_rev, 0)::NUMERIC AS gross_revenue_inr,
    COALESCE(ps.total_disc, 0)::NUMERIC AS discounts_inr,
    ROUND(COALESCE(ps.gross_rev, 0) - COALESCE(ps.total_disc, 0), 2)::NUMERIC AS net_revenue_inr,
    ROUND(COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * COALESCE(ps.avg_fx, 83.0)), 2)::NUMERIC AS reconciled_ad_spend_inr,
    CASE 
      WHEN (COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * COALESCE(ps.avg_fx, 83.0))) > 0 THEN 
        ROUND((COALESCE(ps.gross_rev, 0) - COALESCE(ps.total_disc, 0)) / (COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * COALESCE(ps.avg_fx, 83.0))), 2) 
      ELSE 0 
    END::NUMERIC AS net_roas
  FROM all_campaign_keys c_keys
  LEFT JOIN public.ad_campaigns ac ON LOWER(TRIM(ac.campaign_name)) = c_keys.c_name
  LEFT JOIN clicks_summary cs ON cs.c_name = c_keys.c_name
  LEFT JOIN profiles_summary prs ON prs.c_name = c_keys.c_name
  LEFT JOIN purchases_summary ps ON ps.c_name = c_keys.c_name
  ORDER BY start_date DESC;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, pg_temp;
