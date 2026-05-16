-- ============================================================================
-- 011_telemetry_fix.sql
-- Fixes:
--   1. GRANT INSERT on page_views to anon + authenticated
--   2. GRANT INSERT on activity_logs to authenticated
--   3. Adds user_id FK (nullable) to page_views so logged-in visits
--      can be attributed to a user for the "Visits" per-user column
--   4. Notifies PostgREST to reload schema cache
-- Run in Supabase SQL Editor
-- ============================================================================

-- 1. Allow anon inserts into page_views (anonymous visitors)
ALTER TABLE public.page_views ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Anyone can insert page views" ON public.page_views;
CREATE POLICY "Anyone can insert page views" ON public.page_views
  FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Admins can read page views" ON public.page_views;
CREATE POLICY "Admins can read page views" ON public.page_views
  FOR SELECT TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE profiles.id = auth.uid() AND role = 'admin'));

GRANT INSERT ON public.page_views TO anon;
GRANT INSERT ON public.page_views TO authenticated;
GRANT SELECT ON public.page_views TO authenticated;

-- 2. Allow authenticated inserts into activity_logs
ALTER TABLE public.activity_logs ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users can insert activity" ON public.activity_logs;
CREATE POLICY "Users can insert activity" ON public.activity_logs
  FOR INSERT TO authenticated WITH CHECK (user_id = auth.uid());

DROP POLICY IF EXISTS "Admins can read activity logs" ON public.activity_logs;
CREATE POLICY "Admins can read activity logs" ON public.activity_logs
  FOR SELECT TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE profiles.id = auth.uid() AND role = 'admin'));

GRANT INSERT ON public.activity_logs TO authenticated;
GRANT SELECT ON public.activity_logs TO authenticated;

-- 3. Add nullable user_id column to page_views so logged-in users'
--    page views can be attributed to them for the "Visits" column
DO $$ BEGIN
  ALTER TABLE public.page_views ADD COLUMN user_id UUID REFERENCES auth.users(id);
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- Create index for efficient per-user visit counts
CREATE INDEX IF NOT EXISTS idx_page_views_user ON public.page_views(user_id);
CREATE INDEX IF NOT EXISTS idx_page_views_session_user ON public.page_views(session_id, user_id);

-- 4. Notify PostgREST to reload schema cache
NOTIFY pgrst, 'reload schema';
