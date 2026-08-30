import math
import numpy as np
from PIL import Image, ImageDraw, ImageFont, ImageFilter
from pathlib import Path

def draw_antialiased_polygon(draw, points, fill_color):
    draw.polygon(points, fill=fill_color)

def render_concept1_prism_m(superscale=3):
    # Base size 1200x1200, superscaled to 3600x3600 for razor-sharp antialiasing
    S = 1200 * superscale
    img = Image.new("RGBA", (S, S), (255, 255, 255, 255))
    
    # Coordinates centered
    cx, cy = S // 2, S // 2 - int(40 * superscale)
    
    # 1. Soft Multi-Tier Studio Shadows
    shadow = Image.new("RGBA", (S, S), (0, 0, 0, 0))
    s_draw = ImageDraw.Draw(shadow)
    
    sh_y = cy + int(290 * superscale)
    # Core contact shadow
    s_draw.ellipse([cx - int(240 * superscale), sh_y - int(22 * superscale),
                    cx + int(240 * superscale), sh_y + int(22 * superscale)], fill=(15, 23, 42, 75))
    # Mid diffused shadow
    s_draw.ellipse([cx - int(380 * superscale), sh_y - int(45 * superscale),
                    cx + int(380 * superscale), sh_y + int(45 * superscale)], fill=(30, 41, 59, 38))
    # Wide ambient shadow
    s_draw.ellipse([cx - int(480 * superscale), sh_y - int(75 * superscale),
                    cx + int(480 * superscale), sh_y + int(75 * superscale)], fill=(71, 85, 105, 18))
    # Soft Cyan/Violet ground bounce
    s_draw.ellipse([cx - int(300 * superscale), sh_y - int(35 * superscale),
                    cx + int(300 * superscale), sh_y + int(35 * superscale)], fill=(0, 229, 255, 30))
    
    blur_rad = int(32 * superscale)
    shadow = shadow.filter(ImageFilter.GaussianBlur(blur_rad))
    img = Image.alpha_composite(img, shadow)
    
    # 2. Render Modern Isometric 3D "M" Prism Geometry
    # The M is composed of 4 interlocking dimensional pillars/facets with glowing gradient
    prism_layer = Image.new("RGBA", (S, S), (0, 0, 0, 0))
    p_draw = ImageDraw.Draw(prism_layer)
    
    # Parameters
    w_pillar = int(95 * superscale)
    h_pillar = int(380 * superscale)
    gap = int(22 * superscale)
    slant_y = int(140 * superscale)
    depth_x = int(60 * superscale)
    depth_y = int(35 * superscale)
    
    # Pillar 1 (Left-most vertical)
    p1_x = cx - int(240 * superscale)
    p1_y = cy - int(190 * superscale)
    
    # Left Face (Dark Navy Gradient #0F172A to #1E293B)
    pts_p1_left = [
        (p1_x, p1_y + depth_y),
        (p1_x, p1_y + h_pillar + depth_y),
        (p1_x + depth_x, p1_y + h_pillar),
        (p1_x + depth_x, p1_y)
    ]
    # Front Face (Vibrant Electric Cyan to Deep Royal Blue Gradient)
    pts_p1_front = [
        (p1_x + depth_x, p1_y),
        (p1_x + depth_x, p1_y + h_pillar),
        (p1_x + depth_x + w_pillar, p1_y + h_pillar),
        (p1_x + depth_x + w_pillar, p1_y)
    ]
    # Top Face (Pure Reflective Bright Highlight)
    pts_p1_top = [
        (p1_x, p1_y + depth_y),
        (p1_x + depth_x, p1_y),
        (p1_x + depth_x + w_pillar, p1_y),
        (p1_x + w_pillar, p1_y + depth_y)
    ]
    
    # Pillar 4 (Right-most vertical)
    p4_x = cx + int(145 * superscale)
    p4_y = p1_y
    pts_p4_left = [
        (p4_x, p4_y + depth_y),
        (p4_x, p4_y + h_pillar + depth_y),
        (p4_x + depth_x, p4_y + h_pillar),
        (p4_x + depth_x, p4_y)
    ]
    pts_p4_front = [
        (p4_x + depth_x, p4_y),
        (p4_x + depth_x, p4_y + h_pillar),
        (p4_x + depth_x + w_pillar, p4_y + h_pillar),
        (p4_x + depth_x + w_pillar, p4_y)
    ]
    pts_p4_top = [
        (p4_x, p4_y + depth_y),
        (p4_x + depth_x, p4_y),
        (p4_x + depth_x + w_pillar, p4_y),
        (p4_x + w_pillar, p4_y + depth_y)
    ]

    # Center V-Slants for "M"
    # Left diagonal downward
    diag1_top_l = (p1_x + depth_x + w_pillar, p1_y)
    diag1_bot = (cx + int(depth_x * 0.5), cy + int(110 * superscale))
    diag1_top_r = (cx + int(depth_x * 0.5) + int(w_pillar * 0.9), cy + int(110 * superscale) - int(60 * superscale))
    diag1_mid_l = (p1_x + depth_x + w_pillar, p1_y + int(90 * superscale))
    
    # Right diagonal downward
    diag2_top_r = (p4_x + depth_x, p4_y)
    diag2_bot = diag1_bot
    diag2_top_l = (cx + int(depth_x * 0.5) - int(w_pillar * 0.9), cy + int(110 * superscale) - int(60 * superscale))
    diag2_mid_r = (p4_x + depth_x, p4_y + int(90 * superscale))

    # Draw dimensional geometric elements with rich tailored colors:
    # 1. Left Pillar
    p_draw.polygon(pts_p1_left, fill=(15, 23, 42, 255))        # Midnight Slate #0F172A
    p_draw.polygon(pts_p1_front, fill=(0, 200, 255, 255))      # Electric Cyan #00C8FF
    p_draw.polygon(pts_p1_top, fill=(210, 245, 255, 255))      # Top Highlight

    # 2. Right Pillar
    p_draw.polygon(pts_p4_left, fill=(99, 102, 241, 255))      # Royal Indigo #6366F1
    p_draw.polygon(pts_p4_front, fill=(124, 58, 237, 255))     # Vivid Purple #7C3AED
    p_draw.polygon(pts_p4_top, fill=(235, 225, 255, 255))      # Top Highlight

    # 3. Left Diagonal V-Beam
    p_draw.polygon([diag1_top_l, (p1_x + depth_x + w_pillar, p1_y + h_pillar - int(120 * superscale)), diag1_bot, (diag1_bot[0] - int(w_pillar*0.8), diag1_bot[1])], fill=(0, 160, 240, 255))
    p_draw.polygon([diag1_top_l, diag1_bot, (diag1_bot[0], diag1_bot[1] - int(60*superscale)), (diag1_top_l[0], diag1_top_l[1] + int(40*superscale))], fill=(0, 229, 255, 255))

    # 4. Right Diagonal V-Beam
    p_draw.polygon([diag2_top_r, (p4_x + depth_x, p4_y + h_pillar - int(120 * superscale)), diag2_bot, (diag2_bot[0] + int(w_pillar*0.8), diag2_bot[1])], fill=(109, 40, 217, 255))
    p_draw.polygon([diag2_top_r, diag2_bot, (diag2_bot[0], diag2_bot[1] - int(60*superscale)), (diag2_top_r[0], diag2_top_r[1] + int(40*superscale))], fill=(139, 92, 246, 255))

    # Central Core Glowing Diamond/Node at the apex of "M"
    apex_cx, apex_cy = diag1_bot[0], diag1_bot[1] - int(30 * superscale)
    rad_node = int(42 * superscale)
    p_draw.ellipse([apex_cx - rad_node, apex_cy - rad_node, apex_cx + rad_node, apex_cy + rad_node], fill=(0, 255, 200, 255), outline=(255, 255, 255, 255), width=int(4*superscale))

    img = Image.alpha_composite(img, prism_layer)

    # 3. Super-Sampled High Quality Downscale
    final_img = img.resize((1200, 1200), Image.Resampling.LANCZOS)
    return final_img

