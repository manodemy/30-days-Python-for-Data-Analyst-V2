import asyncio
from pathlib import Path
from playwright.async_api import async_playwright

OUTPUT_DIR = Path(r"d:\Learn Python in 60days\Manodemy_Web_V2\marketing\output\video")
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

HTML_COVER = """<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@800;900&family=Outfit:wght@600;700;800;900&family=JetBrains+Mono:wght@700;800&display=swap');

  :root {
    --cyan: #00f0ff;
    --gold: #facc15;
    --green: #10b981;
    --red: #f43f5e;
    --purple: #c084fc;
    --bg-dark: #040711;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    width: 1080px;
    height: 1920px;
    background: var(--bg-dark);
    color: #ffffff;
    font-family: 'Outfit', sans-serif;
    overflow: hidden;
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }

  /* Cyberpunk Grid Background */
  .grid-bg {
    position: absolute;
    inset: 0;
    background-image: 
      linear-gradient(to right, rgba(255, 255, 255, 0.03) 1px, transparent 1px),
      linear-gradient(to bottom, rgba(255, 255, 255, 0.03) 1px, transparent 1px);
    background-size: 60px 60px;
    mask-image: radial-gradient(circle at 50% 50%, black 40%, transparent 80%);
    z-index: 0;
  }

  /* Ambient Glow Spheres */
  .glow-top {
    position: absolute;
    top: 15%;
    left: 50%;
    transform: translateX(-50%);
    width: 850px;
    height: 500px;
    background: radial-gradient(circle, rgba(0, 240, 255, 0.28) 0%, rgba(250, 204, 21, 0.15) 45%, transparent 70%);
    filter: blur(80px);
    z-index: 1;
  }

  .glow-bottom {
    position: absolute;
    bottom: 18%;
    left: 50%;
    transform: translateX(-50%);
    width: 850px;
    height: 500px;
    background: radial-gradient(circle, rgba(244, 63, 94, 0.22) 0%, rgba(16, 185, 129, 0.2) 45%, transparent 70%);
    filter: blur(80px);
    z-index: 1;
  }

  /* 1:1 Instagram Profile Grid Safe Container (1080 x 1080) */
  .safe-container {
    width: 880px;
    height: 1040px;
    position: relative;
    z-index: 10;
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

  /* Giant Attention Hook Title */
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

  .code-content {
    font-family: 'JetBrains Mono', monospace;
    font-size: 24px;
    font-weight: 700;
    line-height: 1.4;
    color: #f1f5f9;
    white-space: pre-wrap;
  }

  .kw { color: #38bdf8; font-weight: 800; }
  .fn { color: #facc15; font-weight: 800; }
  .str { color: #4ade80; }
  .op { color: #f43f5e; }
  .num { color: #fb923c; }

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
  .bottom-text {
    font-size: 28px;
    font-weight: 800;
    color: #facc15;
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .brand-text {
    font-size: 26px;
    font-weight: 800;
    color: #00f0ff;
    letter-spacing: 1px;
  }
</style>
</head>
<body>
  <div class="grid-bg"></div>
  <div class="glow-top"></div>
  <div class="glow-bottom"></div>

  <!-- Central 1:1 Profile Safe Zone -->
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
        <div class="code-content"><span class="kw">SELECT</span> user_id, login_date,
       <span class="fn">DATE</span>(login_date, <span class="str">'-'</span> || (
         <span class="fn">ROW_NUMBER</span>() <span class="kw">OVER</span>(
           <span class="kw">PARTITION BY</span> user_id <span class="kw">ORDER BY</span> login_date
         )
       ) || <span class="str">' days'</span>) <span class="kw">AS</span> streak_grp
<span class="kw">FROM</span> user_logins;</div>
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
        <div class="code-content"><span class="kw">SELECT</span> user_id, login_date,
       <span class="fn">DENSE_RANK</span>() <span class="kw">OVER</span>(
         <span class="kw">PARTITION BY</span> user_id <span class="kw">ORDER BY</span> login_date
       ) <span class="kw">AS</span> streak_grp
<span class="kw">FROM</span> user_logins;</div>
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

async def generate_cover():
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        # 1. Render Full 1080x1920 Reel Cover
        page = await browser.new_page(viewport={"width": 1080, "height": 1920})
        await page.set_content(HTML_COVER)
        await page.wait_for_timeout(500)
        
        full_png = OUTPUT_DIR / "SQL-10-R1_Cover_HighCTR.png"
        full_jpg = OUTPUT_DIR / "SQL-10-R1_Cover.jpg"
        await page.screenshot(path=str(full_png))
        await page.screenshot(path=str(full_jpg), quality=95)
        print(f"[OK] Full 9:16 High-CTR Cover saved: {full_jpg}", flush=True)

        # 2. Render 1:1 Instagram Grid Preview (Crop middle 1080x1080)
        grid_jpg = OUTPUT_DIR / "SQL-10-R1_Grid_1x1_Preview.jpg"
        await page.screenshot(
            path=str(grid_jpg),
            clip={"x": 0, "y": (1920 - 1080) / 2, "width": 1080, "height": 1080},
            quality=95
        )
        print(f"[OK] 1:1 Instagram Grid Safe-Zone Preview saved: {grid_jpg}", flush=True)
        await browser.close()

if __name__ == "__main__":
    asyncio.run(generate_cover())
