-- ═══════════════════════════════════════════════════════════════════════════════
-- 051_seed_5_reels_campaigns.sql
-- 👑 Full-Funnel Attribution Engine & 5 Instagram Reels Campaign Seed
-- ═══════════════════════════════════════════════════════════════════════════════
-- Attribution Precedence Rules:
-- 1. Sign-Up Attribution: First-Touch (profiles.first_touch_campaign - immutable once set).
-- 2. Session Attribution: Last-Touch (profiles.last_touch_campaign - updated on new campaign visit).
-- 3. Revenue Attribution: Last-Touch frozen at checkout creation (orders.campaign_name -> purchases.last_touch_campaign).
-- 4. Untracked Traffic: Stamped as 'organic_untracked' (never null).
-- ═══════════════════════════════════════════════════════════════════════════════

-- 1. SCHEMA HARDENING FOR AD CAMPAIGNS
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
  qr_code_svg TEXT,
  last_synced_at TIMESTAMPTZ DEFAULT now(),
  created_at TIMESTAMPTZ DEFAULT now()
);

DO $$ 
BEGIN
  BEGIN ALTER TABLE public.ad_campaigns ADD COLUMN campaign_id TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.ad_campaigns ADD COLUMN start_date TIMESTAMPTZ DEFAULT now(); EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.ad_campaigns ADD COLUMN target_url TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.ad_campaigns ADD COLUMN coupon_attached TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.ad_campaigns ADD COLUMN creative_id TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.ad_campaigns ADD COLUMN qr_code_svg TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
END $$;

-- 2. SCHEMA HARDENING FOR CAMPAIGN CLICKS (WITH 30-MIN DEBOUNCE COLUMNS)
CREATE TABLE IF NOT EXISTS public.campaign_clicks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  campaign_name TEXT NOT NULL,
  visitor_id TEXT NOT NULL,
  source TEXT,
  user_agent TEXT,
  last_seen_at TIMESTAMPTZ DEFAULT now(),
  is_unmapped_campaign BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now()
);

DO $$ 
BEGIN
  BEGIN ALTER TABLE public.campaign_clicks ADD COLUMN last_seen_at TIMESTAMPTZ DEFAULT now(); EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.campaign_clicks ADD COLUMN is_unmapped_campaign BOOLEAN DEFAULT false; EXCEPTION WHEN duplicate_column THEN NULL; END;
END $$;

CREATE INDEX IF NOT EXISTS idx_campaign_clicks_campaign_name ON public.campaign_clicks(campaign_name);
CREATE INDEX IF NOT EXISTS idx_campaign_clicks_visitor_id ON public.campaign_clicks(visitor_id);
CREATE INDEX IF NOT EXISTS idx_campaign_clicks_last_seen ON public.campaign_clicks(visitor_id, campaign_name, last_seen_at);

-- 3. SCHEMA HARDENING FOR PURCHASES & ORDERS
DO $$ 
BEGIN
  BEGIN ALTER TABLE public.orders ADD COLUMN campaign_name TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.orders ADD COLUMN currency TEXT DEFAULT 'INR'; EXCEPTION WHEN duplicate_column THEN NULL; END;
  
  BEGIN ALTER TABLE public.purchases ADD COLUMN payment_id TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN first_touch_campaign TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN last_touch_campaign TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN currency TEXT DEFAULT 'INR'; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN amount_gross NUMERIC; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN net_revenue_inr NUMERIC; EXCEPTION WHEN duplicate_column THEN NULL; END;
END $$;

-- Unique constraint on purchases.payment_id for webhook idempotency
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'uq_purchases_payment_id'
  ) THEN
    BEGIN
      ALTER TABLE public.purchases ADD CONSTRAINT uq_purchases_payment_id UNIQUE (payment_id);
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
  END IF;
END $$;

-- 4. HARDENED ROW LEVEL SECURITY (RLS) POLICIES
ALTER TABLE public.ad_campaigns ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.campaign_clicks ENABLE ROW LEVEL SECURITY;

-- ad_campaigns: Public read, Admin write
DROP POLICY IF EXISTS "Public select ad_campaigns" ON public.ad_campaigns;
CREATE POLICY "Public select ad_campaigns" ON public.ad_campaigns FOR SELECT USING (true);

