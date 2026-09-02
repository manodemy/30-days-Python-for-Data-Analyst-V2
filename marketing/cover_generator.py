"""
Automated High-CTR Instagram Reel & YouTube Shorts Cover Generator for Manodemy.
Features:
- Giant, ultra-readable typography optimized for mobile feed scrolling
- High-contrast focused code snippet cards (36px JetBrains Mono)
- Manodemy Signature Cyberpunk Neon Theme (Cyan, Gold, Emerald, Violet)
- 1:1 Instagram Profile Grid Safe-Zone (1080x1080 centered box)
"""
import asyncio
import json
import sys
from pathlib import Path
from playwright.async_api import async_playwright

PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from marketing.direct_builder import REELS_CATALOG
OUTPUT_DIR = PROJECT_ROOT / "marketing" / "output" / "video"
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

COVER_HTML_TEMPLATE = """<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@800;900&family=Outfit:wght@700;800;900&family=JetBrains+Mono:wght@700;800;900&family=Space+Grotesk:wght@700;900&display=swap');

  :root {
    --font-heading: 'Plus Jakarta Sans', sans-serif;
    --font-sub: 'Outfit', sans-serif;
    --font-code: 'JetBrains Mono', monospace;
    --cyan: #00f0ff;
    --gold: #facc15;
    --green: #00f59b;
    --purple: #c084fc;
    --bg-dark: #04060c;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    width: 1080px;
    height: 1080px;
    background: var(--bg-dark);
    color: #fff;
    font-family: var(--font-sub);
    overflow: hidden;
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }

  /* Deep Signature Neon Background */
  .ambient-glow-top {
    position: absolute;
    top: 5%;
    left: 50%;
    transform: translateX(-50%);
    width: 900px;
    height: 500px;
    background: radial-gradient(circle, rgba(0, 240, 255, 0.25) 0%, rgba(250, 204, 21, 0.15) 40%, transparent 70%);
    filter: blur(60px);
    z-index: 1;
  }

  .ambient-glow-bottom {
    position: absolute;
    bottom: 5%;
    left: 50%;
    transform: translateX(-50%);
    width: 900px;
    height: 500px;
    background: radial-gradient(circle, rgba(168, 85, 247, 0.2) 0%, rgba(0, 245, 155, 0.14) 40%, transparent 70%);
    filter: blur(60px);
    z-index: 1;
  }

  .cyber-grid {
    position: absolute;
    inset: 0;
    background-image: 
      linear-gradient(rgba(255, 255, 255, 0.04) 1px, transparent 1px),
      linear-gradient(90deg, rgba(255, 255, 255, 0.04) 1px, transparent 1px);
    background-size: 54px 54px;
    z-index: 2;
  }

  /* 1:1 Instagram Profile Grid Container (1080x1080) */
  .safe-zone {
    position: relative;
    z-index: 10;
    width: 880px;
    height: 1040px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
    padding: 20px 0;
  }

  /* Top Category Pill */
  .top-pill {
    display: inline-flex;
    align-items: center;
    gap: 12px;
    padding: 8px 24px;
    border-radius: 999px;
    background: rgba(15, 23, 42, 0.85);
    border: 1.5px solid rgba(0, 240, 255, 0.4);
    box-shadow: 0 0 25px rgba(0, 240, 255, 0.25);
  }
  .top-pill .dot {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    background: #00f0ff;
    box-shadow: 0 0 10px #00f0ff;
  }
  .top-pill span {
    font-size: 24px;
    font-weight: 800;
    letter-spacing: 2.5px;
    color: #e2e8f0;
    text-transform: uppercase;
  }

  /* Hero Headline Container */
  .title-section {
    text-align: center;
    margin-top: 10px;
    margin-bottom: 12px;
  }
  .main-hook {
    font-family: 'Plus Jakarta Sans', sans-serif;
    font-size: 62px;
    font-weight: 900;
    line-height: 1.1;
    letter-spacing: -1px;
    text-transform: uppercase;
    text-shadow: 0 8px 30px rgba(0,0,0,0.8);
  }
  .highlight-gold {
    color: #facc15;
    text-shadow: 0 0 25px rgba(250, 204, 21, 0.4);
  }
  .highlight-cyan {
    color: #00f0ff;
    text-shadow: 0 0 25px rgba(0, 240, 255, 0.5);
  }
  .sub-question {
    font-size: 30px;
    font-weight: 700;
    color: #cbd5e1;
    margin-top: 8px;
    letter-spacing: 0.5px;
  }

  /* Code Cards Clash Container */
  .cards-grid {
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 12px;
    position: relative;
  }

  .code-card {
    border-radius: 18px;
    background: rgba(10, 15, 30, 0.85);
    backdrop-filter: blur(20px);
    padding: 16px 20px;
    position: relative;
    overflow: hidden;
  }

  .card-a {
    border: 2px solid rgba(0, 240, 255, 0.6);
    box-shadow: 0 0 35px rgba(0, 240, 255, 0.2), inset 0 0 15px rgba(0, 240, 255, 0.1);
  }

  .card-b {
    border: 2px solid rgba(250, 204, 21, 0.6);
    box-shadow: 0 0 35px rgba(250, 204, 21, 0.2), inset 0 0 15px rgba(250, 204, 21, 0.1);
  }

  .card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 8px;
    padding-bottom: 6px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.08);
  }

  .card-label {
    font-size: 25px;
    font-weight: 900;
    letter-spacing: 1px;
    display: flex;
    align-items: center;
    gap: 8px;
  }
  .label-a { color: #00f0ff; }
  .label-b { color: #facc15; }

  .mac-dots {
    display: flex;
    gap: 7px;
  }
  .mac-dot {
    width: 11px;
    height: 11px;
    border-radius: 50%;
  }

  .editor-body {
    font-family: 'JetBrains Mono', monospace;
    font-size: 24px;
    font-weight: 700;
    line-height: 1.4;
    color: #f1f5f9;
    white-space: pre-wrap;
  }

  /* Rich Syntax Colors */
  .kw { color: #38bdf8; font-weight: 800; }
  .fn { color: #facc15; font-weight: 800; }
  .str { color: #4ade80; }
  .num { color: #fb923c; }
  .op { color: #f43f5e; }

  /* VS Floating Divider Row */
  .vs-divider-row {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 15px;
    margin: 2px 0;
    position: relative;
    z-index: 20;
  }

  .divider-line {
    flex: 1;
    height: 2px;
    background: linear-gradient(90deg, transparent, rgba(250, 204, 21, 0.4), transparent);
  }

  .vs-badge {
    width: 56px;
    height: 56px;
    background: linear-gradient(135deg, #0f172a, #1e1b4b);
    border: 2.5px solid #facc15;
    box-shadow: 0 0 25px rgba(250, 204, 21, 0.5);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    font-weight: 900;
    color: #facc15;
    letter-spacing: -0.5px;
    flex-shrink: 0;
  }

  /* Bottom Callout Banner */
  .bottom-banner {
    margin-top: 10px;
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 12px 24px;
    border-radius: 14px;
    background: rgba(15, 23, 42, 0.9);
    border: 1.5px solid rgba(255, 255, 255, 0.12);
  }
  .bottom-text { font-size: 24px; font-weight: 800; color: #facc15; }
  .brand-text { font-size: 24px; font-weight: 800; color: #00f0ff; }
</style>
</head>
<body>
  <div class="ambient-glow-top"></div>
  <div class="ambient-glow-bottom"></div>
  <div class="cyber-grid"></div>

  <div class="safe-zone">
    <!-- Top Category Pill -->
    <div class="top-pill">
      <div class="dot"></div>
      <span id="badgeText">META / GOOGLE SQL TRAP ⚡</span>
    </div>

    <!-- Title Section -->
    <div class="title-section">
      <div class="main-hook" id="hookLine1"><span class="highlight-gold">GAPS & ISLANDS</span> TRAP 🏝️</div>
      <div class="sub-question" id="hookLine2">Which query groups <span class="highlight-cyan">consecutive login streaks</span>?</div>
    </div>

    <!-- Dual Code Cards Clash -->
    <div class="cards-grid">
      <!-- Card A -->
      <div class="code-card card-a">
        <div class="card-header">
          <div class="card-label label-a">⚡ OPTION A</div>
          <div class="mac-dots">
            <div class="mac-dot" style="background:#ff5f56;"></div>
            <div class="mac-dot" style="background:#ffbd2e;"></div>
            <div class="mac-dot" style="background:#27c93f;"></div>
          </div>
        </div>
        <div class="editor-body" id="codeAContent"></div>
      </div>

      <!-- VS Divider Row -->
      <div class="vs-divider-row">
        <div class="divider-line"></div>
        <div class="vs-badge">VS</div>
        <div class="divider-line"></div>
      </div>

      <!-- Card B -->
      <div class="code-card card-b">
        <div class="card-header">
          <div class="card-label label-b">⚡ OPTION B</div>
          <div class="mac-dots">
            <div class="mac-dot" style="background:#ff5f56;"></div>
            <div class="mac-dot" style="background:#ffbd2e;"></div>
            <div class="mac-dot" style="background:#27c93f;"></div>
          </div>
        </div>
        <div class="editor-body" id="codeBContent"></div>
      </div>
    </div>

    <!-- Bottom Action Banner -->
    <div class="bottom-banner">
      <div class="bottom-text">
        <span>👇 Option A or Option B?</span>
      </div>
      <div class="brand-text">
        <span id="linkText">manodemy.com/q17</span>
      </div>
    </div>
  </div>

  <script>
    function highlightSQL(code) {
      let c = code
        .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
      
      const strings = [];
      c = c.replace(/('(?:[^'\\\\]|\\\\.)*')/g, function(match) {
        strings.push(match);
        return '___STR_' + (strings.length - 1) + '___';
      });

      c = c.replace(/\\b(SELECT|FROM|WHERE|AND|OR|BETWEEN|GROUP BY|ORDER BY|HAVING|AS|OVER|PARTITION BY)\\b/g, '<span class="kw">$1</span>');
      c = c.replace(/\\b(COUNT|AVG|SUM|MAX|MIN|LAG|LEAD|ROW_NUMBER|DENSE_RANK|DATE)\\b/g, '<span class="fn">$1</span>');
      c = c.replace(/\\b(\\d+)\\b/g, '<span class="num">$1</span>');

      c = c.replace(/___STR_(\\d+)___/g, function(_, idx) {
        return '<span class="str">' + strings[parseInt(idx)] + '</span>';
      });

      return c;
    }

    window.populateData = function(data) {
      if(data.badge) document.getElementById('badgeText').textContent = data.badge;
      if(data.line1) document.getElementById('hookLine1').innerHTML = data.line1;
      if(data.line2) document.getElementById('hookLine2').innerHTML = data.line2;
      if(data.codeA) document.getElementById('codeAContent').innerHTML = highlightSQL(data.codeA);
      if(data.codeB) document.getElementById('codeBContent').innerHTML = highlightSQL(data.codeB);
      if(data.link) document.getElementById('linkText').textContent = data.link.replace('https://www.', '').replace('https://', '');
    };
  </script>
</body>
</html>
"""

