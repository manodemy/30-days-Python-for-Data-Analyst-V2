#!/usr/bin/env python3
"""
whatsapp_copilot.py — Manodemy Reddit Launch WhatsApp Co-Pilot

WHAT THIS DOES:
  1. Sends you a 15-minute advance warning before every scheduled Reddit action.
  2. Sends you step-by-step instructions with exact copy-paste content at action time.
  3. Monitors your live Reddit post every 25 seconds for new comments.
  4. When a new comment is detected, sends you the comment + a ready-to-paste reply instantly.

POSITIONING STRATEGY (IMPORTANT):
  All posts are framed as "Product Beta Testing & Open Feedback" — NOT as self-promotion.
  This is the authentic, developer-community-approved way to get genuine engagement on Reddit.

HOW TO SET UP WhatsApp ALERTS (CallMeBot — Free, No Credit Card):
  Step 1: Open WhatsApp and send this message to +34 644 55 15 75:
          "I allow callmebot to send me messages"
  Step 2: You will receive your API_KEY in reply.
  Step 3: Paste your API_KEY below where it says CALLMEBOT_API_KEY = "YOUR_KEY_HERE"

USAGE:
  # Run the full 7-day scheduled copilot:
  python whatsapp_copilot.py --mode schedule

  # Monitor a live Reddit post for new comments:
  python whatsapp_copilot.py --mode monitor --post "https://www.reddit.com/r/SideProject/comments/abc123/..."

  # Test that WhatsApp alerts are working:
  python whatsapp_copilot.py --mode test
"""

import argparse
import datetime
import json
import time
import urllib.parse
import urllib.request
import sys

# ─────────────────────────────────────────────────────────────────────────────
# CONFIG — Set your details here
# ─────────────────────────────────────────────────────────────────────────────
WHATSAPP_PHONE = "+918438783021"       # Your WhatsApp number (with country code)
CALLMEBOT_API_KEY = "YOUR_KEY_HERE"   # Get this free from CallMeBot (see setup above)

REDDIT_POLL_INTERVAL = 25             # Seconds between Reddit checks (keep >= 25)
USER_AGENT = "ManodemyCopilot/1.0 (read-only; personal launch tool)"

# ─────────────────────────────────────────────────────────────────────────────
# 7-DAY LAUNCH SCHEDULE
# Format: (hour_IST, minute_IST, subreddit, action_type)
# action_type: "pre_warning" = 15-min advance alert, "action" = post now alert
# ─────────────────────────────────────────────────────────────────────────────
SCHEDULE = [
    # Day 1 Saturday
    {"day_offset": 0, "hour": 16, "minute": 15, "type": "pre_warning",  "subreddit": "r/SideProject"},
    {"day_offset": 0, "hour": 16, "minute": 30, "type": "post_action",  "subreddit": "r/SideProject"},
    # Day 2 Sunday
    {"day_offset": 1, "hour": 15, "minute": 45, "type": "pre_warning",  "subreddit": "r/SQL"},
    {"day_offset": 1, "hour": 16, "minute": 0,  "type": "post_action",  "subreddit": "r/SQL"},
    # Day 3 Monday — feedback review
    {"day_offset": 2, "hour": 11, "minute": 45, "type": "pre_warning",  "subreddit": "r/SideProject"},
    {"day_offset": 2, "hour": 12, "minute": 0,  "type": "update_action","subreddit": "r/SideProject"},
    # Day 4 Tuesday
    {"day_offset": 3, "hour": 16, "minute": 15, "type": "pre_warning",  "subreddit": "r/dataanalysis"},
    {"day_offset": 3, "hour": 16, "minute": 30, "type": "post_action",  "subreddit": "r/dataanalysis"},
    # Day 5 Wednesday — Discord/LinkedIn
    {"day_offset": 4, "hour": 14, "minute": 45, "type": "pre_warning",  "subreddit": "LinkedIn/Discord"},
    {"day_offset": 4, "hour": 15, "minute": 0,  "type": "outreach_action","subreddit": "LinkedIn/Discord"},
    # Day 6 Thursday
    {"day_offset": 5, "hour": 16, "minute": 15, "type": "pre_warning",  "subreddit": "r/learnpython"},
    {"day_offset": 5, "hour": 16, "minute": 30, "type": "post_action",  "subreddit": "r/learnpython"},
    # Day 7 Saturday — audit
    {"day_offset": 6, "hour": 11, "minute": 45, "type": "pre_warning",  "subreddit": "review"},
    {"day_offset": 6, "hour": 12, "minute": 0,  "type": "audit_action", "subreddit": "review"},
]

