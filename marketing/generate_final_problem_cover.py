"""
Final Problem-Statement Visual Cover Generator for Manodemy Reels (1:1 Aspect Ratio).
Structure:
- Top: Category Pill + High-CTR Hook Question
- Center: 1 Stunning Visual Explaining Problem Statement (Dark Streak Calendar Widget)
- Middle: Dual Compact Option Cards with Key Code Highlights (Option A vs Option B)
- Bottom: '👇 Test your code Live' + Direct Simulator Bridge Link (manodemy.com/q17)
"""

import asyncio
import base64
from pathlib import Path
from playwright.async_api import async_playwright

PROJECT_ROOT = Path(__file__).resolve().parent.parent
OUTPUT_DIR = PROJECT_ROOT / "marketing" / "output" / "video"
CALENDAR_IMG = PROJECT_ROOT / "marketing" / "assets" / "images" / "streak_calendar_dark.png"

def get_base64_image(path):
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode("utf-8")

cal_b64 = get_base64_image(CALENDAR_IMG)

HTML_TEMPLATE = f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@800;900&family=Outfit:wght@700;800;900&family=JetBrains+Mono:wght@700;800;900&family=Space+Grotesk:wght@700;900&display=swap');

  :root {{
    --font-heading: 'Plus Jakarta Sans', sans-serif;
    --font-sub: 'Outfit', sans-serif;
    --font-code: 'JetBrains Mono', monospace;
    --cyan: #00f0ff;
    --gold: #facc15;
    --bg-dark: #04060c;
  }}

  * {{ box-sizing: border-box; margin: 0; padding: 0; }}

  body {{
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
  }}

  /* Ambient Glow Spheres */
  .ambient-top {{
    position: absolute;
    top: 5%;
    left: 50%;
    transform: translateX(-50%);
    width: 850px;
    height: 450px;
    background: radial-gradient(circle, rgba(0, 240, 255, 0.22) 0%, rgba(250, 204, 21, 0.12) 40%, transparent 70%);
    filter: blur(60px);
    z-index: 1;
  }}

  .cyber-grid {{
    position: absolute;
    inset: 0;
    background-image: 
      linear-gradient(rgba(255, 255, 255, 0.035) 1px, transparent 1px),
      linear-gradient(90deg, rgba(255, 255, 255, 0.035) 1px, transparent 1px);
    background-size: 54px 54px;
    z-index: 2;
  }}

  /* 1:1 Instagram Profile Safe Container */
  .safe-container {{
    width: 880px;
    height: 1040px;
    position: relative;
    z-index: 10;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
    padding: 16px 0;
  }}

  /* Top Category Pill */
  .top-pill {{
    display: inline-flex;
    align-items: center;
    gap: 12px;
    padding: 8px 24px;
    border-radius: 999px;
    background: rgba(15, 23, 42, 0.85);
    border: 1.5px solid rgba(0, 240, 255, 0.4);
    box-shadow: 0 0 25px rgba(0, 240, 255, 0.25);
  }}
  .top-pill .dot {{
    width: 12px;
    height: 12px;
    border-radius: 50%;
    background: #00f0ff;
    box-shadow: 0 0 10px #00f0ff;
  }}
  .top-pill span {{
    font-size: 23px;
    font-weight: 800;
    letter-spacing: 2.5px;
    color: #e2e8f0;
    text-transform: uppercase;
  }}

  /* Attention Hook Title */
  .title-section {{
    text-align: center;
    margin-top: 6px;
    margin-bottom: 8px;
  }}
  .main-hook {{
    font-family: 'Plus Jakarta Sans', sans-serif;
    font-size: 58px;
    font-weight: 900;
    line-height: 1.1;
    letter-spacing: -1px;
    text-transform: uppercase;
    text-shadow: 0 8px 30px rgba(0,0,0,0.8);
  }}
  .highlight-gold {{
    color: #facc15;
    text-shadow: 0 0 25px rgba(250, 204, 21, 0.4);
  }}
  .highlight-cyan {{
    color: #00f0ff;
    text-shadow: 0 0 25px rgba(0, 240, 255, 0.5);
  }}
  .sub-question {{
    font-size: 28px;
    font-weight: 700;
    color: #cbd5e1;
    margin-top: 6px;
    letter-spacing: 0.5px;
  }}

  /* Center: Problem Statement Visual Frame */
  .problem-visual-frame {{
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 4px 0;
  }}
  .problem-visual-frame img {{
    width: 100%;
    max-height: 500px;
    object-fit: contain;
    filter: drop-shadow(0 25px 50px rgba(0, 0, 0, 0.95));
  }}

  /* Below Image: Dual Option Badges */
  .duel-container {{
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
    position: relative;
  }}

  .option-card {{
    flex: 1;
    background: rgba(10, 15, 30, 0.95);
    border-radius: 18px;
    padding: 16px 18px;
    backdrop-filter: blur(20px);
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    gap: 10px;
    position: relative;
  }}

  .opt-a {{
    border: 2px solid rgba(0, 240, 255, 0.65);
    box-shadow: 0 0 30px rgba(0, 240, 255, 0.2);
  }}

  .opt-b {{
    border: 2px solid rgba(250, 204, 21, 0.65);
    box-shadow: 0 0 30px rgba(250, 204, 21, 0.2);
  }}

  .card-top {{
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
  }}

  .opt-badge {{
    font-size: 20px;
    font-weight: 900;
    letter-spacing: 0.8px;
    text-align: center;
  }}
  .badge-a {{ color: #00f0ff; }}
  .badge-b {{ color: #facc15; }}

  .mac-dots {{
    position: absolute;
    right: 0;
    top: 50%;
    transform: translateY(-50%);
    display: flex;
    gap: 6px;
  }}
  .mac-dot {{
    width: 9px;
    height: 9px;
    border-radius: 50%;
  }}

  .opt-code {{
    font-family: 'JetBrains Mono', monospace;
    font-size: 20px;
    font-weight: 800;
    line-height: 1.4;
    color: #f8fafc;
    text-align: left;
    width: 100%;
    padding-left: 6px;
  }}
  .opt-code .kw {{ color: #38bdf8; }}
  .opt-code .fn {{ color: #facc15; }}

  /* VS Circle */
  .vs-badge {{
    width: 52px;
    height: 52px;
    background: linear-gradient(135deg, #0f172a, #1e1b4b);
    border: 2.5px solid #facc15;
    box-shadow: 0 0 20px rgba(250, 204, 21, 0.5);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    font-weight: 900;
    color: #facc15;
    flex-shrink: 0;
  }}

  /* Bottom Callout Banner: Unified Together */
  .bottom-banner {{
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 12px;
    padding: 12px 24px;
    border-radius: 14px;
    background: rgba(15, 23, 42, 0.95);
    border: 1.5px solid rgba(255, 255, 255, 0.12);
  }}
  .bottom-text {{
    font-size: 23px;
    font-weight: 800;
    color: #facc15;
    display: flex;
    align-items: center;
    gap: 8px;
  }}
  .brand-text {{ font-size: 23px; font-weight: 800; color: #00f0ff; }}
</style>
</head>
<body>
  <div class="ambient-top"></div>
  <div class="cyber-grid"></div>

  <div class="safe-container">
    <!-- Top Pill -->
    <div class="top-pill">
      <div class="dot"></div>
      <span>META / GOOGLE SQL TRAP ⚡</span>
    </div>

    <!-- Title Section -->
    <div class="title-section">
      <div class="main-hook">
        <span class="highlight-gold">GAPS & ISLANDS</span> TRAP 🏝️
      </div>
      <div class="sub-question">
        Which query groups <span class="highlight-cyan">consecutive login streaks</span>?
      </div>
    </div>

    <!-- Center: Problem Statement Visual (Dark Streak Calendar Widget) -->
    <div class="problem-visual-frame">
      <img src="data:image/png;base64,{cal_b64}" alt="Streak Calendar Problem Statement">
    </div>

    <!-- Below Image: Dual Option Badges (Center-Aligned) -->
    <div class="duel-container">
      <!-- Option A Card -->
      <div class="option-card opt-a">
        <div class="card-top">
          <div class="opt-badge badge-a">⚡ OPTION A</div>
          <div class="mac-dots">
            <div class="mac-dot" style="background:#ff5f56;"></div>
            <div class="mac-dot" style="background:#ffbd2e;"></div>
            <div class="mac-dot" style="background:#27c93f;"></div>
          </div>
        </div>
        <div class="opt-code">
          <span class="kw">DATE</span>(login_date, <span class="fn">- ROW_NUMBER()</span>)
        </div>
      </div>

      <!-- Center VS -->
      <div class="vs-badge">VS</div>

      <!-- Option B Card -->
      <div class="option-card opt-b">
        <div class="card-top">
          <div class="opt-badge badge-b">⚡ OPTION B</div>
          <div class="mac-dots">
            <div class="mac-dot" style="background:#ff5f56;"></div>
            <div class="mac-dot" style="background:#ffbd2e;"></div>
            <div class="mac-dot" style="background:#27c93f;"></div>
          </div>
        </div>
        <div class="opt-code">
          <span class="fn">DENSE_RANK()</span> <span class="kw">OVER</span>(ORDER BY date)
        </div>
      </div>
    </div>

    <!-- Bottom Callout Banner: Text Unified Together -->
    <div class="bottom-banner">
      <span class="bottom-text">👇 Test your code Live:</span>
      <span class="brand-text">manodemy.com/q17</span>
    </div>
  </div>
</body>
</html>
"""

async def build_cover():
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        page = await browser.new_page(viewport={"width": 1080, "height": 1080}, device_scale_factor=1.0)
        await page.set_content(HTML_TEMPLATE)
        await page.wait_for_timeout(300)

        out_jpg = OUTPUT_DIR / "SQL-10-R1_Cover_ProblemVisual.jpg"
        await page.screenshot(path=str(out_jpg), type="jpeg", quality=95)
        print(f"[OK] Final Problem-Visual Cover generated: {out_jpg}")
        
        # Also update official cover
        official_cover = OUTPUT_DIR / "SQL-10-R1_Cover.jpg"
        await page.screenshot(path=str(official_cover), type="jpeg", quality=95)
        print(f"[OK] Official cover overwritten: {official_cover}")
        
        await browser.close()

if __name__ == "__main__":
    asyncio.run(build_cover())
