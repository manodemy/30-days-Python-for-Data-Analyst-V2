import numpy as np
from PIL import Image, ImageDraw, ImageFont, ImageFilter
from pathlib import Path
import math

# ─────────────────────────────────────────────
# BRAND DESIGN TOKENS
# ─────────────────────────────────────────────
NAVY_DEEP   = (8,  14,  34)       # #080E22  — base background gradient start
NAVY_MID    = (14, 25,  60)       # #0E193C  — mid
NAVY_LIGHT  = (22, 38,  88)       # #162658  — gradient end
CYAN_NEON   = (0, 229, 255)       # #00E5FF
EMERALD     = (0, 200, 122)       # #00C87A
MINT_BRIGHT = (0, 255, 178)       # #00FFB2
SLATE_TAG   = (148, 163, 184)     # #94A3B8
WHITE_PURE  = (255, 255, 255)

S  = 3  # superscale — render at 3× then lanczos down

# Final output: 2560 × 1440  YouTube banner
W_FINAL = 2560
H_FINAL = 1440

W = W_FINAL * S
H = H_FINAL * S

# YouTube Safe Zone (centre 1546×423 px at actual size)
SZ_W = 1546 * S
SZ_H  = 423  * S
SZ_X  = (W - SZ_W) // 2
SZ_Y  = (H - SZ_H) // 2

def lerp_color(c1, c2, t):
    return tuple(int(c1[i] * (1-t) + c2[i] * t) for i in range(3))

# ─────────────────────────────────────────────
# BACKGROUND: Deep radial-ish Navy gradient
# ─────────────────────────────────────────────
def make_background(W, H):
    arr = np.zeros((H, W, 3), dtype=np.uint8)
    cx, cy = W // 2, H // 2
    max_d  = math.sqrt(cx**2 + cy**2)
    
    for y in range(H):
        for x in range(0, W, 1):
            dx, dy = x - cx, y - cy
            d = math.sqrt(dx*dx + dy*dy) / max_d   # 0..1 from centre
            # horizontal bias
            tx = x / W
            col = lerp_color(NAVY_DEEP, NAVY_LIGHT, min(1.0, tx * 0.6 + d * 0.55))
            arr[y, x] = col
    return Image.fromarray(arr, "RGB")

def make_bg_fast(W, H):
    """Fast numpy-vectorised diagonal gradient  (no per-pixel loop)."""
    xs = np.linspace(0, 1, W, dtype=np.float32)
    ys = np.linspace(0, 1, H, dtype=np.float32)
    xg, yg = np.meshgrid(xs, ys)
    # mix: left-top dark, right-bottom slightly lighter
    t = (xg * 0.65 + yg * 0.35).clip(0, 1)
    
    r = (NAVY_DEEP[0] * (1 - t) + NAVY_LIGHT[0] * t).astype(np.uint8)
    g = (NAVY_DEEP[1] * (1 - t) + NAVY_LIGHT[1] * t).astype(np.uint8)
    b = (NAVY_DEEP[2] * (1 - t) + NAVY_LIGHT[2] * t).astype(np.uint8)
    
    arr = np.stack([r, g, b], axis=2)
    return Image.fromarray(arr, "RGB")

# ─────────────────────────────────────────────
# PARTICLE / GRID LAYER
# ─────────────────────────────────────────────
def add_dot_grid(canvas: Image.Image, S) -> Image.Image:
    overlay = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
    d = ImageDraw.Draw(overlay)
    step = 48 * S
    r    = int(2.5 * S)
    for x in range(0, canvas.width + step, step):
        for y in range(0, canvas.height + step, step):
            d.ellipse([x - r, y - r, x + r, y + r], fill=(255, 255, 255, 18))
    return Image.alpha_composite(canvas.convert("RGBA"), overlay).convert("RGB")

