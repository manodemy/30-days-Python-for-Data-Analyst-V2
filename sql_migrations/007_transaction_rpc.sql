DROP FUNCTION IF EXISTS public.get_transaction_ledger(TIMESTAMPTZ, TIMESTAMPTZ);

CREATE OR REPLACE FUNCTION public.get_transaction_ledger(start_ts TIMESTAMPTZ DEFAULT '2000-01-01'::TIMESTAMPTZ, end_ts TIMESTAMPTZ DEFAULT '2099-01-01'::TIMESTAMPTZ)
RETURNS TABLE (
    id UUID,
    user_id UUID,
    amount_inr NUMERIC,
    currency TEXT,
    coupon_used TEXT,
    payment_gateway TEXT,
    status TEXT,
    created_at TIMESTAMPTZ,
    user_email TEXT,
    user_name TEXT,
    user_country TEXT
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM profiles WHERE profiles.id = auth.uid() AND role = 'admin') THEN
        RAISE EXCEPTION 'Unauthorized';
    END IF;

    RETURN QUERY
    SELECT 
        p.id,
        p.user_id,
        p.amount_inr,
        p.currency,
        p.coupon_used,
        p.payment_gateway,
        p.status,
        p.created_at,
        pr.email,
        pr.full_name,
        pr.country
    FROM purchases p
    LEFT JOIN profiles pr ON p.user_id = pr.id
    WHERE p.status IN ('completed', 'paid', 'captured', 'successful', 'refunded')
      AND p.created_at >= start_ts
      AND p.created_at <= end_ts
    ORDER BY p.created_at DESC;
END;
$$;
