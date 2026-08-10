-- ============================================================================
-- 030_creative_ads_attribution.sql
-- Master-Hardened Dual-Touch Attribution, Security Rate-Limiting, Idempotency & ROAS
-- ============================================================================

-- 1. PATCH PURCHASES TABLE (Attribution, FX Rate, Idempotency)
DO $$ 
BEGIN
  -- Idempotency constraint
  BEGIN ALTER TABLE public.purchases ADD COLUMN gateway_payment_id TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD CONSTRAINT purchases_gateway_payment_id_key UNIQUE (gateway_payment_id); EXCEPTION WHEN duplicate_table THEN NULL; WHEN duplicate_object THEN NULL; END;

  -- Dual Attribution Columns
  BEGIN ALTER TABLE public.purchases ADD COLUMN first_touch_source TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN first_touch_medium TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN first_touch_campaign TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN first_touch_content TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN first_touch_creative_id TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;

  BEGIN ALTER TABLE public.purchases ADD COLUMN last_touch_source TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN last_touch_medium TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN last_touch_campaign TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN last_touch_content TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN last_touch_creative_id TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;

  -- FX Rate & Coupon Flags
  BEGIN ALTER TABLE public.purchases ADD COLUMN fx_rate_used NUMERIC; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN fx_rate_captured_at TIMESTAMPTZ; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN fx_rate_missing BOOLEAN DEFAULT false; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.purchases ADD COLUMN coupon_valid BOOLEAN DEFAULT true; EXCEPTION WHEN duplicate_column THEN NULL; END;
END $$;

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

-- 3. CREATE RATE LIMIT LOG TABLE FOR ATTRIBUTION CAPTURE
CREATE TABLE IF NOT EXISTS public.attribution_rate_limit_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  client_ip TEXT NOT NULL,
  captured_at TIMESTAMPTZ DEFAULT now()
);

-- Index for rate limit lookup
CREATE INDEX IF NOT EXISTS idx_attr_rate_limit_ip_date ON public.attribution_rate_limit_log(client_ip, captured_at);

-- Hardened SECURITY DEFINER Rate Limiting Function (Called by Edge Function with server-verified IP)
CREATE OR REPLACE FUNCTION public.check_attribution_rate_limit(p_client_ip TEXT)
RETURNS BOOLEAN AS $$
DECLARE
  v_count INTEGER;
BEGIN
  -- Security Hardening: explicit search_path prevents privilege escalation
  SET LOCAL search_path = public, pg_temp;

  DELETE FROM public.attribution_rate_limit_log WHERE captured_at < now() - INTERVAL '10 minutes';
  
  SELECT COUNT(*) INTO v_count
  FROM public.attribution_rate_limit_log
  WHERE client_ip = p_client_ip AND captured_at > now() - INTERVAL '1 minute';
  
  IF v_count >= 5 THEN
    RETURN FALSE; -- Throttled
  END IF;
  
  INSERT INTO public.attribution_rate_limit_log(client_ip) VALUES (p_client_ip);
  RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, pg_temp;

-- 4. SERVER-SIDE INPUT SANITIZER & NORMALIZER FUNCTION
CREATE OR REPLACE FUNCTION public.sanitize_utm_param(p_val TEXT, p_is_coupon BOOLEAN DEFAULT FALSE)
RETURNS TEXT AS $$
BEGIN
  IF p_val IS NULL THEN RETURN NULL; END IF;
  
  p_val := TRIM(p_val);
  IF NOT p_is_coupon THEN
    p_val := LOWER(p_val);
  ELSE
    p_val := UPPER(p_val); -- Coupon code uppercase consistency
  END IF;

  -- Regex allowlist: alphanumeric, hyphen, underscore, max 100 chars
  IF p_val ~ '^[A-Za-z0-9_\-]{1,100}$' THEN
    RETURN p_val;
  ELSE
    -- Strip forbidden characters
    RETURN SUBSTRING(REGEXP_REPLACE(p_val, '[^A-Za-z0-9_\-]', '', 'g') FROM 1 FOR 100);
  END IF;
END;
$$ LANGUAGE plpgsql IMMUTABLE SET search_path = public, pg_temp;

