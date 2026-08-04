-- 004_admin_analytics.sql

-- Enable pgcrypto for gen_random_uuid() if needed
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- 1. Create Tables
CREATE TABLE IF NOT EXISTS admin_audit_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  admin_id UUID,
  action TEXT,
  table_name TEXT,
  changed_data JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS coupons (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code TEXT UNIQUE NOT NULL,
  discount_type TEXT CHECK (discount_type IN ('percentage','fixed')) NOT NULL,
  discount_value NUMERIC NOT NULL,
  applies_to TEXT CHECK (applies_to IN ('INR','USD','both')) DEFAULT 'both',
  max_uses INTEGER,
  current_uses INTEGER DEFAULT 0,
  expires_at TIMESTAMPTZ,
  is_active BOOLEAN DEFAULT true,
  created_by UUID REFERENCES auth.users,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS purchases (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users NOT NULL,
  course_id UUID,
  amount_inr NUMERIC NOT NULL,
  amount_original NUMERIC NOT NULL,
  currency TEXT CHECK (currency IN ('INR','USD')) NOT NULL,
  coupon_used TEXT REFERENCES coupons(code),
  payment_gateway TEXT,
  status TEXT CHECK (status IN ('completed','refunded','disputed')) DEFAULT 'completed',
  refunded_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS activity_logs(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID,
  event_type TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Create View
DROP VIEW IF EXISTS bd_daily_revenue;
CREATE OR REPLACE VIEW bd_daily_revenue AS
SELECT
  date_trunc('day', created_at)::date AS day,
  SUM(amount_inr) FILTER (WHERE status = 'completed') AS gross_revenue,
  SUM(amount_inr) FILTER (WHERE status = 'refunded') AS refund_amount,
  SUM(amount_inr) FILTER (WHERE status = 'completed') 
    - COALESCE(SUM(amount_inr) FILTER (WHERE status='refunded'),0) 
    AS net_revenue,
  COUNT(*) FILTER (WHERE status = 'completed') AS transactions,
  COUNT(*) FILTER (WHERE status = 'refunded') AS refunds,
  COUNT(DISTINCT user_id) FILTER (WHERE status = 'completed') 
    AS unique_buyers
FROM purchases
GROUP BY 1 ORDER BY 1;

-- 3. RLS Policies
ALTER TABLE purchases ENABLE ROW LEVEL SECURITY;
ALTER TABLE coupons ENABLE ROW LEVEL SECURITY;

-- Purchases: Security intent: only admins can manage, no one can delete, ever.
CREATE POLICY admin_select_purchases ON purchases
FOR SELECT USING (
  auth.uid() IN (SELECT id FROM profiles WHERE role='admin')
);

CREATE POLICY admin_insert_purchases ON purchases
FOR INSERT WITH CHECK (
  auth.uid() IN (SELECT id FROM profiles WHERE role='admin')
);

CREATE POLICY admin_update_purchases ON purchases
FOR UPDATE USING (
  auth.uid() IN (SELECT id FROM profiles WHERE role='admin')
);

CREATE POLICY deny_delete_purchases ON purchases
FOR DELETE USING (false);

-- Coupons: Security intent: public can read for checkout validation, only admin can mutate.
CREATE POLICY public_select_coupons ON coupons
FOR SELECT USING (true);

CREATE POLICY admin_insert_coupons ON coupons
FOR INSERT WITH CHECK (
  auth.uid() IN (SELECT id FROM profiles WHERE role='admin')
);

CREATE POLICY admin_update_coupons ON coupons
FOR UPDATE USING (
  auth.uid() IN (SELECT id FROM profiles WHERE role='admin')
);

CREATE POLICY admin_delete_coupons ON coupons
FOR DELETE USING (
  auth.uid() IN (SELECT id FROM profiles WHERE role='admin')
);

-- 4. Audit trigger function
-- Security intent: Record exactly who did what to sensitive pricing and coupon data
CREATE OR REPLACE FUNCTION audit_trigger_func()
RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'INSERT') THEN
    INSERT INTO admin_audit_log (admin_id, action, table_name, changed_data, created_at)
    VALUES (auth.uid(), 'INSERT', TG_TABLE_NAME, jsonb_build_object('new', row_to_json(NEW)), now());
    RETURN NEW;
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO admin_audit_log (admin_id, action, table_name, changed_data, created_at)
    VALUES (auth.uid(), 'UPDATE', TG_TABLE_NAME, jsonb_build_object('old', row_to_json(OLD), 'new', row_to_json(NEW)), now());
    RETURN NEW;
  ELSIF (TG_OP = 'DELETE') THEN
    INSERT INTO admin_audit_log (admin_id, action, table_name, changed_data, created_at)
    VALUES (auth.uid(), 'DELETE', TG_TABLE_NAME, jsonb_build_object('old', row_to_json(OLD)), now());
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 5. Attach audit triggers to coupons (and settings if applicable)
DROP TRIGGER IF EXISTS audit_coupons ON coupons;
CREATE TRIGGER audit_coupons
AFTER INSERT OR UPDATE OR DELETE ON coupons
FOR EACH ROW EXECUTE FUNCTION audit_trigger_func();

-- Assuming the settings table is used for pricing changes
-- Un-comment if settings table exists
-- DROP TRIGGER IF EXISTS audit_settings ON settings;
-- CREATE TRIGGER audit_settings
-- AFTER INSERT OR UPDATE OR DELETE ON settings
-- FOR EACH ROW EXECUTE FUNCTION audit_trigger_func();
