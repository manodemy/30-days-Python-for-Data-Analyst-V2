-- ============================================================
-- PASTE THIS ENTIRE BLOCK INTO SUPABASE SQL EDITOR AND RUN IT
-- It will show you current policy status AND apply the fix.
-- ============================================================

-- ── PART 1: DIAGNOSE (shows what policies currently exist) ───
SELECT 
  tablename,
  policyname,
  cmd,
  roles
FROM pg_policies
WHERE tablename IN ('page_views', 'activity_logs')
ORDER BY tablename, cmd;

-- ── PART 2: FIX (applies all missing policies) ──────────────

-- Add user_id to page_views if missing
DO $$ BEGIN
  ALTER TABLE public.page_views ADD COLUMN user_id UUID REFERENCES auth.users(id);
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- Enable RLS
ALTER TABLE public.page_views ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.activity_logs ENABLE ROW LEVEL SECURITY;

-- Allow ANYONE to insert into page_views (anonymous tracking)
DROP POLICY IF EXISTS "allow_anon_insert_page_views" ON public.page_views;
CREATE POLICY "allow_anon_insert_page_views"
  ON public.page_views FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- Allow admins to read page_views
DROP POLICY IF EXISTS "allow_admin_read_page_views" ON public.page_views;
CREATE POLICY "allow_admin_read_page_views"
  ON public.page_views FOR SELECT
  TO authenticated
  USING (EXISTS (
    SELECT 1 FROM public.profiles
    WHERE profiles.id = auth.uid() AND profiles.role = 'admin'
  ));

-- Allow authenticated users to insert their own activity
DROP POLICY IF EXISTS "allow_user_insert_activity" ON public.activity_logs;
CREATE POLICY "allow_user_insert_activity"
  ON public.activity_logs FOR INSERT
  TO authenticated
  WITH CHECK (user_id = auth.uid());

-- Allow admins to read activity_logs
DROP POLICY IF EXISTS "allow_admin_read_activity" ON public.activity_logs;
CREATE POLICY "allow_admin_read_activity"
  ON public.activity_logs FOR SELECT
  TO authenticated
  USING (EXISTS (
    SELECT 1 FROM public.profiles
    WHERE profiles.id = auth.uid() AND profiles.role = 'admin'
  ));

-- Explicit grants
GRANT INSERT ON public.page_views TO anon;
GRANT INSERT ON public.page_views TO authenticated;
GRANT SELECT ON public.page_views TO authenticated;
GRANT INSERT ON public.activity_logs TO authenticated;
GRANT SELECT ON public.activity_logs TO authenticated;

-- Indexes for performance
CREATE INDEX IF NOT EXISTS idx_pv_user_id ON public.page_views(user_id);
CREATE INDEX IF NOT EXISTS idx_pv_session ON public.page_views(session_id);

-- Reload schema cache
NOTIFY pgrst, 'reload schema';

-- ── PART 3: VERIFY (shows policies AFTER applying) ──────────
SELECT 
  tablename,
  policyname,
  cmd,
  roles
FROM pg_policies
WHERE tablename IN ('page_views', 'activity_logs')
ORDER BY tablename, cmd;
