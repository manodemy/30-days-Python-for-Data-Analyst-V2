"""
Dual Visual Code Metaphor Cover Generator for Manodemy Reels (1:1 Aspect Ratio).
Composes:
- Top: Category Pill + High-CTR Hook Question
- Center: Side-by-Side Dual 3D Visual Clash (Option A Image vs Option B Image)
- Bottom: Compact Duel Callout + Direct Simulator Bridge Link
"""

import asyncio
import base64
from pathlib import Path
from playwright.async_api import async_playwright

PROJECT_ROOT = Path(__file__).resolve().parent.parent
OUTPUT_DIR = PROJECT_ROOT / "marketing" / "output" / "video"
IMG_A = PROJECT_ROOT / "marketing" / "assets" / "images" / "opt_a_metaphor.jpg"
IMG_B = PROJECT_ROOT / "marketing" / "assets" / "images" / "opt_b_metaphor.jpg"

def get_base64_image(path):
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode("utf-8")

img_a_b64 = get_base64_image(IMG_A)
img_b_b64 = get_base64_image(IMG_B)

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
    padding: 20px 0;
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
    font-size: 24px;
    font-weight: 800;
    letter-spacing: 2.5px;
    color: #e2e8f0;
    text-transform: uppercase;
  }}

  /* Attention Hook Title */
  .title-section {{
    text-align: center;
    margin-top: 10px;
    margin-bottom: 12px;
  }}
  .main-hook {{
    font-family: 'Plus Jakarta Sans', sans-serif;
    font-size: 60px;
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
    font-size: 30px;
    font-weight: 700;
    color: #cbd5e1;
    margin-top: 8px;
    letter-spacing: 0.5px;
  }}

  /* Side-by-Side Dual Duel Arena */
  .duel-arena {{
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
    position: relative;
  }}

  .duel-card {{
    flex: 1;
    background: rgba(10, 15, 30, 0.9);
    border-radius: 20px;
    padding: 16px;
    backdrop-filter: blur(20px);
    display: flex;
    flex-direction: column;
    gap: 12px;
    position: relative;
    overflow: hidden;
  }}

  .card-a {{
    border: 2.5px solid rgba(0, 240, 255, 0.65);
    box-shadow: 0 0 35px rgba(0, 240, 255, 0.2);
  }}

  .card-b {{
    border: 2.5px solid rgba(250, 204, 21, 0.65);
    box-shadow: 0 0 35px rgba(250, 204, 21, 0.2);
  }}

  .card-header {{
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 6px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.08);
  }}

  .card-label {{
    font-size: 22px;
    font-weight: 900;
    letter-spacing: 1px;
  }}
  .label-a {{ color: #00f0ff; }}
  .label-b {{ color: #facc15; }}

  .mac-dots {{
    display: flex;
    gap: 6px;
  }}
  .mac-dot {{
    width: 10px;
    height: 10px;
    border-radius: 50%;
  }}

  /* Image Visual Frame */
  .visual-box {{
    width: 100%;
    height: 310px;
    border-radius: 14px;
    overflow: hidden;
    background: #000;
    position: relative;
  }}

  .visual-box img {{
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
  }}

  /* Code Formula Tag */
  .formula-tag {{
    font-family: 'JetBrains Mono', monospace;
    font-size: 20px;
    font-weight: 800;
    padding: 10px 14px;
    border-radius: 10px;
    background: rgba(15, 23, 42, 0.95);
    border: 1px solid rgba(255, 255, 255, 0.12);
    color: #f8fafc;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }}
  .formula-tag .kw {{ color: #38bdf8; }}
  .formula-tag .fn {{ color: #facc15; }}

  /* Central Floating VS Badge */
  .vs-badge {{
    width: 58px;
    height: 58px;
    background: linear-gradient(135deg, #0f172a, #1e1b4b);
    border: 2.5px solid #facc15;
    box-shadow: 0 0 25px rgba(250, 204, 21, 0.6);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    font-weight: 900;
    color: #facc15;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    z-index: 30;
  }}

  /* Bottom Banner */
  .bottom-banner {{
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 12px 24px;
    border-radius: 14px;
    background: rgba(15, 23, 42, 0.9);
    border: 1.5px solid rgba(255, 255, 255, 0.12);
  }}
  .bottom-text {{ font-size: 24px; font-weight: 800; color: #facc15; }}
  .brand-text {{ font-size: 24px; font-weight: 800; color: #00f0ff; }}
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

    <!-- Dual Clash Arena (Side-by-Side) -->
    <div class="duel-arena">
      <div class="vs-badge">VS</div>

      <!-- Option A Card -->
      <div class="duel-card card-a">
        <div class="card-header">
          <div class="card-label label-a">⚡ OPTION A</div>
          <div class="mac-dots">
            <div class="mac-dot" style="background:#ff5f56;"></div>
            <div class="mac-dot" style="background:#ffbd2e;"></div>
            <div class="mac-dot" style="background:#27c93f;"></div>
          </div>
        </div>
        <div class="visual-box">
          <img src="data:image/jpeg;base64,{img_a_b64}" alt="Option A Metaphor">
        </div>
        <div class="formula-tag">
          <span class="kw">DATE</span>(date, <span class="fn">- ROW_NO</span>)
        </div>
      </div>

      <!-- Option B Card -->
      <div class="duel-card card-b">
        <div class="card-header">
          <div class="card-label label-b">⚡ OPTION B</div>
          <div class="mac-dots">
            <div class="mac-dot" style="background:#ff5f56;"></div>
            <div class="mac-dot" style="background:#ffbd2e;"></div>
            <div class="mac-dot" style="background:#27c93f;"></div>
          </div>
        </div>
        <div class="visual-box">
          <img src="data:image/jpeg;base64,{img_b_b64}" alt="Option B Metaphor">
        </div>
        <div class="formula-tag">
          <span class="fn">DENSE_RANK()</span> <span class="kw">OVER()</span>
        </div>
      </div>
    </div>

    <!-- Bottom Action Banner -->
    <div class="bottom-banner">
      <div class="bottom-text">
        <span>👇 Option A or Option B?</span>
      </div>
      <div class="brand-text">
        <span>manodemy.com/q17</span>
      </div>
    </div>
  </div>
</body>
</html>
"""

async def render():
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        page = await browser.new_page(viewport={"width": 1080, "height": 1080}, device_scale_factor=1.0)
        await page.set_content(HTML_TEMPLATE)
        await page.wait_for_timeout(400)

        out_jpg = OUTPUT_DIR / "SQL-10-R1_Cover_DualVisual.jpg"
        await page.screenshot(path=str(out_jpg), type="jpeg", quality=95)
        print(f"[OK] Dual Visual Cover generated: {out_jpg}")
        await browser.close()

if __name__ == "__main__":
    asyncio.run(render())
