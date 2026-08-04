-- ============================================================================
-- 010_full_schema_patch.sql
-- Ensure all tables exist and have all required columns for the Admin Dashboard.
-- ============================================================================

-- 1. Create tables if they don't exist at all
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
  discount_type TEXT DEFAULT 'percentage',
  discount_value NUMERIC DEFAULT 0,
  applies_to TEXT DEFAULT 'both',
  max_uses INTEGER,
  current_uses INTEGER DEFAULT 0,
  expires_at TIMESTAMPTZ,
  is_active BOOLEAN DEFAULT true,
  created_by UUID REFERENCES auth.users,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Add columns just in case the tables existed but were missing them
DO $$ 
BEGIN
  -- Patch 'coupons' table
  BEGIN ALTER TABLE public.coupons ADD COLUMN discount_type TEXT DEFAULT 'percentage'; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN discount_value NUMERIC DEFAULT 0; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN applies_to TEXT DEFAULT 'both'; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN max_uses INTEGER; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN current_uses INTEGER DEFAULT 0; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN expires_at TIMESTAMPTZ; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN is_active BOOLEAN DEFAULT true; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.coupons ADD COLUMN created_by UUID REFERENCES auth.users; EXCEPTION WHEN duplicate_column THEN NULL; END;

  -- Patch 'admin_audit_log' table
  BEGIN ALTER TABLE public.admin_audit_log ADD COLUMN admin_id UUID; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.admin_audit_log ADD COLUMN action TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.admin_audit_log ADD COLUMN table_name TEXT; EXCEPTION WHEN duplicate_column THEN NULL; END;
  BEGIN ALTER TABLE public.admin_audit_log ADD COLUMN changed_data JSONB; EXCEPTION WHEN duplicate_column THEN NULL; END;
END $$;

-- 3. Fix admin_audit_log permissions for frontend access
ALTER TABLE public.admin_audit_log ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Admins can view audit logs" ON public.admin_audit_log;
CREATE POLICY "Admins can view audit logs" ON public.admin_audit_log
  FOR SELECT TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE profiles.id = auth.uid() AND role = 'admin'));

-- Ensure frontend roles have correct access
GRANT SELECT ON public.admin_audit_log TO authenticated;
GRANT INSERT ON public.page_views TO anon, authenticated;
GRANT INSERT ON public.activity_logs TO authenticated;

-- Force Schema Cache reload so Supabase sees the new columns instantly
NOTIFY pgrst, 'reload schema';
