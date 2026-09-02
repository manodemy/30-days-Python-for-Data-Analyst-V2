"""
Renders a stunning dark cyberpunk 3D glassmorphic streak calendar widget
representing the Gaps & Islands problem statement.
"""
import asyncio
from pathlib import Path
from playwright.async_api import async_playwright

PROJECT_ROOT = Path(__file__).resolve().parent.parent
OUTPUT_IMG = PROJECT_ROOT / "marketing" / "assets" / "images" / "streak_calendar_dark.png"

CALENDAR_HTML = """<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@700;800;900&family=Outfit:wght@600;700;800;900&family=JetBrains+Mono:wght@700;800&display=swap');

  * { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    width: 860px;
    height: 420px;
    background: transparent;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Outfit', sans-serif;
    overflow: hidden;
  }

  /* 3D Glassmorphic Calendar Card */
  .calendar-card {
    width: 780px;
    background: linear-gradient(135deg, rgba(15, 23, 42, 0.95) 0%, rgba(7, 11, 22, 0.98) 100%);
    border: 2px solid rgba(0, 240, 255, 0.45);
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.9), 0 0 40px rgba(0, 240, 255, 0.2), inset 0 1px 0 rgba(255, 255, 255, 0.2);
    border-radius: 28px;
    padding: 24px 36px 28px 36px;
    position: relative;
    backdrop-filter: blur(24px);
  }

  /* Month Header */
  .cal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 18px;
  }

  .nav-arrow {
    width: 38px;
    height: 38px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.06);
    border: 1px solid rgba(255, 255, 255, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    color: #94a3b8;
    font-size: 20px;
    font-weight: 800;
  }

  .month-title {
    font-family: 'Plus Jakarta Sans', sans-serif;
    font-size: 28px;
    font-weight: 900;
    color: #ffffff;
    letter-spacing: 0.5px;
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .month-title span {
    color: #00f0ff;
    text-shadow: 0 0 15px rgba(0, 240, 255, 0.5);
  }

  /* Days of Week Row */
  .weekdays {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    text-align: center;
    margin-bottom: 12px;
  }
  .weekday {
    font-size: 17px;
    font-weight: 800;
    color: #64748b;
    letter-spacing: 1px;
    text-transform: uppercase;
  }

  /* Calendar Dates Grid */
  .days-grid {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  .week-row {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    align-items: center;
    text-align: center;
    position: relative;
  }

  .day-cell {
    height: 48px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    font-weight: 800;
    color: #94a3b8;
    position: relative;
    z-index: 2;
  }

  .day-cell.muted {
    color: #334155;
  }

  .day-cell.empty-dot {
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .day-cell.empty-dot::after {
    content: '';
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #334155;
  }

  /* Streak Highlight Pill 1: Days 1 - 5 */
  .streak-pill-1 {
    position: absolute;
    left: calc(100% / 7 * 1 + 6px);
    right: calc(100% / 7 * 1 + 6px);
    top: 2px;
    bottom: 2px;
    background: linear-gradient(90deg, rgba(0, 240, 255, 0.25) 0%, rgba(0, 240, 255, 0.35) 100%);
    border: 1.5px solid rgba(0, 240, 255, 0.7);
    border-radius: 999px;
    box-shadow: 0 0 25px rgba(0, 240, 255, 0.35), inset 0 0 15px rgba(0, 240, 255, 0.2);
    z-index: 1;
  }

  /* Streak Highlight Pill 2: Days 7 - 13 */
  .streak-pill-2 {
    position: absolute;
    left: 4px;
    right: 4px;
    top: 2px;
    bottom: 2px;
    background: linear-gradient(90deg, rgba(0, 240, 255, 0.3) 0%, rgba(250, 204, 21, 0.35) 85%, rgba(239, 68, 68, 0.45) 100%);
    border: 1.5px solid rgba(250, 204, 21, 0.8);
    border-radius: 999px;
    box-shadow: 0 0 30px rgba(250, 204, 21, 0.4), inset 0 0 15px rgba(250, 204, 21, 0.2);
    z-index: 1;
  }

  .active-day {
    color: #ffffff !important;
    font-weight: 900 !important;
    text-shadow: 0 0 10px rgba(0, 240, 255, 0.8);
  }

  /* Fire Flame Streak Icon on Day 13 */
  .fire-container {
    position: absolute;
    right: -10px;
    top: -16px;
    z-index: 10;
    display: flex;
    align-items: center;
    justify-content: center;
    filter: drop-shadow(0 0 16px rgba(239, 68, 68, 0.9));
  }
  .fire-badge {
    background: linear-gradient(135deg, #ef4444 0%, #f97316 50%, #facc15 100%);
    width: 48px;
    height: 48px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 26px;
    box-shadow: 0 0 20px rgba(239, 68, 68, 0.8);
    border: 2px solid #ffffff;
    animation: pulse 2s infinite;
  }

  /* Gap Marker Callout */
  .gap-callout {
    position: absolute;
    right: 18px;
    top: 14px;
    background: rgba(239, 68, 68, 0.2);
    border: 1px solid #ef4444;
    color: #fca5a5;
    padding: 4px 12px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 800;
    letter-spacing: 0.5px;
    display: flex;
    align-items: center;
    gap: 6px;
  }
  .gap-dot { width: 8px; height: 8px; border-radius: 50%; background: #ef4444; box-shadow: 0 0 8px #ef4444; }
</style>
</head>
<body>

  <div class="calendar-card">
    <div class="gap-callout">
      <div class="gap-dot"></div>
      <span>GAP ON DAY 6</span>
    </div>

    <!-- Header -->
    <div class="cal-header">
      <div class="nav-arrow">‹</div>
      <div class="month-title">August <span>2025</span> · Streak Activity</div>
      <div class="nav-arrow">›</div>
    </div>

    <!-- Weekdays -->
    <div class="weekdays">
      <div class="weekday">Sun</div>
      <div class="weekday">Mon</div>
      <div class="weekday">Tue</div>
      <div class="weekday">Wed</div>
      <div class="weekday">Thu</div>
      <div class="weekday">Fri</div>
      <div class="weekday">Sat</div>
    </div>

    <!-- Dates Grid -->
    <div class="days-grid">
      <!-- Row 1: Streak 1 to 5, Gap on 6 -->
      <div class="week-row">
        <div class="streak-pill-1"></div>
        <div class="day-cell empty-dot"></div>
        <div class="day-cell active-day">1</div>
        <div class="day-cell active-day">2</div>
        <div class="day-cell active-day">3</div>
        <div class="day-cell active-day">4</div>
        <div class="day-cell active-day">5</div>
        <div class="day-cell" style="color:#ef4444; font-weight:900;">6</div>
      </div>

      <!-- Row 2: Streak 7 to 13 with Flame -->
      <div class="week-row">
        <div class="streak-pill-2"></div>
        <div class="day-cell active-day">7</div>
        <div class="day-cell active-day">8</div>
        <div class="day-cell active-day">9</div>
        <div class="day-cell active-day">10</div>
        <div class="day-cell active-day">11</div>
        <div class="day-cell active-day">12</div>
        <div class="day-cell active-day" style="position:relative;">
          13
          <div class="fire-container">
            <div class="fire-badge">🔥</div>
          </div>
        </div>
      </div>

      <!-- Row 3: Inactive Days -->
      <div class="week-row">
        <div class="day-cell muted">14</div>
        <div class="day-cell muted">15</div>
        <div class="day-cell muted">16</div>
        <div class="day-cell muted">17</div>
        <div class="day-cell muted">18</div>
        <div class="day-cell muted">19</div>
        <div class="day-cell muted">20</div>
      </div>
    </div>
  </div>

</body>
</html>
"""

async def render():
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        page = await browser.new_page(viewport={"width": 860, "height": 420}, device_scale_factor=2.0)
        await page.set_content(CALENDAR_HTML)
        await page.wait_for_timeout(300)
        OUTPUT_IMG.parent.mkdir(parents=True, exist_ok=True)
        await page.screenshot(path=str(OUTPUT_IMG), type="png", omit_background=True)
        print(f"Rendered dark calendar widget: {OUTPUT_IMG}")
        await browser.close()

if __name__ == "__main__":
    asyncio.run(render())
