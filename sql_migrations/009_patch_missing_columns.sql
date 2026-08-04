-- ============================================================================
-- 009_patch_missing_columns.sql
-- Fixes "column does not exist" errors by adding any missing columns
-- to tables that were created previously without them.
-- ============================================================================

DO $$ 
BEGIN

  -- 1. Patch 'coupons' table
  BEGIN
    ALTER TABLE public.coupons ADD COLUMN discount_type TEXT DEFAULT 'percentage';
  EXCEPTION WHEN duplicate_column THEN NULL; END;

  BEGIN
    ALTER TABLE public.coupons ADD COLUMN applies_to TEXT DEFAULT 'both';
  EXCEPTION WHEN duplicate_column THEN NULL; END;

  BEGIN
    ALTER TABLE public.coupons ADD COLUMN max_uses INTEGER;
  EXCEPTION WHEN duplicate_column THEN NULL; END;

  BEGIN
    ALTER TABLE public.coupons ADD COLUMN expires_at TIMESTAMPTZ;
  EXCEPTION WHEN duplicate_column THEN NULL; END;

  BEGIN
    ALTER TABLE public.coupons ADD COLUMN is_active BOOLEAN DEFAULT true;
  EXCEPTION WHEN duplicate_column THEN NULL; END;


  -- 2. Patch 'admin_audit_log' table
  BEGIN
    ALTER TABLE public.admin_audit_log ADD COLUMN changed_data JSONB;
  EXCEPTION WHEN duplicate_column THEN NULL; END;

  BEGIN
    ALTER TABLE public.admin_audit_log ADD COLUMN table_name TEXT;
  EXCEPTION WHEN duplicate_column THEN NULL; END;

  BEGIN
    ALTER TABLE public.admin_audit_log ADD COLUMN action TEXT;
  EXCEPTION WHEN duplicate_column THEN NULL; END;

  BEGIN
    ALTER TABLE public.admin_audit_log ADD COLUMN admin_id UUID;
  EXCEPTION WHEN duplicate_column THEN NULL; END;

END $$;

-- Force Schema Cache reload so Supabase sees the new columns instantly
NOTIFY pgrst, 'reload schema';
