-- ═══════════════════════════════════════════════════════════════
-- Migration: 042_bundle_enrollment.sql
-- Description: Expand schema for Complete Data Analytics Bundle.
--              Add product_type to enrollments, kernel to grading_rubrics,
--              and update check_enrollment logic.
-- ═══════════════════════════════════════════════════════════════

-- 1. Add product_type to enrollments if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_schema = 'public' 
          AND table_name = 'enrollments' 
          AND column_name = 'product_type'
    ) THEN
        ALTER TABLE public.enrollments ADD COLUMN product_type TEXT DEFAULT 'python';
    END IF;
END $$;

-- 2. Add kernel to grading_rubrics if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_schema = 'public' 
          AND table_name = 'grading_rubrics' 
          AND column_name = 'kernel'
    ) THEN
        ALTER TABLE public.grading_rubrics ADD COLUMN kernel TEXT DEFAULT 'python';
    END IF;
END $$;

-- 3. Update the SELECT policy for notebook_content to support SQL/Excel days
--    Allowing free days for all, and gating other days based on check_enrollment
DROP POLICY IF EXISTS select_notebook_content ON public.notebook_content;
CREATE POLICY select_notebook_content ON public.notebook_content
    FOR SELECT
    TO anon, authenticated
    USING (
        day_id IN ('day01', 'day02', 'sql-day01', 'sql-day02', 'excel-day01', 'excel-day02') OR
        (
            auth.uid() IS NOT NULL AND (
                (SELECT role FROM public.profiles WHERE id = auth.uid()) = 'admin' OR
                public.check_enrollment('python-30day') OR
                (day_id LIKE 'sql-%' AND public.check_enrollment('sql-20day')) OR
                (day_id LIKE 'excel-%' AND public.check_enrollment('excel-12day'))
            )
        )
    );

-- 4. Update check_enrollment function to handle bundle product_type / course_id
CREATE OR REPLACE FUNCTION public.check_enrollment(p_course_id TEXT DEFAULT 'python-30day')
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM public.enrollments
    WHERE user_id = auth.uid()
      AND (
        course_id = p_course_id 
        OR product_type = 'bundle'
        OR course_id = 'bundle-data-analytics'
      )
      AND (expires_at IS NULL OR expires_at > now())
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
