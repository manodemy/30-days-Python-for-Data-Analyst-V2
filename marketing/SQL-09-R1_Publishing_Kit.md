# 🚀 1-Click Publishing Kit — `SQL-09-R1`

**Reel Identifier:** `SQL-09-R1`  
**Curriculum Day:** `Day 09 (CTEs & Advanced Window Functions)`  
**Topic:** `Latest Record per User (ROW_NUMBER CTE vs GROUP BY MAX + JOIN)`  
**Target Video:** `marketing/output/video/SQL-09-R1.mp4`  
**Cover Image:** `marketing/output/video/SQL-09-R1_Cover.jpg`  
**Live Simulator Link:** `https://www.manodemy.com/q16`

---

## 📝 1. Standardized Instagram & Social Media Caption

*(Click copy and paste directly into Instagram / YouTube Shorts / TikTok)*

```text
LATEST RECORD PER USER 📊⚡

Which query reliably fetches the latest order per customer?

Can you spot which approach handles duplicate timestamps without returning extra rows?

What’s your answer — A or B? 👇
Drop your choice in the comments before checking the answer!

🧠 Test this SQL interview question live:
👉 manodemy.com/q16

📊 Practice Data Skills with Manodemy
🎁 Day 1 & Day 2 are 100% FREE

🔗 Link in bio

[sql interview questions, sql cte, row_number vs group by max, window functions sql, data analyst interview questions, sql query questions, advanced sql, learn sql]

#SQL #SQLInterview #SQLQuestions #SQLTips #DataAnalyst #DataAnalytics #LearnSQL #Manodemy
```

---

## 📌 2. Pinned First Comment (Reveals Technical Solution)

*(Post this immediately after sharing the reel, then tap **Pin comment**)*

```text
Option A is the Industry Standard ✅ | Option B has a Silent Trap ⚠️

Why Option A (ROW_NUMBER CTE) is the FAANG standard:
Option A numbers rows sequentially within each customer group. Even if a customer placed TWO orders with the exact same timestamp, `ROW_NUMBER()` guarantees exactly ONE latest row is returned!

Why Option B (GROUP BY MAX + JOIN) fails on ties:
If a customer has two orders on the same max date, the join matches BOTH rows, returning duplicate orders and inflating downstream revenue metrics!

💡 Rule of thumb: Always use ROW_NUMBER() or QUALIFY to fetch top N / latest records per group!

Did you vote A or B? 👇
```

---

## ⚙️ 3. Verification & Architecture Checklist

- [x] **Video:** `marketing/output/video/SQL-09-R1.mp4` (1080x1920 @ 24fps, crisp 320kbps 3-layer audio)
- [x] **Cover:** `marketing/output/video/SQL-09-R1_Cover.jpg` (High-CTR macOS IDE Glassmorphism)
- [x] **Simulator Mapping:** `https://www.manodemy.com/q16` connected in `mano-engine.js`!
- [x] **Edge Shortlinks:** `/q16` and `/go/q16` configured in `vercel.json`, `middleware.ts`, and static bridge pages.
