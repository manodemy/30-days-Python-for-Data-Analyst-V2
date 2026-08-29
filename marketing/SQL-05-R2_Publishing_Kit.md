# 🚀 1-Click Publishing Kit — `SQL-05-R2`

**Slot:** Evening Slot (08:30 PM IST)  
**Topic:** CONDITIONAL COUNT TRAP 🤯 (COUNT with ELSE 0 vs SUM with ELSE 0)  
**Target Video:** `marketing/output/video/SQL-05-R2.mp4`  
**Cover Image:** `marketing/output/video/SQL-05-R2_Cover.jpg`  
**Live Simulator Link:** `https://www.manodemy.com/q10`

---

## 📋 Copy-Paste Instagram / YouTube / LinkedIn Caption

```text
CONDITIONAL COUNT TRAP 🤯
Which query correctly counts failed orders?

Can you spot the trap before checking the pinned comment? 

Drop your vote (A or B) below 👇


Practice Data Skills 
👉 Day 1 & Day 2 are 100% FREE
🔗 Link in bio / manodemy.com/q10

#sql #sqlinterview #sqltips #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis
```

---

## 📌 Copy-Paste Pinned Answer (Post immediately after uploading)

```text
Option A is the trap ❌ | Option B is correct ✅

Why Option A fails:
In SQL, `COUNT(expression)` counts EVERY single row where the expression is NOT NULL.
In Option A, when status != 'FAILED', the CASE expression returns 0.
Because `0` is a valid number (not NULL), `COUNT(0)` still increments the count! So Option A returns the TOTAL count of all orders!

Option B uses `SUM(CASE ... THEN 1 ELSE 0 END)`, which adds 1 for failed orders and 0 for others, giving the exact count!

💡 Rule of thumb: With COUNT, never use ELSE 0 (let it default to NULL). With SUM, use ELSE 0!

Be honest — did you vote Option A? 👇
```

---

## 🎯 Code Comparison (Clean Formatted)

**Option A (The Trap — COUNT(0) increments for every row!):**
```sql
SELECT customer_id,
       COUNT(CASE WHEN status = 'FAILED'
             THEN 1 ELSE 0 END) AS failed_cnt
FROM orders
GROUP BY customer_id
```

**Option B (The Correct Standard — SUM correctly adds the 1s):**
```sql
SELECT customer_id,
       SUM(CASE WHEN status = 'FAILED'
           THEN 1 ELSE 0 END) AS failed_cnt
FROM orders
GROUP BY customer_id
```

---

## ⚙️ Visual & Audio Specs:
* **Audio Track:** `Edge-TTS` (en-US-AndrewNeural @ +8% rate) + Whisper word-level alignment
* **Spotlight Transitions:** 380ms cubic ease-out recovery on card spotlights
* **Resolution:** 1080x1920 (FullHD 9:16)
* **Cover Thumbnail:** `SQL-05-R2_Cover.jpg` (1:1 Instagram profile grid safe-zone centered)