async def generate_cover(reel_id="SQL-10-R1"):
    reel = REELS_CATALOG.get(reel_id)
    if not reel:
        print(f"❌ Reel '{reel_id}' not found in catalog.")
        return

    print(f"\n🖼️ Generating Clean 1:1 Square Cover Thumbnail for [{reel_id}]...")
    
    html_file = OUTPUT_DIR / f"{reel_id}_cover_temp.html"
    html_file.write_text(COVER_HTML_TEMPLATE, encoding="utf-8")

    out_cover_jpg = OUTPUT_DIR / f"{reel_id}_Cover.jpg"

    hook_lines = reel.get("hook", "").split("\n")
    line1 = hook_lines[0] if len(hook_lines) > 0 else "GAPS & ISLANDS TRAP 🏝️"
    line2 = hook_lines[1] if len(hook_lines) > 1 else "Which query groups consecutive login streaks?"

    line1_html = line1.replace("GAPS & ISLANDS TRAP", "<span class=\"highlight-gold\">GAPS & ISLANDS</span> TRAP")
    line2_html = line2.replace("consecutive login streaks", "<span class=\"highlight-cyan\">consecutive login streaks</span>")

    payload = {
        "badge": f"{reel.get('badge', 'META / GOOGLE SQL TRAP ⚡')}",
        "line1": line1_html,
        "line2": line2_html,
        "codeA": reel.get("codeA", ""),
        "codeB": reel.get("codeB", ""),
        "link": reel.get("link", "manodemy.com/q17")
    }

    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        page = await browser.new_page(viewport={"width": 1080, "height": 1080}, device_scale_factor=1.0)
        await page.goto(f"file:///{str(html_file).replace('\\\\', '/')}")
        await page.evaluate(f"window.populateData({json.dumps(payload)})")
        await page.wait_for_timeout(400)

        # Clean 1:1 Aspect Ratio Square JPG Cover (1080x1080)
        await page.screenshot(path=str(out_cover_jpg), type="jpeg", quality=95)
        
        await browser.close()

    # Clean up temp HTML
    if html_file.exists():
        html_file.unlink()

    print(f"✅ Clean 1:1 Square Cover Thumbnail Generated Successfully!")
    print(f"📁 JPG Cover: {out_cover_jpg} ({out_cover_jpg.stat().st_size / 1024:.1f} KB)")

if __name__ == "__main__":
    import sys
    r_id = sys.argv[1] if len(sys.argv) > 1 else "SQL-04-R2"
    asyncio.run(generate_cover(r_id))
