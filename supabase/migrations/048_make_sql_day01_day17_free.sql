-- Migration 048: Make SQL Days 01 to 17 Free for all users
-- Allows anonymous and authenticated access to notebook_content for sql-day01 through sql-day17

DROP POLICY IF EXISTS select_notebook_content ON public.notebook_content;
CREATE POLICY select_notebook_content ON public.notebook_content
    FOR SELECT
    TO anon, authenticated
    USING (
        day_id IN (
            'day01', 'day02',
            'excel-day01', 'excel-day02',
            'sql-day01', 'sql-day02', 'sql-day03', 'sql-day04', 'sql-day05',
            'sql-day06', 'sql-day07', 'sql-day08', 'sql-day09', 'sql-day10',
            'sql-day11', 'sql-day12', 'sql-day13', 'sql-day14', 'sql-day15',
            'sql-day16', 'sql-day17'
        ) OR
        (
            auth.uid() IS NOT NULL AND (
                (SELECT role FROM public.profiles WHERE id = auth.uid()) = 'admin' OR
                public.check_enrollment('python-30day') OR
                (day_id LIKE 'sql-%' AND public.check_enrollment('sql-20day')) OR
                (day_id LIKE 'excel-%' AND public.check_enrollment('excel-12day'))
            )
        )
    );