-- Trigger to sanitize purchases attribution before INSERT or UPDATE
CREATE OR REPLACE FUNCTION public.trg_sanitize_purchases_attribution()
RETURNS TRIGGER AS $$
BEGIN
  NEW.first_touch_source := COALESCE(public.sanitize_utm_param(NEW.first_touch_source), 'unknown');
  NEW.first_touch_medium := COALESCE(public.sanitize_utm_param(NEW.first_touch_medium), 'unknown');
  NEW.first_touch_campaign := public.sanitize_utm_param(NEW.first_touch_campaign);
  NEW.first_touch_content := public.sanitize_utm_param(NEW.first_touch_content);
  NEW.first_touch_creative_id := public.sanitize_utm_param(NEW.first_touch_creative_id);

  NEW.last_touch_source := COALESCE(public.sanitize_utm_param(NEW.last_touch_source), 'unknown');
  NEW.last_touch_medium := COALESCE(public.sanitize_utm_param(NEW.last_touch_medium), 'unknown');
  NEW.last_touch_campaign := public.sanitize_utm_param(NEW.last_touch_campaign);
  NEW.last_touch_content := public.sanitize_utm_param(NEW.last_touch_content);
  NEW.last_touch_creative_id := public.sanitize_utm_param(NEW.last_touch_creative_id);
  
  IF NEW.coupon_used IS NOT NULL THEN
    NEW.coupon_used := public.sanitize_utm_param(NEW.coupon_used, TRUE);
  END IF;

  IF NEW.fx_rate_used IS NULL THEN
    IF NEW.currency IS NULL OR NEW.currency = 'INR' THEN
      NEW.fx_rate_used := 1.0;
      NEW.fx_rate_missing := false;
    ELSE
      NEW.fx_rate_missing := true;
    END IF;
  ELSE
    NEW.fx_rate_missing := false;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SET search_path = public, pg_temp;

DROP TRIGGER IF EXISTS trg_purchases_attribution_sanitize ON public.purchases;
CREATE TRIGGER trg_purchases_attribution_sanitize
BEFORE INSERT OR UPDATE ON public.purchases
FOR EACH ROW EXECUTE FUNCTION public.trg_sanitize_purchases_attribution();

-- 5. INDEXES FOR HIGH-PERFORMANCE ANALYTICS
CREATE INDEX IF NOT EXISTS idx_purchases_gateway_payment_id ON public.purchases(gateway_payment_id);
CREATE INDEX IF NOT EXISTS idx_purchases_first_touch_campaign ON public.purchases(first_touch_campaign);
CREATE INDEX IF NOT EXISTS idx_purchases_last_touch_campaign ON public.purchases(last_touch_campaign);
CREATE INDEX IF NOT EXISTS idx_ad_campaigns_campaign_name ON public.ad_campaigns(campaign_name);

-- 6. ALERTS & DATA QUALITY VIEWS
CREATE OR REPLACE VIEW public.invalid_coupon_alerts AS
SELECT 
  coupon_used,
  COUNT(*) AS invalid_attempts_count,
  MIN(created_at) AS first_attempt_at,
  MAX(created_at) AS latest_attempt_at
FROM public.purchases
WHERE coupon_valid = false AND coupon_used IS NOT NULL AND created_at > now() - INTERVAL '1 hour'
GROUP BY coupon_used
HAVING COUNT(*) >= 10;

CREATE OR REPLACE VIEW public.v_unknown_traffic_alerts AS
SELECT 
  first_touch_source,
  first_touch_medium,
  COUNT(*) AS capture_count
FROM public.purchases
WHERE first_touch_source = 'unknown' OR first_touch_medium = 'unknown'
GROUP BY first_touch_source, first_touch_medium;

CREATE OR REPLACE VIEW public.v_fx_missing_transactions AS
SELECT id, gateway_payment_id, amount_inr, currency, created_at
FROM public.purchases
WHERE fx_rate_missing = true;

