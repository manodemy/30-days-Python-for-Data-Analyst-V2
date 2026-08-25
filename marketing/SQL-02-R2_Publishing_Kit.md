# 🎬 REEL 04: VIRAL PUBLISHING KIT (HUMAN DEV EDITION)
### Topic: SQL Running Total Disaster — `ROWS` vs `RANGE` on Same-Day Orders (Day 05)
### Reel ID: `SQL-02-R2`
### Scheduled Slot: Day 2 Evening @ `8:30 PM IST` 🌙

---

## 📌 1. Instagram / YouTube Shorts Caption (Ultra-Short & High-Converting)

> **Copy & paste this directly into your caption:**

```text
RUNNING TOTAL DISASTER 💸
Which query gives a true row-by-row sum on same-day orders?

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
Option A is correct ✅ | Option B is the trap ❌

Why Option B fails on same-day orders:
If you don't specify a window frame after `ORDER BY`, SQL defaults to `RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`.
`RANGE` treats duplicate dates as a single tied group — adding all same-day amounts together in one sudden jump!

Option A explicitly uses `ROWS UNBOUNDED PRECEDING`, forcing SQL to accumulate strictly row by row!

💡 Pro-tip: Always specify `ROWS` in cumulative window sums!

Be honest — did you get this right? 👇
```

---

## 📱 3. Instagram Story Engagement Template

> **Share Reel to Story with an Interactive Poll Sticker:**

1. Tap **Share to Story** from your published Reel.
2. Add a **Poll Sticker**:
   * **Question:** Which query calculates row-by-row sum?
   * **Option 1:** Query A (ROWS) ✅
   * **Option 2:** Query B (Default) ❌
3. Add text: *"99% of devs think Option B works! Watch what happens on duplicate dates 👇"*
4. Add link sticker: `manodemy.in`

---

## ⚙️ 4. Publishing & Engagement Playbook

1. **Cover Thumbnail:** Pick frame at `~1.2s` (where `RUNNING TOTAL DISASTER 💸` and `WHICH GIVES ROW-BY-ROW SUM ?` pop clearly with the glowing cash emoji).
2. **First 20 Minutes Rule:**
   * Post the Pinned Comment immediately upon publishing.
   * Reply to early voter comments instantly (*"Option B surprised so many people!"* / *"Check the breakdown above!"*).
   * Fast reply velocity immediately triggers the Instagram Explore algorithm!

---

## 📁 5. Master Upload Video Reference

* **Instagram Upload Master (1080x1920 Full HD @ 30fps):**
  👉 [marketing/output/video/SQL-02-R2.mp4](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/marketing/output/video/SQL-02-R2.mp4) *(2.97 MB — 16.57s duration)*