# ─────────────────────────────────────────────────────────────────────────────
# POST CONTENT TEMPLATES (Product Testing Framing — NOT self-promotion)
# ─────────────────────────────────────────────────────────────────────────────
POST_TEMPLATES = {
    "r/SideProject": {
        "title": "I built a zero-setup in-browser SQL + Python sandbox with Whisper ASR word-synced typewriter audio — looking for brutal technical feedback from developers!",
        "body": """Hey r/SideProject,

I've been working on an interesting technical challenge: building a fully in-browser SQL and Python execution engine with word-level Whisper ASR audio synchronized to a typewriter code animation.

The goal was to eliminate the #1 reason beginners quit coding courses — painful local environment setup. No PostgreSQL server, no Anaconda, no terminal errors on Day 1.

I'd love to get stress-tested by this community:
https://www.manodemy.com/sql/day01.html (100% free, zero login required)

Specific things I'd love feedback on:
1. How does the SQLite query execution latency feel on your browser & OS?
2. Does the Whisper ASR audio-typewriter sync feel natural or distracting?
3. Any mobile/Firefox/Safari rendering edge cases I should fix?

Tear it apart — I ship fixes live within minutes based on feedback!"""
    },
    "r/SQL": {
        "title": "Built an in-browser SQLite practice sandbox with real retail schemas (no installation) — feedback from SQL practitioners wanted",
        "body": """Hey r/SQL,

The biggest friction I see for people learning SQL is the Day 1 setup problem — installing database servers, configuring ports, importing CSVs. So I built a zero-setup in-browser SQL environment.

Test it here (no login, no credit card): https://www.manodemy.com/sql/day01.html

It uses real-world retail business schemas (customers, orders, inventory, transactions).

Would love expert SQL feedback:
1. Are the starter queries meaningful for real-world practice?
2. What query patterns (CTEs, window functions, correlated subqueries) feel missing?
3. Any SQL dialect quirks between browser SQLite and PostgreSQL I should document?"""
    },
    "r/dataanalysis": {
        "title": "Building a browser-based 60-day SQL→Excel→Python data analyst curriculum — need real feedback from practicing analysts",
        "body": """Hey r/dataanalysis,

Most learning resources treat SQL, Excel, and Python as completely separate skills. But in practice, a data analyst uses all three in a single workflow. So I mapped the entire workflow into a single 60-day in-browser curriculum.

Test the first two days (completely free): https://www.manodemy.com/sql/day01.html

I'm specifically looking for feedback from working analysts:
1. Is the SQL → Excel → Python progression realistic for how you work?
2. What datasets or real-world scenarios would make practice more meaningful?
3. What am I missing that you wish you had learned earlier in your career?"""
    },
    "r/learnpython": {
        "title": "Built a zero-install Python data analysis sandbox that runs in the browser — looking for beginner feedback on the learning experience",
        "body": """Hey r/learnpython,

The #1 issue I see with Python beginners is giving up before writing their first line of code because of environment setup errors. So I built a Python sandbox that runs entirely in the browser — no pip install, no venv, no Anaconda.

Start with the SQL foundation (Day 1, completely free): https://www.manodemy.com/sql/day01.html

Specifically looking for beginner feedback:
1. Does the zero-setup experience remove the initial friction you faced?
2. Is the step-by-step audio explanation clear and easy to follow?
3. What Python topics (Pandas, Matplotlib, NumPy) would you most want to practice this way?"""
    }
}

# Comment response suggestions by category
REPLY_TEMPLATES = {
    "bug": "Thank you for catching this! I just pushed a fix to production — please refresh and let me know if that resolves it for you.",
    "pricing": "Really appreciate your interest! Days 01–04 are fully interactive and live right now. Days 05–60 are being released weekly as part of active development. We have an early founding member pass for ₹1,999 ($29) for lifetime all-access before it goes to regular pricing.",
    "praise": "Thank you so much! This genuinely means a lot — I've been heads-down building this for months. Did you get a chance to try running the practice queries? Would love to know if the audio sync felt natural.",
    "feature": "That's a great suggestion — adding it to the roadmap right now! Out of curiosity, is this something you'd want for interview prep, or more for day-to-day work tasks?",
    "general": "Thank you for taking the time to test this! Your feedback is genuinely valuable. What would make this most useful for your learning goals?"
}


# ─────────────────────────────────────────────────────────────────────────────
# WHATSAPP SENDER (CallMeBot — Free API)
# ─────────────────────────────────────────────────────────────────────────────
def send_whatsapp(message: str) -> bool:
    """Send a WhatsApp message via CallMeBot free API."""
    if CALLMEBOT_API_KEY == "YOUR_KEY_HERE":
        print("\n[WHATSAPP SIMULATION — API key not configured yet]")
        print("─" * 60)
        print(message)
        print("─" * 60)
        return True

    encoded = urllib.parse.quote(message)
    url = f"https://api.callmebot.com/whatsapp.php?phone={WHATSAPP_PHONE}&text={encoded}&apikey={CALLMEBOT_API_KEY}"
    try:
        with urllib.request.urlopen(url, timeout=10) as resp:
            return resp.status == 200
    except Exception as e:
        print(f"[WhatsApp error] {e}")
        return False


