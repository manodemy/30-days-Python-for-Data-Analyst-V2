-- ═══════════════════════════════════════════════════════════════
-- Migration: 032_telemetry_rls_policies.sql
-- Description: Sets up robust, secure RLS policies for telemetry tables
--              Allowing public inserts for tracking, only admins can read.
-- ═══════════════════════════════════════════════════════════════

-- 1. Enable RLS on page_views and activity_logs
ALTER TABLE public.page_views ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.activity_logs ENABLE ROW LEVEL SECURITY;

-- 2. Drop existing policies if any
DROP POLICY IF EXISTS public_insert_page_views ON public.page_views;
DROP POLICY IF EXISTS admin_select_page_views ON public.page_views;
DROP POLICY IF EXISTS public_insert_activity_logs ON public.activity_logs;
DROP POLICY IF EXISTS admin_select_activity_logs ON public.activity_logs;

-- 3. Create public insert policies (so client telemetry can report visits/events)
CREATE POLICY public_insert_page_views ON public.page_views
  FOR INSERT WITH CHECK (true);

CREATE POLICY public_insert_activity_logs ON public.activity_logs
  FOR INSERT WITH CHECK (true);

-- 4. Create admin-only read/mutate policies
CREATE POLICY admin_select_page_views ON public.page_views
  FOR ALL TO authenticated USING (
    auth.uid() IN (SELECT id FROM public.profiles WHERE role = 'admin')
  );

CREATE POLICY admin_select_activity_logs ON public.activity_logs
  FOR ALL TO authenticated USING (
    auth.uid() IN (SELECT id FROM public.profiles WHERE role = 'admin')
  );
