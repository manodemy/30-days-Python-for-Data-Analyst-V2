# 📓 MANODEMY META ADS MARKETING LOGBOOK
**Project:** 30-Day Meta Ads Sprint (Target: 50 Sales @ ₹1,999 = ₹99,950 Revenue)  
**Total Target Budget:** ₹15,000 | **Target CPA:** ≤ ₹300 | **Current Spend:** ₹0.00 (Draft Mode / Organic Bootstrap)  
**Navigator (Strategy & Optimization):** Antigravity  
**Pilot (Founder & Execution):** Manojkumar  
**Core Landing Page:** `https://www.manodemy.com/` (`landing_v2/index.html`)  
**Ad Account ID:** `1402285795428092`  
**Dataset / Meta Pixel ID:** `1730292165783816` (Manodemy Pixel)  
**Primary Campaign:** `Manodemy - Phase 1 - 50 Sales Testing Sprint`  

---

## 📅 Chronological Session Logs

### 🟢 Session 01: Strategy Kickoff & Growth Architecture (2026-08-16)
- **Goal Established:** Reach 50 paying students for 60-Day Data Analytics Masterclass (SQL, Excel, Python) at ₹1,999 lifetime access.
- **Budget & Unit Economics:** ₹15,000 budget cap, ₹300 Target CPA, ₹1,699 net profit per student, target ROAS ~6.6x.
- **Funnel Architecture:** Self-serve interactive web app on `manodemy.com` (Razorpay checkout) with WhatsApp Business support (`+91 84387 83021`).
- **Files Created:**
  - `meta_ads_growth_hub/CAMPAIGN_BLUEPRINT.md`
  - `meta_ads_growth_hub/DAILY_EXECUTION_TRACKER.csv`
  - `meta_ads_growth_hub/DAILY_LOG_TEMPLATE.md`
  - `meta_ads_growth_hub/MARKETING_LOGBOOK.md`

---

### 🟢 Session 02: Account Inspection & Pre-Flight Check (2026-08-16)
- **Instagram Profile Identified:** `@manodemy26`
- **Course Landing Page:** `https://www.manodemy.com/` with interactive Day 01 & 02 SQL notebooks.
- **Master Video Reels Ready:** `Manim_Ad_1_Master_Reel.mp4` (23s) & `Manodemy_Ad_2_Master_Reel.mp4`.

---

### 🟢 Session 03: Division of Roles — The Navigator & The Pilot (2026-08-16)
- **Antigravity (Navigator):** Strategy, ad copywriting, video prompts, WhatsApp scripts, tracking code, nightly diagnostics, logbook maintenance.
- **Founder (Pilot):** Account authentication, billing, ad manager actions, customer chats, sending 9 PM daily updates.

---

### 🟢 Session 04: Facebook Brand Identity & Page Creation (2026-08-16)
- **Page Created:** Official Facebook Page `Manodemy` published.
- **Branding Assets Attached:**
  - Profile Icon: 3D Neon Glowing "M" Keycap (`docs/branding/reddit_avatar.png`).
  - Cover Banner: Dark Glassmorphic Banner (`docs/branding/reddit_banner.png`).
- **Connected Channels:** Instagram `@manodemy26` linked; WhatsApp Business (`+91 84387 83021`) connected.

---

### 🟢 Session 05: Zero-Cost Draft Strategy & Bootstrap Blueprint (2026-08-16)
- **Financial Status & Decision:** Founder currently has ₹0 ad spend available.
- **Action:** Build 100% of the Meta Campaign Architecture in **DRAFT Mode** ($0 spent, ₹0 charged).
- **Organic Bootstrap Playbook:** Deploy organic video distribution across Instagram Reels, WhatsApp status, and Reddit to generate initial cashflow before paid scaling.

---

### 🟢 Session 11: Instagram Profile Conversion Optimization (2026-08-16)
- **Status Confirmed:** Ad 1 Master Reel is live on Instagram (`@manodemy26`).
- **Profile Conversion Actions:**
  1. Pin hero reel to top of Instagram grid for 100% visitor exposure.
  2. Create 3 core Story Highlights (`🎯 Free Demo`, `📚 60-Day Track`, `📜 Certificate`).
  3. Pre-configure DM quick replies for incoming leads.

