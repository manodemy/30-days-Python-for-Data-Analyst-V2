"""
Automated 7-Layer Generator for SQL-16-R1 (The Double-Swipe Fraud Trap)
Topic: Zomato & Swiggy Duplicate Payment Deductions (₹850 debited twice in 4 seconds)

Generates 100% native vector-sharp 1080x1920 PNG layers using Playwright HTML/CSS rendering:
- 0_background.png: Dark cyber fintech stadium with cyan/crimson atmospheric ambient & grid
- 1_title.png: Giant 3D Gold Metallic 'DOUBLE CHARGE?' + LIVE ZOMATO & SWIGGY badge
- 2_tape.png: Angled yellow hazard tape '⚠️ ₹850 DEBITED TWICE IN 4 SECONDS!'
- 3_card_left.png: Zomato Instant Refund card (Cyan electric glowing frame, rapid swipe 4s apart detected)
- 4_card_right.png: Self-Join Catastrophe audit card (Crimson warning frame, 100% orders duplicated)
- 5_vs_lightning.png: Reusable 3D chrome VS badge + electric lightning clash
- 6_bottom.png: Sleek dark glassmorphism question card + interactive CTA pill
"""

import sys
import asyncio
from pathlib import Path
from PIL import Image
from playwright.async_api import async_playwright

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8')

PROJECT_ROOT = Path(__file__).resolve().parent.parent
LAYERS_DIR = PROJECT_ROOT / "marketing" / "assets" / "sql16_layers"
LAYERS_DIR.mkdir(parents=True, exist_ok=True)
OUTPUT_DIR = PROJECT_ROOT / "marketing" / "output" / "video"
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

SHARED_CSS = """
  @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,900;1,900&family=Plus+Jakarta+Sans:wght@800;900&family=Outfit:wght@700;800;900&family=JetBrains+Mono:wght@700;800&family=Space+Grotesk:wght@700;900&display=swap');

  :root {
    --cyan: #00f0ff;
    --crimson: #ff0055;
    --gold: #facc15;
    --gold-light: #fff066;
    --bg-dark: #030611;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    width: 1080px;
    height: 1920px;
    background: transparent;
    color: #fff;
    font-family: 'Outfit', sans-serif;
    overflow: hidden;
    position: relative;
  }
"""

async def render_layer(html_body: str, output_path: Path, omit_bg: bool = True):
    full_html = f"""<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>{SHARED_CSS}</style>
</head>
<body>
{html_body}
</body>
</html>"""
    async with async_playwright() as p:
        browser = await p.chromium.launch()
        page = await browser.new_page(viewport={"width": 1080, "height": 1920}, device_scale_factor=1)
        await page.set_content(full_html)
        await page.wait_for_timeout(400)
        await page.screenshot(path=str(output_path), omit_background=omit_bg, type="png")
        await browser.close()
    print(f"   ✓ Rendered: {output_path.name}", flush=True)

