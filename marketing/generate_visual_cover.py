"""
Visual Code Metaphor Cover Generator for Manodemy Reels (1:1 Aspect Ratio).
Composes:
- Top: Category Pill + High-CTR Hook Question
- Center: 3D Conceptual Metaphor Art (Octane/Cyberpunk Neon Glass)
- Bottom: Sleek Duel Option Cards (Option A vs Option B)
- Footer: Call-To-Action + Direct Simulator Bridge Link
"""

import asyncio
import base64
from pathlib import Path
from playwright.async_api import async_playwright

PROJECT_ROOT = Path(__file__).resolve().parent.parent
OUTPUT_DIR = PROJECT_ROOT / "marketing" / "output" / "video"
IMAGE_ASSET = PROJECT_ROOT / "marketing" / "assets" / "images" / "gaps_islands_metaphor.jpg"

def get_base64_image(path):
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode("utf-8")

img_base64 = get_base64_image(IMAGE_ASSET)

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
    margin-top: 8px;
    margin-bottom: 10px;
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
    margin-top: 6px;
    letter-spacing: 0.5px;
  }}

  /* 3D Visual Art Frame */
  .art-frame {{
    width: 100%;
    height: 380px;
    border-radius: 20px;
    overflow: hidden;
    position: relative;
    border: 2px solid rgba(0, 240, 255, 0.4);
    box-shadow: 0 0 40px rgba(0, 240, 255, 0.25), inset 0 0 20px rgba(0, 0, 0, 0.8);
    background: #050811;
  }}

  .art-frame img {{
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
  }}

  .art-overlay-label {{
    position: absolute;
    bottom: 12px;
    right: 14px;
    background: rgba(15, 23, 42, 0.85);
    border: 1px solid rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    padding: 6px 14px;
    border-radius: 8px;
    font-size: 18px;
    font-weight: 800;
    color: #94a3b8;
    letter-spacing: 1px;
  }}

  /* Compact Duel Clash Cards */
  .duel-container {{
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 14px;
    position: relative;
  }}

  .option-card {{
    flex: 1;
    background: rgba(10, 15, 30, 0.9);
    border-radius: 16px;
    padding: 16px 18px;
    backdrop-filter: blur(20px);
    position: relative;
    display: flex;
    flex-direction: column;
    gap: 8px;
  }}

  .opt-a {{
    border: 2px solid rgba(0, 240, 255, 0.6);
    box-shadow: 0 0 25px rgba(0, 240, 255, 0.15);
  }}

  .opt-b {{
    border: 2px solid rgba(250, 204, 21, 0.6);
    box-shadow: 0 0 25px rgba(250, 204, 21, 0.15);
  }}

  .opt-badge {{
    font-size: 20px;
    font-weight: 900;
    letter-spacing: 0.8px;
  }}
  .badge-a {{ color: #00f0ff; }}
  .badge-b {{ color: #facc15; }}

  .opt-code {{
    font-family: 'JetBrains Mono', monospace;
    font-size: 21px;
    font-weight: 800;
    line-height: 1.35;
    color: #f8fafc;
  }}
  .opt-code .kw {{ color: #38bdf8; }}
  .opt-code .fn {{ color: #facc15; }}

  /* Central VS Circle */
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

    <!-- 3D Conceptual Metaphor Art Frame -->
    <div class="art-frame">
      <img src="data:image/jpeg;base64,{img_base64}" alt="Gaps and Islands 3D Metaphor">
      <div class="art-overlay-label">DATA ARCHIPELAGO · STREAK ISLANDS</div>
    </div>

    <!-- Compact Duel Options -->
    <div class="duel-container">
      <!-- Option A -->
      <div class="option-card opt-a">
        <div class="opt-badge badge-a">⚡ OPTION A</div>
        <div class="opt-code">
          <span class="kw">DATE</span>(login_date, <span class="fn">- ROW_NUMBER()</span>)
        </div>
      </div>

      <!-- Center VS -->
      <div class="vs-badge">VS</div>

      <!-- Option B -->
      <div class="option-card opt-b">
        <div class="opt-badge badge-b">⚡ OPTION B</div>
        <div class="opt-code">
          <span class="fn">DENSE_RANK()</span> <span class="kw">OVER</span>(ORDER BY date)
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

async def build_cover():
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        page = await browser.new_page(viewport={"width": 1080, "height": 1080}, device_scale_factor=1.0)
        await page.set_content(HTML_TEMPLATE)
        await page.wait_for_timeout(400)

        out_jpg = OUTPUT_DIR / "SQL-10-R1_Cover_Visual.jpg"
        await page.screenshot(path=str(out_jpg), type="jpeg", quality=95)
        print(f"[OK] Visual Metaphor Cover generated: {out_jpg}")
        await browser.close()

if __name__ == "__main__":
    asyncio.run(build_cover())
