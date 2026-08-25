# 🎬 REEL 03: VIRAL PUBLISHING KIT (HUMAN DEV EDITION)
### Topic: SQL Top 3 Earners — Window Functions `RANK()` vs `DENSE_RANK()` (Day 05)
### Reel ID: `SQL-02-R1`
### Scheduled Slot: Day 2 Morning @ `7:07 AM IST` 🌅

---

## 📌 1. Instagram / YouTube Shorts Caption (Ultra-Short & Punchy)

> **Copy & paste this directly into your caption:**

```text
TOP 3 EARNERS TRAP 🏆
Which query avoids skipping ranks when salaries tie?

Can you spot the trap before checking the pinned comment? 

Drop your vote (A or B) below 👇


Practice Data Skills 
👉 Day 1 & Day 2 are 100% FREE
🔗 Link in bio

#sql #sqlinterview #windowfunctions #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis
```

---

## 📌 2. Pinned Comment (Senior Dev Breakdown 📌)

> **Post this as the 1st comment, then tap "Pin Comment" 📌:**

```text
Option A is the trap ❌ | Option B is correct ✅

Why Option A misses true top 3 earners:
When salaries tie (e.g. two people earn $120k), `RANK()` assigns ranks 1, 1, 3 — skipping rank 2!
If 3 people tie at 1st place (1, 1, 1, 4), `WHERE rk <= 3` completely misses the 2nd and 3rd highest salary tiers!

`DENSE_RANK()` gives consecutive ranks (1, 1, 2, 3) with zero gaps, guaranteeing you fetch the true top 3 distinct salary levels!

💡 Pro-tip: Use ROW_NUMBER for pagination, DENSE_RANK for leaderboard ranks!

Be honest — did you get this right? 👇
```

---

## 📱 3. Instagram Story Engagement Template

> **Share Reel to Story with an Interactive Poll Sticker:**

1. Tap **Share to Story** from your published Reel.
2. Add a **Poll Sticker**:
   * **Question:** Which query avoids skipping ranks?
   * **Option 1:** Query A (RANK) ❌
   * **Option 2:** Query B (DENSE_RANK) ✅
3. Add text: *"95% fail this in FAANG SQL rounds! Full breakdown 👇"*
4. Add link sticker: `manodemy.in`

---

## ⚙️ 4. Publishing & Engagement Playbook

1. **Cover Thumbnail:** Pick frame at `~1.2s` (where `TOP 3 EARNERS TRAP 🏆` and `AVOIDS SKIPPING RANKS ?` pop with the glowing golden trophy).
2. **First 20 Minutes Rule:**
   * Post the Pinned Comment immediately upon publishing.
   * Reply to the first 10-15 voter comments instantly (*"Option A got so many devs!"* / *"Check the breakdown above!"*).
   * Fast comment reply velocity triggers the Instagram Explore algorithm!

---

## 📁 5. Master Upload Video Reference

* **Instagram Upload Master (1080x1920 Full HD @ 30fps):**
  👉 [marketing/output/video/SQL-02-R1.mp4](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/marketing/output/video/SQL-02-R1.mp4) *(3.25 MB — 16.9s duration)*
