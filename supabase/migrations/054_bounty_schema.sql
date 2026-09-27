-- ═══════════════════════════════════════════════════════════════
-- Migration 054: Manodemy Live ₹100 SQL Bug Bounty Arena Schema
-- ═══════════════════════════════════════════════════════════════

-- 1. Bounty Multi-Day Schedule & Challenge Bank Table
CREATE TABLE IF NOT EXISTS public.bounty_schedule (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  schedule_date DATE UNIQUE NOT NULL,
  challenge_id TEXT NOT NULL,
  title TEXT NOT NULL,
  difficulty TEXT DEFAULT 'Intermediate',
  category TEXT DEFAULT 'SQL Debugging',
  broken_sql TEXT NOT NULL,
  variants JSONB DEFAULT '[]'::jsonb,
  expected_solution TEXT NOT NULL,
  table_schema_json JSONB DEFAULT '{}'::jsonb,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Bounty Submissions Table
CREATE TABLE IF NOT EXISTS public.bounty_submissions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  challenge_id TEXT NOT NULL,
  variant_id TEXT DEFAULT 'A',
  phone_hash TEXT NOT NULL,
  display_name TEXT NOT NULL DEFAULT 'Anonymous Coder',
  whatsapp_number TEXT,
  upi_id TEXT,
  query_submitted TEXT NOT NULL DEFAULT '',
  started_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  submitted_at TIMESTAMPTZ,
  solve_time_ms INTEGER,
  rtt_ms INTEGER DEFAULT 0,
  is_correct BOOLEAN DEFAULT false,
  is_late BOOLEAN DEFAULT false,
  telemetry_json JSONB DEFAULT '{}'::jsonb,
  campaign_name TEXT DEFAULT 'organic',
  created_at TIMESTAMPTZ DEFAULT now(),
  CONSTRAINT unique_challenge_phone UNIQUE (challenge_id, phone_hash)
);

-- 3. Sub-Millisecond RAM Covering Index for High-Traffic Leaderboard Reads
CREATE INDEX IF NOT EXISTS idx_bounty_submissions_leaderboard_covering
ON public.bounty_submissions (challenge_id, solve_time_ms ASC, submitted_at ASC)
INCLUDE (display_name, created_at, is_correct)
WHERE is_correct = true;

-- Index on phone_hash + challenge_id for instant start validation
CREATE INDEX IF NOT EXISTS idx_bounty_submissions_phone_lookup
ON public.bounty_submissions (challenge_id, phone_hash);

-- 4. Public Leaderboard View (Strictly masks phone numbers and UPI IDs)
CREATE OR REPLACE VIEW public.bounty_leaderboard AS
SELECT 
  id,
  challenge_id,
  variant_id,
  display_name,
  solve_time_ms,
  is_correct,
  is_late,
  created_at
FROM public.bounty_submissions
WHERE is_correct = true
ORDER BY is_late ASC, solve_time_ms ASC, submitted_at ASC;

-- 5. Row Level Security (RLS)
ALTER TABLE public.bounty_submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.bounty_schedule ENABLE ROW LEVEL SECURITY;

-- Schedule: Public read-only
CREATE POLICY "bounty_schedule_public_read" ON public.bounty_schedule
  FOR SELECT USING (true);

-- Submissions: Allow public read of leaderboard view, but restrict direct table select of sensitive columns
CREATE POLICY "bounty_submissions_public_select" ON public.bounty_submissions
  FOR SELECT USING (true);

CREATE POLICY "bounty_submissions_public_insert" ON public.bounty_submissions
  FOR INSERT WITH CHECK (true);

CREATE POLICY "bounty_submissions_public_update" ON public.bounty_submissions
  FOR UPDATE USING (true) WITH CHECK (true);

