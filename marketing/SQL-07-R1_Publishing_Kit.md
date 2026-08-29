# 🚀 1-Click Publishing Kit — `SQL-07-R1`

**Slot:** Morning Slot (08:15 AM IST)  
**Topic:** NOT IN NULL TRAP 🕳️💀 (Subqueries vs `NOT EXISTS`: Why a Single NULL Returns 0 Rows)  
**Target Video:** `marketing/output/video/SQL-07-R1.mp4`  
**Cover Image:** `marketing/output/video/SQL-07-R1_Cover.jpg`  
**Live Simulator Link:** `https://www.manodemy.com/q12`

---

## 📋 Copy-Paste Instagram / YouTube / LinkedIn Caption

```text
NOT IN NULL TRAP 🕳️💀
Which query safely finds customers who never ordered?

Did a single NULL guest checkout break your entire subquery? 

Drop your vote (A or B) below 👇


Practice Data Skills 
👉 Day 1 & Day 2 are 100% FREE
🔗 Link in bio / manodemy.com/q12

#sql #sqlinterview #sqltips #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis
```

---

## 📌 Copy-Paste Pinned Comment (Post Immediately After Upload)

```text
Option A is the trap ❌ | Option B is correct ✅

Why Option A returns 0 rows in production:
If the orders table contains even ONE guest order with a NULL customer_id, the subquery produces (101, 102, NULL).
In SQL 3-Valued Logic, `id NOT IN (..., NULL)` translates to `id != NULL`, which is UNKNOWN.
Because `TRUE AND UNKNOWN` equals UNKNOWN, the WHERE clause throws away EVERY single customer, returning 0 rows!

Option B uses `NOT EXISTS`, which safely checks row presence and ignores NULLs!

💡 Rule of thumb: Never use NOT IN with nullable columns. Always use NOT EXISTS!

Did you know about the 3-Valued Logic trap? 👇
```

---

## 🎙️ Complete Voice Narration & Acoustic Timeline

| Timestamp | Visual Layer / Action | 🎙️ Spoken Voice Narration | 🔊 Acoustic SFX Layer |
|---|---|---|---|
| **0.00s – 3.20s** | 🚨 Header: `NOT IN NULL TRAP 🕳️` | *"This NOT IN query returned zero rows in production!"* | Dramatic cyber alert whoosh |
| **3.20s – 6.10s** | Code A & Code B render in macOS frame | *"Which query safely finds customers who never ordered?"* | Code typewriter click |
| **6.10s – 8.60s** | Option A (`NOT IN`) vs Option B (`NOT EXISTS`) | *"Choose your answer. Option A... or Option B?"* | Duel focus ping |
| **8.60s – 11.60s** | ⏰ **Animated Clock Ticking Countdown** | *(Dramatic Voice Pause)* | 💣 **3-Second Clock Ticking Bomb SFX** |
| **11.60s – 14.87s** | Option B emerald glow + Bottom CTA | *"Drop your vote in the comments below."* | Winner chime ding + Sub-bass sweep |

---

## 🎯 Verification Checklist

- [x] **Video:** `marketing/output/video/SQL-07-R1.mp4` (1080x1920 @ 24fps, crisp 320kbps 3-layer audio, 14.87s duration)
- [x] **Cover:** `marketing/output/video/SQL-07-R1_Cover.jpg` (High-CTR macOS IDE Glassmorphism)
- [x] **Simulator Mapping:** `https://www.manodemy.com/q12` & `utm_campaign=instagram_reel_12` connected in `mano-engine.js`!
