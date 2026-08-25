# 🎬 REEL 06: VIRAL PUBLISHING KIT (HUMAN DEV EDITION)
### Topic: SQL Operator Precedence Bug — `AND` beats `OR` in `WHERE` Clauses (Day 04)
### Reel ID: `SQL-03-R2`
### Scheduled Slot: Evening @ `8:30 PM IST` 🌙

---

## 📌 1. Instagram / YouTube Shorts Caption (Ultra-Short & High-Converting)

> **Copy & paste this directly into your caption:**

```text
SQL "OR" PRECEDENCE BUG 💀
Which query returns strictly ACTIVE employees without pulling inactive rows?

Can you spot the trap before checking the pinned comment? 

Drop your vote (A or B) below 👇


Practice Data Skills 
👉 Day 1 & Day 2 are 100% FREE
🔗 Link in bio / manodemy.com/q6

#sql #sqlinterview #sqltips #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis
```

---

## 📌 2. Pinned Comment (Senior Dev Breakdown 📌)

> **Post this as the 1st comment, then tap "Pin Comment" 📌:**

```text
Option A is the trap ❌ | Option B is correct ✅

Why Option A returns inactive employees:
In SQL operator precedence, `AND` takes priority over `OR` (`A AND B OR C` evaluates as `(A AND B) OR C`).
Because of this, ANY employee in Department 10 is returned — even if they are inactive (`is_active = 0`)!

Option B uses parentheses `AND (dept = 20 OR dept = 10)` to strictly enforce active status on both departments.

💡 Pro-tip: Always use parentheses when mixing AND and OR in WHERE clauses!

Be honest — did you get this right? 👇
```

---

## 📱 3. Instagram Story Engagement Template

> **Share Reel to Story with an Interactive Poll Sticker:**

1. Tap **Share to Story** from your published Reel.
2. Add a **Poll Sticker**:
   * **Question:** Does `AND` evaluate before `OR` in SQL?
   * **Option 1:** Yes (Option B fix) ✅
   * **Option 2:** No (Option A works) ❌
3. Add text: *"95% of SQL learners forget parentheses in WHERE clauses! Test live in 3 seconds 👇"*
4. Add link sticker: `https://www.manodemy.com/q6`

---

## ⚙️ 4. Publishing & Engagement Playbook

1. **Cover Thumbnail:** Pick frame at `~1.2s` (where `SQL "OR" PRECEDENCE BUG 💀` and `STRICTLY ACTIVE EMPLOYEES ?` pop clearly).
2. **First 20 Minutes Rule:**
   * Post the Pinned Comment immediately upon publishing.
   * Reply to early voter comments instantly (*"Without parens, Dept 10 inactive rows leak in!"*).
   * Fast reply velocity immediately triggers the Instagram Explore algorithm!

---

## 📁 5. Master Upload Video Reference

* **Instagram Upload Master (1080x1920 Full HD @ 24fps):**
  👉 [marketing/output/video/SQL-03-R2.mp4](file:///d:/Learn%20Python%20in%2060days/Manodemy_Web_V2/marketing/output/video/SQL-03-R2.mp4)
