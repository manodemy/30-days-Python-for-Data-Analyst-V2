# 🚀 1-Click Publishing Kit — `SQL-05-R1`

**Slot:** Morning Slot (07:07 AM IST)  
**Topic:** LEFT JOIN WHERE vs AND Trap 💥 (The Accidental INNER JOIN)  
**Target Video:** `marketing/output/video/SQL-05-R1.mp4`  
**Cover Image:** `marketing/output/video/SQL-05-R1_Cover.jpg`  
**Live Simulator Link:** `https://www.manodemy.com/q9`

---

## 📋 Copy-Paste Instagram / YouTube / LinkedIn Caption

```text
LEFT JOIN TRAP 💥
Which query keeps customers with zero orders?

Can you spot the trap before checking the pinned comment? 

Drop your vote (A or B) below 👇


Practice Data Skills 
👉 Day 1 & Day 2 are 100% FREE
🔗 Link in bio / manodemy.com/q9

#sql #sqlinterview #sqltips #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis
```

---

## 📌 Copy-Paste Pinned Answer (Post immediately after uploading)

```text
Option A is the trap ❌ | Option B is correct ✅

Why Option A silently acts like an INNER JOIN:
In Option A, the WHERE clause executes AFTER the join.
For customers with no orders, `o.status` is NULL. Because `NULL = 'COMPLETED'` evaluates to UNKNOWN, the WHERE clause throws them out!

Option B filters the orders table in the ON clause BEFORE joining, preserving all customers with zero orders!

💡 Rule of thumb: Filter right-table columns in the ON clause to keep your LEFT JOIN working!

Be honest — did you get this right? 👇
```

---

## 🎯 Code Comparison (Clean Formatted)

**Option A (The Trap — Filter in WHERE turns LEFT JOIN into INNER JOIN):**
```sql
SELECT c.customer_name, o.order_amount
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.status = 'COMPLETED'
```

**Option B (The Correct Standard — Filter in ON preserves left table rows):**
```sql
SELECT c.customer_name, o.order_amount
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
                  AND o.status = 'COMPLETED'
```

---

## ⚙️ Visual & Audio Specs:
* **Audio Track:** `Edge-TTS` (en-US-AndrewNeural @ +8% rate) + Whisper word-level alignment
* **Spotlight Transitions:** 380ms cubic ease-out recovery on card spotlights
* **Resolution:** 1080x1920 (FullHD 9:16)
* **Cover Thumbnail:** `SQL-05-R1_Cover.jpg` (1:1 Instagram profile grid safe-zone centered)
