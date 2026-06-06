-- ═══════════════════════════════════════════════════════════════
-- Migration: 039_notebook_content.sql
-- Description: Creates the notebook_content table, configures RLS,
--              and sets up granular security for notebook lessons.
-- ═══════════════════════════════════════════════════════════════

-- 1. Create the notebook_content table
CREATE TABLE IF NOT EXISTS public.notebook_content (
    day_id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    html_body TEXT NOT NULL,
    sections JSONB DEFAULT '[]'::jsonb NOT NULL,
    cells JSONB DEFAULT '[]'::jsonb NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Enable Row Level Security (RLS) on notebook_content
ALTER TABLE public.notebook_content ENABLE ROW LEVEL SECURITY;

-- 3. SELECT policy: Allows everyone to read Day 1 & Day 2 (free days).
--    Paid days (Day 3-30) require either 'admin' role or a valid course enrollment.
CREATE POLICY select_notebook_content ON public.notebook_content
    FOR SELECT
    TO anon, authenticated
    USING (
        day_id IN ('day01', 'day02') OR
        (
            auth.uid() IS NOT NULL AND (
                (SELECT role FROM public.profiles WHERE id = auth.uid()) = 'admin' OR
                public.check_enrollment('python-30day')
            )
        )
    );

-- 4. INSERT/UPDATE/DELETE policies for mutations (service_role or admin only)
CREATE POLICY admin_all_notebook_content ON public.notebook_content
    FOR ALL
    TO authenticated
    USING ((SELECT role FROM public.profiles WHERE id = auth.uid()) = 'admin')
    WITH CHECK ((SELECT role FROM public.profiles WHERE id = auth.uid()) = 'admin');

CREATE POLICY service_role_all_notebook_content ON public.notebook_content
    FOR ALL
    TO service_role
    USING (true)
    WITH CHECK (true);