# ─────────────────────────────────────────────
# GLOW BLOB (radial)
# ─────────────────────────────────────────────
def add_glow_blob(canvas: Image.Image, cx, cy, radius, color, alpha=90) -> Image.Image:
    blob = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
    d    = Image.new("RGBA", (radius * 2, radius * 2), (0, 0, 0, 0))
    bd   = ImageDraw.Draw(d)
    bd.ellipse([0, 0, radius * 2, radius * 2], fill=(*color, alpha))
    d = d.filter(ImageFilter.GaussianBlur(radius // 2))
    blob.paste(d, (cx - radius, cy - radius), d)
    return Image.alpha_composite(canvas.convert("RGBA"), blob).convert("RGB")

# ─────────────────────────────────────────────
# 3-D KEYCAP — exact copy from master logo code
# ─────────────────────────────────────────────
def draw_3d_keycap(W, H, cx, cy, kw, kh):
    layer = Image.new("RGBA", (W, H), (0, 0, 0, 0))

    # --- shadow ---
    sh = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    sd  = ImageDraw.Draw(sh)
    sh_y = cy + kh // 2 + int(8 * S)
    sd.ellipse([cx - int(kw*.46), sh_y - int(10*S), cx + int(kw*.46), sh_y + int(10*S)], fill=(0,0,0,160))
    sd.ellipse([cx - int(kw*.64), sh_y - int(26*S), cx + int(kw*.64), sh_y + int(26*S)], fill=(0,0,0,70))
    sd.ellipse([cx - int(kw*.52), sh_y - int(18*S), cx + int(kw*.52), sh_y + int(18*S)], fill=(0,229,255,55))
    sh = sh.filter(ImageFilter.GaussianBlur(int(18*S)))
    layer = Image.alpha_composite(layer, sh)

    # --- body ---
    key = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    kd  = ImageDraw.Draw(key)
    rbase, rmid, rtop = int(kw*.23), int(kw*.21), int(kw*.19)

    base_box = [cx-kw//2, cy-kh//2+int(16*S), cx+kw//2, cy+kh//2+int(16*S)]
    kd.rounded_rectangle(base_box, rbase, fill=(7,11,24,255))

    mid_box = [cx-int(kw*.485), cy-int(kh*.485)+int(8*S), cx+int(kw*.485), cy+int(kh*.485)+int(8*S)]
    kd.rounded_rectangle(mid_box, rmid, fill=(24,34,56,255))

    top_box = [cx-int(kw*.44), cy-int(kh*.44), cx+int(kw*.44), cy+int(kh*.44)]
    kd.rounded_rectangle(top_box, rtop, fill=(12,19,36,255), outline=(42,58,86,255), width=max(2,int(3.5*S)))

    kd.arc([top_box[0], top_box[1], top_box[2], top_box[1]+int(kh*.35)], 180, 360,
           fill=(56,189,248,200), width=max(2,int(3*S)))
    kd.line([(top_box[0]+int(kw*.12), top_box[1]+max(1,int(1.5*S))),
             (top_box[0]+int(kw*.32), top_box[1]+max(1,int(1.5*S)))],
            fill=(255,255,255,230), width=max(2,int(2*S)))

    dish = [cx-int(kw*.37), cy-int(kh*.37), cx+int(kw*.37), cy+int(kh*.37)]
    kd.rounded_rectangle(dish, int(rtop*.8), fill=(4,7,18,255), outline=(20,30,48,255), width=max(1,int(1.5*S)))

    # --- glowing M ---
    font_m = ImageFont.truetype("C:/Windows/Fonts/bahnschrift.ttf", int(kw*.54))
    bb = font_m.getbbox("M")
    mx = cx - (bb[2]-bb[0])//2
    my = cy - (bb[3]-bb[1])//2 - int(5*S)

    for blur, col, alpha in [(14*S,(0,229,255),200), (6*S,(0,255,190),230)]:
        tmp = Image.new("RGBA", (W,H), (0,0,0,0))
        ImageDraw.Draw(tmp).text((mx,my), "M", fill=(*col, alpha), font=font_m)
        tmp = tmp.filter(ImageFilter.GaussianBlur(int(blur)))
        key = Image.alpha_composite(key, tmp)

    solid = Image.new("RGBA", (W,H), (0,0,0,0))
    ImageDraw.Draw(solid).text((mx,my), "M", fill=(0,255,225,255), font=font_m)
    key = Image.alpha_composite(key, solid)

    hot = Image.new("RGBA", (W,H), (0,0,0,0))
    ImageDraw.Draw(hot).text((mx,my), "M", fill=(235,255,252,190), font=font_m)
    hot = hot.filter(ImageFilter.GaussianBlur(int(1.8*S)))
    key = Image.alpha_composite(key, hot)

    return Image.alpha_composite(layer, key)

# ─────────────────────────────────────────────
# GRADIENT TEXT HELPER
# ─────────────────────────────────────────────
def gradient_text(base: Image.Image, text, x, y, font, c1, c2):
    """Render text with a horizontal gradient fill."""
    mask = Image.new("L", base.size, 0)
    ImageDraw.Draw(mask).text((x, y), text, fill=255, font=font)
    bb = font.getbbox(text)
    tw = bb[2] - bb[0]
    
    grad = np.zeros((base.height, base.width, 4), dtype=np.uint8)
    for px in range(x, x + tw):
        if 0 <= px < base.width:
            t = (px - x) / max(1, tw - 1)
            col = tuple(int(c1[i]*(1-t)+c2[i]*t) for i in range(3))
            grad[:, px] = (*col, 255)
    grad_img = Image.fromarray(grad, "RGBA")
    grad_img.putalpha(mask)
    base = Image.alpha_composite(base.convert("RGBA"), grad_img)
    return base.convert("RGB")

# ─────────────────────────────────────────────
# SAFE-ZONE BADGE (pill label)
# ─────────────────────────────────────────────
def rounded_pill(draw, x1, y1, x2, y2, fill, radius=None):
    if radius is None: radius = (y2 - y1) // 2
    draw.rounded_rectangle([x1, y1, x2, y2], radius=radius, fill=fill)

# ─────────────────────────────────────────────
# MAIN BANNER COMPOSER
# ─────────────────────────────────────────────
def build_banner():
    # 1. Background
    print("  -> background...")
    bg = make_bg_fast(W, H)
    bg = add_dot_grid(bg, S)
    bg = add_glow_blob(bg, int(W * 0.28), int(H * 0.48), int(W * 0.28), CYAN_NEON, alpha=40)
    bg = add_glow_blob(bg, int(W * 0.72), int(H * 0.52), int(W * 0.24), EMERALD,   alpha=35)

    canvas = bg.convert("RGBA")
    draw   = ImageDraw.Draw(canvas)

    # 2. Font setup
    print("  -> fonts...")
    f_brand   = ImageFont.truetype("C:/Windows/Fonts/bahnschrift.ttf",  int(210*S))
    f_tagline = ImageFont.truetype("C:/Windows/Fonts/bahnschrift.ttf",  int(68*S))
    f_pills   = ImageFont.truetype("C:/Windows/Fonts/segoeuib.ttf",     int(40*S))
    f_sub     = ImageFont.truetype("C:/Windows/Fonts/segoeui.ttf",      int(56*S))
    f_sched   = ImageFont.truetype("C:/Windows/Fonts/segoeuib.ttf",     int(50*S))

    # ─── SAFE ZONE reference ───
    sz_cx = SZ_X + SZ_W // 2  # safe-zone centre X
    sz_cy = SZ_Y + SZ_H // 2  # safe-zone centre Y

    # 3. 3D Keycap (left inside safe zone)
    print("  -> 3D keycap...")
    kw = kh = int(270 * S)
    key_cx  = SZ_X + int(200 * S)
    key_cy  = sz_cy - int(10*S)
    kc_layer = draw_3d_keycap(W, H, key_cx, key_cy, kw, kh)
    canvas   = Image.alpha_composite(canvas, kc_layer)
    draw     = ImageDraw.Draw(canvas)

    # 4. Brand Wordmark  "[M]anodemy"
    print("  -> wordmark...")
    word_x = key_cx + kw//2 + int(24*S)
    word_y = sz_cy - int(145*S)

    draw.text((word_x, word_y), "ano", fill=WHITE_PURE, font=f_brand)
    bb_ano = f_brand.getbbox("ano")
    ano_w  = bb_ano[2] - bb_ano[0]

    # "demy" — emerald→mint gradient
    canvas = gradient_text(canvas, "demy", word_x + ano_w, word_y, f_brand,
                           EMERALD, MINT_BRIGHT)
    draw = ImageDraw.Draw(canvas)

    # Accent rail under the wordmark
    bb_full = f_brand.getbbox("anodemy")
    word_w  = bb_full[2] - bb_full[0]
    rail_y  = word_y + int(215*S)
    rail_h  = int(9*S)

    draw.rounded_rectangle([key_cx - kw//2 + int(8*S), rail_y,
                             word_x + ano_w - int(8*S),  rail_y + rail_h],
                           radius=int(5*S), fill=CYAN_NEON)
    draw.rounded_rectangle([word_x + ano_w, rail_y,
                             word_x + word_w, rail_y + rail_h],
                           radius=int(5*S), fill=EMERALD)

    # 5. Tagline centred under full [keycap+anodemy] lockup
    tag_y  = rail_y + int(28*S)
    dot_r  = int(12*S)
    lockup_left  = key_cx - kw//2
    lockup_right = word_x + word_w
    lockup_mid   = (lockup_left + lockup_right) // 2
    tag_text_str = "HANDS-ON EDTECH"
    bb_tag  = f_tagline.getbbox(tag_text_str)
    tag_w   = bb_tag[2] - bb_tag[0]
    total_tag_w = dot_r*2 + int(16*S) + tag_w
    tag_start   = lockup_mid - total_tag_w // 2
    dot_cx_t = tag_start + dot_r
    dot_cy_t = tag_y + int(26*S)
    draw.ellipse([dot_cx_t-dot_r, dot_cy_t-dot_r, dot_cx_t+dot_r, dot_cy_t+dot_r], fill=EMERALD)
    draw.ellipse([dot_cx_t-int(dot_r*.5), dot_cy_t-int(dot_r*.5),
                  dot_cx_t+int(dot_r*.5), dot_cy_t+int(dot_r*.5)], fill=MINT_BRIGHT)
    draw.text((dot_cx_t + dot_r + int(16*S), tag_y),
              tag_text_str, fill=SLATE_TAG, font=f_tagline)

    # RIGHT PANEL: topics, headline, schedule
    sep_x = lockup_right + int(64*S)
    draw.line([(sep_x, SZ_Y + int(36*S)), (sep_x, SZ_Y + SZ_H - int(36*S))],
              fill=(*CYAN_NEON, 50), width=max(2, int(2*S)))

    # 6. Topic pills -- right panel, dynamic width, 2 rows stacked vertically
    print("  -> pills...")
    pills = ["SQL", "Python", "Excel", "Pandas", "Data Analysis", "Power BI"]
    ph = int(46*S)
    pill_gap_x = int(14*S)
    pill_gap_y = int(16*S)
    panel_x = sep_x + int(38*S)
    panel_y = sz_cy - int(112*S)

    # Pre-compute pill widths
    pill_dims = []
    for label in pills:
        bb_p = f_pills.getbbox(label)
        pw   = bb_p[2] - bb_p[0] + int(40*S)
        pill_dims.append(pw)

    # Distribute pills across 2 rows
    row0 = pills[:3]
    row1 = pills[3:]
    row0_dims = pill_dims[:3]
    row1_dims = pill_dims[3:]

    for row_i, (row_labels, row_dims) in enumerate([(row0, row0_dims), (row1, row1_dims)]):
        cx_cur = panel_x
        py     = panel_y + row_i * (ph + pill_gap_y)
        for j, (label, pw) in enumerate(zip(row_labels, row_dims)):
            px = cx_cur
            if row_i == 0:  # cyan outline
                border = Image.new("RGBA", (W, H), (0,0,0,0))
                bd = ImageDraw.Draw(border)
                bd.rounded_rectangle([px, py, px+pw, py+ph],
                                      radius=ph//2, fill=(*CYAN_NEON, 18))
                bd.rounded_rectangle([px, py, px+pw, py+ph],
                                      radius=ph//2, outline=(*CYAN_NEON, 195), width=max(2,int(2.5*S)))
                canvas = Image.alpha_composite(canvas.convert("RGBA"), border)
                draw   = ImageDraw.Draw(canvas)
                draw.text((px + int(20*S), py + int(5*S)), label, fill=WHITE_PURE, font=f_pills)
            else:  # emerald solid
                draw.rounded_rectangle([px, py, px+pw, py+ph], radius=ph//2, fill=(*EMERALD, 215))
                draw.text((px + int(20*S), py + int(5*S)), label, fill=WHITE_PURE, font=f_pills)
            cx_cur += pw + pill_gap_x

    # 7. Sub-headline below pills
    sub_text = "Master Data Skills in 60 Days"
    sub_y    = panel_y + 2 * (ph + pill_gap_y) + int(22*S)
    draw.text((panel_x, sub_y), sub_text, fill=(*WHITE_PURE, 210), font=f_sub)

    # 8. Schedule line
    sched_text = "New videos every week"
    sched_y    = sub_y + int(68*S)
    draw.text((panel_x, sched_y), sched_text, fill=(*SLATE_TAG, 195), font=f_sched)


    # 9. Subtle vignette
    vignette = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    vd = ImageDraw.Draw(vignette)
    for i in range(12):
        alpha = int(55 * (1 - i / 12))
        margin = i * int(40 * S)
        vd.rectangle([margin, margin, W - margin, H - margin],
                     outline=(0, 0, 0, alpha), width=int(40 * S))
    canvas = Image.alpha_composite(canvas.convert("RGBA"), vignette)

    # ── DEV ONLY: draw safe-zone reference (remove before delivery) ──
    # draw_dev = ImageDraw.Draw(canvas)
    # draw_dev.rectangle([SZ_X, SZ_Y, SZ_X+SZ_W, SZ_Y+SZ_H], outline=(255,0,0,200), width=6)

    return canvas.convert("RGB")


def main():
    assets   = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets")
    art_dir  = Path(r"C:\Users\deepa\.gemini\antigravity-ide\brain\a09e199c-322b-4925-b003-e1aebbe5d3bc")

    print("[1/2] Building 2560×1440 YouTube channel banner…")
    banner_hires = build_banner()

    print("[2/2] Downscaling to final 2560×1440…")
    banner = banner_hires.resize((W_FINAL, H_FINAL), Image.Resampling.LANCZOS)

    out_png = assets  / "manodemy_yt_banner_v2.png"
    out_jpg = assets  / "manodemy_yt_banner_v2.jpg"
    art_png = art_dir / "manodemy_yt_banner_v2.png"
    art_jpg = art_dir / "manodemy_yt_banner_v2.jpg"

    banner.save(out_png, "PNG")
    banner.save(out_jpg, "JPEG", quality=97)
    banner.save(art_png, "PNG")
    banner.save(art_jpg, "JPEG", quality=97)

    print(f"[✓] Saved → {out_png}")
    print(f"[✓] Saved → {out_jpg}")
    print("[SUCCESS] Manodemy YouTube Banner v2 ready!")


if __name__ == "__main__":
    main()
