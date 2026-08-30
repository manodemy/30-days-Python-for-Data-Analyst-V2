import math
import numpy as np
from PIL import Image, ImageDraw, ImageFont, ImageFilter
from pathlib import Path

def render_concept2_glass_keycap(superscale=3):
    S = 1200 * superscale
    img = Image.new("RGBA", (S, S), (255, 255, 255, 255))
    
    cx, cy = S // 2, S // 2 - int(20 * superscale)
    
    # 1. Soft Studio Contact Shadows
    shadow = Image.new("RGBA", (S, S), (0, 0, 0, 0))
    s_draw = ImageDraw.Draw(shadow)
    
    kw = int(460 * superscale)
    kh = int(460 * superscale)
    sh_y = cy + kh // 2 + int(10 * superscale)
    
    s_draw.ellipse([cx - int(260 * superscale), sh_y - int(30 * superscale),
                    cx + int(260 * superscale), sh_y + int(30 * superscale)], fill=(15, 23, 42, 90))
    s_draw.ellipse([cx - int(380 * superscale), sh_y - int(60 * superscale),
                    cx + int(380 * superscale), sh_y + int(60 * superscale)], fill=(30, 41, 59, 40))
    s_draw.ellipse([cx - int(300 * superscale), sh_y - int(45 * superscale),
                    cx + int(300 * superscale), sh_y + int(45 * superscale)], fill=(0, 200, 255, 35))
    
    shadow = shadow.filter(ImageFilter.GaussianBlur(int(36 * superscale)))
    img = Image.alpha_composite(img, shadow)
    
    # 2. Keycap 3D Base Body (Lower dark beveled skirt)
    key_layer = Image.new("RGBA", (S, S), (0, 0, 0, 0))
    k_draw = ImageDraw.Draw(key_layer)
    
    rad_base = int(110 * superscale)
    rad_top = int(95 * superscale)
    
    # Lower Skirt (Deep Midnight Navy #0B1120)
    base_box = [cx - kw//2, cy - kh//2 + int(50 * superscale), cx + kw//2, cy + kh//2 + int(50 * superscale)]
    k_draw.rounded_rectangle(base_box, radius=rad_base, fill=(11, 17, 32, 255))
    
    # Mid Body Bevel (Dark Titanium #1E293B to #334155)
    mid_box = [cx - int(kw*0.48), cy - int(kh*0.48) + int(25 * superscale), cx + int(kw*0.48), cy + int(kh*0.48) + int(25 * superscale)]
    k_draw.rounded_rectangle(mid_box, radius=rad_top + int(10*superscale), fill=(30, 41, 59, 255))
    
    # Top Face: Sleek Dark Obsidian Glass Plate (#0F172A)
    top_box = [cx - int(kw*0.44), cy - int(kh*0.44), cx + int(kw*0.44), cy + int(kh*0.44)]
    k_draw.rounded_rectangle(top_box, radius=rad_top, fill=(15, 23, 42, 255), outline=(51, 65, 85, 255), width=int(4*superscale))
    
    # Subtle inner dish vignette / depression glow
    dish_box = [cx - int(kw*0.38), cy - int(kh*0.38), cx + int(kw*0.38), cy + int(kh*0.38)]
    k_draw.rounded_rectangle(dish_box, radius=int(rad_top*0.8), fill=(2, 6, 23, 255))
    
    # 3. Glowing Letter "M" (Modern Bold Geometric Letterform)
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    font_m = ImageFont.truetype(f_bold, int(310 * superscale))
    
    # Glow layer for letter M
    m_glow = Image.new("RGBA", (S, S), (0, 0, 0, 0))
    mg_draw = ImageDraw.Draw(m_glow)
    
    bbox_m = font_m.getbbox("M")
    mw = bbox_m[2] - bbox_m[0]
    mh = bbox_m[3] - bbox_m[1]
    mx = cx - mw // 2
    my = cy - mh // 2 - int(10 * superscale)
    
    # Diffused Cyan Glow
    mg_draw.text((mx, my), "M", fill=(0, 240, 255, 200), font=font_m)
    m_glow = m_glow.filter(ImageFilter.GaussianBlur(int(18 * superscale)))
    
    # Draw Sharp Neon-Cyan to Electric Emerald Letter
    m_sharp = Image.new("RGBA", (S, S), (0, 0, 0, 0))
    ms_draw = ImageDraw.Draw(m_sharp)
    ms_draw.text((mx, my), "M", fill=(0, 255, 210, 255), font=font_m)
    
    # Composite all layers
    key_layer = Image.alpha_composite(key_layer, m_glow)
    key_layer = Image.alpha_composite(key_layer, m_sharp)
    img = Image.alpha_composite(img, key_layer)
    
    # 4. Downscale with Lanczos
    final_img = img.resize((1200, 1200), Image.Resampling.LANCZOS)
    return final_img

def build_concept2_horizontal_brand(emblem_img):
    W, H = 2800, 800
    canvas = Image.new("RGBA", (W, H), (255, 255, 255, 255))
    
    emblem_scaled = emblem_img.resize((560, 560), Image.Resampling.LANCZOS)
    ex = 140
    ey = (H - 560) // 2
    canvas.paste(emblem_scaled, (ex, ey), emblem_scaled)
    
    draw = ImageDraw.Draw(canvas)
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    f_segoe = "C:/Windows/Fonts/segoeuib.ttf"
    
    font_main = ImageFont.truetype(f_bold, 215)
    font_sub = ImageFont.truetype(f_segoe, 46)
    font_tag = ImageFont.truetype(f_bold, 32)
    
    tx = ex + 560 + 80
    ty = ey + 75
    
    # Wordmark: Mano (Obsidian Navy) + demy (Neon Emerald)
    draw.text((tx, ty), "Mano", fill=(11, 17, 32, 255), font=font_main)
    bbox_mano = font_main.getbbox("Mano")
    mano_w = bbox_mano[2] - bbox_mano[0]
    
    draw.text((tx + mano_w, ty), "demy", fill=(0, 200, 150, 255), font=font_main)
    
    # Accent Line
    line_y = ty + 215
    draw.rounded_rectangle([tx, line_y, tx + 420, line_y + 10], radius=5, fill=(0, 240, 255, 255))
    draw.rounded_rectangle([tx + 435, line_y, tx + 620, line_y + 10], radius=5, fill=(0, 200, 150, 255))
    
    # Tagline: LEARN DATA ANALYTICS BY ACTUALLY CODING
    sy = line_y + 35
    draw.text((tx, sy), "LEARN DATA ANALYTICS BY ACTUALLY CODING", fill=(71, 85, 105, 255), font=font_sub)
    
    # Tags
    tag_y = sy + 75
    tags = [
        ("SQL STUDIO", (6, 182, 212)),
        ("PYTHON", (234, 179, 8)),
        ("ADVANCED EXCEL", (16, 185, 129)),
        ("750+ PROBLEMS", (244, 63, 94))
    ]
    
    curr_tx = tx
    for t_name, col in tags:
        bbox_t = font_tag.getbbox(t_name)
        tw = (bbox_t[2] - bbox_t[0]) + 28
        th = (bbox_t[3] - bbox_t[1]) + 18
        
        draw.rounded_rectangle([curr_tx, tag_y, curr_tx + tw, tag_y + th], radius=8,
                               fill=(col[0], col[1], col[2], 20),
                               outline=(col[0], col[1], col[2], 180), width=2)
        draw.text((curr_tx + 14, tag_y + 7), t_name, fill=(30, 41, 59, 255), font=font_tag)
        curr_tx += tw + 18
        
    return canvas

def generate_concept2():
    print("[1/2] Rendering Concept 2: Neo-Keycap Glass Icon (Square 1:1)...")
    emblem_1x1 = render_concept2_glass_keycap(superscale=3)
    
    out_dir = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets")
    
    emblem_1x1_png = out_dir / "manodemy_neo_keycap_white_1x1.png"
    emblem_1x1_jpg = out_dir / "manodemy_neo_keycap_white_1x1.jpg"
    emblem_1x1.save(emblem_1x1_png, "PNG")
    emblem_1x1.convert("RGB").save(emblem_1x1_jpg, "JPEG", quality=98)
    
    print("[2/2] Rendering Concept 2: Full Horizontal Brand Lockup on Pure White (2800x800)...")
    brand_horiz = build_concept2_horizontal_brand(emblem_1x1)
    
    brand_png = out_dir / "manodemy_neo_brand_white_bg.png"
    brand_jpg = out_dir / "manodemy_neo_brand_white_bg.jpg"
    brand_horiz.save(brand_png, "PNG")
    brand_horiz.convert("RGB").save(brand_jpg, "JPEG", quality=98)
    
    # Copy to artifacts
    art_dir = Path(r"C:\Users\deepa\.gemini\antigravity-ide\brain\a09e199c-322b-4925-b003-e1aebbe5d3bc")
    emblem_1x1.save(art_dir / "manodemy_neo_keycap_white_1x1.png", "PNG")
    emblem_1x1.convert("RGB").save(art_dir / "manodemy_neo_keycap_white_1x1.jpg", "JPEG", quality=98)
    brand_horiz.save(art_dir / "manodemy_neo_brand_white_bg.png", "PNG")
    brand_horiz.convert("RGB").save(art_dir / "manodemy_neo_brand_white_bg.jpg", "JPEG", quality=98)
    
    print("[SUCCESS] Concept 2 (Neo-Keycap Glass White) Created Successfully!")

if __name__ == "__main__":
    generate_concept2()