def build_worldclass_horizontal_brand(emblem_img):
    W, H = 2800, 800
    canvas = Image.new("RGBA", (W, H), (255, 255, 255, 255))
    
    # Scale emblem to 560x560
    emblem_scaled = emblem_img.resize((560, 560), Image.Resampling.LANCZOS)
    ex = 140
    ey = (H - 560) // 2
    
    canvas.paste(emblem_scaled, (ex, ey), emblem_scaled)
    draw = ImageDraw.Draw(canvas)
    
    # Fonts
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    f_segoe = "C:/Windows/Fonts/segoeuib.ttf"
    
    font_main = ImageFont.truetype(f_bold, 215)
    font_sub = ImageFont.truetype(f_segoe, 46)
    font_tag = ImageFont.truetype(f_bold, 32)
    
    tx = ex + 560 + 80
    ty = ey + 75
    
    # Wordmark: MANODEMY in ultra-crisp modern styling
    # "MANO" in Deep Obsidian Navy (#0B1120) + "DEMY" in Electric Cyan-to-Indigo (#00B4D8 / #0077B6 / #7C3AED)
    draw.text((tx, ty), "MANO", fill=(11, 17, 32, 255), font=font_main)
    bbox_mano = font_main.getbbox("MANO")
    mano_w = bbox_mano[2] - bbox_mano[0]
    
    draw.text((tx + mano_w + 10, ty), "DEMY", fill=(0, 180, 216, 255), font=font_main)
    
    # Sleek Gradient Accent Line under Wordmark
    line_y = ty + 215
    draw.rounded_rectangle([tx, line_y, tx + 480, line_y + 10], radius=5, fill=(0, 200, 255, 255))
    draw.rounded_rectangle([tx + 495, line_y, tx + 680, line_y + 10], radius=5, fill=(124, 58, 237, 255))
    
    # Subtitle: LEARN DATA ANALYTICS BY ACTUALLY CODING
    sy = line_y + 35
    draw.text((tx, sy), "LEARN DATA ANALYTICS BY ACTUALLY CODING", fill=(71, 85, 105, 255), font=font_sub)
    
    # Tech Stack Tags (SQL • PYTHON • EXCEL • INTERVIEW SANDBOX)
    tag_y = sy + 75
    tags = [
        ("SQL STUDIO", (6, 182, 212)),
        ("PYTHON", (234, 179, 8)),
        ("EXCEL", (16, 185, 129)),
        ("750+ PROBLEMS", (244, 63, 94))
    ]
    
    curr_tx = tx
    for t_name, col in tags:
        bbox_t = font_tag.getbbox(t_name)
        tw = (bbox_t[2] - bbox_t[0]) + 28
        th = (bbox_t[3] - bbox_t[1]) + 18
        
        # Pill outline
        draw.rounded_rectangle([curr_tx, tag_y, curr_tx + tw, tag_y + th], radius=8,
                               fill=(col[0], col[1], col[2], 18),
                               outline=(col[0], col[1], col[2], 180), width=2)
        draw.text((curr_tx + 14, tag_y + 7), t_name, fill=(30, 41, 59, 255), font=font_tag)
        curr_tx += tw + 18
        
    return canvas