async def build_all_sql16_layers():
    print("🎨 Generating 7 Clean Native Layers for SQL-16-R1...", flush=True)

    # 1. LAYER 0: BACKGROUND
    html_bg = """
    <div style="position:absolute; inset:0; background:radial-gradient(circle at 50% 32%, #081228 0%, #030611 65%, #010206 100%);">
      <!-- Ambient stadium glow left (cyan electric) -->
      <div style="position:absolute; top:32%; left:-10%; width:650px; height:850px; background:radial-gradient(circle, rgba(0,240,255,0.20) 0%, transparent 70%); filter:blur(85px);"></div>
      <!-- Ambient stadium glow right (crimson alert) -->
      <div style="position:absolute; top:32%; right:-10%; width:650px; height:850px; background:radial-gradient(circle, rgba(255,0,85,0.20) 0%, transparent 70%); filter:blur(85px);"></div>
      <!-- Top Title Glow (warm gold) -->
      <div style="position:absolute; top:8%; left:50%; transform:translateX(-50%); width:950px; height:450px; background:radial-gradient(circle, rgba(250,204,21,0.18) 0%, transparent 70%); filter:blur(85px);"></div>
      <!-- Cyber subtle grid -->
      <div style="position:absolute; inset:0; background-image:linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px); background-size:60px 60px;"></div>
    </div>
    """
    await render_layer(html_bg, LAYERS_DIR / "0_background.png", omit_bg=False)

    # 2. LAYER 1: 3D METALLIC TITLE + LIVE BADGE
    html_title = """
    <div style="position:absolute; top:80px; left:50%; transform:translateX(-50%); width:980px; text-align:center; display:flex; flex-direction:column; align-items:center;">
      <h1 style="font-family:'Montserrat', sans-serif; font-size:88px; font-weight:900; line-height:0.92; letter-spacing:-2px; text-transform:uppercase; color:#fff;
                 text-shadow: 0 4px 0 #94a3b8, 0 8px 0 #475569, 0 12px 0 #1e293b, 0 18px 35px rgba(0,0,0,0.95), 0 0 50px rgba(250,204,21,0.45);">
        DOUBLE
      </h1>
      <div style="display:flex; align-items:center; justify-content:center; gap:20px; width:100%; margin-top:8px;">
        <h1 style="font-family:'Montserrat', sans-serif; font-size:92px; font-weight:900; line-height:0.92; letter-spacing:-2px; text-transform:uppercase;
                   background:linear-gradient(180deg, #ffffff 0%, #fff066 35%, #facc15 70%, #d97706 100%);
                   -webkit-background-clip:text; -webkit-text-fill-color:transparent;
                   filter:drop-shadow(0 4px 0 #b45309) drop-shadow(0 8px 0 #78350f) drop-shadow(0 16px 30px rgba(250,204,21,0.65));">
          CHARGE?
        </h1>
        <div style="background:rgba(3,6,17,0.95); border:2.5px solid #00f0ff; border-radius:30px; padding:10px 24px; display:flex; align-items:center; gap:12px; box-shadow:0 0 30px rgba(0,240,255,0.55), inset 0 0 15px rgba(0,240,255,0.2);">
          <div style="width:14px; height:14px; border-radius:50%; background:#ff0055; box-shadow:0 0 14px #ff0055;"></div>
          <span style="font-family:'Plus Jakarta Sans', sans-serif; font-size:22px; font-weight:900; letter-spacing:1.5px; color:#fff; text-shadow:0 0 10px rgba(255,255,255,0.8);">
            💳 ZOMATO & SWIGGY
          </span>
        </div>
      </div>
    </div>
    """
    await render_layer(html_title, LAYERS_DIR / "1_title.png")

    # 3. LAYER 2: ANGLE HAZARD CAUTION TAPE
    html_tape = """
    <div style="position:absolute; top:490px; left:50%; transform:translateX(-50%) rotate(-1.5deg); width:1020px;
                background:linear-gradient(90deg, #facc15 0%, #ffe840 50%, #facc15 100%);
                padding:15px 32px; border-radius:10px; display:flex; align-items:center; justify-content:center; gap:16px;
                box-shadow: 0 14px 40px rgba(0,0,0,0.95), 0 0 40px rgba(250,204,21,0.5); border:3.5px solid #fff;">
      <span style="font-size:30px;">⚠️</span>
      <span style="font-family:'Plus Jakarta Sans', sans-serif; font-size:25px; font-weight:900; letter-spacing:2px; color:#030611; text-transform:uppercase;">
        ₹850 DEBITED TWICE IN 4 SECONDS!
      </span>
      <span style="font-size:30px;">⚠️</span>
    </div>
    """
    await render_layer(html_tape, LAYERS_DIR / "2_tape.png")

    # 4. LAYER 3: CARD LEFT (Zomato Instant Refund - Rapid Swipe Flagged)
    # 4. LAYER 3: CARD LEFT (Zomato Instant Refund - Rapid Swipe Flagged)
    hero_left_path = (PROJECT_ROOT / "marketing" / "assets" / "sql15_gpay_hero.jpg").as_uri()
    html_card_left = f"""
    <div style="position:absolute; top:575px; left:60px; width:465px; height:765px;
                border-radius:28px; border:4px solid #00f0ff; background:linear-gradient(180deg, rgba(8,25,55,0.96) 0%, rgba(3,10,25,0.98) 100%);
                box-shadow: 0 25px 60px rgba(0,0,0,0.98), 0 0 55px rgba(0,240,255,0.45), inset 0 0 35px rgba(0,240,255,0.2);
                display:flex; flex-direction:column; align-items:center; justify-content:space-between; padding:20px 20px; overflow:hidden; position:relative;">
      
      <!-- Card Top Badge -->
      <div style="display:flex; align-items:center; justify-content:space-between; width:100%; border-bottom:1.5px solid rgba(0,240,255,0.25); padding-bottom:12px; z-index:2;">
        <div style="display:flex; align-items:center; gap:10px;">
          <div style="width:40px; height:40px; border-radius:12px; background:linear-gradient(135deg, #00f0ff, #0284c7); display:flex; align-items:center; justify-content:center; font-size:22px; box-shadow:0 0 18px rgba(0,240,255,0.6);">
            💳
          </div>
          <div>
            <div style="font-family:'Montserrat', sans-serif; font-size:19px; font-weight:900; color:#fff; letter-spacing:0.5px;">ZOMATO APP</div>
            <div style="font-size:12px; font-weight:700; color:#38bdf8;">CARD **** 4291</div>
          </div>
        </div>
        <div style="background:rgba(34,197,94,0.15); border:1.5px solid #22c55e; border-radius:12px; padding:4px 10px; font-size:12px; font-weight:800; color:#22c55e; letter-spacing:1px;">
          REFUNDED
        </div>
      </div>

      <!-- Photorealistic Hero Image Container -->
      <div style="width:100%; height:550px; border-radius:20px; overflow:hidden; position:relative; box-shadow:0 15px 35px rgba(0,0,0,0.8); border:2px solid rgba(0,240,255,0.3);">
        <img src="{hero_left_path}" style="width:100%; height:100%; object-fit:cover; object-position:center top;" />
        <div style="position:absolute; inset:0; background:linear-gradient(180deg, transparent 65%, rgba(3,10,25,0.95) 100%);"></div>
      </div>

      <!-- Bottom Card Pill -->
      <div style="width:100%; background:rgba(3,6,17,0.95); border:2.5px solid #22c55e; border-radius:16px; padding:12px 14px; display:flex; align-items:center; justify-content:center; box-shadow:0 0 25px rgba(34,197,94,0.4); z-index:2; margin-top:-22px;">
        <span style="font-family:'JetBrains Mono', monospace; font-size:20px; font-weight:900; color:#22c55e; letter-spacing:1px;">
          RAPID SWIPE (4s APART) [✓]
        </span>
      </div>
    </div>
    """
    await render_layer(html_card_left, LAYERS_DIR / "3_card_left.png")

    # 5. LAYER 4: CARD RIGHT (Self-Join Trap Overkill)
    hero_right_path = (PROJECT_ROOT / "marketing" / "assets" / "sql15_bank_hero.jpg").as_uri()
    html_card_right = f"""
    <div style="position:absolute; top:575px; right:60px; width:465px; height:765px;
                border-radius:28px; border:4px solid #ff0055; background:linear-gradient(180deg, rgba(55,8,25,0.96) 0%, rgba(25,3,10,0.98) 100%);
                box-shadow: 0 25px 60px rgba(0,0,0,0.98), 0 0 55px rgba(255,0,85,0.45), inset 0 0 35px rgba(255,0,85,0.2);
                display:flex; flex-direction:column; align-items:center; justify-content:space-between; padding:20px 20px; overflow:hidden; position:relative;">
      
      <!-- Card Top Badge -->
      <div style="display:flex; align-items:center; justify-content:space-between; width:100%; border-bottom:1.5px solid rgba(255,0,85,0.25); padding-bottom:12px; z-index:2;">
        <div style="display:flex; align-items:center; gap:10px;">
          <div style="width:40px; height:40px; border-radius:12px; background:linear-gradient(135deg, #ff0055, #dc2626); display:flex; align-items:center; justify-content:center; font-size:22px; box-shadow:0 0 18px rgba(255,0,85,0.6);">
            🚨
          </div>
          <div>
            <div style="font-family:'Montserrat', sans-serif; font-size:19px; font-weight:900; color:#fff; letter-spacing:0.5px;">SELF-JOIN TRAP</div>
            <div style="font-size:12px; font-weight:700; color:#f87171;">ENGINEERING BUG</div>
          </div>
        </div>
        <div style="background:rgba(255,0,85,0.15); border:1.5px solid #ff0055; border-radius:12px; padding:4px 10px; font-size:12px; font-weight:800; color:#ff0055; letter-spacing:1px;">
          ERROR
        </div>
      </div>

      <!-- Photorealistic Hero Image Container -->
      <div style="width:100%; height:550px; border-radius:20px; overflow:hidden; position:relative; box-shadow:0 15px 35px rgba(0,0,0,0.8); border:2px solid rgba(255,0,85,0.3);">
        <img src="{hero_right_path}" style="width:100%; height:100%; object-fit:cover; object-position:center top;" />
        <div style="position:absolute; inset:0; background:linear-gradient(180deg, transparent 65%, rgba(25,3,10,0.95) 100%);"></div>
      </div>

      <!-- Bottom Card Pill -->
      <div style="width:100%; background:rgba(3,6,17,0.95); border:2.5px solid #ff0055; border-radius:16px; padding:12px 14px; display:flex; align-items:center; justify-content:center; box-shadow:0 0 25px rgba(255,0,85,0.4); z-index:2; margin-top:-22px;">
        <span style="font-family:'JetBrains Mono', monospace; font-size:20px; font-weight:900; color:#ff0055; letter-spacing:1px;">
          SELF-MATCH TRAP [✗]
        </span>
      </div>
    </div>
    """
    await render_layer(html_card_right, LAYERS_DIR / "4_card_right.png")

    # 6. LAYER 5: 3D CHROME VS BADGE + LIGHTNING
    # Copy from sql15_layers if exists, or render native
    vs_source = PROJECT_ROOT / "marketing" / "assets" / "sql15_layers" / "5_vs_lightning.png"
    if vs_source.exists():
        im_vs = Image.open(vs_source)
        im_vs.save(LAYERS_DIR / "5_vs_lightning.png")
        print("   ✓ Copied 5_vs_lightning.png from sql15_layers", flush=True)

    # 7. LAYER 6: BOTTOM QUESTION CARD + INTERACTIVE CTA
    html_bottom = """
    <div style="position:absolute; top:1385px; left:50%; transform:translateX(-50%); width:960px; display:flex; flex-direction:column; align-items:center; gap:18px;">
      
      <!-- Question Terminal Card -->
      <div style="width:100%; background:rgba(7,13,31,0.96); border:2.5px solid #1e293b; border-radius:24px; padding:26px 32px; box-shadow:0 25px 60px rgba(0,0,0,0.98); display:flex; flex-direction:column; align-items:center; gap:16px;">
        <div style="font-family:'Plus Jakarta Sans', sans-serif; font-size:23px; font-weight:900; color:#f8fafc; text-transform:uppercase; letter-spacing:1px; text-align:center;">
          WHICH QUERY FLAGS ACCIDENTAL SWIPES SAFELY?
        </div>
        <div style="display:flex; align-items:center; justify-content:center; gap:16px; width:100%;">
          <div style="flex:1; background:rgba(34,197,94,0.1); border:2px solid #22c55e; border-radius:14px; padding:12px 16px; text-align:center; font-family:'JetBrains Mono', monospace; font-size:19px; font-weight:800; color:#22c55e;">
            [A] LAG TIME-DELTA ✅
          </div>
          <span style="font-family:'Montserrat', sans-serif; font-size:22px; font-weight:900; color:#64748b;">VS</span>
          <div style="flex:1; background:rgba(255,0,85,0.1); border:2px solid #ff0055; border-radius:14px; padding:12px 16px; text-align:center; font-family:'JetBrains Mono', monospace; font-size:19px; font-weight:800; color:#ff0055;">
            [B] TIME-WINDOW JOIN ❌
          </div>
        </div>
      </div>

      <!-- CTA Pill -->
      <div style="background:rgba(3,6,17,0.96); border:2.5px solid #00f0ff; border-radius:30px; padding:14px 42px; display:flex; align-items:center; gap:12px; box-shadow:0 0 35px rgba(0,240,255,0.45), inset 0 0 15px rgba(0,240,255,0.2);">
        <span style="font-family:'Montserrat', sans-serif; font-size:22px; font-weight:900; color:#00f0ff; letter-spacing:2px; text-transform:uppercase;">
          VOTE A OR B: manodemy.com/q23
        </span>
      </div>
    </div>
    """
    await render_layer(html_bottom, LAYERS_DIR / "6_bottom.png")

    # 8. GENERATE COMPOSITE MASTER COVER (SQL-16-R1_Opening_Poster_1080x1920.jpg)
    print("🖼️ Stacking all 7 layers to export Master Cover...", flush=True)
    bg = Image.open(LAYERS_DIR / "0_background.png").convert("RGBA")
    title = Image.open(LAYERS_DIR / "1_title.png").convert("RGBA")
    tape = Image.open(LAYERS_DIR / "2_tape.png").convert("RGBA")
    c_l = Image.open(LAYERS_DIR / "3_card_left.png").convert("RGBA")
    c_r = Image.open(LAYERS_DIR / "4_card_right.png").convert("RGBA")
    vs = Image.open(LAYERS_DIR / "5_vs_lightning.png").convert("RGBA")
    bot = Image.open(LAYERS_DIR / "6_bottom.png").convert("RGBA")

    comp = bg.copy()
    comp = Image.alpha_composite(comp, c_l)
    comp = Image.alpha_composite(comp, c_r)
    comp = Image.alpha_composite(comp, vs)
    comp = Image.alpha_composite(comp, tape)
    comp = Image.alpha_composite(comp, title)
    comp = Image.alpha_composite(comp, bot)

    cover_jpg = OUTPUT_DIR / "SQL-16-R1_Opening_Poster_1080x1920.jpg"
    comp.convert("RGB").save(cover_jpg, quality=95)
    print(f"   ✓ Master Cover saved: {cover_jpg}", flush=True)

    # 1:1 Safe Zone Crop (1080x1080 center: y=420 to y=1500)
    crop_1x1 = comp.crop((0, 420, 1080, 1500)).convert("RGB")
    crop_1x1_jpg = OUTPUT_DIR / "SQL-16-R1_Opening_Poster_1x1.jpg"
    crop_1x1.save(crop_1x1_jpg, quality=95)
    print(f"   ✓ 1:1 Safe Zone Crop saved: {crop_1x1_jpg}", flush=True)

    # Standard reel cover files
    cover_std_jpg = OUTPUT_DIR / "SQL-16-R1_Cover.jpg"
    cover_std_png = OUTPUT_DIR / "SQL-16-R1_Cover.png"
    comp.convert("RGB").save(cover_std_jpg, quality=95)
    comp.save(cover_std_png)
    print(f"   ✓ Standard Covers saved: {cover_std_jpg} and {cover_std_png}", flush=True)

if __name__ == "__main__":
    asyncio.run(build_all_sql16_layers())
