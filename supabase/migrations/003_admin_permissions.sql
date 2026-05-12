-- Fix RLS for settings table to allow Admins to update pricing
DROP POLICY IF EXISTS "Service role can write settings" ON public.settings;

CREATE POLICY "Admins can update settings" 
ON public.settings 
FOR ALL 
USING (
  EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = auth.uid() AND role = 'admin'
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = auth.uid() AND role = 'admin'
  )
);
