-- ═══════════════════════════════════════════════════════════════════════════════
-- 051_seed_5_reels_campaigns_down.sql
-- Rollback / Down migration for 051_seed_5_reels_campaigns.sql
-- ═══════════════════════════════════════════════════════════════════════════════

DELETE FROM public.ad_campaigns 
WHERE campaign_name IN (
  'reel_day04_q1_high_performers',
  'reel_day04_q2_salary_analytics',
  'reel_day04_q3_dept_ranking',
  'reel_day04_q4_sales_growth',
  'reel_day04_q5_churn_retention',
  'organic_untracked'
);
