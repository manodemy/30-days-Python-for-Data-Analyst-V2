import numpy as np
from PIL import Image, ImageDraw, ImageFont, ImageFilter
from pathlib import Path

def render_3d_keycap_white_icon():
    # Render at high-res 1600 x 1600 (Square 1:1 for Profile/Avatar)
    size = 1600
    canvas = Image.new("RGBA", (size, size), (255, 255, 255, 255))
    
    # Load the high-res 3D keycap emblem
    key_path = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets\manodemy_Logo.png")
    key_img = Image.open(key_path).convert("RGBA")
    w_k, h_k = key_img.size
    
    # Clean precision polygon extraction of the keycap
    mask = Image.new("L", (w_k, h_k), 0)
    m_draw = ImageDraw.Draw(mask)
    
    poly = [
        (int(w_k * 0.365), int(h_k * 0.268)),  # Top-left
        (int(w_k * 0.565), int(h_k * 0.235)),  # Top-right
        (int(w_k * 0.728), int(h_k * 0.565)),  # Right corner
        (int(w_k * 0.690), int(h_k * 0.748)),  # Bottom-right mist
        (int(w_k * 0.500), int(h_k * 0.770)),  # Switch base
        (int(w_k * 0.245), int(h_k * 0.748)),  # Bottom-left mist
        (int(w_k * 0.210), int(h_k * 0.520)),  # Left corner
    ]
    m_draw.polygon(poly, fill=255)
    mask = mask.filter(ImageFilter.GaussianBlur(3.0))
    
    arr = np.array(key_img, dtype=np.float32)
    r, g, b = arr[:, :, 0], arr[:, :, 1], arr[:, :, 2]
    max_c = np.maximum(np.maximum(r, g), b)
    
    poly_arr = np.array(mask, dtype=np.float32) / 255.0
    lum_alpha = np.clip((max_c - 10.0) / 18.0, 0.0, 1.0)
    final_alpha = (poly_arr * lum_alpha * 255.0).astype(np.uint8)
    
    clean_arr = np.dstack([r.astype(np.uint8), g.astype(np.uint8), b.astype(np.uint8), final_alpha])
    clean_key = Image.fromarray(clean_arr, mode="RGBA")
    bbox = clean_key.getbbox()
    if bbox:
        clean_key = clean_key.crop(bbox)
        
    # Scale to fill 68% of the square canvas
    target_dim = int(size * 0.70)
    aspect = clean_key.width / clean_key.height
    key_h = target_dim
    key_w = int(key_h * aspect)
    key_scaled = clean_key.resize((key_w, key_h), Image.Resampling.LANCZOS)
    
    kx = (size - key_w) // 2
    ky = (size - key_h) // 2 - 20
    
    # 1. Multi-tier Soft Studio Shadows on White
    shadow = Image.new("RGBA", (size, size), (0, 0, 0, 0))
    s_draw = ImageDraw.Draw(shadow)
    
    sc_x = kx + key_w // 2
    sc_y = ky + key_h - 20
    
    # Contact core shadow
    s_draw.ellipse([sc_x - 220, sc_y - 18, sc_x + 220, sc_y + 18], fill=(0, 0, 0, 100))
    # Mid contact drop shadow
    s_draw.ellipse([sc_x - 340, sc_y - 45, sc_x + 340, sc_y + 45], fill=(0, 0, 0, 45))
    # Wide ambient occlusion shadow
    s_draw.ellipse([sc_x - 460, sc_y - 80, sc_x + 460, sc_y + 80], fill=(0, 0, 0, 20))
    # Cyan neon ground bounce
    s_draw.ellipse([sc_x - 300, sc_y - 35, sc_x + 300, sc_y + 35], fill=(0, 230, 246, 30))
    # Purple secondary bounce
    s_draw.ellipse([sc_x - 240, sc_y - 25, sc_x + 240, sc_y + 25], fill=(168, 85, 247, 20))
    
    shadow = shadow.filter(ImageFilter.GaussianBlur(28))
    
    # 2. Subtle luxury radial vignette on the white studio background
    bg_vignette = Image.new("RGBA", (size, size), (255, 255, 255, 255))
    v_draw = ImageDraw.Draw(bg_vignette)
    for r_v in range(int(size * 0.7), int(size * 0.4), -20):
        alpha_v = int(12 * (1.0 - (r_v - size * 0.4) / (size * 0.3)))
        v_draw.ellipse([size//2 - r_v, size//2 - r_v, size//2 + r_v, size//2 + r_v], fill=(240, 244, 250, alpha_v))
    
    canvas = Image.alpha_composite(bg_vignette, shadow)
    canvas.paste(key_scaled, (kx, ky), key_scaled)
    
    # Output paths
    out_dir = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets")
    out_avatar_png = out_dir / "manodemy_3d_keycap_white_avatar_1x1.png"
    out_avatar_jpg = out_dir / "manodemy_3d_keycap_white_avatar_1x1.jpg"
    
    canvas.save(out_avatar_png, "PNG")
    canvas.convert("RGB").save(out_avatar_jpg, "JPEG", quality=98)
    
    # Copy to artifacts
    art_dir = Path(r"C:\Users\deepa\.gemini\antigravity-ide\brain\a09e199c-322b-4925-b003-e1aebbe5d3bc")
    canvas.save(art_dir / "manodemy_3d_keycap_white_avatar_1x1.png", "PNG")
    canvas.convert("RGB").save(art_dir / "manodemy_3d_keycap_white_avatar_1x1.jpg", "JPEG", quality=98)
    
    print("[SUCCESS] 3D Keycap White Studio Avatar (1:1) Created Successfully!")

if __name__ == "__main__":
    render_3d_keycap_white_icon()
