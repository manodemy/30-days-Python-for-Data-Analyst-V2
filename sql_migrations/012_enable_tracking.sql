-- ============================================================================
-- 012_enable_tracking.sql  ← RUN THIS ONE FILE IN SUPABASE SQL EDITOR
-- Fixes ALL visit/tracking permission issues in one shot.
-- Safe to run multiple times.
-- ============================================================================

-- STEP 1: Add user_id column to page_views (for user-attributed visits)
DO $$ BEGIN
  ALTER TABLE public.page_views ADD COLUMN user_id UUID REFERENCES auth.users(id);
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- STEP 2: Enable RLS on both tables
ALTER TABLE public.page_views ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.activity_logs ENABLE ROW LEVEL SECURITY;

-- STEP 3: page_views — allow ANYONE (anon + logged-in) to insert
-- This is intentional: page views are anonymous telemetry
DROP POLICY IF EXISTS "allow_anon_insert_page_views" ON public.page_views;
CREATE POLICY "allow_anon_insert_page_views"
  ON public.page_views
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- STEP 4: page_views — only admins can read
DROP POLICY IF EXISTS "allow_admin_read_page_views" ON public.page_views;
CREATE POLICY "allow_admin_read_page_views"
  ON public.page_views
  FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE profiles.id = auth.uid() AND profiles.role = 'admin'
    )
  );

-- STEP 5: activity_logs — authenticated users can insert their OWN rows
DROP POLICY IF EXISTS "allow_user_insert_activity" ON public.activity_logs;
CREATE POLICY "allow_user_insert_activity"
  ON public.activity_logs
  FOR INSERT
  TO authenticated
  WITH CHECK (user_id = auth.uid());

-- STEP 6: activity_logs — only admins can read
DROP POLICY IF EXISTS "allow_admin_read_activity" ON public.activity_logs;
CREATE POLICY "allow_admin_read_activity"
  ON public.activity_logs
  FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE profiles.id = auth.uid() AND profiles.role = 'admin'
    )
  );

-- STEP 7: Explicit GRANTs (belt and suspenders)
GRANT INSERT ON public.page_views TO anon;
GRANT INSERT ON public.page_views TO authenticated;
GRANT SELECT ON public.page_views TO authenticated;
GRANT INSERT ON public.activity_logs TO authenticated;
GRANT SELECT ON public.activity_logs TO authenticated;

-- STEP 8: Performance indexes
CREATE INDEX IF NOT EXISTS idx_page_views_user_id ON public.page_views(user_id);
CREATE INDEX IF NOT EXISTS idx_page_views_session ON public.page_views(session_id);
CREATE INDEX IF NOT EXISTS idx_page_views_created ON public.page_views(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_activity_logs_user ON public.activity_logs(user_id, created_at DESC);

-- STEP 9: Reload Supabase schema cache
NOTIFY pgrst, 'reload schema';

-- Done! Visits will now be captured for all users.
