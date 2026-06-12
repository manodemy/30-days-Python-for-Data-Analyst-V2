-- ═══════════════════════════════════════════════════════════════
-- Migration 041: Referral Earnings System
-- Solo Operator Edition — legally safe, no TDS/TAN/GST required
-- Run in Supabase SQL Editor
-- ═══════════════════════════════════════════════════════════════

-- ───────────────────────────────────────────────────────────────
-- TABLE 1: Referral Codes (one per user, fully random, privacy-safe)
-- ───────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.referral_codes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL UNIQUE REFERENCES auth.users(id) ON DELETE CASCADE,
  code TEXT NOT NULL UNIQUE,           -- 8-char random (charset excludes 0/O/1/I/L)
  total_clicks INTEGER DEFAULT 0,
  total_signups INTEGER DEFAULT 0,
  total_purchases INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);
ALTER TABLE public.referral_codes ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "rc_users_read_own" ON public.referral_codes;
DROP POLICY IF EXISTS "rc_admins_read_all" ON public.referral_codes;
DROP POLICY IF EXISTS "rc_service_full" ON public.referral_codes;
CREATE POLICY "rc_users_read_own"    ON public.referral_codes FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "rc_admins_read_all"   ON public.referral_codes FOR SELECT USING (EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin'));
CREATE POLICY "rc_service_full"      ON public.referral_codes FOR ALL    USING (auth.role() = 'service_role');

-- ───────────────────────────────────────────────────────────────
-- TABLE 2: Referral Tracking (click → signup → purchase funnel)
-- ───────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.referral_tracking (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  referrer_user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  referral_code TEXT NOT NULL,
  referred_user_id UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  referred_email TEXT,
  event_type TEXT NOT NULL CHECK (event_type IN ('click', 'signup', 'purchase')),
  ip_address TEXT,
  user_agent TEXT,
  order_id UUID REFERENCES public.orders(id) ON DELETE SET NULL,
  metadata JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);
ALTER TABLE public.referral_tracking ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "rt_users_read_own" ON public.referral_tracking;
DROP POLICY IF EXISTS "rt_anon_clicks" ON public.referral_tracking;
DROP POLICY IF EXISTS "rt_admins_read_all" ON public.referral_tracking;
DROP POLICY IF EXISTS "rt_service_full" ON public.referral_tracking;
CREATE POLICY "rt_users_read_own"  ON public.referral_tracking FOR SELECT USING (auth.uid() = referrer_user_id);
CREATE POLICY "rt_anon_clicks"     ON public.referral_tracking FOR INSERT WITH CHECK (event_type = 'click');
CREATE POLICY "rt_admins_read_all" ON public.referral_tracking FOR SELECT USING (EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin'));
CREATE POLICY "rt_service_full"    ON public.referral_tracking FOR ALL    USING (auth.role() = 'service_role');

-- ───────────────────────────────────────────────────────────────
-- TABLE 3: Referral Earnings (cross-border + idempotency via UNIQUE order_id)
-- ───────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.referral_earnings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  referrer_user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  referred_user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  order_id UUID NOT NULL UNIQUE REFERENCES public.orders(id) ON DELETE CASCADE,
  -- UNIQUE on order_id: prevents double-crediting when both verify-payment
  -- and payment-webhook fire for the same order

  buyer_country TEXT NOT NULL,           -- ISO-2 code of buyer
  referrer_country TEXT NOT NULL,        -- ISO-2 code of referrer
  is_cross_border BOOLEAN NOT NULL DEFAULT false,

  -- Commission in buyer's currency zone
  original_amount INTEGER NOT NULL,      -- paise if INR, cents if USD
  original_currency TEXT NOT NULL CHECK (original_currency IN ('INR', 'USD')),

  -- Commission in referrer's payout currency
  credited_amount INTEGER NOT NULL,      -- paise if INR, cents if USD
  credited_currency TEXT NOT NULL CHECK (credited_currency IN ('INR', 'USD')),

  -- Exchange rate audit trail (NULL for same-zone)
  exchange_rate NUMERIC(12,6),
  exchange_rate_source TEXT,
  exchange_rate_timestamp TIMESTAMPTZ,

  -- Lifecycle
  status TEXT NOT NULL DEFAULT 'earned' CHECK (status IN ('earned','confirmed','cancelled','paid','forfeited')),
  cooling_ends_at TIMESTAMPTZ NOT NULL,  -- earned_at + 7 days
  confirmed_at TIMESTAMPTZ,             -- earned → confirmed (7-day cooling done)
  cancelled_at TIMESTAMPTZ,             -- cancelled due to refund
  cancellation_reason TEXT,
  forfeited_at TIMESTAMPTZ,             -- confirmed → forfeited (180-day inactivity)
  created_at TIMESTAMPTZ DEFAULT now()
);

COMMENT ON TABLE public.referral_earnings IS
  'Referral commissions. order_id UNIQUE prevents double-crediting from dual payment paths. '
  'earned=instant but locked; confirmed=withdrawable; forfeited=expired after 180 days.';

ALTER TABLE public.referral_earnings ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "re_users_read_own" ON public.referral_earnings;
DROP POLICY IF EXISTS "re_admins_read_all" ON public.referral_earnings;
DROP POLICY IF EXISTS "re_service_full" ON public.referral_earnings;
CREATE POLICY "re_users_read_own"   ON public.referral_earnings FOR SELECT USING (auth.uid() = referrer_user_id);
CREATE POLICY "re_admins_read_all"  ON public.referral_earnings FOR SELECT USING (EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin'));
CREATE POLICY "re_service_full"     ON public.referral_earnings FOR ALL    USING (auth.role() = 'service_role');

-- ───────────────────────────────────────────────────────────────
-- TABLE 4: Withdrawal Requests
-- SECURITY: No client INSERT policy — all inserts via Edge Function (service_role)
-- ───────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.withdrawal_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  amount INTEGER NOT NULL,               -- paise/cents
  currency TEXT NOT NULL CHECK (currency IN ('INR', 'USD')),
  payment_method TEXT NOT NULL CHECK (payment_method IN ('upi', 'gpay', 'phonepe', 'paypal')),
  payment_details JSONB NOT NULL,        -- { upi_id } / { mobile } / { paypal_email }
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','completed','rejected')),
  admin_notes TEXT,                      -- admin fills on approval
  rejection_reason TEXT,                 -- admin fills on rejection (shown to user)
  processed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now()
);
ALTER TABLE public.withdrawal_requests ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "wr_users_read_own" ON public.withdrawal_requests;
DROP POLICY IF EXISTS "wr_admins_read_all" ON public.withdrawal_requests;
DROP POLICY IF EXISTS "wr_admins_update_all" ON public.withdrawal_requests;
DROP POLICY IF EXISTS "wr_service_full" ON public.withdrawal_requests;
-- Users can READ their own requests
CREATE POLICY "wr_users_read_own"    ON public.withdrawal_requests FOR SELECT USING (auth.uid() = user_id);
-- NO INSERT policy for users — intentional hardening.
-- Attack vector blocked: direct supabase.from('withdrawal_requests').insert() from browser console.
-- All inserts go through /functions/v1/request-withdrawal (service_role).
CREATE POLICY "wr_admins_read_all"   ON public.withdrawal_requests FOR SELECT USING (EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin'));
CREATE POLICY "wr_admins_update_all" ON public.withdrawal_requests FOR UPDATE USING (EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin'));
CREATE POLICY "wr_service_full"      ON public.withdrawal_requests FOR ALL    USING (auth.role() = 'service_role');

-- ───────────────────────────────────────────────────────────────
-- TABLE 5: Exchange Rate Cache (60-min TTL, USD→INR)
-- ───────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.exchange_rate_cache (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  base_currency TEXT NOT NULL DEFAULT 'USD',
  target_currency TEXT NOT NULL DEFAULT 'INR',
  rate NUMERIC(12,6) NOT NULL,           -- e.g. 83.7045
  source TEXT NOT NULL,                  -- API URL
  fetched_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  expires_at TIMESTAMPTZ NOT NULL,
  UNIQUE(base_currency, target_currency)
);
ALTER TABLE public.exchange_rate_cache ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "erc_anyone_read" ON public.exchange_rate_cache;
DROP POLICY IF EXISTS "erc_service_writes" ON public.exchange_rate_cache;
CREATE POLICY "erc_anyone_read"   ON public.exchange_rate_cache FOR SELECT USING (true);
CREATE POLICY "erc_service_writes" ON public.exchange_rate_cache FOR ALL   USING (auth.role() = 'service_role');

-- ───────────────────────────────────────────────────────────────
-- PROFILE COLUMN ADDITIONS (safe — IF NOT EXISTS)
-- ───────────────────────────────────────────────────────────────
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS referred_by UUID REFERENCES auth.users(id);
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS referral_banned BOOLEAN DEFAULT false;
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS referral_terms_accepted BOOLEAN DEFAULT false;
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS referral_terms_accepted_at TIMESTAMPTZ;

-- ORDER COLUMN (safe — IF NOT EXISTS)
ALTER TABLE public.orders ADD COLUMN IF NOT EXISTS referral_code TEXT;

-- ───────────────────────────────────────────────────────────────
-- INDEXES
-- ───────────────────────────────────────────────────────────────
CREATE INDEX IF NOT EXISTS idx_ref_codes_code       ON public.referral_codes(code);
CREATE INDEX IF NOT EXISTS idx_ref_codes_user       ON public.referral_codes(user_id);
CREATE INDEX IF NOT EXISTS idx_ref_tracking_referrer ON public.referral_tracking(referrer_user_id);
CREATE INDEX IF NOT EXISTS idx_ref_tracking_code    ON public.referral_tracking(referral_code);
CREATE INDEX IF NOT EXISTS idx_ref_earnings_referrer ON public.referral_earnings(referrer_user_id);
CREATE INDEX IF NOT EXISTS idx_ref_earnings_status  ON public.referral_earnings(status);
CREATE INDEX IF NOT EXISTS idx_ref_earnings_order   ON public.referral_earnings(order_id);
CREATE INDEX IF NOT EXISTS idx_withdrawal_user      ON public.withdrawal_requests(user_id);
CREATE INDEX IF NOT EXISTS idx_withdrawal_status    ON public.withdrawal_requests(status);
CREATE INDEX IF NOT EXISTS idx_exchange_pair        ON public.exchange_rate_cache(base_currency, target_currency);

-- ───────────────────────────────────────────────────────────────
-- DEFAULT REFERRAL CONFIG (does nothing if key already exists)
-- Values are in smallest unit: paise (INR) or cents (USD)
-- reward_inr=20000 → ₹200, discount_inr=10000 → ₹100, yearly_cap_inr=1000000 → ₹10,000
-- reward_usd=200 → $2,   discount_usd=100 → $1,   yearly_cap_usd=12000 → $120
-- ───────────────────────────────────────────────────────────────
INSERT INTO public.settings (key, value) VALUES (
  'referral_config',
  '{
    "reward_inr": 20000,
    "reward_usd": 200,
    "discount_inr": 10000,
    "discount_usd": 100,
    "min_withdrawal_inr": 20000,
    "min_withdrawal_usd": 200,
    "yearly_cap_inr": 1000000,
    "yearly_cap_usd": 12000,
    "cooling_period_days": 7,
    "forfeiture_days": 180,
    "max_referrals_per_day": 10,
    "program_active": true,
    "self_referral_blocked": true,
    "exchange_rate_cache_minutes": 60
  }'::jsonb
) ON CONFLICT (key) DO NOTHING;

-- ───────────────────────────────────────────────────────────────
-- RPC: generate_referral_code
-- Privacy-safe: fully random 8-char code (no name leakage)
-- Charset excludes ambiguous chars: 0, O, 1, I, L
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.generate_referral_code(p_user_id UUID)
RETURNS TEXT AS $$
DECLARE
  v_code TEXT;
  v_chars TEXT := '23456789ABCDEFGHJKLMNPQRSTUVWXYZ';
  v_index INTEGER;
BEGIN
  -- Return existing code if already generated
  SELECT code INTO v_code FROM public.referral_codes WHERE user_id = p_user_id;
  IF v_code IS NOT NULL THEN RETURN v_code; END IF;

  -- Generate unique 8-character code
  LOOP
    v_code := '';
    FOR i IN 1..8 LOOP
      v_index := floor(random() * length(v_chars) + 1)::integer;
      v_code := v_code || substr(v_chars, v_index, 1);
    END LOOP;
    EXIT WHEN NOT EXISTS (SELECT 1 FROM public.referral_codes WHERE code = v_code);
  END LOOP;

  INSERT INTO public.referral_codes (user_id, code) VALUES (p_user_id, v_code);
  RETURN v_code;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ───────────────────────────────────────────────────────────────
-- RPC: increment_referral_purchases (called by Edge Function on purchase)
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.increment_referral_purchases(p_code TEXT)
RETURNS void AS $$
BEGIN
  UPDATE public.referral_codes
  SET total_purchases = total_purchases + 1
  WHERE code = p_code;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ───────────────────────────────────────────────────────────────
-- RPC: get_referral_summary (dashboard hero + stats)
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.get_referral_summary(p_user_id UUID)
RETURNS JSONB AS $$
DECLARE
  v_result JSONB;
  v_country TEXT;
  v_fy_start TIMESTAMPTZ;
  v_fy_cap_inr INTEGER;
  v_fy_cap_usd INTEGER;
BEGIN
  SELECT country INTO v_country FROM public.profiles WHERE id = p_user_id;

  -- Indian financial year starts April 1
  IF EXTRACT(MONTH FROM now()) >= 4 THEN
    v_fy_start := DATE_TRUNC('year', now()) + INTERVAL '3 months';
  ELSE
    v_fy_start := DATE_TRUNC('year', now()) - INTERVAL '9 months';
  END IF;

  SELECT
    COALESCE((value->>'yearly_cap_inr')::INTEGER, 1000000),
    COALESCE((value->>'yearly_cap_usd')::INTEGER, 12000)
  INTO v_fy_cap_inr, v_fy_cap_usd
  FROM public.settings WHERE key = 'referral_config';

  SELECT jsonb_build_object(
    'total_earned',       COALESCE(SUM(CASE WHEN status IN ('earned','confirmed','paid') THEN credited_amount ELSE 0 END), 0),
    'available_balance',  COALESCE(SUM(CASE WHEN status = 'confirmed' THEN credited_amount ELSE 0 END), 0),
    'locked_balance',     COALESCE(SUM(CASE WHEN status = 'earned' THEN credited_amount ELSE 0 END), 0),
    'total_withdrawn',    COALESCE(SUM(CASE WHEN status = 'paid' THEN credited_amount ELSE 0 END), 0),
    'total_referrals',    COUNT(CASE WHEN status IN ('earned','confirmed','paid') THEN 1 END),
    'payout_currency',    CASE WHEN v_country = 'IN' THEN 'INR' ELSE 'USD' END,
    -- Financial year cap (cap checked against created_at, not confirmed_at)
    'fy_earned',          COALESCE(SUM(CASE WHEN status IN ('earned','confirmed','paid') AND created_at >= v_fy_start THEN credited_amount ELSE 0 END), 0),
    'fy_cap',             CASE WHEN v_country = 'IN' THEN v_fy_cap_inr ELSE v_fy_cap_usd END,
    'fy_cap_currency',    CASE WHEN v_country = 'IN' THEN 'INR' ELSE 'USD' END,
    -- Indian buyer breakdown
    'indian_referrals', jsonb_build_object(
      'count',         COUNT(CASE WHEN buyer_country = 'IN' AND status IN ('earned','confirmed','paid') THEN 1 END),
      'total_credited',COALESCE(SUM(CASE WHEN buyer_country = 'IN' AND status IN ('earned','confirmed','paid') THEN credited_amount ELSE 0 END), 0)
    ),
    -- Foreign buyer breakdown
    'foreign_referrals', jsonb_build_object(
      'count',            COUNT(CASE WHEN buyer_country != 'IN' AND status IN ('earned','confirmed','paid') THEN 1 END),
      'total_original_usd',COALESCE(SUM(CASE WHEN buyer_country != 'IN' AND status IN ('earned','confirmed','paid') THEN original_amount ELSE 0 END), 0),
      'total_credited',   COALESCE(SUM(CASE WHEN buyer_country != 'IN' AND status IN ('earned','confirmed','paid') THEN credited_amount ELSE 0 END), 0)
    ),
    'cross_border_count', COUNT(CASE WHEN is_cross_border = true AND status IN ('earned','confirmed','paid') THEN 1 END),
    'current_exchange_rate', COALESCE(
      (SELECT rate FROM public.exchange_rate_cache
       WHERE base_currency = 'USD' AND target_currency = 'INR' AND expires_at > now() LIMIT 1),
      83.50
    )
  ) INTO v_result
  FROM public.referral_earnings
  WHERE referrer_user_id = p_user_id;

  RETURN COALESCE(v_result, jsonb_build_object(
    'total_earned', 0, 'available_balance', 0, 'locked_balance', 0,
    'total_withdrawn', 0, 'total_referrals', 0,
    'payout_currency', CASE WHEN v_country = 'IN' THEN 'INR' ELSE 'USD' END,
    'fy_earned', 0, 'fy_cap', CASE WHEN v_country = 'IN' THEN v_fy_cap_inr ELSE v_fy_cap_usd END,
    'fy_cap_currency', CASE WHEN v_country = 'IN' THEN 'INR' ELSE 'USD' END,
    'indian_referrals', '{"count":0,"total_credited":0}'::jsonb,
    'foreign_referrals', '{"count":0,"total_original_usd":0,"total_credited":0}'::jsonb,
    'cross_border_count', 0, 'current_exchange_rate', 83.50
  ));
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ───────────────────────────────────────────────────────────────
-- RPC: get_referral_earnings_list (paginated earnings history)
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.get_referral_earnings_list(
  p_user_id UUID,
  p_limit INTEGER DEFAULT 50,
  p_offset INTEGER DEFAULT 0
)
RETURNS JSONB AS $$
BEGIN
  RETURN (
    SELECT COALESCE(jsonb_agg(row_to_json(e)), '[]'::jsonb)
    FROM (
      SELECT
        re.id,
        re.buyer_country,
        re.is_cross_border,
        re.original_amount,
        re.original_currency,
        re.credited_amount,
        re.credited_currency,
        re.exchange_rate,
        re.status,
        re.cooling_ends_at,
        re.confirmed_at,
        re.forfeited_at,
        re.created_at,
        GREATEST(0, EXTRACT(EPOCH FROM (re.cooling_ends_at - now())))::INTEGER AS seconds_until_unlock,
        LEFT(p.email, 1) || '***@' || SPLIT_PART(p.email, '@', 2) AS referred_email
      FROM public.referral_earnings re
      JOIN public.profiles p ON p.id = re.referred_user_id
      WHERE re.referrer_user_id = p_user_id
      ORDER BY re.created_at DESC
      LIMIT p_limit OFFSET p_offset
    ) e
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ───────────────────────────────────────────────────────────────
-- SCHEDULED FUNCTION: auto_confirm_referral_earnings
-- Called every 15 minutes: moves earned → confirmed after cooling period
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.auto_confirm_referral_earnings()
RETURNS INTEGER AS $$
DECLARE
  v_count INTEGER;
BEGIN
  UPDATE public.referral_earnings
  SET status = 'confirmed', confirmed_at = now()
  WHERE status = 'earned' AND cooling_ends_at <= now();
  GET DIAGNOSTICS v_count = ROW_COUNT;
  RETURN v_count;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ───────────────────────────────────────────────────────────────
-- SCHEDULED FUNCTION: forfeit_stale_earnings
-- Called daily: moves confirmed → forfeited after 180 days
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.forfeit_stale_earnings()
RETURNS INTEGER AS $$
DECLARE
  v_forfeiture_days INTEGER;
  v_count INTEGER;
BEGIN
  SELECT COALESCE((value->>'forfeiture_days')::INTEGER, 180)
  INTO v_forfeiture_days
  FROM public.settings WHERE key = 'referral_config';

  UPDATE public.referral_earnings
  SET status = 'forfeited', forfeited_at = now()
  WHERE status = 'confirmed'
    AND confirmed_at <= (now() - (v_forfeiture_days || ' days')::INTERVAL);
  GET DIAGNOSTICS v_count = ROW_COUNT;
  RETURN v_count;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ───────────────────────────────────────────────────────────────
-- TRIGGER: cancel referral earning when order is refunded
-- Handles BOTH earned (within 7 days) AND confirmed (late refund)
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.cancel_referral_on_refund()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.status = 'refunded' AND OLD.status != 'refunded' THEN
    UPDATE public.referral_earnings
    SET
      status = 'cancelled',
      cancelled_at = now(),
      cancellation_reason = CASE
        WHEN status = 'confirmed' THEN 'Late refund processed by admin'
        ELSE 'Buyer refunded within cooling period'
      END
    WHERE order_id = NEW.id AND status IN ('earned', 'confirmed');
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS tr_cancel_referral_on_refund ON public.orders;
CREATE TRIGGER tr_cancel_referral_on_refund
  AFTER UPDATE OF status ON public.orders
  FOR EACH ROW EXECUTE FUNCTION public.cancel_referral_on_refund();

-- Reload PostgREST schema cache so new tables/RPCs are immediately accessible
NOTIFY pgrst, 'reload schema';
