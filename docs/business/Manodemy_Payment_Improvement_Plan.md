# 🏗️ Master Implementation Plan: Complete Access Control, Payment Bundle & Guest Sandbox Architecture

> **Business Context:** This is the revenue-critical core architecture for Manodemy.
> **Aligned Requirements:**
> 1. **Complete Bundle on Payment:** All purchases unlock the unified 60-Day Data Analytics Bundle (`bundle-data-analytics`).
> 2. **Universal Free Tier:** ONLY **SQL Day 01 & SQL Day 02** are free for everyone without login. Excel & Python require enrollment.
> 3. **Day 05–60 "Coming Soon" Lock:** For paid students, **SQL Days 01, 02, 03, 04** are fully active and playable. **Days 05 to 60** display a sleek **"Coming Soon"** state. Only the admin (`manodamy25@gmail.com`) can preview Days 05–60.
> 4. **Strict Guest Reel Sandbox:** Visiting a reel link (e.g. `/sql-practice?day=4&q=2`) allows guest users to **scroll content, type SQL, and execute query ONLY for that specific question (`q=2`)**. All narration play buttons, presentation controls, test portal, other question cards, and day navigation are strictly locked; clicking any locked element opens the enrollment modal.
> 5. **Real-Time Ad Intelligence Telemetry:** Every reel link click (`?utm_campaign=...` or auto-generated `sql_day04_q2`) is captured in Supabase `campaign_clicks` and `ad_campaigns` so it reflects live in the Admin **Creative Ads & Channel Conversion Leaderboard**.

---

## 1. User Access Matrix & Day Visibility

| User Tier | SQL Day 01–02 | SQL Day 03–04 | SQL Day 05–18 | Excel (19–30) & Python (31–60) |
|---|---|---|---|---|
| **Anonymous / Free Guest** | ✅ Full Free Access | 🔒 Paywall (unless reel link `?q=X` for that single question) | 🔒 Paywall | 🔒 Paywall |
| **Guest via Reel Link (`?day=4&q=2`)** | ✅ Free Access | 🎯 **Sandboxed Q2 Only** (Run/Edit allowed; Audio, Slides & Other Qs locked) | 🔒 Paywall | 🔒 Paywall |
| **Paid / Enrolled Student** | ✅ Full Access | ✅ Full Access | ⏳ **Coming Soon** (Active Preparation) | ⏳ **Coming Soon** (Active Preparation) |
| **System Admin (`manodamy25@gmail.com`)** | ✅ Full Access | ✅ Full Access | 👑 Full Preview / Testing Access | 👑 Full Preview / Testing Access |

---

## 2. Proposed Changes & Technical Architecture

### Component 1: Access Control & Day Gating

#### [MODIFY] [manifest.js](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/content/manifest.js)
- Set `free: true` **only** for `day01` and `day02` under SQL.
- Set `free: false` for `excel-day01` and `pyDay01`.
- Set `prepared: true, comingSoon: false` for SQL Days 01–04.
- Set `prepared: false, comingSoon: true` for Days 05–60.
- When a paid user clicks Days 05–60, render the sleek **Coming Soon** banner/toast rather than broken content.
- If admin (`manodamy25@gmail.com`), allow bypassing `comingSoon` for content authoring and verification.

#### [MODIFY] [middleware.ts](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/middleware.ts)
- Strictly allow public access for `/sql/day01.html` and `/sql/day02.html` (or `/Version-3/index.html?day=1` and `?day=2`).
- Scope guest pass bypass **strictly** to SQL Engine routes with `q` parameter (e.g. `/sql-practice`, `/try`, `/Version-3/index.html`).
- Block unauthenticated bypass on Python/Excel notebook routes (`/notebook/day*`, `/notebook/excel-day*`).

#### [MODIFY] [page.tsx](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/app/notebook/%5BdayId%5D/page.tsx)
- Redirect all `/notebook/sql-day*` routes cleanly to `/Version-3/index.html?day=X`.
- Check `check_enrollment` for `python-30day` and bundle properly (fix the bug where Python checked SQL/Excel).
- Protect days >= 5: if not admin, show "Coming Soon" or redirect to course dashboard.

#### [MODIFY] [home.html](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/home.html)
- Remove the broad `isGuestPass` bypass from `home.html` client guard so the main student dashboard remains securely gated for logged-in / paid students.

---

### Component 2: Strict Guest Reel Sandbox Engine

#### [MODIFY] [mano-engine.js](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/mano-engine.js)
- **Guest State Initialization:** Detect if visitor is a non-paid guest with `?q=X` (or `?question=X`).
- **Interactive Question Lock:**
  - Active Question (`q === allowedQuestion`): CodeMirror editor enabled, **▶ Run** button active, table output active, hints active.
  - Inactive Questions (`q !== allowedQuestion`): Rendered with lock icon 🔒. Clicking triggers `showGuestPaywallModal()`.
- **Audio & Presentation Lock:**
  - Disable Play/Pause button (`#playPauseBtn`, `#navPlayBtn`, Spacebar key).
  - Disable Presentation Slides toggle and timeline scrubber.
  - Clicking any play/presentation button intercepts and opens `showGuestPaywallModal()`.
- **Day Selector Lock:**
  - Clicking other days in the dropdown or sidebar opens `showGuestPaywallModal()`.
- **Content Scrolling:**
  - Content scrolling is 100% permitted so students can read the problem explanation, schema details, and tips.