---

### 🟢 Session 12: Detailed Instagram Conversion SOP & DM Playbook (2026-08-16)
- **Standard Operating Procedures (SOP):**
  1. *Profile Reel Pinning:* Locks hero demo reel at top-left grid position.
  2. *Pinned Comment Architecture:* Direct link to `manodemy.com` pinned at comment rank #1.
  3. *Story Link Sticker Deployment:* 24h interactive sticker with `https://www.manodemy.com/` link.
  4. *Profile Highlights Matrix:* 3 permanent circular highlights.
  5. *Inbound DM Conversion Script:* Automated 3-stage closing script for student inquiries.

---

### 🟢 Session 13: Instagram Pinned Comment UX Optimization (2026-08-16)
- **Comment Copy Review & Refinement:**
  - Evaluated founder's draft with redirect links (`/go/day01_sql_free`, `/go/day02_sql_free`).
  - **Identified Instagram Limitation:** URLs in Instagram comments are non-clickable plain text.
  - **UX Enhancement:** Added clickable `@manodemy26` Bio link mention and "Comment 'DEMO' for DM" trigger to capture leads directly in Messenger where links are 100% clickable.

---

### 🟢 Session 14: Day 0 Infrastructure & Organic Launch Complete (2026-08-16)
- **Milestone Reached:** 100% of Setup & Pre-Flight Checklist Completed.
- **Channels Configured:** Facebook Page, Instagram `@manodemy26`, Meta Ads Manager Draft Campaign, Organic Hero Reel with pinned comment, Growth Hub files.

---

### 🟢 Session 15: Meta Pixel Code & Event Tracking Integration (2026-08-16)
- **Pixel ID Identified:** `1730292165783816` (Manodemy Pixel).
- **Tracking Architecture Deployed:**
  1. `landing_v2/index.html` & `public/landing_v2/index.html` ➔ Standard `PageView` base code installed in `<head>`.
  2. `landing_v2/app.js` & `public/landing_v2/app.js` ➔ `InitiateCheckout` event fired upon Razorpay modal launch (Value: ₹1,999 INR).
  3. `payment-success.html` & `landing_v2/payment-success.html` & `public/payment-success.html` ➔ `Purchase` conversion event configured with dynamic conversion value (Value: ₹1,999 INR).

---

### 🟢 Session 16: Meta Tracking Wizard & Full Attribution Architecture (2026-08-17)
- **End-to-End Attribution Roadmap:**
  1. *Ad Click:* Meta Ad (`utm_source=meta&utm_campaign=fb_ads_1`) ➔ Shortlink `/go/fb_ads_1`.
  2. *Top-Funnel Event:* `PageView` (Pixel ID: `1730292165783816`) + Supabase campaign click logging.
  3. *Mid-Funnel Event:* `InitiateCheckout` fired on Razorpay open (₹1,999 INR).
  4. *Bottom-Funnel Event:* `Purchase` fired on `payment-success.html`.
  5. *Founder Reporting:* Real-time tracking via Meta Ads Manager columns + Manodemy Admin Dashboard (`admin.html`).

---

### 🟢 Session 17: Meta Pixel CSP Fix & First Live Tracking Confirmed (2026-08-17)
- **Root Cause Found:** `vercel.json` Content-Security-Policy (CSP) was blocking `connect.facebook.net` and `*.facebook.com` — Pixel code was present but could never load/execute.
- **Fix Applied:** Added `https://connect.facebook.net`, `https://www.facebook.com`, `https://*.facebook.com` to `script-src`, `img-src`, and `connect-src` directives in CSP.
- **Deployment:** Commit `965d2cc` manually deployed on Vercel.
- **Result:** 🟢 **PageView: Active | 3+ events received | Connection: Browser** — Pixel is fully operational!

---

