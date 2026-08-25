---
name: marketing-reel-engine
description: Standard operating procedure and multi-agent architecture for generating viral 9:16 vertical reels (SQL, Python, Excel) for Manodemy with automated Option A vs B psychological challenges, animated clock ticking countdowns, and 1-click publishing packs.
---

# 🚀 MANODEMY MARKETING & REEL ENGINE (MM SPECIFICATION v1.0)

This skill defines the autonomous multi-agent pipeline for creating high-converting, viral 9:16 vertical programming reels, social media challenges, and marketing assets for the Manodemy 60-Day Data Analyst curriculum.

---

## 👥 MULTI-AGENT HIERARCHY & ROLES

```
┌─────────────────────────────────────────────────────────────┐
│             👑 DIRECTOR: Marketing Madam (MM)               │
│          (Growth Strategy · Quality Gate · Oversight)       │
└──────────────────────────────┬──────────────────────────────┘
                               │
       ┌───────────────────────┴───────────────────────┐
       ▼                                               ▼
┌─────────────────────────────┐         ┌─────────────────────────────┐
│ 🧠 AGENT 1: REEL ARCHITECT  │         │ 🎬 AGENT 2: STUDIO PRODUCER │
│  - Question Extractor       │         │  - Audio & Clock Synthesizer│
│  - Viral Hook Crafter       │────────▶│  - 9:16 Visual Renderer     │
│  - Tricky Option A/B Builder│         │  - 1-Click Launchpad Pack   │
│  - Narration & Caption Lead │         │                             │
└─────────────────────────────┘         └─────────────────────────────┘
                               │
               ┌───────────────┴───────────────┐
               ▼ (FUTURE EXTENSION SLOTS)      ▼
┌─────────────────────────────┐         ┌─────────────────────────────┐
│ 📊 AGENT 3: METRIC TRACKER  │         │ 💬 AGENT 4: WHATSAPP/DM BOT │
│  - Analyzes view counts     │         │  - Auto-replies to comments │
│  - Updates winning patterns │         │  - Delivers free test links │
└─────────────────────────────┘         └─────────────────────────────┘
```

---

## 🎯 AGENT 1: THE REEL CONTENT ARCHITECT (CREATIVE LEAD)

### Core Tasks:
1. **Curriculum Ingestion:** Scans `public/Version-3/content/day-XX.js` across the 60-Day curriculum (SQL Day 01-18, Excel Day 19-30, Python Day 31-60).
2. **The 3-Tier Confusion Strategy:** Formulates two competing code options (`Option A` vs `Option B`):
   - **Type 1 (Both Correct - Debate War):** Both queries execute and return valid data, but use different approaches (e.g. `COUNT(*)` vs `COUNT(1)` or `COALESCE` vs `CASE WHEN`).
   - **Type 2 (Sneaky 1-Character Trap - Mind Bender):** One query is 100% correct, while the other has a subtle, easily overlooked edge case or precedence bug (e.g. missing parentheses around `OR` in `WHERE`).
   - **Type 3 (Both Fail - Trick Question):** Both queries contain subtle bugs (used sparingly for extreme shock value).
3. **Hook Formulation:** Crafts a 3-second uppercase title (e.g., `⚡ 90% GET THIS WRONG`, `🚨 SQL INTERVIEW TRAP`).
   - **Hook Emoji Standard (Strict Rule):**
     - **NEVER repeat generic skull emojis (`💀`) across reels.**
     - **ALWAYS choose a distinct, context-relevant emoji tailored to the concept:**
       - Aggregations / Headcount / Counting / Math: 🔢, 📊, 🧮
       - Logic / Precedence / Edge Cases / Traps: 🐛, ⚠️, 🔀
       - Running Totals / Money / Finance: 💸, 💰, 🪙
       - NULLs / Missing Rows / Drops: 🕳️, 🔍, 🚫
       - Performance / Joins / Optimization: ⚡, 🔗, 🚀
4. **Copy Package Generation:** Writes:
   - Voiceover narration script (natural English)
   - Instagram / YouTube Caption with strategic hashtags
   - Pinned first comment revealing the technical answer explanation
   - Deep-link to the free interactive playground on Manodemy.

---

## 🎬 AGENT 2: THE STUDIO PRODUCER (TECHNICAL & VIDEO ENGINE)

### Core Tasks:
1. **Template Ingestion:** Injects the JSON blueprint from Agent 1 into the locked 9:16 **Neon Radial Clock (Cyan vs Pink)** HTML/CSS template (`tools/reel-engine/template.html`).
2. **Audio & Clock Synthesis:** Merges voiceover speech with the 5-second ticking clock audio + heartbeat SFX.
3. **Automated Headless Rendering:** Launches headless browser, animates the ticking clock and code cards, and exports a clean **1080x1920 MP4 Video** file.
4. **1-Click Launchpad Packaging:** Saves all deliverables to `tools/reel-engine/output/reel_name/`:
   - `video.mp4`
   - `caption.txt`
   - `pinned_comment.txt`
   - `link.txt`

---

## 🔄 SELF-EVOLVING SYSTEM (LIVING PLAYBOOK)

The engine learns and adapts dynamically using `tools/reel-engine/playbook.json`:

1. **Winning Hooks Registry:** High-performing hook structures are tagged with high confidence scores.
2. **Anti-Pattern Guardrails:** Formats or questions that receive low engagement or feedback are logged and avoided in future reel generation.
3. **Dynamic Rule Updates:** When new marketing insights are provided by the user or MM in chat, they are persisted directly into `playbook.json`.

---

## 🔌 PLUG-AND-PLAY FUTURE EXTENSION SLOTS

The system is designed with open interfaces for adding specialized subagents:
- **`Agent 3 (Analytics Tracker):`** Ingests Instagram/YouTube view counts and feeds data into `playbook.json`.
- **`Agent 4 (Auto-DM Funnel):`** Integrates with ManyChat/Instagram API to automatically DM the free test link to anyone who comments "A" or "B".
- **`Agent 5 (Multi-Platform Adaptor):`** Re-formats vertical reels into LinkedIn swipe carousels and Twitter text threads.
