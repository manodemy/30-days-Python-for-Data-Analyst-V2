# 🚀 MANODEMY MARKETING SUITE (MM v1.0)
─────────────────────────────────────────────────────────────────
Dedicated, 100% isolated marketing & viral reel generation engine for Manodemy 60-Day Data Analyst course.

## 📁 Directory Architecture
```text
marketing/
├── agents/
│   ├── pyreel-specialist.js     # Python Viral Reel Specialist (Day 31-60)
│   └── sqlreel-specialist.js    # SQL Viral Reel Specialist (Day 01-18)
├── templates/
│   └── neon-radial-clock.html   # 1080x1920 9:16 Video Layout (Cyan vs Pink)
├── playbook.json                # Living Evolving Knowledge Base & Winning Hooks
├── engine.js                    # Core Orchestrator & Packager
├── clean.js                     # 1-Click Output Folder Cleanup Utility
└── output/                      # Generated 1-Click Ready-to-Post packs
```

## ⚡ Quick Commands

### 1. Generate Python Viral Reel:
```bash
node marketing/agents/pyreel-specialist.js
```

### 2. Generate SQL Viral Reel:
```bash
node marketing/agents/sqlreel-specialist.js
```

### 3. Clear Output Folder (Zero Disk Bloat):
```bash
node marketing/clean.js
```

## 📦 What Each Reel Pack Contains
Inside `marketing/output/<reel_id>/`:
1. `index.html` — 1080x1920 full vertical preview
2. `caption.txt` — Ready-to-paste Instagram / YouTube caption with hashtags
3. `pinned_comment.txt` — The solution explanation to pin as first comment
4. `link.txt` — Direct link-in-bio URL to the free test simulator
