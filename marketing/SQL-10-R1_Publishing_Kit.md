# 🚀 1-Click Publishing Kit — `SQL-10-R1`

**Reel Identifier:** `SQL-10-R1`  
**Curriculum Day:** `Day 10 (Advanced Algorithmic SQL)`  
**Topic:** `Gaps & Islands (Consecutive Login Streaks)`  
**Target Video:** `marketing/output/video/SQL-10-R1.mp4`  
**Cover Image:** `marketing/output/video/SQL-10-R1_Cover.jpg`  
**Live Simulator Link:** `https://www.manodemy.com/q17`

---

## 📝 1. Standardized Instagram & Social Media Caption

*(Click copy and paste directly into Instagram / YouTube Shorts / TikTok)*

```text
GAPS & ISLANDS TRAP 🏝️⚡

Which query groups consecutive active days into unbroken login streaks?

Can you spot which approach generates a constant grouping key for consecutive days?

What’s your answer — A or B? 👇
Drop your choice in the comments before checking the answer!

🧠 Test this SQL interview question live:
👉 manodemy.com/q17

📊 Practice Data Skills with Manodemy
🎁 Day 1 & Day 2 are 100% FREE

🔗 Link in bio

[sql interview questions, gaps and islands sql, row_number trick, consecutive streaks, faang sql interview, data analyst interview, advanced sql, learn sql]

#SQL #SQLInterview #SQLQuestions #SQLTips #DataAnalyst #DataAnalytics #LearnSQL #Manodemy
```

---

## 📌 2. Pinned First Comment (Reveals Technical Solution)

*(Post this immediately after sharing the reel, then tap **Pin comment**)*

```text
Option A is the FAANG Standard ✅ | Option B is the Trap ❌

Why Option A (date - ROW_NUMBER()) works:
As long as login dates are consecutive, both `login_date` and `ROW_NUMBER()` increment by +1 each day. Subtracting ROW_NUMBER() from login_date produces a CONSTANT date anchor for the entire unbroken streak!

Why Option B (DENSE_RANK) fails on gaps:
`DENSE_RANK()` simply numbers rows sequentially 1, 2, 3... regardless of whether there is a 5-day gap between logins! It fails to detect broken streaks.

💡 Rule of thumb: Subtracting ROW_NUMBER() from dates is the golden trick for Gaps & Islands problems!

Did you vote A or B? 👇
```

---

## ⚙️ 3. Verification & Architecture Checklist

- [x] **Video:** `marketing/output/video/SQL-10-R1.mp4` (1080x1920 @ 24fps, crisp 320kbps 3-layer audio)
- [x] **Cover:** `marketing/output/video/SQL-10-R1_Cover.jpg` (High-CTR macOS IDE Glassmorphism)
- [x] **Simulator Mapping:** `https://www.manodemy.com/q17` connected in `mano-engine.js`!
- [x] **Edge Shortlinks:** `/q17` and `/go/q17` configured in `vercel.json`, `middleware.ts`, and static bridge pages.
