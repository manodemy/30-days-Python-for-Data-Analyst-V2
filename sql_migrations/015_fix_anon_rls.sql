-- ============================================================================
-- 015_fix_anon_rls.sql
-- Fix: Anonymous visitors (user_id = NULL) could not insert page_views
--      due to RLS policy mismatch. This was silently dropping all
--      non-logged-in visit tracking.
-- Run in Supabase SQL Editor
-- ============================================================================

-- 1. Allow user_id to be NULL (anonymous visitors)
ALTER TABLE public.page_views ALTER COLUMN user_id DROP NOT NULL;

-- 2. Drop and recreate the insert policy to explicitly allow null user_id
DROP POLICY IF EXISTS "Anyone can insert page views" ON public.page_views;
CREATE POLICY "Anyone can insert page views" ON public.page_views
  FOR INSERT WITH CHECK (true);

-- 3. Ensure anon role has INSERT privilege
GRANT INSERT ON public.page_views TO anon;
GRANT INSERT ON public.page_views TO authenticated;

-- 4. Keep SELECT restricted to admins
DROP POLICY IF EXISTS "Admins can read page views" ON public.page_views;
CREATE POLICY "Admins can read page views" ON public.page_views
  FOR SELECT TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE profiles.id = auth.uid() AND role = 'admin'
    )
  );

-- 5. Reload PostgREST schema cache
NOTIFY pgrst, 'reload schema';
