import math
import numpy as np
from PIL import Image, ImageDraw, ImageFont, ImageFilter
from pathlib import Path

def create_linear_gradient(width, height, color1, color2, direction="horizontal"):
    base = Image.new("RGBA", (width, height), (0, 0, 0, 0))
    arr = np.zeros((height, width, 4), dtype=np.float32)
    
    if direction == "horizontal":
        for x in range(width):
            t = x / max(1, width - 1)
            r = color1[0] * (1 - t) + color2[0] * t
            g = color1[1] * (1 - t) + color2[1] * t
            b = color1[2] * (1 - t) + color2[2] * t
            a = color1[3] * (1 - t) + color2[3] * t
            arr[:, x] = [r, g, b, a]
            
    return Image.fromarray(arr.astype(np.uint8), mode="RGBA")

def draw_hyper_stunning_keycap(W, H, cx, cy, kw, kh, superscale=3):
    layer = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    
    # 1. Multi-Stage Studio Contact Shadows & Floor Glow
    shadow = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    s_draw = ImageDraw.Draw(shadow)
    
    sh_y = cy + kh // 2 + int(8 * superscale)
    
    s_draw.ellipse([cx - int(kw * 0.44), sh_y - int(10 * superscale),
                    cx + int(kw * 0.44), sh_y + int(10 * superscale)], fill=(11, 19, 43, 210))
    s_draw.ellipse([cx - int(kw * 0.62), sh_y - int(24 * superscale),
                    cx + int(kw * 0.62), sh_y + int(24 * superscale)], fill=(30, 41, 59, 90))
    s_draw.ellipse([cx - int(kw * 0.80), sh_y - int(45 * superscale),
                    cx + int(kw * 0.80), sh_y + int(45 * superscale)], fill=(71, 85, 105, 38))
    s_draw.ellipse([cx - int(kw * 0.52), sh_y - int(18 * superscale),
                    cx + int(kw * 0.52), sh_y + int(18 * superscale)], fill=(0, 240, 255, 70))
    s_draw.ellipse([cx - int(kw * 0.38), sh_y - int(12 * superscale),
                    cx + int(kw * 0.38), sh_y + int(12 * superscale)], fill=(0, 255, 178, 45))
    
    shadow = shadow.filter(ImageFilter.GaussianBlur(int(20 * superscale)))
    layer = Image.alpha_composite(layer, shadow)
    
    # 2. Keycap Lower Mechanical Skirt
    key = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    k_draw = ImageDraw.Draw(key)
    
    rad_base = int(kw * 0.23)
    rad_mid = int(kw * 0.21)
    rad_top = int(kw * 0.19)
    
    base_box = [cx - kw//2, cy - kh//2 + int(16 * superscale),
                cx + kw//2, cy + kh//2 + int(16 * superscale)]
    k_draw.rounded_rectangle(base_box, radius=rad_base, fill=(7, 11, 24, 255))
    
    mid_box = [cx - int(kw*0.485), cy - int(kh*0.485) + int(8 * superscale),
               cx + int(kw*0.485), cy + int(kh*0.485) + int(8 * superscale)]
    k_draw.rounded_rectangle(mid_box, radius=rad_mid, fill=(24, 34, 56, 255))
    
    top_box = [cx - int(kw*0.44), cy - int(kh*0.44), cx + int(kw*0.44), cy + int(kh*0.44)]
    k_draw.rounded_rectangle(top_box, radius=rad_top, fill=(12, 19, 36, 255),
                             outline=(42, 58, 86, 255), width=max(2, int(3.5 * superscale)))
    
    # Specular Glint Highlight
    k_draw.arc([top_box[0], top_box[1], top_box[2], top_box[1] + int(kh*0.35)], start=180, end=360,
               fill=(56, 189, 248, 210), width=max(2, int(3 * superscale)))
    k_draw.line([(top_box[0] + int(kw*0.12), top_box[1] + max(1, int(1.5*superscale))),
                 (top_box[0] + int(kw*0.32), top_box[1] + max(1, int(1.5*superscale)))],
                fill=(255, 255, 255, 230), width=max(2, int(2 * superscale)))
    
    # Concave Dish Depression
    dish_box = [cx - int(kw*0.37), cy - int(kh*0.37), cx + int(kw*0.37), cy + int(kh*0.37)]
    k_draw.rounded_rectangle(dish_box, radius=int(rad_top * 0.8), fill=(4, 7, 18, 255),
                             outline=(20, 30, 48, 255), width=max(1, int(1.5 * superscale)))
    
    # 3. Glowing Neon-Cyan Letter 'M'
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    font_size_m = int(kw * 0.54)
    font_m = ImageFont.truetype(f_bold, font_size_m)
    
    bbox_m = font_m.getbbox("M")
    mw = bbox_m[2] - bbox_m[0]
    mh = bbox_m[3] - bbox_m[1]
    mx = cx - mw // 2
    my = cy - mh // 2 - int(5 * superscale)
    
    # Multi-layer Glow
    m_bloom_wide = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    mbw_draw = ImageDraw.Draw(m_bloom_wide)
    mbw_draw.text((mx, my), "M", fill=(0, 229, 255, 200), font=font_m)
    m_bloom_wide = m_bloom_wide.filter(ImageFilter.GaussianBlur(int(14 * superscale)))
    
    m_bloom_tight = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    mbt_draw = ImageDraw.Draw(m_bloom_tight)
    mbt_draw.text((mx, my), "M", fill=(0, 255, 190, 230), font=font_m)
    m_bloom_tight = m_bloom_tight.filter(ImageFilter.GaussianBlur(int(6 * superscale)))
    
    m_solid = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    ms_draw = ImageDraw.Draw(m_solid)
    ms_draw.text((mx, my), "M", fill=(0, 255, 225, 255), font=font_m)
    
    m_hot = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    mh_draw = ImageDraw.Draw(m_hot)
    mh_draw.text((mx, my), "M", fill=(235, 255, 252, 190), font=font_m)
    m_hot = m_hot.filter(ImageFilter.GaussianBlur(int(1.8 * superscale)))
    
    key = Image.alpha_composite(key, m_bloom_wide)
    key = Image.alpha_composite(key, m_bloom_tight)
    key = Image.alpha_composite(key, m_solid)
    key = Image.alpha_composite(key, m_hot)
    
    layer = Image.alpha_composite(layer, key)
    return layer

def build_refined_logo_master(alignment_mode="center", superscale=3):
    """
    Renders the Master Brand Logo with perfected tagline positioning:
    - 'center': Perfectly centered across the full lockup width
    - 'left_flush': Perfectly aligned with the left edge of the 3D Keycap
    """
    W = 2800 * superscale
    H = 850 * superscale
    
    white_canvas = Image.new("RGBA", (W, H), (255, 255, 255, 255))
    trans_canvas = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    
    kw = int(290 * superscale)
    kh = int(290 * superscale)
    
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    f_segoe = "C:/Windows/Fonts/segoeuib.ttf"
    
    font_word = ImageFont.truetype(f_bold, int(295 * superscale))
    font_tag = ImageFont.truetype(f_segoe, int(54 * superscale))
    
    ano_part = "ano"
    demy_part = "demy"
    
    bbox_ano = font_word.getbbox(ano_part)
    ano_w = bbox_ano[2] - bbox_ano[0]
    bbox_demy = font_word.getbbox(demy_part)
    demy_w = bbox_demy[2] - bbox_demy[0]
    
    gap_btn_to_text = int(28 * superscale)
    total_content_w = kw + gap_btn_to_text + ano_w + demy_w
    
    start_x = (W - total_content_w) // 2
    center_y = H // 2 - int(42 * superscale)
    
    btn_cx = start_x + kw // 2
    btn_cy = center_y + int(6 * superscale)
    
    # Render 3D Keycap
    keycap_layer = draw_hyper_stunning_keycap(W, H, btn_cx, btn_cy, kw, kh, superscale)
    white_canvas = Image.alpha_composite(white_canvas, keycap_layer)
    trans_canvas = Image.alpha_composite(trans_canvas, keycap_layer)
    
    text_x = start_x + kw + gap_btn_to_text
    text_y = center_y - int(132 * superscale)
    
    # Typography Layer
    text_layer = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    t_draw = ImageDraw.Draw(text_layer)
    
    t_draw.text((text_x, text_y), ano_part, fill=(10, 17, 40, 255), font=font_word)
    
    demy_x = text_x + ano_w
    demy_mask = Image.new("L", (W, H), 0)
    dm_draw = ImageDraw.Draw(demy_mask)
    dm_draw.text((demy_x, text_y), demy_part, fill=255, font=font_word)
    
    grad_demy = create_linear_gradient(W, H, (0, 200, 122, 255), (0, 230, 160, 255), direction="horizontal")
    text_layer.paste(grad_demy, (0, 0), demy_mask)
    
    white_canvas = Image.alpha_composite(white_canvas, text_layer)
    trans_canvas = Image.alpha_composite(trans_canvas, text_layer)
    
    # Energy Rails (Accent Underline)
    rail_y = text_y + int(310 * superscale)
    rail_h = int(12 * superscale)
    
    # Left Rail: spans under [M]ano
    rail_l_start = start_x + int(10 * superscale)
    rail_l_end = text_x + ano_w - int(14 * superscale)
    rail_l_w = rail_l_end - rail_l_start
    
    rail_l_grad = create_linear_gradient(rail_l_w, rail_h, (0, 229, 255, 255), (0, 180, 230, 255), direction="horizontal")
    mask_rail_l = Image.new("L", (rail_l_w, rail_h), 0)
    mrl_draw = ImageDraw.Draw(mask_rail_l)
    mrl_draw.rounded_rectangle([0, 0, rail_l_w, rail_h], radius=int(6 * superscale), fill=255)
    
    # Right Rail: spans under 'demy'
    rail_r_start = text_x + ano_w
    rail_r_end = text_x + ano_w + demy_w
    rail_r_w = rail_r_end - rail_r_start
    
    rail_r_grad = create_linear_gradient(rail_r_w, rail_h, (0, 200, 122, 255), (0, 255, 178, 255), direction="horizontal")
    mask_rail_r = Image.new("L", (rail_r_w, rail_h), 0)
    mrr_draw = ImageDraw.Draw(mask_rail_r)
    mrr_draw.rounded_rectangle([0, 0, rail_r_w, rail_h], radius=int(6 * superscale), fill=255)
    
    # Tagline Setup
    # Calculate exact width of "● HANDS-ON EDTECH"
    tag_text = "HANDS-ON EDTECH"
    bbox_tag = font_tag.getbbox(tag_text)
    tag_w = bbox_tag[2] - bbox_tag[0]
    
    dot_rad = int(15 * superscale)
    dot_gap = int(20 * superscale)
    total_tagline_w = (dot_rad * 2) + dot_gap + tag_w
    
    # Compute Tagline starting X based on alignment mode:
    if alignment_mode == "center":
        # Perfectly centered across the entire [Button M] + anodemy width
        tagline_start_x = start_x + (total_content_w - total_tagline_w) // 2
    elif alignment_mode == "wordmark_center":
        # Centered under the word "anodemy"
        word_w = ano_w + demy_w
        tagline_start_x = text_x + (word_w - total_tagline_w) // 2
    else:  # "left_flush"
        # Flush with the 3D Keycap's left edge
        tagline_start_x = start_x + int(12 * superscale)
        
    tag_y = rail_y + int(44 * superscale)
    dot_cx = tagline_start_x + dot_rad
    dot_cy = tag_y + int(32 * superscale)
    tag_text_x = dot_cx + dot_rad + dot_gap
    
    for canvas in [white_canvas, trans_canvas]:
        canvas.paste(rail_l_grad, (rail_l_start, rail_y), mask_rail_l)
        canvas.paste(rail_r_grad, (rail_r_start, rail_y), mask_rail_r)
        
        draw = ImageDraw.Draw(canvas)
        
        # Concentric Quantum Bullet
        # Outer Emerald Halo
        draw.ellipse([dot_cx - dot_rad, dot_cy - dot_rad, dot_cx + dot_rad, dot_cy + dot_rad], fill=(0, 200, 122, 255))
        # Inner Neon Core
        draw.ellipse([dot_cx - int(dot_rad*0.5), dot_cy - int(dot_rad*0.5),
                      dot_cx + int(dot_rad*0.5), dot_cy + int(dot_rad*0.5)], fill=(0, 255, 210, 255))
        
        # Tagline Text
        draw.text((tag_text_x, tag_y), tag_text, fill=(71, 85, 105, 255), font=font_tag)

    final_white = white_canvas.resize((2800, 850), Image.Resampling.LANCZOS)
    final_trans = trans_canvas.resize((2800, 850), Image.Resampling.LANCZOS)
    
    return final_white, final_trans

def main():
    assets_dir = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets")
    art_dir = Path(r"C:\Users\deepa\.gemini\antigravity-ide\brain\a09e199c-322b-4925-b003-e1aebbe5d3bc")
    
    # 1. Generate Symmetrical Optical Center (Option 1)
    print("[1/2] Generating Perfectly Centered Tagline Positioning...")
    white_center, trans_center = build_refined_logo_master(alignment_mode="center", superscale=3)
    
    white_center.save(assets_dir / "manodemy_master_logo_white.png", "PNG")
    white_center.convert("RGB").save(assets_dir / "manodemy_master_logo_white.jpg", "JPEG", quality=98)
    trans_center.save(assets_dir / "manodemy_master_logo_transparent.png", "PNG")
    
    white_center.save(art_dir / "manodemy_master_logo_white.png", "PNG")
    white_center.convert("RGB").save(art_dir / "manodemy_master_logo_white.jpg", "JPEG", quality=98)
    trans_center.save(art_dir / "manodemy_master_logo_transparent.png", "PNG")
    
    # Also save the centered option as preview
    white_center.save(art_dir / "manodemy_tagline_centered.png", "PNG")
    white_center.convert("RGB").save(art_dir / "manodemy_tagline_centered.jpg", "JPEG", quality=98)
    
    # 2. Generate Left-Flush Tagline (Option 2)
    print("[2/2] Generating Left-Flush Grid Tagline Positioning...")
    white_flush, trans_flush = build_refined_logo_master(alignment_mode="left_flush", superscale=3)
    white_flush.save(art_dir / "manodemy_tagline_left_flush.png", "PNG")
    white_flush.convert("RGB").save(art_dir / "manodemy_tagline_left_flush.jpg", "JPEG", quality=98)
    
    # 3. Generate Wordmark Centered (Option 3 - Centered under 'anodemy')
    white_word_ctr, trans_word_ctr = build_refined_logo_master(alignment_mode="wordmark_center", superscale=3)
    white_word_ctr.save(art_dir / "manodemy_tagline_wordmark_center.png", "PNG")
    white_word_ctr.convert("RGB").save(art_dir / "manodemy_tagline_wordmark_center.jpg", "JPEG", quality=98)
    
    print("[SUCCESS] All 3 Refined Tagline Positioning Options Generated!")

if __name__ == "__main__":
    main()
