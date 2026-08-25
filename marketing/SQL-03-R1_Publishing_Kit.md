# 🎬 REEL 05: VIRAL PUBLISHING KIT (HUMAN DEV EDITION)
### Topic: SQL Aggregation Trap — `COUNT(*)` vs `COUNT(column)` on NULLs (Day 04)
### Reel ID: `SQL-03-R1`
### Scheduled Slot: Morning @ `7:07 AM IST` 🌅

---

## 📌 1. Instagram / YouTube Shorts Caption (Ultra-Short & High-Converting)

> **Copy & paste this directly into your caption:**

```text
COUNT(*) VS COUNT(COL) 💀
Which query counts all employees without dropping NULLs?

Can you spot the trap before checking the pinned comment? 

Drop your vote (A or B) below 👇


Practice Data Skills 
👉 Day 1 & Day 2 are 100% FREE
🔗 Link in bio / manodemy.com/q5

#sql #sqlinterview #sqltips #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis
```

---

## 📌 2. Pinned Comment (Senior Dev Breakdown 📌)

> **Post this as the 1st comment, then tap "Pin Comment" 📌:**

```text
Option A is the trap ❌ | Option B is correct ✅

Why Option A undercounts employees:
`COUNT(column_name)` ONLY counts rows where the column is NOT NULL. If an employee has NULL commission, they are silently excluded from the headcount!

`COUNT(*)` counts total physical rows regardless of NULLs.

💡 Pro-tip: Always use `COUNT(*)` for row counts and `COUNT(col)` only when checking non-null presence!

Be honest — did you get this right? 👇
```

---

## 📱 3. Instagram Story Engagement Template

> **Share Reel to Story with an Interactive Poll Sticker:**

1. Tap **Share to Story** from your published Reel.
2. Add a **Poll Sticker**:
   * **Question:** Which query counts ALL employees including NULLs?
   * **Option 1:** Option A (COUNT col) ❌
   * **Option 2:** Option B (COUNT *) ✅
3. Add text: *"85% of developers get this wrong in interview screenings! Test live in 3 seconds 👇"*
4. Add link sticker: `https://www.manodemy.com/q5`

---

## ⚙️ 4. Publishing & Engagement Playbook

1. **Cover Thumbnail:** Pick frame at `~1.2s` (where `COUNT(*) VS COUNT(COL) 💀` and `COUNT WITHOUT DROPPING NULLS ?` pop clearly).
2. **First 20 Minutes Rule:**
   * Post the Pinned Comment immediately upon publishing.
   * Reply to early voter comments instantly (*"Option A drops all NULL commission rows!"*).
   * Fast reply velocity immediately triggers the Instagram Explore algorithm!

---

## 📁 5. Master Upload Video Reference

* **Instagram Upload Master (1080x1920 Full HD @ 24fps):**
  👉 [marketing/output/video/SQL-03-R1.mp4](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/marketing/output/video/SQL-03-R1.mp4)
