import math
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont, ImageFilter

def create_ultra_banner():
    width, height = 2560, 1440
    img = Image.new("RGBA", (width, height), (6, 9, 20, 255))

    # 1. Radiant Ambient Background Glows
    glow = Image.new("RGBA", (width, height), (0, 0, 0, 0))
    g_draw = ImageDraw.Draw(glow)

    # Left purple glow behind emblem
    cx1, cy1 = width * 0.28, height * 0.50
    for r in range(500, 0, -12):
        alpha = int(55 * (1 - r / 500))
        g_draw.ellipse([cx1 - r, cy1 - r, cx1 + r, cy1 + r], fill=(124, 58, 237, alpha))

    # Center-right cyan aura
    cx2, cy2 = width * 0.62, height * 0.50
    for r in range(550, 0, -12):
        alpha = int(48 * (1 - r / 550))
        g_draw.ellipse([cx2 - r, cy2 - r, cx2 + r, cy2 + r], fill=(0, 230, 246, alpha))

    # Top right electric blue
    cx3, cy3 = width * 0.85, height * 0.35
    for r in range(400, 0, -15):
        alpha = int(40 * (1 - r / 400))
        g_draw.ellipse([cx3 - r, cy3 - r, cx3 + r, cy3 + r], fill=(37, 99, 235, alpha))

    img = Image.alpha_composite(img, glow)

    # 2. Modern Cyber Grid Pattern
    grid = Image.new("RGBA", (width, height), (0, 0, 0, 0))
    grid_draw = ImageDraw.Draw(grid)
    for x in range(0, width, 75):
        grid_draw.line([(x, 0), (x, height)], fill=(255, 255, 255, 6), width=1)
    for y in range(0, height, 75):
        grid_draw.line([(y, 0), (width, y)], fill=(255, 255, 255, 6), width=1)
    img = Image.alpha_composite(img, grid)

    # Safe Zone: 1546 x 423 pixels in center
    safe_left = (width - 1546) // 2   # 507
    safe_top = (height - 423) // 2    # 508
    safe_right = safe_left + 1546     # 2053
    safe_bottom = safe_top + 423      # 931

    # Load Fonts
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    f_segoe = "C:/Windows/Fonts/segoeuib.ttf"
    
    font_title = ImageFont.truetype(f_bold, 88)
    font_sub = ImageFont.truetype(f_bold, 38)
    font_tag = ImageFont.truetype(f_segoe, 23)
    font_url = ImageFont.truetype(f_bold, 28)

    # 3. Process Emblem (Extract only the 3D Keycap Emblem)
    logo_path = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets\logo.png")
    if logo_path.exists():
        raw_logo = Image.open(logo_path).convert("RGBA")
        # Crop the left emblem (the 3D keyboard keycap)
        # raw logo size is roughly 500x500
        w_raw, h_raw = raw_logo.size
        # Crop ONLY the keycap emblem tightly (0 to 0.30 of width)
        emblem_crop = raw_logo.crop((0, int(h_raw * 0.12), int(w_raw * 0.28), int(h_raw * 0.88)))
        
        target_h = 240
        aspect = emblem_crop.width / emblem_crop.height
        target_w = int(target_h * aspect)
        emblem_img = emblem_crop.resize((target_w, target_h), Image.Resampling.LANCZOS)
        
        lx = safe_left + 90
        ly = safe_top + (423 - target_h) // 2 - 5
        
        # Emblem ambient aura
        emblem_glow = Image.new("RGBA", (width, height), (0, 0, 0, 0))
        eg_draw = ImageDraw.Draw(emblem_glow)
        for r in range(140, 0, -8):
            alpha = int(70 * (1 - r / 140))
            eg_draw.ellipse([lx + target_w//2 - r, ly + target_h//2 - r, lx + target_w//2 + r, ly + target_h//2 + r], fill=(0, 230, 246, alpha))
        img = Image.alpha_composite(img, emblem_glow)
        img.paste(emblem_img, (lx, ly), emblem_img)
        
        text_start_x = lx + target_w + 55
    else:
        text_start_x = safe_left + 120

    draw = ImageDraw.Draw(img)

    # 4. Main Title: MANODEMY
    ty = safe_top + 60
    draw.text((text_start_x, ty), "MANODEMY", fill=(255, 255, 255, 255), font=font_title)

    # Gradient Brand Bar
    draw.rounded_rectangle([text_start_x, ty + 102, text_start_x + 360, ty + 109], radius=3, fill=(0, 230, 246, 255))
    draw.rounded_rectangle([text_start_x + 372, ty + 102, text_start_x + 480, ty + 109], radius=3, fill=(168, 85, 247, 255))

    # 5. Subtitle: Master Data Analytics By Actually Coding
    sy = ty + 122
    draw.text((text_start_x, sy), "Master Data Analytics By Actually Coding", fill=(226, 232, 240, 255), font=font_sub)

    # 6. Tech Stack Badges (Clean Modern Pills)
    py = sy + 68
    badges = [
        ("60-DAY MASTERCLASS", (139, 92, 246)),
        ("SQL STUDIO", (6, 182, 212)),
        ("PYTHON", (234, 179, 8)),
        ("ADVANCED EXCEL", (16, 185, 129)),
        ("750+ INTERVIEW PROBLEMS", (244, 63, 94))
    ]

    curr_x = text_start_x
    for b_text, color in badges:
        bbox = font_tag.getbbox(b_text)
        bw = (bbox[2] - bbox[0]) + 26
        bh = (bbox[3] - bbox[1]) + 18

        # Badge backdrop
        b_layer = Image.new("RGBA", (width, height), (0, 0, 0, 0))
        b_draw = ImageDraw.Draw(b_layer)
        b_draw.rounded_rectangle([curr_x, py, curr_x + bw, py + bh], radius=8, fill=(color[0], color[1], color[2], 40), outline=(color[0], color[1], color[2], 210), width=1)
        img = Image.alpha_composite(img, b_layer)
        draw = ImageDraw.Draw(img)

        draw.text((curr_x + 13, py + 7), b_text, fill=(255, 255, 255, 245), font=font_tag)
        curr_x += bw + 14

    # 7. URL & Live Practice Callout
    uy = py + bh + 32
    draw.text((text_start_x, uy), "PRACTICE LIVE ON SQL SANDBOX  ->  WWW.MANODEMY.COM", fill=(0, 230, 246, 255), font=font_url)

    # 8. Save Outputs
    out_dir = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets")
    out_banner_png = out_dir / "manodemy_youtube_banner_2560x1440.png"
    out_banner_jpg = out_dir / "manodemy_youtube_banner_2560x1440.jpg"

    img.convert("RGB").save(out_banner_jpg, quality=98)
    img.save(out_banner_png, "PNG")

    # Copy to artifacts directory
    art_dir = Path(r"C:\Users\deepa\.gemini\antigravity-ide\brain\a09e199c-322b-4925-b003-e1aebbe5d3bc")
    img.convert("RGB").save(art_dir / "manodemy_youtube_banner.jpg", quality=98)
    img.save(art_dir / "manodemy_youtube_banner.png", "PNG")
    print("[SUCCESS] High-Definition YouTube Banner Generated Successfully!")

if __name__ == "__main__":
    create_ultra_banner()