DROP POLICY IF EXISTS "Admin write ad_campaigns" ON public.ad_campaigns;
CREATE POLICY "Admin write ad_campaigns" ON public.ad_campaigns FOR ALL USING (
  auth.role() = 'service_role' OR (SELECT public.is_admin())
);

-- campaign_clicks: Direct insert/select REVOKED from anon/authenticated.
-- Handled strictly via track_campaign_click (SECURITY DEFINER)
DROP POLICY IF EXISTS "Public insert campaign_clicks" ON public.campaign_clicks;
DROP POLICY IF EXISTS "Public select campaign_clicks" ON public.campaign_clicks;
DROP POLICY IF EXISTS "Admin full campaign_clicks" ON public.campaign_clicks;

CREATE POLICY "Admin full campaign_clicks" ON public.campaign_clicks FOR ALL USING (
  auth.role() = 'service_role' OR (SELECT public.is_admin())
);

-- 5. DEBOUNCED CAMPAIGN CLICK RPC FUNCTION
CREATE OR REPLACE FUNCTION public.track_campaign_click(
  p_campaign TEXT,
  p_visitor_id TEXT,
  p_source TEXT DEFAULT NULL,
  p_user_agent TEXT DEFAULT NULL
)
RETURNS VOID AS $$
DECLARE
  v_campaign_clean TEXT;
  v_visitor_clean TEXT;
  v_source_clean TEXT;
  v_is_unmapped BOOLEAN := false;
  v_existing_id UUID;
BEGIN
  -- Normalize inputs
  v_visitor_clean := LOWER(TRIM(COALESCE(p_visitor_id, '')));
  IF v_visitor_clean = '' THEN
    RETURN;
  END IF;

  v_campaign_clean := LOWER(TRIM(COALESCE(p_campaign, '')));
  IF v_campaign_clean = '' OR v_campaign_clean = 'null' OR v_campaign_clean = 'undefined' THEN
    v_campaign_clean := 'organic_untracked';
  ELSE
    -- Check if campaign exists in ad_campaigns
    IF NOT EXISTS (SELECT 1 FROM public.ad_campaigns WHERE LOWER(TRIM(campaign_name)) = v_campaign_clean) THEN
      v_is_unmapped := true;
    END IF;
  END IF;

  v_source_clean := LOWER(TRIM(COALESCE(p_source, 'direct')));

  -- 30-Minute Debounce Check: Check if same visitor + campaign logged in last 30 minutes
  SELECT id INTO v_existing_id
  FROM public.campaign_clicks
  WHERE campaign_name = v_campaign_clean
    AND visitor_id = v_visitor_clean
    AND last_seen_at >= (now() - INTERVAL '30 minutes')
  ORDER BY last_seen_at DESC
  LIMIT 1;

  IF v_existing_id IS NOT NULL THEN
    -- Update existing session timestamp
    UPDATE public.campaign_clicks
    SET last_seen_at = now()
    WHERE id = v_existing_id;
  ELSE
    -- Insert new debounced visit
    INSERT INTO public.campaign_clicks (
      campaign_name,
      visitor_id,
      source,
      user_agent,
      last_seen_at,
      is_unmapped_campaign,
      created_at
    )
    VALUES (
      v_campaign_clean,
      v_visitor_clean,
      v_source_clean,
      p_user_agent,
      now(),
      v_is_unmapped,
      now()
    );
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, pg_temp;

GRANT EXECUTE ON FUNCTION public.track_campaign_click(TEXT, TEXT, TEXT, TEXT) TO anon, authenticated, service_role;

