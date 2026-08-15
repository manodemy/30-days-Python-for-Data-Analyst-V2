-- Migration: 053_delete_campaign_rpc.sql
-- Enables permanent deletion of ad campaigns and associated click telemetry via SECURITY DEFINER RPC and RLS policies

-- 1. Explicit DELETE policies for ad_campaigns and campaign_clicks
DROP POLICY IF EXISTS "Public delete ad_campaigns" ON public.ad_campaigns;
CREATE POLICY "Public delete ad_campaigns" ON public.ad_campaigns FOR DELETE USING (true);

DROP POLICY IF EXISTS "Public delete campaign_clicks" ON public.campaign_clicks;
CREATE POLICY "Public delete campaign_clicks" ON public.campaign_clicks FOR DELETE USING (true);

-- 2. Master atomic deletion RPC with SECURITY DEFINER
CREATE OR REPLACE FUNCTION public.delete_ad_campaign(
  p_campaign_name TEXT,
  p_campaign_id TEXT DEFAULT NULL
)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_name TEXT := LOWER(TRIM(COALESCE(p_campaign_name, '')));
BEGIN
  -- Delete by ID if provided
  IF p_campaign_id IS NOT NULL AND p_campaign_id <> '' THEN
    DELETE FROM public.ad_campaigns WHERE campaign_id = p_campaign_id;
  END IF;

  -- Delete by campaign name from both ad_campaigns and clicks table
  IF v_name <> '' THEN
    DELETE FROM public.ad_campaigns WHERE LOWER(TRIM(campaign_name)) = v_name;
    DELETE FROM public.campaign_clicks WHERE LOWER(TRIM(campaign_name)) = v_name;
  END IF;

  RETURN TRUE;
END;
$$;

GRANT EXECUTE ON FUNCTION public.delete_ad_campaign(TEXT, TEXT) TO anon, authenticated, service_role;
