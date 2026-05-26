-- ═══════════════════════════════════════════════════════════════
-- MANODEMY — Add reviewer_role column to reviews table
-- ═══════════════════════════════════════════════════════════════

ALTER TABLE public.reviews ADD COLUMN IF NOT EXISTS reviewer_role TEXT;

-- Rebuild schema cache
NOTIFY pgrst, 'reload schema';