-- 7. ROAS ANALYTICS RPC (Reconciled FX Spend & Accurately Calculated Net ROAS)
CREATE OR REPLACE FUNCTION public.get_creative_ads_performance(
  start_ts TIMESTAMPTZ DEFAULT '2000-01-01'::TIMESTAMPTZ,
  end_ts TIMESTAMPTZ DEFAULT '2099-01-01'::TIMESTAMPTZ,
  attribution_mode TEXT DEFAULT 'last_touch'
)
RETURNS TABLE (
  campaign_name TEXT,
  ad_content TEXT,
  creative_id TEXT,
  platform TEXT,
  sales_count BIGINT,
  gross_revenue_inr NUMERIC,
  total_discount_given_inr NUMERIC,
  net_revenue_inr NUMERIC,
  reconciled_ad_spend_inr NUMERIC,
  gross_roas NUMERIC,
  net_roas NUMERIC
) AS $$
BEGIN
  IF attribution_mode = 'first_touch' THEN
    RETURN QUERY
    WITH aggregated AS (
      SELECT 
        COALESCE(p.first_touch_campaign, 'direct_or_unknown')::TEXT AS c_name,
        COALESCE(p.first_touch_content, 'none')::TEXT AS a_content,
        COALESCE(p.first_touch_creative_id, 'none')::TEXT AS c_id,
        COALESCE(p.first_touch_source, 'unknown')::TEXT AS p_form,
        COUNT(p.id)::BIGINT AS s_count,
        ROUND(SUM(p.amount_inr), 2) AS g_rev,
        ROUND(SUM(CASE WHEN LOWER(c.discount_type) = 'percentage' THEN (p.amount_inr * (COALESCE(c.discount_value, 0) / 100.0)) ELSE COALESCE(c.discount_value, 0) END), 2) AS t_disc,
        ROUND(AVG(COALESCE(p.fx_rate_used, 83.0)), 2) AS avg_fx
      FROM public.purchases p
      LEFT JOIN public.coupons c ON UPPER(TRIM(c.code)) = UPPER(TRIM(p.coupon_used))
      WHERE p.created_at BETWEEN start_ts AND end_ts
      GROUP BY p.first_touch_campaign, p.first_touch_content, p.first_touch_creative_id, p.first_touch_source
    )
    SELECT 
      agg.c_name AS campaign_name,
      agg.a_content AS ad_content,
      agg.c_id AS creative_id,
      agg.p_form AS platform,
      agg.s_count AS sales_count,
      agg.g_rev AS gross_revenue_inr,
      agg.t_disc AS total_discount_given_inr,
      ROUND(agg.g_rev - agg.t_disc, 2) AS net_revenue_inr,
      ROUND(COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * agg.avg_fx), 2) AS reconciled_ad_spend_inr,
      CASE 
        WHEN (COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * agg.avg_fx)) > 0 THEN 
          ROUND(agg.g_rev / (COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * agg.avg_fx)), 2) 
        ELSE 0 
      END AS gross_roas,
      CASE 
        WHEN (COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * agg.avg_fx)) > 0 THEN 
          ROUND((agg.g_rev - agg.t_disc) / (COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * agg.avg_fx)), 2) 
        ELSE 0 
      END AS net_roas
    FROM aggregated agg
    LEFT JOIN public.ad_campaigns ac ON LOWER(TRIM(ac.campaign_name)) = LOWER(TRIM(agg.c_name));
  ELSE
    RETURN QUERY
    WITH aggregated AS (
      SELECT 
        COALESCE(p.last_touch_campaign, 'direct_or_unknown')::TEXT AS c_name,
        COALESCE(p.last_touch_content, 'none')::TEXT AS a_content,
        COALESCE(p.last_touch_creative_id, 'none')::TEXT AS c_id,
        COALESCE(p.last_touch_source, 'unknown')::TEXT AS p_form,
        COUNT(p.id)::BIGINT AS s_count,
        ROUND(SUM(p.amount_inr), 2) AS g_rev,
        ROUND(SUM(CASE WHEN LOWER(c.discount_type) = 'percentage' THEN (p.amount_inr * (COALESCE(c.discount_value, 0) / 100.0)) ELSE COALESCE(c.discount_value, 0) END), 2) AS t_disc,
        ROUND(AVG(COALESCE(p.fx_rate_used, 83.0)), 2) AS avg_fx
      FROM public.purchases p
      LEFT JOIN public.coupons c ON UPPER(TRIM(c.code)) = UPPER(TRIM(p.coupon_used))
      WHERE p.created_at BETWEEN start_ts AND end_ts
      GROUP BY p.last_touch_campaign, p.last_touch_content, p.last_touch_creative_id, p.last_touch_source
    )
    SELECT 
      agg.c_name AS campaign_name,
      agg.a_content AS ad_content,
      agg.c_id AS creative_id,
      agg.p_form AS platform,
      agg.s_count AS sales_count,
      agg.g_rev AS gross_revenue_inr,
      agg.t_disc AS total_discount_given_inr,
      ROUND(agg.g_rev - agg.t_disc, 2) AS net_revenue_inr,
      ROUND(COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * agg.avg_fx), 2) AS reconciled_ad_spend_inr,
      CASE 
        WHEN (COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * agg.avg_fx)) > 0 THEN 
          ROUND(agg.g_rev / (COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * agg.avg_fx)), 2) 
        ELSE 0 
      END AS gross_roas,
      CASE 
        WHEN (COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * agg.avg_fx)) > 0 THEN 
          ROUND((agg.g_rev - agg.t_disc) / (COALESCE(ac.ad_spend_inr, 0) + (COALESCE(ac.ad_spend_usd, 0) * agg.avg_fx)), 2) 
        ELSE 0 
      END AS net_roas
    FROM aggregated agg
    LEFT JOIN public.ad_campaigns ac ON LOWER(TRIM(ac.campaign_name)) = LOWER(TRIM(agg.c_name));
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, pg_temp;

-- 8. ROW LEVEL SECURITY (RLS) POLICIES
ALTER TABLE public.ad_campaigns ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.attribution_rate_limit_log ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Admin full access on ad_campaigns" ON public.ad_campaigns;
CREATE POLICY "Admin full access on ad_campaigns" ON public.ad_campaigns FOR ALL USING (
  auth.role() = 'service_role' OR EXISTS (
    SELECT 1 FROM auth.users WHERE auth.uid() = id AND email IN ('manodamy25@gmail.com')
  )
);

DROP POLICY IF EXISTS "Service role access on attribution_rate_limit_log" ON public.attribution_rate_limit_log;
CREATE POLICY "Service role access on attribution_rate_limit_log" ON public.attribution_rate_limit_log FOR ALL USING (
  auth.role() = 'service_role'
);
