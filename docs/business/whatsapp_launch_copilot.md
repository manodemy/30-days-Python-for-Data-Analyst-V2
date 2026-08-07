# 📱 Manodemy Mobile WhatsApp Launch Co-Pilot
*Automated step-by-step launch guidance & instant real-time comment responder for `+91 8438783021`.*
*Revised Strategy: Product Beta Testing & Open Feedback framing — NOT self-promotion.*

---

## 🎯 Core Strategy: "Product Testing" NOT "Self-Promotion"

> ⚠️ **Critical Rule:** Every Reddit post is framed as an independent developer seeking genuine technical feedback. Never mention sales, pricing, or subscriptions in the initial post. Natural conversions happen when testers fall in love with the product and ask how to access more.

---

## ⚡ 1. The 3-Tier Alert Architecture

```
TIER 1: 15-Minute Advance Pre-Warning
   ↓ (Gives you time to get ready)
TIER 2: Exact Action-Time Step-by-Step Dispatch
   ↓ (Ready-to-paste post content)
TIER 3: Instant Real-Time Comment Alert
   ↓ (Fires within 5-10 seconds of a new comment)
   → 1-Tap Developer Reply Ready to Paste
```

---

## 🛠️ 2. Setup Instructions (One-Time, 2 Minutes)

### Step A: Get Your Free CallMeBot API Key
1. Open WhatsApp on your phone.
2. Add this number as a contact: **+34 644 55 15 75**
3. Send this exact message to it: `I allow callmebot to send me messages`
4. You will receive your API key within 60 seconds.
5. Open `scripts/maintenance/whatsapp_copilot.py` and paste your key at line: `CALLMEBOT_API_KEY = "YOUR_KEY_HERE"`

### Step B: Test Your Connection
```bash
python scripts/maintenance/whatsapp_copilot.py --mode test
```
*You will receive a WhatsApp confirmation message on your phone.*

---

## 📬 3. Sample WhatsApp Messages (Exactly How They Look on Your Phone)

### ⏰ TYPE 1: 15-Minute Advance Pre-Warning
```
⏰ 15-MINUTE LAUNCH WARNING!

Target Community: r/SideProject
Post Time: 16:30 IST (in 15 minutes)

CHECKLIST - Do these now:
1. Make sure your phone has good internet.
2. Open Reddit app and make sure you are logged in.
3. Visit: https://www.manodemy.com/sql/day01.html and make sure it loads and audio plays.
4. Keep Reddit app open and ready.

In 15 minutes I will send you the exact TITLE and BODY to copy & paste!
```

---

### 🚀 TYPE 2: Exact Action-Time Dispatch (Post Now!)
```
🚀 POST NOW ON REDDIT!

STEP 1: Open Reddit app
STEP 2: Tap the '+' button at the bottom center
STEP 3: In the search bar, type and select: r/SideProject
STEP 4: Tap 'Post' type → select 'Text'

COPY THIS EXACT TITLE:
I built a zero-setup in-browser SQL + Python sandbox with Whisper ASR word-synced typewriter audio — looking for brutal technical feedback from developers!

COPY THIS EXACT BODY:
Hey r/SideProject, I've been working on an interesting technical challenge: building a fully in-browser SQL and Python execution engine with word-level Whisper ASR audio synchronized to a typewriter code animation...

[Full ready-to-paste body is sent by the script]

STEP 5: Tap 'POST' in the top right corner.
STEP 6: Copy your post link and reply to this message with the URL so I start monitoring!
```

---

### 🔔 TYPE 3: Instant Real-Time Comment Alert (Fires in < 10 Seconds)
```
🚨 NEW REDDIT COMMENT!

User: u/tech_analyst_23
Category: PRAISE

THEIR COMMENT:
"This looks incredible! The audio typewriter is super clean. Are window functions and CTEs covered?"

VISIT: https://www.reddit.com/r/SideProject/comments/...

YOUR SUGGESTED REPLY (tap to copy & paste on Reddit):
"Thank you so much! This genuinely means a lot — I've been heads-down building this for months. Did you get a chance to try running the practice queries? Would love to know if the audio sync felt natural."

IMPORTANT: Go to Reddit app NOW, find this comment, and paste the reply above!
```

---

## 🗓️ 4. Complete 7-Day Schedule for `+91 8438783021`

| Day | Pre-Warning | Action Time | Community | Mission |
| :--- | :--- | :--- | :--- | :--- |
| **Day 1: Saturday** | **4:15 PM** | **4:30 PM** | `r/SideProject` | Beta test post (technical feedback focus) |
| **Day 2: Sunday** | **3:45 PM** | **4:00 PM** | `r/SQL` | SQL practitioner feedback |
| **Day 3: Monday** | **11:45 AM** | **12:00 PM** | `r/SideProject` | Reply to weekend comments & thank testers |
| **Day 4: Tuesday** | **4:15 PM** | **4:30 PM** | `r/dataanalysis` | Analyst career curriculum feedback |
| **Day 5: Wednesday** | **2:45 PM** | **3:00 PM** | LinkedIn/Discord | Direct outreach to #OpenToWork analysts |
| **Day 6: Thursday** | **4:15 PM** | **4:30 PM** | `r/learnpython` | Python learner zero-setup feedback |
| **Day 7: Saturday** | **11:45 AM** | **12:00 PM** | Analytics Review | Traffic audit, conversion check, next steps |

---

## 🚀 5. Running the System (3 Commands)

```bash
# 1. Test WhatsApp connection (do this first)
python scripts/maintenance/whatsapp_copilot.py --mode test

# 2. Start the 7-day automated schedule (run this Saturday morning)
python scripts/maintenance/whatsapp_copilot.py --mode schedule --launch-date 2026-08-09

# 3. Monitor a live post for instant comment alerts (paste your post URL after posting)
python scripts/maintenance/whatsapp_copilot.py --mode monitor --post "https://www.reddit.com/r/SideProject/comments/YOUR_POST_ID/"
```

> **Tip:** Keep the monitor command running on your laptop/PC while you relax on your phone. Every time someone comments, your WhatsApp buzzes with the exact reply text — you just open Reddit and paste it!