-- 6. SEED THE 5 INSTAGRAM REELS CAMPAIGNS + ORGANIC UNTRACKED
INSERT INTO public.ad_campaigns (
  campaign_id,
  campaign_name,
  platform,
  target_url,
  ad_spend_inr,
  ad_spend_usd,
  start_date,
  qr_code_svg
)
VALUES
  (
    'CMP-REEL01',
    'reel_day04_q1_high_performers',
    'Meta',
    'https://www.manodemy.com/sql-practice?day=4&q=1&utm_source=instagram&utm_medium=reels&utm_campaign=reel_day04_q1_high_performers',
    0,
    0,
    '2026-08-15 00:00:00+00',
    'https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=https%3A%2F%2Fwww.manodemy.com%2Fsql-practice%3Fday%3D4%26q%3D1%26utm_source%3Dinstagram%26utm_medium%3Dreels%26utm_campaign%3Dreel_day04_q1_high_performers'
  ),
  (
    'CMP-REEL02',
    'reel_day04_q2_salary_analytics',
    'Meta',
    'https://www.manodemy.com/sql-practice?day=4&q=2&utm_source=instagram&utm_medium=reels&utm_campaign=reel_day04_q2_salary_analytics',
    0,
    0,
    '2026-08-15 00:00:00+00',
    'https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=https%3A%2F%2Fwww.manodemy.com%2Fsql-practice%3Fday%3D4%26q%3D2%26utm_source%3Dinstagram%26utm_medium%3Dreels%26utm_campaign%3Dreel_day04_q2_salary_analytics'
  ),
  (
    'CMP-REEL03',
    'reel_day04_q3_dept_ranking',
    'Meta',
    'https://www.manodemy.com/sql-practice?day=4&q=3&utm_source=instagram&utm_medium=reels&utm_campaign=reel_day04_q3_dept_ranking',
    0,
    0,
    '2026-08-15 00:00:00+00',
    'https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=https%3A%2F%2Fwww.manodemy.com%2Fsql-practice%3Fday%3D4%26q%3D3%26utm_source%3Dinstagram%26utm_medium%3Dreels%26utm_campaign%3Dreel_day04_q3_dept_ranking'
  ),
  (
    'CMP-REEL04',
    'reel_day04_q4_sales_growth',
    'Meta',
    'https://www.manodemy.com/sql-practice?day=4&q=4&utm_source=instagram&utm_medium=reels&utm_campaign=reel_day04_q4_sales_growth',
    0,
    0,
    '2026-08-15 00:00:00+00',
    'https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=https%3A%2F%2Fwww.manodemy.com%2Fsql-practice%3Fday%3D4%26q%3D4%26utm_source%3Dinstagram%26utm_medium%3Dreels%26utm_campaign%3Dreel_day04_q4_sales_growth'
  ),
  (
    'CMP-REEL05',
    'reel_day04_q5_churn_retention',
    'Meta',
    'https://www.manodemy.com/sql-practice?day=4&q=5&utm_source=instagram&utm_medium=reels&utm_campaign=reel_day04_q5_churn_retention',
    0,
    0,
    '2026-08-15 00:00:00+00',
    'https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=https%3A%2F%2Fwww.manodemy.com%2Fsql-practice%3Fday%3D4%26q%3D5%26utm_source%3Dinstagram%26utm_medium%3Dreels%26utm_campaign%3Dreel_day04_q5_churn_retention'
  ),
  (
    'CMP-ORGANIC',
    'organic_untracked',
    'Direct',
    'https://www.manodemy.com/',
    0,
    0,
    '2026-08-01 00:00:00+00',
    'https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=https%3A%2F%2Fwww.manodemy.com%2F'
  )
ON CONFLICT (campaign_name) DO UPDATE
SET
  platform = EXCLUDED.platform,
  target_url = EXCLUDED.target_url,
  qr_code_svg = EXCLUDED.qr_code_svg,
  last_synced_at = now();

