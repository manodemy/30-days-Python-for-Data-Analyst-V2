-- ============================================================================
-- 030_creative_ads_attribution_down.sql
-- Down Migration / Rollback Script for 030_creative_ads_attribution.sql
-- ============================================================================

-- 1. DROP RPC & VIEWS
DROP FUNCTION IF EXISTS public.get_creative_ads_performance(TIMESTAMPTZ, TIMESTAMPTZ, TEXT);
DROP VIEW IF EXISTS public.invalid_coupon_alerts;

-- 2. DROP INDEXES
DROP INDEX IF EXISTS public.idx_purchases_gateway_payment_id;
DROP INDEX IF EXISTS public.idx_purchases_first_touch_campaign;
DROP INDEX IF EXISTS public.idx_purchases_last_touch_campaign;
DROP INDEX IF EXISTS public.idx_ad_campaigns_campaign_name;
DROP INDEX IF EXISTS public.idx_attr_rate_limit_ip_date;

-- 3. DROP TRIGGER & SANITIZER FUNCTION
DROP TRIGGER IF EXISTS trg_purchases_attribution_sanitize ON public.purchases;
DROP FUNCTION IF EXISTS public.trg_sanitize_purchases_attribution();
DROP FUNCTION IF EXISTS public.sanitize_utm_param(TEXT);
DROP FUNCTION IF EXISTS public.check_attribution_rate_limit(TEXT);

-- 4. DROP RATE LIMIT LOG & AD CAMPAIGNS TABLE
DROP TABLE IF EXISTS public.attribution_rate_limit_log;
DROP TABLE IF EXISTS public.ad_campaigns;

-- 5. REMOVE ADDED COLUMNS FROM PURCHASES
ALTER TABLE public.purchases DROP CONSTRAINT IF EXISTS purchases_gateway_payment_id_key;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS gateway_payment_id;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS first_touch_source;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS first_touch_medium;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS first_touch_campaign;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS first_touch_content;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS first_touch_creative_id;

ALTER TABLE public.purchases DROP COLUMN IF EXISTS last_touch_source;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS last_touch_medium;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS last_touch_campaign;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS last_touch_content;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS last_touch_creative_id;

ALTER TABLE public.purchases DROP COLUMN IF EXISTS fx_rate_used;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS fx_rate_captured_at;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS fx_rate_missing;
ALTER TABLE public.purchases DROP COLUMN IF EXISTS coupon_valid;
