// ═══════════════════════════════════════════════════════════════
// Supabase Edge Function: request-withdrawal
// Creates a withdrawal request after validating balance & limits
// Deploy: supabase functions deploy request-withdrawal
// ═══════════════════════════════════════════════════════════════

import { serve } from 'https://deno.land/std@0.177.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
    )

    // ── Auth verification ──
    const authHeader = req.headers.get('Authorization')
    if (!authHeader) throw new Error('Missing authorization header')

    const { data: { user }, error: authError } = await supabase.auth.getUser(
      authHeader.replace('Bearer ', '')
    )
    if (authError || !user) throw new Error('Unauthorized')

    const { payment_method, payment_details } = await req.json()

    // ── Validate payment method ──
    const validMethods = ['upi', 'gpay', 'phonepe', 'paypal']
    if (!validMethods.includes(payment_method)) {
      throw new Error('Invalid payment method')
    }
    if (!payment_details || Object.keys(payment_details).length === 0) {
      throw new Error('Payment details required')
    }

    // ── Get user profile ──
    const { data: profile } = await supabase
      .from('profiles')
      .select('country, referral_terms_accepted, referral_banned')
      .eq('id', user.id)
      .single()

    if (!profile) throw new Error('Profile not found')
    if (profile.referral_banned) throw new Error('Referral program access suspended')
    if (!profile.referral_terms_accepted) throw new Error('Must accept referral terms first')

    const isIndian = profile.country === 'IN'
    const payoutCurrency = isIndian ? 'INR' : 'USD'

    // ── Get referral config ──
    const { data: configRow } = await supabase
      .from('settings')
      .select('value')
      .eq('key', 'referral_config')
      .single()

    const config = configRow?.value || {}
    const minWithdrawal = isIndian
      ? (config.min_withdrawal_inr || 20000)
      : (config.min_withdrawal_usd || 200)

    // ── Check program is active ──
    if (config.program_active === false) {
      throw new Error('Referral program is currently paused')
    }

    // ── Check only one pending request at a time ──
    const { data: existingPending } = await supabase
      .from('withdrawal_requests')
      .select('id')
      .eq('user_id', user.id)
      .eq('status', 'pending')
      .single()

    if (existingPending) {
      throw new Error('You already have a pending withdrawal request. Wait for it to be processed before submitting another.')
    }

    // ── Calculate available balance (confirmed earnings only) ──
    const { data: earnings } = await supabase
      .from('referral_earnings')
      .select('credited_amount, credited_currency')
      .eq('referrer_user_id', user.id)
      .eq('status', 'confirmed')
      .eq('credited_currency', payoutCurrency)

    const availableBalance = (earnings || []).reduce((sum, e) => sum + e.credited_amount, 0)

    if (availableBalance < minWithdrawal) {
      const minFormatted = isIndian
        ? `₹${(minWithdrawal / 100).toFixed(0)}`
        : `$${(minWithdrawal / 100).toFixed(2)}`
      throw new Error(`Insufficient balance. Minimum withdrawal is ${minFormatted}. Available: ${isIndian ? '₹' : '$'}${(availableBalance / 100).toFixed(isIndian ? 0 : 2)}`)
    }

    // ── Validate payment details match country ──
    if (isIndian) {
      if (payment_method === 'paypal') throw new Error('Indian users cannot withdraw via PayPal. Use UPI, Google Pay, or PhonePe.')
      if (payment_method === 'upi' && !payment_details.upi_id?.includes('@')) {
        throw new Error('Invalid UPI ID. Must contain @ (e.g., name@upi)')
      }
      if ((payment_method === 'gpay' || payment_method === 'phonepe') && !/^\d{10}$/.test(payment_details.mobile || '')) {
        throw new Error('Invalid mobile number. Must be 10 digits.')
      }
    } else {
      if (payment_method !== 'paypal') throw new Error('International users can only withdraw via PayPal.')
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
      if (!emailRegex.test(payment_details.paypal_email || '')) {
        throw new Error('Invalid PayPal email address.')
      }
    }

    // ── Create withdrawal request (service_role bypasses missing client INSERT policy) ──
    const { data: withdrawal, error: insertError } = await supabase
      .from('withdrawal_requests')
      .insert({
        user_id: user.id,
        amount: availableBalance,
        currency: payoutCurrency,
        payment_method,
        payment_details,
        status: 'pending'
      })
      .select()
      .single()

    if (insertError) throw insertError

    console.log(`[request-withdrawal] Created request ${withdrawal.id} for user ${user.id}: ${payoutCurrency} ${availableBalance}`)

    return new Response(
      JSON.stringify({
        success: true,
        withdrawal_id: withdrawal.id,
        amount: availableBalance,
        currency: payoutCurrency,
        message: `Withdrawal request submitted! You'll be paid within 3–7 business days.`
      }),
      { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[request-withdrawal] Error:', error.message)
    return new Response(
      JSON.stringify({ error: error.message }),
      { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 400 }
    )
  }
})
