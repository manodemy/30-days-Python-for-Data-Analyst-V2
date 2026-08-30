import math
import numpy as np
from PIL import Image, ImageDraw, ImageFont, ImageFilter
from pathlib import Path

def create_linear_gradient(width, height, color1, color2, direction="horizontal"):
    """Creates a smooth linear gradient image of specified dimensions."""
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
    else:
        for y in range(height):
            t = y / max(1, height - 1)
            r = color1[0] * (1 - t) + color2[0] * t
            g = color1[1] * (1 - t) + color2[1] * t
            b = color1[2] * (1 - t) + color2[2] * t
            a = color1[3] * (1 - t) + color2[3] * t
            arr[y, :] = [r, g, b, a]
            
    return Image.fromarray(arr.astype(np.uint8), mode="RGBA")

def draw_hyper_stunning_keycap(W, H, cx, cy, kw, kh, superscale=3):
    """
    Renders an ultra-luxurious, state-of-the-art 3D tactile mechanical keycap
    with multi-tier glass refraction, specular glints, volumetric glowing neon-cyan 'M',
    and soft studio contact shadows.
    """
    layer = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    
    # 1. Multi-Stage Studio Contact Shadows & Neon Floor Bounce
    shadow = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    s_draw = ImageDraw.Draw(shadow)
    
    sh_y = cy + kh // 2 + int(8 * superscale)
    
    # Tight Core Occlusion Shadow
    s_draw.ellipse([cx - int(kw * 0.44), sh_y - int(10 * superscale),
                    cx + int(kw * 0.44), sh_y + int(10 * superscale)], fill=(11, 19, 43, 210))
    # Mid Diffused Drop Shadow
    s_draw.ellipse([cx - int(kw * 0.62), sh_y - int(24 * superscale),
                    cx + int(kw * 0.62), sh_y + int(24 * superscale)], fill=(30, 41, 59, 90))
    # Wide Soft Ambient Falloff
    s_draw.ellipse([cx - int(kw * 0.80), sh_y - int(45 * superscale),
                    cx + int(kw * 0.80), sh_y + int(45 * superscale)], fill=(71, 85, 105, 38))
    # Electric Cyan & Mint Luminescent Floor Bounce
    s_draw.ellipse([cx - int(kw * 0.52), sh_y - int(18 * superscale),
                    cx + int(kw * 0.52), sh_y + int(18 * superscale)], fill=(0, 240, 255, 70))
    s_draw.ellipse([cx - int(kw * 0.38), sh_y - int(12 * superscale),
                    cx + int(kw * 0.38), sh_y + int(12 * superscale)], fill=(0, 255, 178, 45))
    
    shadow = shadow.filter(ImageFilter.GaussianBlur(int(20 * superscale)))
    layer = Image.alpha_composite(layer, shadow)
    
    # 2. Keycap Lower Mechanical Skirt (Space Obsidian #070B18)
    key = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    k_draw = ImageDraw.Draw(key)
    
    rad_base = int(kw * 0.23)
    rad_mid = int(kw * 0.21)
    rad_top = int(kw * 0.19)
    
    # Base Skirt with slight 3D perspective
    base_box = [cx - kw//2, cy - kh//2 + int(16 * superscale),
                cx + kw//2, cy + kh//2 + int(16 * superscale)]
    k_draw.rounded_rectangle(base_box, radius=rad_base, fill=(7, 11, 24, 255))
    
    # Mid Chamfer Housing (Deep Slate Titanium #1A233A)
    mid_box = [cx - int(kw*0.485), cy - int(kh*0.485) + int(8 * superscale),
               cx + int(kw*0.485), cy + int(kh*0.485) + int(8 * superscale)]
    k_draw.rounded_rectangle(mid_box, radius=rad_mid, fill=(24, 34, 56, 255))
    
    # Top Face Plate: Dark Obsidian Glass (#0D1527) with Subtle Gradient
    top_box = [cx - int(kw*0.44), cy - int(kh*0.44), cx + int(kw*0.44), cy + int(kh*0.44)]
    k_draw.rounded_rectangle(top_box, radius=rad_top, fill=(12, 19, 36, 255),
                             outline=(42, 58, 86, 255), width=max(2, int(3.5 * superscale)))
    
    # Top Specular Glint (Precision light reflection on top-left edge)
    k_draw.arc([top_box[0], top_box[1], top_box[2], top_box[1] + int(kh*0.35)], start=180, end=360,
               fill=(56, 189, 248, 210), width=max(2, int(3 * superscale)))
    k_draw.line([(top_box[0] + int(kw*0.12), top_box[1] + max(1, int(1.5*superscale))),
                 (top_box[0] + int(kw*0.32), top_box[1] + max(1, int(1.5*superscale)))],
                fill=(255, 255, 255, 230), width=max(2, int(2 * superscale)))
    
    # Inner Concave Dish Depression with ambient occlusion (#040712)
    dish_box = [cx - int(kw*0.37), cy - int(kh*0.37), cx + int(kw*0.37), cy + int(kh*0.37)]
    k_draw.rounded_rectangle(dish_box, radius=int(rad_top * 0.8), fill=(4, 7, 18, 255),
                             outline=(20, 30, 48, 255), width=max(1, int(1.5 * superscale)))
    
    # 3. Multi-Layer Volumetric Glowing Neon-Cyan/Mint Letter 'M'
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    font_size_m = int(kw * 0.54)
    font_m = ImageFont.truetype(f_bold, font_size_m)
    
    bbox_m = font_m.getbbox("M")
    mw = bbox_m[2] - bbox_m[0]
    mh = bbox_m[3] - bbox_m[1]
    mx = cx - mw // 2
    my = cy - mh // 2 - int(5 * superscale)
    
    # Wide Cyan Ambient Glow
    m_bloom_wide = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    mbw_draw = ImageDraw.Draw(m_bloom_wide)
    mbw_draw.text((mx, my), "M", fill=(0, 229, 255, 200), font=font_m)
    m_bloom_wide = m_bloom_wide.filter(ImageFilter.GaussianBlur(int(14 * superscale)))
    
    # Tight Intense Mint/Cyan Core Glow
    m_bloom_tight = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    mbt_draw = ImageDraw.Draw(m_bloom_tight)
    mbt_draw.text((mx, my), "M", fill=(0, 255, 190, 230), font=font_m)
    m_bloom_tight = m_bloom_tight.filter(ImageFilter.GaussianBlur(int(6 * superscale)))
    
    # Sharp Solid Core Neon Letter (Electric Cyan to Neon Mint)
    m_solid = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    ms_draw = ImageDraw.Draw(m_solid)
    ms_draw.text((mx, my), "M", fill=(0, 255, 225, 255), font=font_m)
    
    # Hot White Specular Center Line
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

def render_hyper_stunning_brand(superscale=3):
    W = 2800 * superscale
    H = 850 * superscale
    
    white_canvas = Image.new("RGBA", (W, H), (255, 255, 255, 255))
    trans_canvas = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    
    # Dimensions of the 1:1 square tactile keycap
    kw = int(290 * superscale)
    kh = int(290 * superscale)
    
    # Typography Setup (Font Science)
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    f_segoe = "C:/Windows/Fonts/segoeuib.ttf"
    
    font_word = ImageFont.truetype(f_bold, int(295 * superscale))
    font_tag = ImageFont.truetype(f_segoe, int(58 * superscale))
    
    ano_part = "ano"
    demy_part = "demy"
    
    bbox_ano = font_word.getbbox(ano_part)
    ano_w = bbox_ano[2] - bbox_ano[0]
    bbox_demy = font_word.getbbox(demy_part)
    demy_w = bbox_demy[2] - bbox_demy[0]
    
    # Exact Optical Kerning
    gap_btn_to_text = int(30 * superscale)
    total_content_w = kw + gap_btn_to_text + ano_w + demy_w
    
    start_x = (W - total_content_w) // 2
    center_y = H // 2 - int(38 * superscale)
    
    btn_cx = start_x + kw // 2
    btn_cy = center_y + int(6 * superscale)
    
    # Render 3D Keycap directly
    keycap_layer = draw_hyper_stunning_keycap(W, H, btn_cx, btn_cy, kw, kh, superscale)
    white_canvas = Image.alpha_composite(white_canvas, keycap_layer)
    trans_canvas = Image.alpha_composite(trans_canvas, keycap_layer)
    
    text_x = start_x + kw + gap_btn_to_text
    text_y = center_y - int(132 * superscale)
    
    # Render Typography with Gradient Science:
    # 1. "ano" Mask in Deep Space Obsidian (#0A1128)
    # 2. "demy" with Radiant Cyan-to-Mint-Emerald Gradient (#00E5FF to #00C87A to #00FFB2)
    
    # Prepare text layer
    text_layer = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    t_draw = ImageDraw.Draw(text_layer)
    
    # Draw "ano" in deep authoritative space navy
    t_draw.text((text_x, text_y), ano_part, fill=(10, 17, 40, 255), font=font_word)
    
    # For "demy", create a smooth gradient fill
    demy_x = text_x + ano_w
    demy_mask = Image.new("L", (W, H), 0)
    dm_draw = ImageDraw.Draw(demy_mask)
    dm_draw.text((demy_x, text_y), demy_part, fill=255, font=font_word)
    
    # Vibrant tech gradient for "demy"
    grad_demy = create_linear_gradient(W, H, (0, 200, 122, 255), (0, 230, 160, 255), direction="horizontal")
    # Mask gradient
    text_layer.paste(grad_demy, (0, 0), demy_mask)
    
    white_canvas = Image.alpha_composite(white_canvas, text_layer)
    trans_canvas = Image.alpha_composite(trans_canvas, text_layer)
    
    # 3. Holographic Gradient Energy Rail (Accent Underline)
    rail_y = text_y + int(312 * superscale)
    rail_h = int(12 * superscale)
    
    # Left Rail under [M]ano (Electric Neon Cyan #00E5FF to #00B4D8)
    rail_l_start = start_x + int(12 * superscale)
    rail_l_end = text_x + ano_w - int(14 * superscale)
    rail_l_w = rail_l_end - rail_l_start
    
    rail_l_grad = create_linear_gradient(rail_l_w, rail_h, (0, 229, 255, 255), (0, 180, 230, 255), direction="horizontal")
    mask_rail_l = Image.new("L", (rail_l_w, rail_h), 0)
    mrl_draw = ImageDraw.Draw(mask_rail_l)
    mrl_draw.rounded_rectangle([0, 0, rail_l_w, rail_h], radius=int(6 * superscale), fill=255)
    
    # Right Rail under 'demy' (Emerald to Mint #00C87A to #00FFB2)
    rail_r_start = text_x + ano_w
    rail_r_end = text_x + ano_w + demy_w
    rail_r_w = rail_r_end - rail_r_start
    
    rail_r_grad = create_linear_gradient(rail_r_w, rail_h, (0, 200, 122, 255), (0, 255, 178, 255), direction="horizontal")
    mask_rail_r = Image.new("L", (rail_r_w, rail_h), 0)
    mrr_draw = ImageDraw.Draw(mask_rail_r)
    mrr_draw.rounded_rectangle([0, 0, rail_r_w, rail_h], radius=int(6 * superscale), fill=255)
    
    # Paste Energy Rails with subtle glow
    for canvas in [white_canvas, trans_canvas]:
        canvas.paste(rail_l_grad, (rail_l_start, rail_y), mask_rail_l)
        canvas.paste(rail_r_grad, (rail_r_start, rail_y), mask_rail_r)
        
        # 4. Quantum Tagline Node & Swiss Typography
        draw = ImageDraw.Draw(canvas)
        tag_y = rail_y + int(44 * superscale)
        
        # Concentric Quantum Bullet (Emerald Core + Cyan Halo)
        dot_rad = int(16 * superscale)
        dot_cx = text_x + dot_rad
        dot_cy = tag_y + int(34 * superscale)
        
        # Outer Cyan Halo
        draw.ellipse([dot_cx - dot_rad, dot_cy - dot_rad, dot_cx + dot_rad, dot_cy + dot_rad], fill=(0, 200, 122, 255))
        # Inner Neon Core
        draw.ellipse([dot_cx - int(dot_rad*0.5), dot_cy - int(dot_rad*0.5),
                      dot_cx + int(dot_rad*0.5), dot_cy + int(dot_rad*0.5)], fill=(0, 255, 210, 255))
        
        # Tagline Text: "HANDS-ON EDTECH" in Refined Slate (#475569)
        tag_text = "HANDS-ON EDTECH"
        draw.text((dot_cx + dot_rad + int(22 * superscale), tag_y), tag_text, fill=(71, 85, 105, 255), font=font_tag)

    # 4. Final Lanczos Downscale
    final_white = white_canvas.resize((2800, 850), Image.Resampling.LANCZOS)
    final_trans = trans_canvas.resize((2800, 850), Image.Resampling.LANCZOS)
    
    # 1:1 Avatar Master (1200 x 1200)
    av_S = 1200 * superscale
    av_layer = draw_hyper_stunning_keycap(av_S, av_S, av_S // 2, av_S // 2, int(680 * superscale), int(680 * superscale), superscale)
    avatar_white = Image.new("RGBA", (av_S, av_S), (255, 255, 255, 255))
    avatar_white = Image.alpha_composite(avatar_white, av_layer)
    final_avatar = avatar_white.resize((1200, 1200), Image.Resampling.LANCZOS)
    
    return final_white, final_trans, final_avatar

def main():
    assets_dir = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets")
    art_dir = Path(r"C:\Users\deepa\.gemini\antigravity-ide\brain\a09e199c-322b-4925-b003-e1aebbe5d3bc")
    
    print("[1/2] Rendering Hyper-Stunning Master Brand Logo...")
    final_white, final_trans, final_avatar = render_hyper_stunning_brand(superscale=3)
    
    # Save Master Logo Files
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
    
    # Copy to artifacts
    final_white.save(art_dir / "manodemy_master_logo_white.png", "PNG")
    final_white.convert("RGB").save(art_dir / "manodemy_master_logo_white.jpg", "JPEG", quality=98)
    final_trans.save(art_dir / "manodemy_master_logo_transparent.png", "PNG")
    final_avatar.save(art_dir / "manodemy_master_avatar_1x1.png", "PNG")
    final_avatar.convert("RGB").save(art_dir / "manodemy_master_avatar_1x1.jpg", "JPEG", quality=98)
    
    print("[2/2] [SUCCESS] Hyper-Stunning Master Brand Logo Suite Generated Successfully!")

if __name__ == "__main__":
    main()