-- 7. REFRESH AD INTELLIGENCE AGGREGATION RPC
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
    SELECT DISTINCT LOWER(TRIM(p.last_touch_campaign)) AS c_name FROM public.purchases p WHERE p.last_touch_campaign IS NOT NULL AND p.created_at BETWEEN start_ts AND end_ts
    UNION
    SELECT DISTINCT LOWER(TRIM(p.first_touch_campaign)) AS c_name FROM public.purchases p WHERE p.first_touch_campaign IS NOT NULL AND p.created_at BETWEEN start_ts AND end_ts
    UNION
    SELECT DISTINCT LOWER(TRIM(prof.first_touch_campaign)) AS c_name FROM public.profiles prof WHERE prof.first_touch_campaign IS NOT NULL AND prof.created_at BETWEEN start_ts AND end_ts
  ),
  clicks_agg AS (
    SELECT 
      LOWER(TRIM(cc.campaign_name)) AS c_name,
      COUNT(cc.id)::BIGINT AS total_visits,
      COUNT(DISTINCT cc.visitor_id)::BIGINT AS unique_visitors
    FROM public.campaign_clicks cc
    WHERE cc.created_at BETWEEN start_ts AND end_ts
    GROUP BY LOWER(TRIM(cc.campaign_name))
  ),
  profiles_agg AS (
    SELECT 
      LOWER(TRIM(prof.first_touch_campaign)) AS c_name,
      COUNT(prof.id)::BIGINT AS total_signins
    FROM public.profiles prof
    WHERE prof.created_at BETWEEN start_ts AND end_ts
    GROUP BY LOWER(TRIM(prof.first_touch_campaign))
  ),
  purchases_agg AS (
    SELECT 
      LOWER(TRIM(COALESCE(p.last_touch_campaign, p.first_touch_campaign))) AS c_name,
      COUNT(p.id)::BIGINT AS total_purchases,
      COALESCE(SUM(COALESCE(p.amount_gross, p.amount_inr, (p.amount_usd * 83.5), (p.amount / 100))), 0)::NUMERIC AS gross_revenue_inr,
      COALESCE(SUM(COALESCE(p.coupon_discount_inr, 0)), 0)::NUMERIC AS discounts_inr,
      COALESCE(SUM(COALESCE(p.net_revenue_inr, p.amount_inr, (p.amount_usd * 83.5), (p.amount / 100))), 0)::NUMERIC AS net_revenue_inr
    FROM public.purchases p
    WHERE (p.status = 'completed' OR p.status = 'success' OR p.status = 'paid')
      AND p.created_at BETWEEN start_ts AND end_ts
    GROUP BY LOWER(TRIM(COALESCE(p.last_touch_campaign, p.first_touch_campaign)))
  )
  SELECT 
    COALESCE(ac.campaign_id, ('CMP-' || UPPER(SUBSTRING(c_keys.c_name, 1, 6))))::TEXT AS campaign_id,
    c_keys.c_name::TEXT AS campaign_name,
    COALESCE(ac.platform, 'Direct')::TEXT AS platform,
    COALESCE(ac.start_date, start_ts)::TIMESTAMPTZ AS start_date,
    COALESCE(ac.target_url, ('https://www.manodemy.com/?utm_campaign=' || c_keys.c_name))::TEXT AS target_url,
    COALESCE(ca.total_visits, 0)::BIGINT AS total_visits,
    COALESCE(ca.unique_visitors, 0)::BIGINT AS unique_visitors,
    COALESCE(pa.total_signins, 0)::BIGINT AS total_signins,
    COALESCE(pua.total_purchases, 0)::BIGINT AS total_purchases,
    COALESCE(pua.gross_revenue_inr, 0)::NUMERIC AS gross_revenue_inr,
    COALESCE(pua.discounts_inr, 0)::NUMERIC AS discounts_inr,
    COALESCE(pua.net_revenue_inr, 0)::NUMERIC AS net_revenue_inr,
    COALESCE(ac.ad_spend_inr + (ac.ad_spend_usd * 83.5), 0)::NUMERIC AS reconciled_ad_spend_inr,
    CASE 
      WHEN COALESCE(ac.ad_spend_inr + (ac.ad_spend_usd * 83.5), 0) > 0 
        THEN ROUND((COALESCE(pua.net_revenue_inr, 0) / (ac.ad_spend_inr + (ac.ad_spend_usd * 83.5)))::NUMERIC, 2)
      ELSE 0
    END AS net_roas
  FROM all_campaign_keys c_keys
  LEFT JOIN public.ad_campaigns ac ON LOWER(TRIM(ac.campaign_name)) = c_keys.c_name
  LEFT JOIN clicks_agg ca ON ca.c_name = c_keys.c_name
  LEFT JOIN profiles_agg pa ON pa.c_name = c_keys.c_name
  LEFT JOIN purchases_agg pua ON pua.c_name = c_keys.c_name
  ORDER BY total_purchases DESC, total_visits DESC;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, pg_temp;

GRANT EXECUTE ON FUNCTION public.get_ad_intelligence_v2(TIMESTAMPTZ, TIMESTAMPTZ) TO anon, authenticated, service_role;
