-- ============================================================================
-- 016_plan_trigger.sql
-- Fix: profiles.plan_type never auto-updates after a purchase.
--      Plan Distribution chart on Retention tab was always wrong.
--      Also fixes the User Roster "Plan" column.
-- Run in Supabase SQL Editor
-- ============================================================================

-- 1. Trigger function: upgrade/downgrade plan_type based on purchase status
CREATE OR REPLACE FUNCTION public.sync_plan_on_purchase()
RETURNS TRIGGER LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
  IF NEW.status IN ('completed', 'paid', 'captured', 'successful') THEN
    UPDATE public.profiles
    SET plan_type = 'premium'
    WHERE id = NEW.user_id;
  END IF;

  IF NEW.status IN ('refunded', 'disputed') THEN
    -- Only revert to free if user has NO other active purchases
    IF NOT EXISTS (
      SELECT 1 FROM public.purchases
      WHERE user_id = NEW.user_id
        AND status IN ('completed', 'paid', 'captured', 'successful')
        AND id <> NEW.id
    ) THEN
      UPDATE public.profiles
      SET plan_type = 'free'
      WHERE id = NEW.user_id;
    END IF;
  END IF;

  RETURN NEW;
END;
$$;

-- 2. Attach trigger to purchases table (fires on INSERT and UPDATE)
DROP TRIGGER IF EXISTS trg_sync_plan_on_purchase ON public.purchases;
CREATE TRIGGER trg_sync_plan_on_purchase
  AFTER INSERT OR UPDATE OF status ON public.purchases
  FOR EACH ROW EXECUTE FUNCTION public.sync_plan_on_purchase();

-- 3. Backfill: Fix all existing users who already paid but show 'free'
UPDATE public.profiles p
SET plan_type = 'premium'
WHERE EXISTS (
  SELECT 1 FROM public.purchases pu
  WHERE pu.user_id = p.id
    AND pu.status IN ('completed', 'paid', 'captured', 'successful')
)
AND (p.plan_type IS NULL OR p.plan_type = 'free');

NOTIFY pgrst, 'reload schema';
