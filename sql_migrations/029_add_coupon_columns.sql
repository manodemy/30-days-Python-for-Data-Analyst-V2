-- ============================================================================
-- 029_add_coupon_columns.sql
-- Patch public.coupons to support starts_at, campaign_tag, single_use_per_email, mode, value, currency_scope
-- ============================================================================

DO $$ 
BEGIN
  BEGIN ALTER TABLE public.coupons ADD COLUMN starts_at TIMESTAMPTZ; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN campaign_tag TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN single_use_per_email BOOLEAN DEFAULT false; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN mode TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN value NUMERIC; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN currency_scope TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN uses_count INTEGER DEFAULT 0; EXCEPTION WHEN duplicate_column THEN NULL; END;
END $$;
