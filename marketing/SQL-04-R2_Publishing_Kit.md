# 📦 SQL-04-R2 Publishing Kit — DATE RANGE TRAP 📅

**Reel ID:** SQL-04-R2 | **Badge:** SQL · Datetime Filtering | **Day:** DAY 04  
**Sandbox Link:** https://www.manodemy.com/q8  
**Short Bio Link:** manodemy.com/q8

---

## 📋 Caption (Copy-Paste Ready)

```text
DATE RANGE TRAP 📅
Which query pulls all January sales?

Can you spot the trap before checking the pinned comment? 

Drop your vote (A or B) below 👇


Practice Data Skills 
👉 Day 1 & Day 2 are 100% FREE
🔗 Link in bio / manodemy.com/q8

#sql #sqlinterview #sqltips #dataanalytics #dataengineer #datascience #dataanalyst #sqlquery #faang #techinterview #codinginterview #learnsql #database #manodemy #dataanalysis
```

---

## 📌 Pinned Comment (Post after uploading)

```text
Option A is the trap ❌ | Option B is correct ✅

Why Option A fails on real databases:
In modern databases, timestamps store fractional seconds or milliseconds (like `23:59:59.850`).
`BETWEEN ... 23:59:59` misses every single transaction placed in that final second of January!
Even worse, on engines like SQL Server, `23:59:59.999` rounds UP into Feb 1st!

Option B (`>= '2024-01-01' AND < '2024-02-01'`) is the half-open interval standard used in production — it guarantees 100% data capture with zero rounding bugs!

💡 Rule of thumb: NEVER use BETWEEN on datetime columns!

Be honest — did you think Option A was bulletproof? 👇
```

---

## 🎬 Video Specs

| Field | Value |
|---|---|
| Resolution | 1080 × 1920 (Full HD 9:16) |
| FPS | 24 |
| Audio | 320kbps AAC (Narration + BGM + SFX) |
| Duration | ~16–18s |
| Output | `marketing/output/video/SQL-04-R2.mp4` |

---

## 🔗 Tracking Links

| Alias | Destination |
|---|---|
| manodemy.com/q8 | /Version-3/index.html?day=4&challenge=SQL-04-R2&utm_campaign=reel_day04_q8_date_range |
| manodemy.com/go/q8 | Same |

---

## 📅 Suggested Post Time

**August 27, 8:30 PM IST** (Evening prime-time slot)

---

## 🗒️ Code Reference

**Option A (The Trap — 23:59:59 false confidence):**
```sql
SELECT order_id, total_amount
FROM sales
WHERE order_date
  BETWEEN '2024-01-01 00:00:00'
      AND '2024-01-31 23:59:59'
```

**Option B (The Production Fix — half-open interval):**
```sql
SELECT order_id, total_amount
FROM sales
WHERE order_date >= '2024-01-01'
  AND order_date <  '2024-02-01'
```
