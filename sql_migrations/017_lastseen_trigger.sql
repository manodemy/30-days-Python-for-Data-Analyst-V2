-- ============================================================================
-- 017_lastseen_trigger.sql
-- Fix: profiles.last_sign_in_at was not reliably updated on login.
--      User Roster "Last Seen" column was stale or blank.
--      Syncs last_sign_in_at every time a user's auth record is touched.
-- Run in Supabase SQL Editor
-- ============================================================================

-- 1. Ensure last_sign_in_at column exists on profiles
DO $$ BEGIN
  ALTER TABLE public.profiles ADD COLUMN last_sign_in_at TIMESTAMPTZ;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- 2. Trigger function: sync auth.users.last_sign_in_at → profiles
CREATE OR REPLACE FUNCTION public.sync_last_sign_in()
RETURNS TRIGGER LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
  UPDATE public.profiles
  SET last_sign_in_at = NEW.last_sign_in_at
  WHERE id = NEW.id;
  RETURN NEW;
END;
$$;

-- 3. Attach to auth.users (runs on every login/session refresh)
DROP TRIGGER IF EXISTS trg_sync_last_sign_in ON auth.users;
CREATE TRIGGER trg_sync_last_sign_in
  AFTER UPDATE OF last_sign_in_at ON auth.users
  FOR EACH ROW
  WHEN (NEW.last_sign_in_at IS DISTINCT FROM OLD.last_sign_in_at)
  EXECUTE FUNCTION public.sync_last_sign_in();

-- 4. Backfill: copy current last_sign_in_at from auth.users → profiles
UPDATE public.profiles p
SET last_sign_in_at = u.last_sign_in_at
FROM auth.users u
WHERE p.id = u.id
  AND u.last_sign_in_at IS NOT NULL;

NOTIFY pgrst, 'reload schema';
