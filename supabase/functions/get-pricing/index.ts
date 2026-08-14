import { serve } from 'https://deno.land/std@0.177.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders })

  try {
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
    )
    const { data } = await supabase.from('settings').select('value').eq('key', 'pricing').single()
    return new Response(JSON.stringify(data?.value || {
      inr: 199900, usd: 4900, original_inr: 499900, original_usd: 14900, discount_label_inr: '60% OFF', discount_label_usd: '67% OFF', flash_sale: null
    }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' } })
  } catch (e) {
    return new Response(JSON.stringify({ inr: 199900, usd: 4900, original_inr: 499900, original_usd: 14900, discount_label_inr: '60% OFF', discount_label_usd: '67% OFF' }),
      { headers: { ...corsHeaders, 'Content-Type': 'application/json' } })
  }
})
