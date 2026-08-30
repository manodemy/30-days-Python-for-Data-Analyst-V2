import numpy as np
from PIL import Image, ImageDraw, ImageFont, ImageFilter
from pathlib import Path

def extract_pure_keycap_crisp(keycap_path):
    img = Image.open(keycap_path).convert("RGBA")
    w, h = img.size
    arr = np.array(img, dtype=np.float32)
    r, g, b = arr[:, :, 0], arr[:, :, 1], arr[:, :, 2]
    
    # Precise geometric polygon tightly tracing the 3D keycap and mechanical base
    mask = Image.new("L", (w, h), 0)
    m_draw = ImageDraw.Draw(mask)
    
    poly_pts = [
        (int(w * 0.365), int(h * 0.272)),  # Top-left vertex
        (int(w * 0.565), int(h * 0.240)),  # Top-right vertex
        (int(w * 0.725), int(h * 0.565)),  # Right side vertex
        (int(w * 0.690), int(h * 0.745)),  # Bottom-right mist
        (int(w * 0.500), int(h * 0.765)),  # Mechanical switch base
        (int(w * 0.245), int(h * 0.745)),  # Bottom-left mist
        (int(w * 0.215), int(h * 0.525)),  # Left side vertex
    ]
    m_draw.polygon(poly_pts, fill=255)
    
    # Ultra-smooth subtle edge antialiasing
    mask = mask.filter(ImageFilter.GaussianBlur(2.5))
    
    poly_arr = np.array(mask, dtype=np.float32) / 255.0
    
    # Natural luminance transparency on the bottom mist particles
    max_c = np.maximum(np.maximum(r, g), b)
    lum_alpha = np.clip((max_c - 12.0) / 20.0, 0.0, 1.0)
    
    final_alpha = (poly_arr * lum_alpha * 255.0).astype(np.uint8)
    
    clean_arr = np.dstack([r.astype(np.uint8), g.astype(np.uint8), b.astype(np.uint8), final_alpha])
    clean_img = Image.fromarray(clean_arr, mode="RGBA")
    
    bbox = clean_img.getbbox()
    if bbox:
        clean_img = clean_img.crop(bbox)
        
    return clean_img

def build_perfect_brand_logo():
    keycap_path = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets\manodemy_Logo.png")
    keycap = extract_pure_keycap_crisp(keycap_path)
    
    # Target Resolution: 2400 x 720
    W, H = 2400, 720
    white_img = Image.new("RGBA", (W, H), (255, 255, 255, 255))
    
    # Keycap sizing
    target_key_h = 470
    aspect = keycap.width / keycap.height
    target_key_w = int(target_key_h * aspect)
    key_resized = keycap.resize((target_key_w, target_key_h), Image.Resampling.LANCZOS)
    
    kx = 120
    ky = (H - target_key_h) // 2 - 5
    
    # Soft realistic ground contact shadow on white
    shadow = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    s_draw = ImageDraw.Draw(shadow)
    
    sc_x = kx + target_key_w // 2
    sc_y = ky + target_key_h - 10
    
    # Realistic contact shadow
    s_draw.ellipse([sc_x - 130, sc_y - 10, sc_x + 130, sc_y + 10], fill=(0, 0, 0, 85))
    s_draw.ellipse([sc_x - 200, sc_y - 22, sc_x + 200, sc_y + 22], fill=(0, 0, 0, 35))
    s_draw.ellipse([sc_x - 160, sc_y - 15, sc_x + 160, sc_y + 15], fill=(0, 230, 246, 25))
    shadow = shadow.filter(ImageFilter.GaussianBlur(12))
    
    white_img = Image.alpha_composite(white_img, shadow)
    white_img.paste(key_resized, (kx, ky), key_resized)
    
    # Typography
    draw = ImageDraw.Draw(white_img)
    
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    f_segoe = "C:/Windows/Fonts/segoeuib.ttf"
    
    font_main = ImageFont.truetype(f_bold, 225)
    font_tag = ImageFont.truetype(f_segoe, 54)
    
    text_x = kx + target_key_w + 75
    text_y = ky + 35
    
    mano_text = "Mano"
    demy_text = "demy"
    
    # Draw "Mano" in dark navy (#0b1226)
    draw.text((text_x, text_y), mano_text, fill=(11, 18, 38, 255), font=font_main)
    
    bbox_mano = font_main.getbbox(mano_text)
    mano_w = bbox_mano[2] - bbox_mano[0]
    
    # Draw "demy" in vibrant emerald green (#00c87a)
    draw.text((text_x + mano_w, text_y), demy_text, fill=(0, 197, 122, 255), font=font_main)
    
    # Tagline: "● HANDS-ON EDTECH"
    tag_y = text_y + 230
    
    # Solid geometric green dot
    dot_radius = 16
    dot_cx = text_x + dot_radius + 4
    dot_cy = tag_y + 32
    draw.ellipse([dot_cx - dot_radius, dot_cy - dot_radius, dot_cx + dot_radius, dot_cy + dot_radius], fill=(0, 197, 122, 255))
    
    # Tagline text in modern slate (#546884)
    tag_text = "HANDS-ON EDTECH"
    draw.text((dot_cx + dot_radius + 24, tag_y), tag_text, fill=(84, 104, 132, 255), font=font_tag)
    
    # Save Outputs
    out_dir = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets")
    out_png = out_dir / "manodemy_logo_white_bg.png"
    out_jpg = out_dir / "manodemy_logo_white_bg.jpg"
    
    white_img.save(out_png, "PNG")
    white_img.convert("RGB").save(out_jpg, "JPEG", quality=98)
    
    # Transparent PNG
    trans_img = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    trans_img.paste(key_resized, (kx, ky), key_resized)
    t_draw = ImageDraw.Draw(trans_img)
    t_draw.text((text_x, text_y), mano_text, fill=(11, 18, 38, 255), font=font_main)
    t_draw.text((text_x + mano_w, text_y), demy_text, fill=(0, 197, 122, 255), font=font_main)
    t_draw.ellipse([dot_cx - dot_radius, dot_cy - dot_radius, dot_cx + dot_radius, dot_cy + dot_radius], fill=(0, 197, 122, 255))
    t_draw.text((dot_cx + dot_radius + 24, tag_y), tag_text, fill=(84, 104, 132, 255), font=font_tag)
    
    trans_png = out_dir / "manodemy_logo_transparent.png"
    trans_img.save(trans_png, "PNG")
    
    # Copy to artifacts
    art_dir = Path(r"C:\Users\deepa\.gemini\antigravity-ide\brain\a09e199c-322b-4925-b003-e1aebbe5d3bc")
    white_img.save(art_dir / "manodemy_logo_white_bg.png", "PNG")
    white_img.convert("RGB").save(art_dir / "manodemy_logo_white_bg.jpg", "JPEG", quality=98)
    trans_img.save(art_dir / "manodemy_logo_transparent.png", "PNG")
    
    print("[SUCCESS] Razor-sharp Manodemy White Background Logo Created!")

if __name__ == "__main__":
    build_perfect_brand_logo()
