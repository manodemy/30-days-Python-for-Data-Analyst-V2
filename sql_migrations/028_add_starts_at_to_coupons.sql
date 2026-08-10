-- ============================================================================
-- 028_add_starts_at_to_coupons.sql
-- Add starts_at column to public.coupons table for scheduled coupon activations
-- ============================================================================

DO $$ 
BEGIN
  BEGIN
    ALTER TABLE public.coupons ADD COLUMN starts_at TIMESTAMPTZ;
  EXCEPTION WHEN duplicate_column THEN NULL; END;
END $$;

-- Update RLS policies to respect starts_at
DROP POLICY IF EXISTS "Anyone can read active coupons" ON public.coupons;
CREATE POLICY "Anyone can read active coupons" ON public.coupons FOR SELECT USING (
  is_active = true 
  AND (starts_at IS NULL OR starts_at <= now()) 
  AND (expires_at IS NULL OR expires_at > now())
);