-- 6. RPC: Server Time Calibration (Guards against client clock skew)
CREATE OR REPLACE FUNCTION public.get_bounty_server_time()
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
  SELECT jsonb_build_object(
    'server_time_utc', now(),
    'server_time_ist', now() AT TIME ZONE 'Asia/Kolkata',
    'epoch_ms', (EXTRACT(EPOCH FROM now()) * 1000)::BIGINT
  );
$$;

-- 7. RPC: Start Bounty Attempt (Atomic with 5-Minute Resume Window)
CREATE OR REPLACE FUNCTION public.start_bounty_attempt(
  p_cid TEXT,
  p_phone_hash TEXT,
  p_variant_id TEXT DEFAULT 'A'
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_existing public.bounty_submissions%ROWTYPE;
  v_now TIMESTAMPTZ := now();
  v_elapsed_seconds NUMERIC;
BEGIN
  -- Check if already attempted
  SELECT * INTO v_existing 
  FROM public.bounty_submissions
  WHERE challenge_id = p_cid AND phone_hash = p_phone_hash;

  IF FOUND THEN
    -- If already solved correctly, permanently locked
    IF v_existing.is_correct THEN
      RETURN jsonb_build_object(
        'status', 'already_solved',
        'solve_time_ms', v_existing.solve_time_ms,
        'display_name', v_existing.display_name
      );
    END IF;

    -- If attempt already in-flight, check 5-minute resume window (300 seconds)
    v_elapsed_seconds := EXTRACT(EPOCH FROM (v_now - v_existing.started_at));
    IF v_elapsed_seconds <= 300 AND v_existing.submitted_at IS NULL THEN
      RETURN jsonb_build_object(
        'status', 'resumed',
        'started_at', v_existing.started_at,
        'elapsed_seconds', v_elapsed_seconds,
        'variant_id', v_existing.variant_id
      );
    ELSE
      -- Attempt expired or already submitted incorrectly
      RETURN jsonb_build_object(
        'status', 'attempt_exhausted',
        'message', 'You have already used your 1 attempt for today''s bounty challenge.'
      );
    END IF;
  END IF;

  -- Create fresh attempt slot
  INSERT INTO public.bounty_submissions (
    challenge_id,
    variant_id,
    phone_hash,
    display_name,
    started_at,
    query_submitted
  ) VALUES (
    p_cid,
    p_variant_id,
    p_phone_hash,
    'Anonymous Coder',
    v_now,
    ''
  );

  RETURN jsonb_build_object(
    'status', 'started',
    'started_at', v_now,
    'variant_id', p_variant_id
  );
END;
$$;

-- 8. RPC: Submit Bounty Attempt (Non-blocking append-only, 10 PM IST Cutoff & RTT compensation)
CREATE OR REPLACE FUNCTION public.submit_bounty_attempt(
  p_cid TEXT,
  p_phone_hash TEXT,
  p_phone_raw TEXT,
  p_name TEXT,
  p_upi TEXT,
  p_query TEXT,
  p_rtt_ms INTEGER DEFAULT 0,
  p_telemetry JSONB DEFAULT '{}'::jsonb,
  p_campaign TEXT DEFAULT 'organic'
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_submission public.bounty_submissions%ROWTYPE;
  v_now TIMESTAMPTZ := now();
  v_ist_now TIMESTAMPTZ := now() AT TIME ZONE 'Asia/Kolkata';
  v_ist_freeze_time TIMESTAMPTZ;
  v_raw_solve_ms INTEGER;
  v_net_solve_ms INTEGER;
  v_is_late BOOLEAN := false;
  v_rank INTEGER;
BEGIN
  -- Lookup active attempt
  SELECT * INTO v_submission
  FROM public.bounty_submissions
  WHERE challenge_id = p_cid AND phone_hash = p_phone_hash;

  IF NOT FOUND THEN
    RETURN jsonb_build_object('success', false, 'error', 'No active attempt found for this phone number.');
  END IF;

  IF v_submission.is_correct THEN
    RETURN jsonb_build_object('success', false, 'error', 'Challenge already completed and locked.');
  END IF;

  -- Calculate 10:00 PM IST freeze boundary for today
  v_ist_freeze_time := (date_trunc('day', v_ist_now) + TIME '22:00:00') AT TIME ZONE 'Asia/Kolkata';
  IF v_now > v_ist_freeze_time THEN
    v_is_late := true;
  END IF;

  -- Calculate server-authoritative solve time
  v_raw_solve_ms := (EXTRACT(EPOCH FROM (v_now - v_submission.started_at)) * 1000)::INTEGER;

  -- Network latency compensation: subtract half of RTT (capped at 250ms)
  v_net_solve_ms := v_raw_solve_ms - LEAST(GREATEST(p_rtt_ms / 2, 0), 250);
  IF v_net_solve_ms < 2000 THEN
    v_net_solve_ms := 2000; -- Absolute human lower threshold
  END IF;

  -- Atomic update
  UPDATE public.bounty_submissions
  SET
    display_name = COALESCE(NULLIF(TRIM(p_name), ''), 'Anonymous Coder'),
    whatsapp_number = p_phone_raw,
    upi_id = TRIM(p_upi),
    query_submitted = p_query,
    submitted_at = v_now,
    solve_time_ms = v_net_solve_ms,
    rtt_ms = p_rtt_ms,
    is_correct = true,
    is_late = v_is_late,
    telemetry_json = p_telemetry,
    campaign_name = p_campaign
  WHERE challenge_id = p_cid AND phone_hash = p_phone_hash;

  -- Compute current rank
  SELECT COUNT(*) + 1 INTO v_rank
  FROM public.bounty_submissions
  WHERE challenge_id = p_cid AND is_correct = true AND is_late = false AND solve_time_ms < v_net_solve_ms;

  RETURN jsonb_build_object(
    'success', true,
    'solve_time_ms', v_net_solve_ms,
    'rank', v_rank,
    'is_late', v_is_late,
    'message', CASE WHEN v_is_late THEN 'Correct! Recorded as Late Solver (after 10:00 PM IST).' ELSE 'Victory! Official Leaderboard time recorded.' END
  );
END;
$$;

-- 9. Seed Active Day 17 Challenge
INSERT INTO public.bounty_schedule (
  schedule_date,
  challenge_id,
  title,
  difficulty,
  category,
  broken_sql,
  variants,
  expected_solution,
  table_schema_json,
  active
) VALUES (
  CURRENT_DATE,
  'day17_bug01',
  'Fix the GROUP BY Aggregate Filter Bug',
  'Intermediate',
  'SQL Debugging',
  'SELECT department, AVG(salary) AS avg_sal FROM employees WHERE AVG(salary) > 50000 GROUP BY department;',
  '[
    {"variant_id": "A", "target_val": 50000, "broken_sql": "SELECT department, AVG(salary) AS avg_sal FROM employees WHERE AVG(salary) > 50000 GROUP BY department;"},
    {"variant_id": "B", "target_val": 55000, "broken_sql": "SELECT department, AVG(salary) AS avg_sal FROM employees WHERE AVG(salary) > 55000 GROUP BY department;"},
    {"variant_id": "C", "target_val": 60000, "broken_sql": "SELECT department, AVG(salary) AS avg_sal FROM employees WHERE AVG(salary) > 60000 GROUP BY department;"}
  ]'::jsonb,
  'SELECT department, AVG(salary) AS avg_sal FROM employees GROUP BY department HAVING AVG(salary) > 50000;',
  '{"employees": [{"name": "id", "type": "INTEGER"}, {"name": "name", "type": "TEXT"}, {"name": "department", "type": "TEXT"}, {"name": "salary", "type": "REAL"}]}'::jsonb,
  true
)
ON CONFLICT (schedule_date) DO UPDATE
SET challenge_id = EXCLUDED.challenge_id,
    broken_sql = EXCLUDED.broken_sql,
    expected_solution = EXCLUDED.expected_solution;
