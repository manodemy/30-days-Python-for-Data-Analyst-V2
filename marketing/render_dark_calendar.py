"""
Renders a large, prominent, authentic full-month dark cyberpunk streak calendar widget
with maximum readability and visual impact.
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
    width: 880px;
    height: 520px;
    background: transparent;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Outfit', sans-serif;
    overflow: hidden;
  }

  /* 3D Glassmorphic Large Calendar Card */
  .calendar-card {
    width: 870px;
    background: linear-gradient(145deg, rgba(16, 24, 44, 0.98) 0%, rgba(8, 12, 24, 0.99) 100%);
    border: 2px solid rgba(0, 240, 255, 0.45);
    box-shadow: 0 25px 65px rgba(0, 0, 0, 0.95), 0 0 50px rgba(0, 240, 255, 0.22), inset 0 1px 0 rgba(255, 255, 255, 0.3);
    border-radius: 28px;
    padding: 24px 36px 26px 36px;
    position: relative;
    backdrop-filter: blur(24px);
  }

  /* Month Header: Clean, Authentic, Centered */
  .cal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    padding: 0 12px;
  }

  .nav-arrow {
    width: 44px;
    height: 44px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.06);
    border: 1.5px solid rgba(255, 255, 255, 0.12);
    display: flex;
    align-items: center;
    justify-content: center;
    color: #cbd5e1;
    font-size: 24px;
    font-weight: 700;
  }

  .month-title {
    font-family: 'Plus Jakarta Sans', sans-serif;
    font-size: 34px;
    font-weight: 900;
    color: #ffffff;
    letter-spacing: 0.5px;
  }
  .month-title span {
    color: #00f0ff;
    text-shadow: 0 0 18px rgba(0, 240, 255, 0.7);
  }

  /* Weekdays Header */
  .weekdays {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    text-align: center;
    margin-bottom: 14px;
    border-bottom: 1.5px solid rgba(255, 255, 255, 0.09);
    padding-bottom: 10px;
  }
  .weekday {
    font-size: 20px;
    font-weight: 800;
    color: #64748b;
    letter-spacing: 1.2px;
    text-transform: uppercase;
  }

  /* Full Calendar 5-Week Grid */
  .days-grid {
    display: flex;
    flex-direction: column;
    gap: 8px;
  }

  .week-row {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    align-items: center;
    text-align: center;
    position: relative;
    height: 50px;
  }

  .day-cell {
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 25px;
    font-weight: 800;
    color: #94a3b8;
    position: relative;
    z-index: 2;
  }

  .day-cell.muted {
    color: #334155;
    font-weight: 600;
  }

  .day-cell.empty-dot::after {
    content: '';
    width: 7px;
    height: 7px;
    border-radius: 50%;
    background: #334155;
  }

  /* Streak Capsule 1: Days 1 to 5 */
  .streak-pill-1 {
    position: absolute;
    left: calc(100% / 7 * 1 + 6px);
    right: calc(100% / 7 * 1 + 6px);
    top: 4px;
    bottom: 4px;
    background: linear-gradient(90deg, rgba(0, 240, 255, 0.3) 0%, rgba(0, 240, 255, 0.45) 100%);
    border: 2px solid rgba(0, 240, 255, 0.9);
    border-radius: 999px;
    box-shadow: 0 0 28px rgba(0, 240, 255, 0.45), inset 0 0 14px rgba(0, 240, 255, 0.3);
    z-index: 1;
  }

  /* Streak Capsule 2: Days 7 to 13 with Flame */
  .streak-pill-2 {
    position: absolute;
    left: 6px;
    right: 6px;
    top: 4px;
    bottom: 4px;
    background: linear-gradient(90deg, rgba(0, 240, 255, 0.32) 0%, rgba(250, 204, 21, 0.42) 80%, rgba(239, 68, 68, 0.55) 100%);
    border: 2px solid rgba(250, 204, 21, 0.9);
    border-radius: 999px;
    box-shadow: 0 0 35px rgba(250, 204, 21, 0.5), inset 0 0 14px rgba(250, 204, 21, 0.3);
    z-index: 1;
  }

  .active-day {
    color: #ffffff !important;
    font-weight: 900 !important;
    text-shadow: 0 0 12px rgba(0, 240, 255, 0.95);
  }

  /* Flame Badge on Day 13 */
  .fire-container {
    position: absolute;
    right: -14px;
    top: -18px;
    z-index: 10;
    filter: drop-shadow(0 0 20px rgba(239, 68, 68, 0.95));
  }
  .fire-badge {
    background: linear-gradient(135deg, #ef4444 0%, #f97316 50%, #facc15 100%);
    width: 52px;
    height: 52px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 28px;
    border: 2.5px solid #ffffff;
    box-shadow: 0 0 25px rgba(239, 68, 68, 0.95);
  }
</style>
</head>
<body>

  <div class="calendar-card">
    <!-- Clean Centered Month Header -->
    <div class="cal-header">
      <div class="nav-arrow">‹</div>
      <div class="month-title">August <span>2025</span></div>
      <div class="nav-arrow">›</div>
    </div>

    <!-- Weekdays Header -->
    <div class="weekdays">
      <div class="weekday">Sun</div>
      <div class="weekday">Mon</div>
      <div class="weekday">Tue</div>
      <div class="weekday">Wed</div>
      <div class="weekday">Thu</div>
      <div class="weekday">Fri</div>
      <div class="weekday">Sat</div>
    </div>

    <!-- Full Realistic Monthly Dates Grid -->
    <div class="days-grid">
      <!-- Week 1: Days 1 - 6 (Streak 1-5, Day 6 regular) -->
      <div class="week-row">
        <div class="streak-pill-1"></div>
        <div class="day-cell empty-dot"></div>
        <div class="day-cell active-day">1</div>
        <div class="day-cell active-day">2</div>
        <div class="day-cell active-day">3</div>
        <div class="day-cell active-day">4</div>
        <div class="day-cell active-day">5</div>
        <div class="day-cell">6</div>
      </div>

      <!-- Week 2: Days 7 - 13 (Streak 7-13 with Flame on 13) -->
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

      <!-- Week 3: Days 14 - 20 -->
      <div class="week-row">
        <div class="day-cell muted">14</div>
        <div class="day-cell muted">15</div>
        <div class="day-cell muted">16</div>
        <div class="day-cell muted">17</div>
        <div class="day-cell muted">18</div>
        <div class="day-cell muted">19</div>
        <div class="day-cell muted">20</div>
      </div>

      <!-- Week 4: Days 21 - 27 -->
      <div class="week-row">
        <div class="day-cell muted">21</div>
        <div class="day-cell muted">22</div>
        <div class="day-cell muted">23</div>
        <div class="day-cell muted">24</div>
        <div class="day-cell muted">25</div>
        <div class="day-cell muted">26</div>
        <div class="day-cell muted">27</div>
      </div>

      <!-- Week 5: Days 28 - 31 -->
      <div class="week-row">
        <div class="day-cell muted">28</div>
        <div class="day-cell muted">29</div>
        <div class="day-cell muted">30</div>
        <div class="day-cell muted">31</div>
        <div class="day-cell empty-dot"></div>
        <div class="day-cell empty-dot"></div>
        <div class="day-cell empty-dot"></div>
      </div>
    </div>
  </div>

</body>
</html>
"""

async def render():
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        page = await browser.new_page(viewport={"width": 880, "height": 520}, device_scale_factor=2.0)
        await page.set_content(CALENDAR_HTML)
        await page.wait_for_timeout(300)
        OUTPUT_IMG.parent.mkdir(parents=True, exist_ok=True)
        await page.screenshot(path=str(OUTPUT_IMG), type="png", omit_background=True)
        print(f"Rendered larger realistic calendar widget: {OUTPUT_IMG}")
        await browser.close()

if __name__ == "__main__":
    asyncio.run(render())
