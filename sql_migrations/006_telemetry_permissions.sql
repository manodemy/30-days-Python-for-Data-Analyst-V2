-- 006_telemetry_permissions.sql

-- 1. Grant base insert permissions to the API roles
GRANT INSERT ON public.page_views TO anon, authenticated;
GRANT INSERT ON public.activity_logs TO authenticated;

-- 2. Enable Row Level Security (Security Best Practice)
ALTER TABLE public.page_views ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.activity_logs ENABLE ROW LEVEL SECURITY;

-- 3. Create Policies for page_views
-- Drop them first to be safe if you run this multiple times
DROP POLICY IF EXISTS "Allow anonymous inserts" ON public.page_views;
DROP POLICY IF EXISTS "Allow admins to read page views" ON public.page_views;

-- Anyone can insert a page view (since it tracks anonymous traffic)
CREATE POLICY "Allow anonymous inserts" ON public.page_views 
FOR INSERT WITH CHECK (true);

-- Only admins can read the page views
CREATE POLICY "Allow admins to read page views" ON public.page_views 
FOR SELECT USING (auth.uid() IN (SELECT id FROM profiles WHERE role='admin'));

-- 4. Create Policies for activity_logs
DROP POLICY IF EXISTS "Allow authenticated inserts" ON public.activity_logs;
DROP POLICY IF EXISTS "Allow admins to read activity logs" ON public.activity_logs;

-- Logged-in users can only insert their own activity
CREATE POLICY "Allow authenticated inserts" ON public.activity_logs 
FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);

-- Only admins can read the activity logs
CREATE POLICY "Allow admins to read activity logs" ON public.activity_logs 
FOR SELECT USING (auth.uid() IN (SELECT id FROM profiles WHERE role='admin'));
