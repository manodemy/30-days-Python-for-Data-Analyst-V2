-- ═══════════════════════════════════════════════════════════════
-- Migration: 036_capture_coupon_phone.sql
-- Captures coupon code, coupon discount value, and buyer phone number
-- for the Admin Intelligence Suite Transaction Ledger
-- ═══════════════════════════════════════════════════════════════

-- ── STEP 1: Add coupon columns to orders ──
ALTER TABLE public.orders
  ADD COLUMN IF NOT EXISTS coupon_code TEXT,
  ADD COLUMN IF NOT EXISTS coupon_discount_inr NUMERIC DEFAULT 0;

-- ── STEP 2: Add phone column to profiles ──
ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS phone TEXT;

-- ── STEP 3: Add coupon_discount_inr to purchases ──
ALTER TABLE public.purchases
  ADD COLUMN IF NOT EXISTS coupon_discount_inr NUMERIC DEFAULT 0;

-- ── STEP 4: Update sync trigger to carry coupon data ──
CREATE OR REPLACE FUNCTION public.sync_payment_to_purchases()
RETURNS TRIGGER AS $$
DECLARE
  v_user_id UUID;
  v_course_id TEXT;
  v_gateway TEXT;
  v_coupon_code TEXT;
  v_coupon_discount_inr NUMERIC;
  v_amount_inr NUMERIC;
  v_amount_original NUMERIC;
  v_purchase_status TEXT;
  v_refunded_at TIMESTAMPTZ := NULL;
  v_inr_usd_rate NUMERIC := 83.5;
BEGIN
  -- 1. Fetch order details (now including coupon data)
  SELECT user_id, course_id, gateway, coupon_code, coupon_discount_inr
  INTO v_user_id, v_course_id, v_gateway, v_coupon_code, v_coupon_discount_inr
  FROM public.orders
  WHERE id = NEW.order_id;

  -- 2. Only sync if a valid order exists
  IF v_user_id IS NOT NULL THEN
    v_amount_original := NEW.amount / 100.0;

    IF NEW.currency = 'INR' THEN
      v_amount_inr := v_amount_original;
    ELSE
      v_amount_inr := v_amount_original * v_inr_usd_rate;
    END IF;

    IF NEW.status = 'captured' THEN
      v_purchase_status := 'completed';
    ELSIF NEW.status = 'refunded' THEN
      v_purchase_status := 'refunded';
      v_refunded_at := now();
    ELSE
      RETURN NEW;
    END IF;

    -- 3. Upsert into purchases with coupon data
    INSERT INTO public.purchases (
      id,
      user_id,
      course_id,
      amount_inr,
      amount_original,
      currency,
      coupon_used,
      coupon_discount_inr,
      payment_gateway,
      status,
      refunded_at,
      created_at
    ) VALUES (
      NEW.id,
      v_user_id,
      NULL,
      v_amount_inr,
      v_amount_original,
      NEW.currency,
      v_coupon_code,              -- ← coupon code from orders
      COALESCE(v_coupon_discount_inr, 0),  -- ← discount amount from orders
      v_gateway,
      v_purchase_status,
      v_refunded_at,
      NEW.created_at
    )
    ON CONFLICT (id) DO UPDATE SET
      status = EXCLUDED.status,
      coupon_used = EXCLUDED.coupon_used,
      coupon_discount_inr = EXCLUDED.coupon_discount_inr,
      refunded_at = EXCLUDED.refunded_at;

  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Re-attach trigger
DROP TRIGGER IF EXISTS tr_sync_payment_to_purchases ON public.payments;
CREATE TRIGGER tr_sync_payment_to_purchases
  AFTER INSERT OR UPDATE ON public.payments
  FOR EACH ROW
  EXECUTE FUNCTION public.sync_payment_to_purchases();

-- ── STEP 5: Update get_transaction_ledger RPC to return discount & phone ──
DROP FUNCTION IF EXISTS public.get_transaction_ledger(TIMESTAMPTZ, TIMESTAMPTZ);

CREATE OR REPLACE FUNCTION public.get_transaction_ledger(
  start_ts TIMESTAMPTZ DEFAULT '2000-01-01'::TIMESTAMPTZ,
  end_ts   TIMESTAMPTZ DEFAULT '2099-01-01'::TIMESTAMPTZ
)
RETURNS TABLE (
  id                  UUID,
  user_id             UUID,
  amount_inr          NUMERIC,
  currency            TEXT,
  coupon_used         TEXT,
  coupon_discount_inr NUMERIC,
  payment_gateway     TEXT,
  status              TEXT,
  created_at          TIMESTAMPTZ,
  user_email          TEXT,
  user_name           TEXT,
  user_country        TEXT,
  phone               TEXT
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM profiles WHERE profiles.id = auth.uid() AND role = 'admin'
  ) THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  RETURN QUERY
  SELECT
    p.id,
    p.user_id,
    p.amount_inr,
    p.currency,
    p.coupon_used,
    COALESCE(p.coupon_discount_inr, 0),
    p.payment_gateway,
    p.status,
    p.created_at,
    pr.email,
    pr.full_name,
    pr.country,
    pr.phone
  FROM purchases p
  LEFT JOIN profiles pr ON p.user_id = pr.id
  WHERE p.status IN ('completed', 'paid', 'captured', 'successful', 'refunded')
    AND p.created_at >= start_ts
    AND p.created_at <= end_ts
  ORDER BY p.created_at DESC;
END;
$$;

-- ── Grants ──
GRANT EXECUTE ON FUNCTION public.get_transaction_ledger(TIMESTAMPTZ, TIMESTAMPTZ) TO authenticated;

-- ── Force Schema Cache reload ──
NOTIFY pgrst, 'reload schema';