### 🟢 Session 18: Meta Ad Creative Pixel Link & Shortlink Route Integration (2026-08-17)
- **Ad Creative Tracking Configured:**
  - `Ad 1 - Anti-Tutorial Hell Master Reel` linked to `Manodemy Pixel (1730292165783816)`.
  - Website Events Tracking: Active ☑️.
  - Shortlink Added: `/go/fb_ads_1` added to `vercel.json` and `middleware.ts` with zero-latency redirect, Supabase campaign tracking, and cookie attribution.
- **Campaign State:** Stored securely in Draft Mode (0 financial risk, ready to activate on command).

---

### 🟢 Session 19: Ads Manager Dashboard Preset & Complete Pre-Launch Sign-off (2026-08-17)
- **Reporting Preset Deployed:** `Manodemy Growth Dashboard` configured with 13 key metrics (Spend, Impressions, Clicks, CTR, CPC, Initiate Checkouts [Total & Cost], Purchases [Total, Cost/CPA, Value]).
- **Dual-Attribution Verified:** Shortlink `/go/fb_ads_1` routes with zero latency to landing page with UTM tags, records in Supabase `campaign_clicks`, and triggers Meta Pixel `PageView`.
- **System Readiness:** 100% of Meta Ads infrastructure, tracking, and campaign assets are configured and saved in Draft Mode ready for launch.

---

### 🟢 Session 20: 15-Second Pomelli AI Video Ad Prompt Architecture (2026-08-17)
- **Objective:** Design high-converting 15-second AI video prompt package for Pomelli / Gen-3 video generator.
- **Narrative Arc:**
  1. *Hook (0-3s):* Anti-Tutorial Hell — Stop passively watching videos, start active coding.
  2. *Daily Workflow (3-8s):* 3-Step Daily Loop: Interactive Theory ➔ Practice Exercises ➔ Daily Interview Test.
  3. *Gamification & Proof (8-12s):* Accumulate 1,200+ Scorecard Marks ➔ Unlock Official Verified Certificate.
  4. *Offer & CTA (12-15s):* 1-Time Registration, Lifetime Practice. Try Day 01 Free at `manodemy.com`.
- **Status:** Pomelli prompt package generated with camera directions, visual lighting cues, voiceover, and sound-off typography.

---

### 🟢 Session 21: UGC Real-Person Walkthrough Ad Architecture for Pomelli (2026-08-17)
- **Concept:** Realistic UGC (User Generated Content) / Creator-led product demo ad (15–20s).
- **Format:** Split-screen / Picture-in-Picture (PiP) creator talking directly to camera while interacting with the live `manodemy.com` web app on a laptop.
- **Narrative Arc:**
  1. *Hook (0-3s):* "Stop watching 50-hour YouTube tutorials. Here is how I actually learned SQL & Python in 60 days on Manodemy."
  2. *Daily 3-Step Walkthrough (3-9s):* Creator points to screen: Visual Theory ➔ Live In-Browser Code Practice ➔ Daily Interview Test.
  3. *Scorecard & Proof (9-12s):* Earn 1,200+ marks across 60 days ➔ Download official job-ready certificate.
  4. *Offer & CTA (12-15s):* "One-time registration, lifetime access. Try Day 01 & 02 100% free with zero signup at manodemy.com."
- **Status:** Prompt blueprints engineered for AI avatar generation, scene scripting, voiceover, and visual overlays.

---

### 🟢 Session 22: Production-Grade UGC Ad Prompt Architecture v3 (2026-08-17)
- **Prompt Engineering Upgrade (v3):**
  - **Manodemy Specificity Injected:** Exact curriculum structure (SQL 18d + Excel 12d + Python 30d), in-browser zero-install compiler (Wasm/Pyodide), 1,200+ marks scorecard gamification, verified QR certificate.
  - **Meta Conversion Architecture:** Pattern interrupt hook (0-3s), 3-beat interactive walkthrough (3-9s), credibility & proof (9-12s), risk-reversal CTA (12-15s).
  - **B-Roll Capture Specs:** Tailored exact URLs (`/sql/day-01.html`, `#curriculum`, `sample-certificate.html`) with smooth cursor timing for screen replacement.
  - **Negative Prompts & Audio Mastering:** Rigorous exclusions to eliminate AI uncanny valley effects.

---

*(All future daily analyses, decisions, ad changes, and metric reviews will be appended below)*


