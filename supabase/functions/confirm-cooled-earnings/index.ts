// ═══════════════════════════════════════════════════════════════
// Supabase Edge Function: confirm-cooled-earnings
// CRON function — no JWT required
// Deploy: supabase functions deploy confirm-cooled-earnings --no-verify-jwt
//
// Schedule this to run every 15 minutes via Supabase Dashboard
// or pg_cron:
//   SELECT cron.schedule('confirm-referral-earnings', '*/15 * * * *',
//     $$ SELECT net.http_post('https://erqoyvbuhmkyvcqgwcbz.supabase.co/functions/v1/confirm-cooled-earnings',
//       '{}', 'application/json',
//       '{"Authorization": "Bearer YOUR_SERVICE_ROLE_KEY"}'::jsonb) $$
//   );
// ═══════════════════════════════════════════════════════════════

import { serve } from 'https://deno.land/std@0.177.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

serve(async (req) => {
  // Allow CRON calls without JWT (deploy with --no-verify-jwt)
  try {
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
    )

    // ── Step 1: Auto-confirm earnings past cooling period (earned → confirmed) ──
    const { data: confirmedCount } = await supabase.rpc('auto_confirm_referral_earnings')
    console.log(`[confirm-cooled-earnings] Confirmed: ${confirmedCount ?? 0} earnings`)

    // ── Step 2: Forfeit stale confirmed earnings (confirmed → forfeited, 180 days) ──
    const { data: forfeitedCount } = await supabase.rpc('forfeit_stale_earnings')
    console.log(`[confirm-cooled-earnings] Forfeited: ${forfeitedCount ?? 0} stale earnings`)

    return new Response(
      JSON.stringify({
        success: true,
        confirmed: confirmedCount ?? 0,
        forfeited: forfeitedCount ?? 0,
        timestamp: new Date().toISOString()
      }),
      { headers: { 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[confirm-cooled-earnings] Error:', error.message)
    return new Response(
      JSON.stringify({ error: error.message }),
      { headers: { 'Content-Type': 'application/json' }, status: 500 }
    )
  }
})