# ─────────────────────────────────────────────────────────────────────────────
# MESSAGE BUILDERS
# ─────────────────────────────────────────────────────────────────────────────
def build_pre_warning(subreddit: str, action_time: str) -> str:
    return f"""⏰ 15-MINUTE LAUNCH WARNING!

Target Community: {subreddit}
Post Time: {action_time} IST (in 15 minutes)

CHECKLIST - Do these now:
1. Make sure your phone has good internet.
2. Open Reddit app and make sure you are logged in.
3. Visit: https://www.manodemy.com/sql/day01.html and make sure it loads and audio plays.
4. Keep Reddit app open and ready.

In 15 minutes I will send you the exact TITLE and BODY to copy & paste!"""


def build_post_action(subreddit: str) -> str:
    template = POST_TEMPLATES.get(subreddit, POST_TEMPLATES["r/SideProject"])
    return f"""🚀 POST NOW ON REDDIT!

STEP 1: Open Reddit app
STEP 2: Tap the '+' button at the bottom center
STEP 3: In the search bar, type and select: {subreddit}
STEP 4: Tap 'Post' type → select 'Text'

COPY THIS EXACT TITLE:
{template['title']}

COPY THIS EXACT BODY:
{template['body']}

STEP 5: Tap 'POST' in the top right corner.
STEP 6: Once posted, copy your post link and reply to this message with the URL so I can start monitoring comments!"""


def build_update_action() -> str:
    return """📊 MONDAY FEEDBACK REVIEW - Take 10 minutes to do this:

STEP 1: Open Reddit app → check your r/SideProject post.
STEP 2: Read all comments carefully.
STEP 3: Reply to any unanswered comments (I will help you with exact reply text if you send me the comments here).
STEP 4: Visit https://vercel.com/dashboard and check the traffic analytics.
STEP 5: Note down the top 2 most requested features from commenters.

Reply with a quick summary of how many comments and what the main feedback is!"""


def build_comment_alert(author: str, body: str, permalink: str, category: str) -> str:
    suggestion = REPLY_TEMPLATES.get(category, REPLY_TEMPLATES["general"])
    short_body = body.strip()[:300] + ("..." if len(body) > 300 else "")
    return f"""🚨 NEW REDDIT COMMENT!

User: u/{author}
Category: {category.upper()}

THEIR COMMENT:
"{short_body}"

VISIT: {permalink}

YOUR SUGGESTED REPLY (tap to copy & paste on Reddit):
"{suggestion}"

IMPORTANT: Go to Reddit app NOW, find this comment, and paste the reply above!"""


# ─────────────────────────────────────────────────────────────────────────────
# COMMENT CLASSIFIER
# ─────────────────────────────────────────────────────────────────────────────
def classify_comment(body: str) -> str:
    low = body.lower()
    if any(w in low for w in ["bug", "broken", "error", "crash", "doesn't work", "not working", "issue"]):
        return "bug"
    if any(w in low for w in ["price", "cost", "pay", "₹", "$", "subscription", "free", "paid", "purchase"]):
        return "pricing"
    if any(w in low for w in ["amazing", "incredible", "love", "great", "awesome", "wow", "cool", "nice work"]):
        return "praise"
    if any(w in low for w in ["add", "feature", "suggestion", "could you", "would be great", "missing", "wish"]):
        return "feature"
    return "general"


