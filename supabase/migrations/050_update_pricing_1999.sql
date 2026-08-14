-- ═══════════════════════════════════════════════════════
-- Manodemy Masterclass: Update Indian Pricing to ₹1,999
-- ═══════════════════════════════════════════════════════

INSERT INTO public.settings (key, value, updated_at)
VALUES (
  'pricing',
  '{"inr": 199900, "usd": 4900, "original_inr": 499900, "original_usd": 14900, "discount_label": "60% OFF", "discount_label_usd": "67% OFF", "updated_at": "2026-08-15T00:00:00.000Z"}'::jsonb,
  now()
)
ON CONFLICT (key) DO UPDATE
SET value = EXCLUDED.value,
    updated_at = now();