- **Paywall Modal:**
  - High-converting dark-glass modal with clear value proposition: *"Unlock All 60 Days — 750+ Practice Questions, AI Voice Narration & Certification"*, with direct checkout CTA link to `/landing_v2/index.html#pricing`.

---

### Component 3: Complete Bundle Payments & Order Creation

#### [MODIFY] [create-order/index.ts](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/supabase/functions/create-order/index.ts)
- Accept `course_id` (e.g. `bundle-data-analytics`, `sql-20day`, `python-30day`, `excel-12day`), defaulting to `bundle-data-analytics`.
- When an order is created, attach `course_id: targetCourseId` and note the bundle.
- Ensure enrollment upsert handles `bundle-data-analytics` and sets `product_type = 'bundle'`.

#### [MODIFY] [verify-payment/index.ts](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/supabase/functions/verify-payment/index.ts) & [payment-webhook/index.ts](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/supabase/functions/payment-webhook/index.ts)
- When payment is captured, enroll user in `bundle-data-analytics` (or the course ordered) and update profile `plan = 'pro'`.
- This ensures `check_enrollment()` returns `true` for all 60 days of content automatically.

#### [MODIFY] [payment-success.html](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/payment-success.html) & [landing_v2/payment-success.html](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/landing_v2/payment-success.html)
- Update copy: *"Welcome to the Complete 60-Day Data Analytics Masterclass (SQL + Excel + Python). Your lifetime access is active."*
- Check enrollment via `check_enrollment('bundle-data-analytics')` and set `manodemy_enrolled = 'true'`.

#### [MODIFY] [vercel.json](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/vercel.json)
- Remove circular rewrite on `/notebook/sql-day*`.
- Keep clean shortlinks `/sql-practice`, `/try`, `/sql-challenge` routing to `/Version-3/index.html`.

---

### Component 4: Real-Time Reel Telemetry & Admin Leaderboard

#### [MODIFY] [mano-engine.js](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/public/Version-3/mano-engine.js)
- On page load, if `day` and `q` are present:
  - Generate/read campaign identifier: `utm_campaign` or fallback `sql_day04_q2`.
  - Obtain/persist visitor ID via `localStorage.getItem('manodemy_visitor_id')`.
  - Invoke `track_campaign_click` RPC on Supabase in real time.
  - Upsert campaign into `ad_campaigns` table with `platform: 'Meta'`.
  - Store click in `manodemy_local_campaign_clicks` for zero-latency admin dashboard aggregation.
- The Admin **Creative Ads & Channel Conversion Leaderboard** in `admin.html` will instantly display every reel visitor, campaign name, QR code, and conversion tracking!

---

## 3. Verification & Testing Plan

### Automated & Integrity Verification
1. `npm run sync` — Synchronize public web assets.
2. Static syntax and typescript check on all modified Edge Functions and Next.js routes.

### Manual Verification Matrix
| Test Case | Test URL | Expected Outcome |
|---|---|---|
| **1. Free SQL Day 01** | `/Version-3/index.html?day=1` | ✅ 100% accessible to anyone without login. |
| **2. Free SQL Day 02** | `/Version-3/index.html?day=2` | ✅ 100% accessible to anyone without login. |
| **3. Paid SQL Day 03 (Logged Out)** | `/Version-3/index.html?day=3` | 🔒 Blocked by paywall modal; redirect to pricing. |
| **4. Paid SQL Day 03 (Paid Student)** | `/Version-3/index.html?day=3` | ✅ Fully playable with voice & solutions. |
| **5. SQL Day 05 (Paid Student)** | `/Version-3/index.html?day=5` | ⏳ Shows **"Coming Soon"** toast/card; no broken errors. |
| **6. SQL Day 05 (Admin Email)** | `/Version-3/index.html?day=5` | 👑 Full preview access unlocked for admin. |
| **7. Reel Guest Link (Q2)** | `/sql-practice?day=4&q=2` | 🎯 Q2 Code Editor & Run works; Play audio & other Qs locked with paywall modal. |
| **8. Reel Telemetry Capture** | Open `/sql-practice?day=4&q=2` | 📊 Check `admin.html` Creative Ads leaderboard; campaign `sql_day04_q2` appears with +1 visit. |
| **9. Python Notebook Gating** | `/notebook/day04` | 🔒 Requires login + enrollment; `?q=1` does NOT bypass paywall. |
| **10. Payment Flow** | Complete test order | 🚀 Enrolled into `bundle-data-analytics`, full access to Days 01–04 + Coming Soon for rest. |

---

## 4. Execution Order

1. **Step 1 — Manifest & Day Visibility:** Update `manifest.js` (only SQL 01-02 free, 01-04 active, 05-60 coming soon).
2. **Step 2 — Edge & Next.js Guards:** Update `middleware.ts`, `page.tsx`, and `vercel.json`.
3. **Step 3 — SQL Engine Sandbox & Telemetry:** Update `mano-engine.js` with guest sandbox constraints, paywall modal, and real-time telemetry RPC.
4. **Step 4 — Payment & Enrollment Pipeline:** Update `create-order/index.ts`, `verify-payment/index.ts`, and `payment-success.html`.
5. **Step 5 — Dashboard Guard:** Clean up `home.html` guest pass override.
6. **Step 6 — Sync & End-to-End Verification:** Run `npm run sync` and verify all 10 test matrix cases in the browser.