# ─────────────────────────────────────────────────────────────────────────────
# REDDIT COMMENT MONITOR
# ─────────────────────────────────────────────────────────────────────────────
def fetch_reddit_comments(post_url: str) -> list:
    json_url = post_url.split("?")[0].rstrip("/") + ".json"
    req = urllib.request.Request(json_url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            data = json.loads(resp.read().decode("utf-8"))
        comments = []
        def walk(children):
            for child in children:
                if child.get("kind") != "t1":
                    continue
                d = child["data"]
                comments.append({
                    "id": d["id"],
                    "author": d.get("author", "[deleted]"),
                    "body": d.get("body", ""),
                    "permalink": "https://www.reddit.com" + d.get("permalink", "")
                })
                if isinstance(d.get("replies"), dict):
                    walk(d["replies"]["data"]["children"])
        if len(data) >= 2:
            walk(data[1]["data"]["children"])
        return comments
    except Exception as e:
        print(f"[Reddit fetch error] {e}")
        return []


def monitor_post(post_url: str):
    print(f"\n📡 Live monitoring started: {post_url}")
    print(f"Polling every {REDDIT_POLL_INTERVAL}s — WhatsApp alerts will fire instantly on new comments.")
    print("Press Ctrl+C to stop.\n")

    seen_ids = set()
    # Baseline existing comments
    existing = fetch_reddit_comments(post_url)
    seen_ids = {c["id"] for c in existing}
    print(f"Baselined {len(seen_ids)} existing comments. Watching for new ones...\n")

    send_whatsapp(f"📡 COMMENT MONITOR ACTIVE!\n\nI am now watching your Reddit post every {REDDIT_POLL_INTERVAL} seconds.\nYou will get an instant WhatsApp the moment someone comments!\n\nPost: {post_url}")

    try:
        while True:
            time.sleep(REDDIT_POLL_INTERVAL)
            current = fetch_reddit_comments(post_url)
            for c in current:
                if c["id"] not in seen_ids:
                    seen_ids.add(c["id"])
                    category = classify_comment(c["body"])
                    msg = build_comment_alert(c["author"], c["body"], c["permalink"], category)
                    print(f"\n🔔 NEW COMMENT from u/{c['author']} [{category}]")
                    send_whatsapp(msg)
    except KeyboardInterrupt:
        print("\nMonitoring stopped.")


# ─────────────────────────────────────────────────────────────────────────────
# SCHEDULED LAUNCH DISPATCHER
# ─────────────────────────────────────────────────────────────────────────────
def run_schedule(launch_date: datetime.date):
    print(f"\n🗓️  7-Day Launch Schedule starting: {launch_date}")
    print("WhatsApp alerts will fire automatically at each scheduled time.\n")

    IST_OFFSET = datetime.timezone(datetime.timedelta(hours=5, minutes=30))
    fired = set()

    while True:
        now = datetime.datetime.now(IST_OFFSET)
        for i, event in enumerate(SCHEDULE):
            event_date = launch_date + datetime.timedelta(days=event["day_offset"])
            event_dt = datetime.datetime(event_date.year, event_date.month, event_date.day,
                                         event["hour"], event["minute"], tzinfo=IST_OFFSET)
            if i in fired:
                continue
            if now >= event_dt and now < event_dt + datetime.timedelta(minutes=2):
                fired.add(i)
                action_time = f"{event['hour']:02d}:{event['minute']+15:02d}"
                subreddit = event["subreddit"]
                etype = event["type"]

                if etype == "pre_warning":
                    msg = build_pre_warning(subreddit, action_time)
                elif etype == "post_action":
                    msg = build_post_action(subreddit)
                elif etype == "update_action":
                    msg = build_update_action()
                elif etype == "outreach_action":
                    msg = "🌐 OUTREACH TIME!\n\nOpen LinkedIn and search: #OpenToWork Data Analyst\nSend 5 friendly DMs offering free Day 01 practice:\n\n'Hey [Name]! I built a free interactive SQL & Python browser sandbox to help people prep for data analyst interviews. Would love your feedback: https://www.manodemy.com/sql/day01.html'"
                elif etype == "audit_action":
                    msg = "📊 WEEK 1 AUDIT!\n\nCheck these 3 things:\n1. Vercel analytics → how many unique visitors this week?\n2. How many comments total across all Reddit posts?\n3. How many people clicked the Pro upgrade modal?\n\nReply with your numbers and I will give you a revenue & growth summary!"
                else:
                    continue

                print(f"\n[{now.strftime('%H:%M IST')}] Firing event: {etype} for {subreddit}")
                send_whatsapp(msg)

        time.sleep(30)


# ─────────────────────────────────────────────────────────────────────────────
# ENTRY POINT
# ─────────────────────────────────────────────────────────────────────────────
def main():
    parser = argparse.ArgumentParser(description="Manodemy WhatsApp Launch Co-Pilot")
    parser.add_argument("--mode", choices=["schedule", "monitor", "test"], required=True,
                        help="schedule=run 7-day plan | monitor=watch a live post | test=send test alert")
    parser.add_argument("--post", help="Reddit post URL for monitor mode")
    parser.add_argument("--launch-date", help="Launch start date YYYY-MM-DD (default: today)")
    args = parser.parse_args()

    if args.mode == "test":
        print("Sending test WhatsApp message...")
        send_whatsapp("✅ MANODEMY CO-PILOT CONNECTED!\n\nYour WhatsApp launch assistant is active and ready.\nYou will receive:\n- 15-min advance launch warnings\n- Step-by-step post instructions\n- Instant comment alerts with 1-tap replies\n\nReady for launch! 🚀")
        print("Test complete!")

    elif args.mode == "monitor":
        if not args.post:
            print("Error: --post URL is required for monitor mode.")
            sys.exit(1)
        monitor_post(args.post)

    elif args.mode == "schedule":
        if args.launch_date:
            launch = datetime.date.fromisoformat(args.launch_date)
        else:
            launch = datetime.date.today()
        run_schedule(launch)


if __name__ == "__main__":
    main()
