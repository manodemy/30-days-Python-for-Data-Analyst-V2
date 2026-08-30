import math
import numpy as np
from PIL import Image, ImageDraw, ImageFont, ImageFilter
from pathlib import Path

def draw_3d_keycap_on_layer(canvas_w, canvas_h, cx, cy, kw, kh, superscale=3):
    """
    Renders an authentic, geometrically balanced 1:1 tactile 3D mechanical keycap
    directly at specified coordinates (cx, cy) with pixel-perfect square aspect ratio.
    """
    layer = Image.new("RGBA", (canvas_w, canvas_h), (0, 0, 0, 0))
    
    # 1. Soft Studio Contact Shadows
    shadow = Image.new("RGBA", (canvas_w, canvas_h), (0, 0, 0, 0))
    s_draw = ImageDraw.Draw(shadow)
    
    sh_y = cy + kh // 2 + int(6 * superscale)
    
    # Core contact shadow
    s_draw.ellipse([cx - int(kw * 0.42), sh_y - int(12 * superscale),
                    cx + int(kw * 0.42), sh_y + int(12 * superscale)], fill=(15, 23, 42, 190))
    # Diffused shadow
    s_draw.ellipse([cx - int(kw * 0.58), sh_y - int(24 * superscale),
                    cx + int(kw * 0.58), sh_y + int(24 * superscale)], fill=(30, 41, 59, 80))
    # Wide ambient shadow
    s_draw.ellipse([cx - int(kw * 0.72), sh_y - int(40 * superscale),
                    cx + int(kw * 0.72), sh_y + int(40 * superscale)], fill=(71, 85, 105, 35))
    # Cyan neon ground glow
    s_draw.ellipse([cx - int(kw * 0.48), sh_y - int(16 * superscale),
                    cx + int(kw * 0.48), sh_y + int(16 * superscale)], fill=(0, 229, 255, 60))
    
    shadow = shadow.filter(ImageFilter.GaussianBlur(int(18 * superscale)))
    layer = Image.alpha_composite(layer, shadow)
    
    # 2. Keycap Lower Skirt & Bevel Geometry
    key = Image.new("RGBA", (canvas_w, canvas_h), (0, 0, 0, 0))
    k_draw = ImageDraw.Draw(key)
    
    rad_base = int(kw * 0.22)
    rad_mid = int(kw * 0.20)
    rad_top = int(kw * 0.18)
    
    # Base Skirt (Obsidian Navy #080D1A)
    base_box = [cx - kw//2, cy - kh//2 + int(14 * superscale), cx + kw//2, cy + kh//2 + int(14 * superscale)]
    k_draw.rounded_rectangle(base_box, radius=rad_base, fill=(8, 13, 26, 255))
    
    # Mid Body Bevel (Dark Titanium Slate #1E293B)
    mid_box = [cx - int(kw*0.485), cy - int(kh*0.485) + int(7 * superscale),
               cx + int(kw*0.485), cy + int(kh*0.485) + int(7 * superscale)]
    k_draw.rounded_rectangle(mid_box, radius=rad_mid, fill=(26, 36, 56, 255))
    
    # Top Face: Dark Obsidian Glass (#0D1424) with Specular Rim
    top_box = [cx - int(kw*0.44), cy - int(kh*0.44), cx + int(kw*0.44), cy + int(kh*0.44)]
    k_draw.rounded_rectangle(top_box, radius=rad_top, fill=(13, 20, 36, 255),
                             outline=(45, 60, 85, 255), width=max(2, int(3 * superscale)))
    
    # Top Specular Rim Light (Cyan highlight on top edge)
    k_draw.arc([top_box[0], top_box[1], top_box[2], top_box[1] + int(kh*0.3)], start=180, end=360,
               fill=(56, 189, 248, 180), width=max(2, int(2.5 * superscale)))
    
    # Inner Concave Dish Depression (#040711)
    dish_box = [cx - int(kw*0.37), cy - int(kh*0.37), cx + int(kw*0.37), cy + int(kh*0.37)]
    k_draw.rounded_rectangle(dish_box, radius=int(rad_top * 0.8), fill=(4, 7, 17, 255))
    
    # 3. Volumetric Glowing Neon-Cyan Letter 'M'
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    font_size_m = int(kw * 0.52)
    font_m = ImageFont.truetype(f_bold, font_size_m)
    
    bbox_m = font_m.getbbox("M")
    mw = bbox_m[2] - bbox_m[0]
    mh = bbox_m[3] - bbox_m[1]
    mx = cx - mw // 2
    my = cy - mh // 2 - int(5 * superscale)
    
    # Outer Cyan Bloom
    m_bloom = Image.new("RGBA", (canvas_w, canvas_h), (0, 0, 0, 0))
    mb_draw = ImageDraw.Draw(m_bloom)
    mb_draw.text((mx, my), "M", fill=(0, 229, 255, 220), font=font_m)
    m_bloom = m_bloom.filter(ImageFilter.GaussianBlur(int(10 * superscale)))
    
    # Bright Core Neon Letter
    m_core = Image.new("RGBA", (canvas_w, canvas_h), (0, 0, 0, 0))
    mc_draw = ImageDraw.Draw(m_core)
    mc_draw.text((mx, my), "M", fill=(0, 255, 220, 255), font=font_m)
    
    # White Center Highlight
    m_hi = Image.new("RGBA", (canvas_w, canvas_h), (0, 0, 0, 0))
    mh_draw = ImageDraw.Draw(m_hi)
    mh_draw.text((mx, my), "M", fill=(225, 255, 250, 180), font=font_m)
    m_hi = m_hi.filter(ImageFilter.GaussianBlur(int(2 * superscale)))
    
    key = Image.alpha_composite(key, m_bloom)
    key = Image.alpha_composite(key, m_core)
    key = Image.alpha_composite(key, m_hi)
    
    layer = Image.alpha_composite(layer, key)
    return layer

def render_master_logo(superscale=3):
    W = 2800 * superscale
    H = 850 * superscale
    
    white_canvas = Image.new("RGBA", (W, H), (255, 255, 255, 255))
    trans_canvas = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    
    # Keycap geometry: exact 1:1 square
    kw = int(285 * superscale)
    kh = int(285 * superscale)
    
    # Typography Setup (Font Science)
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    f_segoe = "C:/Windows/Fonts/segoeuib.ttf"
    
    font_word = ImageFont.truetype(f_bold, int(290 * superscale))
    font_tag = ImageFont.truetype(f_segoe, int(58 * superscale))
    
    ano_part = "ano"
    demy_part = "demy"
    
    bbox_ano = font_word.getbbox(ano_part)
    ano_w = bbox_ano[2] - bbox_ano[0]
    bbox_demy = font_word.getbbox(demy_part)
    demy_w = bbox_demy[2] - bbox_demy[0]
    
    gap_btn_to_text = int(28 * superscale)
    total_content_w = kw + gap_btn_to_text + ano_w + demy_w
    
    start_x = (W - total_content_w) // 2
    center_y = H // 2 - int(40 * superscale)
    
    btn_cx = start_x + kw // 2
    btn_cy = center_y + int(6 * superscale)
    
    # Render 3D Keycap directly
    keycap_layer = draw_3d_keycap_on_layer(W, H, btn_cx, btn_cy, kw, kh, superscale)
    white_canvas = Image.alpha_composite(white_canvas, keycap_layer)
    trans_canvas = Image.alpha_composite(trans_canvas, keycap_layer)
    
    text_x = start_x + kw + gap_btn_to_text
    text_y = center_y - int(130 * superscale)
    
    # Color Science Tokens
    COLOR_NAVY = (11, 19, 43, 255)      # Space Obsidian #0B132B
    COLOR_EMERALD = (0, 200, 122, 255)  # Radiant Tech Growth Emerald #00C87A
    COLOR_CYAN = (0, 229, 255, 255)     # Electric Neon Cyan #00E5FF
    COLOR_SLATE = (71, 85, 105, 255)    # Modern Editorial Slate #475569
    
    for canvas in [white_canvas, trans_canvas]:
        draw = ImageDraw.Draw(canvas)
        
        # Wordmark: "ano" + "demy"
        draw.text((text_x, text_y), ano_part, fill=COLOR_NAVY, font=font_word)
        draw.text((text_x + ano_w, text_y), demy_part, fill=COLOR_EMERALD, font=font_word)
        
        # Dual-Tone Energy Rail (Accent Lines)
        line_y = text_y + int(310 * superscale)
        bar_h = int(11 * superscale)
        
        # Cyan rail under [M]ano
        rail_left_start = start_x + int(12 * superscale)
        rail_left_end = text_x + ano_w - int(14 * superscale)
        draw.rounded_rectangle([rail_left_start, line_y, rail_left_end, line_y + bar_h],
                               radius=int(6 * superscale), fill=COLOR_CYAN)
        
        # Emerald rail under 'demy'
        rail_right_start = text_x + ano_w
        rail_right_end = text_x + ano_w + demy_w
        draw.rounded_rectangle([rail_right_start, line_y, rail_right_end, line_y + bar_h],
                               radius=int(6 * superscale), fill=COLOR_EMERALD)
        
        # Tagline: "● HANDS-ON EDTECH"
        tag_y = line_y + int(42 * superscale)
        
        # Solid Geometric Emerald Bullet
        dot_rad = int(16 * superscale)
        dot_cx = text_x + dot_rad
        dot_cy = tag_y + int(34 * superscale)
        draw.ellipse([dot_cx - dot_rad, dot_cy - dot_rad, dot_cx + dot_rad, dot_cy + dot_rad], fill=COLOR_EMERALD)
        
        # Tagline Text
        tag_text = "HANDS-ON EDTECH"
        draw.text((dot_cx + dot_rad + int(22 * superscale), tag_y), tag_text, fill=COLOR_SLATE, font=font_tag)

    final_white = white_canvas.resize((2800, 850), Image.Resampling.LANCZOS)
    final_trans = trans_canvas.resize((2800, 850), Image.Resampling.LANCZOS)
    
    # 1:1 Master Avatar (1200 x 1200)
    av_S = 1200 * superscale
    av_layer = draw_3d_keycap_on_layer(av_S, av_S, av_S // 2, av_S // 2, int(680 * superscale), int(680 * superscale), superscale)
    avatar_white = Image.new("RGBA", (av_S, av_S), (255, 255, 255, 255))
    avatar_white = Image.alpha_composite(avatar_white, av_layer)
    final_avatar = avatar_white.resize((1200, 1200), Image.Resampling.LANCZOS)
    
    return final_white, final_trans, final_avatar

def cleanup_old_logos(assets_dir: Path):
    unwanted_files = [
        "manodemy_3d_keycap_white_avatar_1x1.jpg",
        "manodemy_3d_keycap_white_avatar_1x1.png",
        "manodemy_button_logo_embedded_trans.png",
        "manodemy_button_logo_embedded_white.jpg",
        "manodemy_button_logo_embedded_white.png",
        "manodemy_button_logo_lockup_trans.png",
        "manodemy_button_logo_lockup_white.jpg",
        "manodemy_button_logo_lockup_white.png",
        "manodemy_button_logo_transparent.png",
        "manodemy_button_logo_white.jpg",
        "manodemy_button_logo_white.png",
        "manodemy_logo_transparent.png",
        "manodemy_logo_white_bg.jpg",
        "manodemy_logo_white_bg.png",
        "manodemy_neo_brand_white_bg.jpg",
        "manodemy_neo_brand_white_bg.png",
        "manodemy_neo_keycap_white_1x1.jpg",
        "manodemy_neo_keycap_white_1x1.png",
        "manodemy_worldclass_brand_white_bg.jpg",
        "manodemy_worldclass_brand_white_bg.png",
        "manodemy_worldclass_emblem_1x1.jpg",
        "manodemy_worldclass_emblem_1x1.png"
    ]
    for filename in unwanted_files:
        f = assets_dir / filename
        if f.exists():
            try:
                f.unlink()
            except Exception:
                pass

def main():
    assets_dir = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets")
    art_dir = Path(r"C:\Users\deepa\.gemini\antigravity-ide\brain\a09e199c-322b-4925-b003-e1aebbe5d3bc")
    
    cleanup_old_logos(assets_dir)
    
    print("[1/2] Rendering Master Brand Logo with Geometric 1:1 Keycap...")
    final_white, final_trans, final_avatar = render_master_logo(superscale=3)
    
    master_white_png = assets_dir / "manodemy_master_logo_white.png"
    master_white_jpg = assets_dir / "manodemy_master_logo_white.jpg"
    master_trans_png = assets_dir / "manodemy_master_logo_transparent.png"
    master_avatar_png = assets_dir / "manodemy_master_avatar_1x1.png"
    master_avatar_jpg = assets_dir / "manodemy_master_avatar_1x1.jpg"
    
    final_white.save(master_white_png, "PNG")
    final_white.convert("RGB").save(master_white_jpg, "JPEG", quality=98)
    final_trans.save(master_trans_png, "PNG")
    final_avatar.save(master_avatar_png, "PNG")
    final_avatar.convert("RGB").save(master_avatar_jpg, "JPEG", quality=98)
    
    final_white.save(art_dir / "manodemy_master_logo_white.png", "PNG")
    final_white.convert("RGB").save(art_dir / "manodemy_master_logo_white.jpg", "JPEG", quality=98)
    final_trans.save(art_dir / "manodemy_master_logo_transparent.png", "PNG")
    final_avatar.save(art_dir / "manodemy_master_avatar_1x1.png", "PNG")
    final_avatar.convert("RGB").save(art_dir / "manodemy_master_avatar_1x1.jpg", "JPEG", quality=98)
    
    print("[2/2] [SUCCESS] Perfect Master Brand Logo Suite Generated Successfully!")

if __name__ == "__main__":
    main()