def generate_all():
    print("[1/2] Rendering Concept 1: Isometric 3D Prism Emblem (Square 1:1)...")
    emblem_1x1 = render_concept1_prism_m(superscale=3)
    
    out_dir = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets")
    out_dir.mkdir(parents=True, exist_ok=True)
    
    emblem_1x1_png = out_dir / "manodemy_worldclass_emblem_1x1.png"
    emblem_1x1_jpg = out_dir / "manodemy_worldclass_emblem_1x1.jpg"
    emblem_1x1.save(emblem_1x1_png, "PNG")
    emblem_1x1.convert("RGB").save(emblem_1x1_jpg, "JPEG", quality=98)
    
    print("[2/2] Rendering Concept 1: Full Horizontal Brand Lockup on Pure White (2800x800)...")
    brand_horiz = build_worldclass_horizontal_brand(emblem_1x1)
    
    brand_png = out_dir / "manodemy_worldclass_brand_white_bg.png"
    brand_jpg = out_dir / "manodemy_worldclass_brand_white_bg.jpg"
    brand_horiz.save(brand_png, "PNG")
    brand_horiz.convert("RGB").save(brand_jpg, "JPEG", quality=98)
    
    # Copy to artifacts
    art_dir = Path(r"C:\Users\deepa\.gemini\antigravity-ide\brain\a09e199c-322b-4925-b003-e1aebbe5d3bc")
    emblem_1x1.save(art_dir / "manodemy_worldclass_emblem_1x1.png", "PNG")
    emblem_1x1.convert("RGB").save(art_dir / "manodemy_worldclass_emblem_1x1.jpg", "JPEG", quality=98)
    brand_horiz.save(art_dir / "manodemy_worldclass_brand_white_bg.png", "PNG")
    brand_horiz.convert("RGB").save(art_dir / "manodemy_worldclass_brand_white_bg.jpg", "JPEG", quality=98)
    
    print("[SUCCESS] All World-Class White Background Brand Assets Generated Successfully!")

if __name__ == "__main__":
    generate_all()
