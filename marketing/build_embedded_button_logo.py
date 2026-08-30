import math
import numpy as np
from PIL import Image, ImageDraw, ImageFont, ImageFilter
from pathlib import Path

def get_clean_button_asset():
    btn_path = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets\manodemy_neo_keycap_white_1x1.png")
    btn_raw = Image.open(btn_path).convert("RGBA")
    
    arr = np.array(btn_raw)
    r, g, b, a = arr[:, :, 0], arr[:, :, 1], arr[:, :, 2], arr[:, :, 3]
    diff_from_white = 255.0 - np.minimum(np.minimum(r, g), b)
    content_alpha = np.clip(diff_from_white / 12.0, 0.0, 1.0) * 255.0
    content_alpha[r < 225] = 255.0
    
    arr_clean = np.dstack([r, g, b, content_alpha.astype(np.uint8)])
    btn_clean = Image.fromarray(arr_clean, mode="RGBA")
    
    bbox = btn_clean.getbbox()
    if bbox:
        btn_clean = btn_clean.crop(bbox)
    return btn_clean

def build_embedded_variant_a(btn_clean):
    # Variant A: [3D Button 'M'] + "anodemy" (Wordmark Integration)
    W, H = 2600, 750
    white_img = Image.new("RGBA", (W, H), (255, 255, 255, 255))
    trans_img = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    f_segoe = "C:/Windows/Fonts/segoeuib.ttf"
    
    font_word = ImageFont.truetype(f_bold, 255)
    font_tag = ImageFont.truetype(f_segoe, 52)
    
    ano_part = "ano"
    demy_part = "demy"
    
    bbox_ano = font_word.getbbox(ano_part)
    ano_w = bbox_ano[2] - bbox_ano[0]
    bbox_demy = font_word.getbbox(demy_part)
    demy_w = bbox_demy[2] - bbox_demy[0]
    
    target_btn_h = 280
    btn_aspect = btn_clean.width / btn_clean.height
    target_btn_w = int(target_btn_h * btn_aspect)
    btn_scaled = btn_clean.resize((target_btn_w, target_btn_h), Image.Resampling.LANCZOS)
    
    # Tight, elegant kerning
    gap = 4
    total_w = target_btn_w + gap + ano_w + demy_w
    start_x = (W - total_w) // 2
    
    btn_x = start_x
    text_y = (H - 255) // 2 - 30
    btn_y = text_y - 22
    
    white_img.paste(btn_scaled, (btn_x, btn_y), btn_scaled)
    trans_img.paste(btn_scaled, (btn_x, btn_y), btn_scaled)
    
    text_x = btn_x + target_btn_w + gap
    
    for canvas in [white_img, trans_img]:
        draw = ImageDraw.Draw(canvas)
        
        # "ano" (Deep Navy)
        draw.text((text_x, text_y), ano_part, fill=(12, 20, 40, 255), font=font_word)
        # "demy" (Vibrant Emerald Green)
        draw.text((text_x + ano_w, text_y), demy_part, fill=(0, 200, 122, 255), font=font_word)
        
        # Dual Accent Line under entire word
        line_y = text_y + 265
        bar_h = 10
        
        # Cyan bar spanning from under button to end of "ano"
        draw.rounded_rectangle([btn_x + 10, line_y, text_x + ano_w - 12, line_y + bar_h], radius=5, fill=(0, 229, 255, 255))
        # Green bar under "demy"
        draw.rounded_rectangle([text_x + ano_w, line_y, text_x + ano_w + demy_w, line_y + bar_h], radius=5, fill=(0, 200, 122, 255))
        
        # Tagline: "● HANDS-ON EDTECH"
        tag_y = line_y + 35
        dot_rad = 14
        dot_cx = text_x + dot_rad
        dot_cy = tag_y + 30
        draw.ellipse([dot_cx - dot_rad, dot_cy - dot_rad, dot_cx + dot_rad, dot_cy + dot_rad], fill=(0, 200, 122, 255))
        
        tag_text = "HANDS-ON EDTECH"
        draw.text((dot_cx + dot_rad + 20, tag_y), tag_text, fill=(84, 104, 132, 255), font=font_tag)
        
    return white_img, trans_img

def build_embedded_variant_b(btn_clean):
    # Variant B: Emblem on Left + Full "Manodemy" on Right + "HANDS-ON EDTECH"
    W, H = 2800, 800
    white_img = Image.new("RGBA", (W, H), (255, 255, 255, 255))
    trans_img = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    
    f_bold = "C:/Windows/Fonts/bahnschrift.ttf"
    f_segoe = "C:/Windows/Fonts/segoeuib.ttf"
    
    font_word = ImageFont.truetype(f_bold, 240)
    font_tag = ImageFont.truetype(f_segoe, 54)
    
    target_btn_h = 420
    btn_aspect = btn_clean.width / btn_clean.height
    target_btn_w = int(target_btn_h * btn_aspect)
    btn_scaled = btn_clean.resize((target_btn_w, target_btn_h), Image.Resampling.LANCZOS)
    
    mano_text = "Mano"
    demy_text = "demy"
    bbox_mano = font_word.getbbox(mano_text)
    mano_w = bbox_mano[2] - bbox_mano[0]
    bbox_demy = font_word.getbbox(demy_text)
    demy_w = bbox_demy[2] - bbox_demy[0]
    
    gap = 70
    total_w = target_btn_w + gap + mano_w + demy_w
    start_x = (W - total_w) // 2
    
    btn_x = start_x
    btn_y = (H - target_btn_h) // 2 - 5
    
    white_img.paste(btn_scaled, (btn_x, btn_y), btn_scaled)
    trans_img.paste(btn_scaled, (btn_x, btn_y), btn_scaled)
    
    text_x = btn_x + target_btn_w + gap
    text_y = (H - 240) // 2 - 40
    
    for canvas in [white_img, trans_img]:
        draw = ImageDraw.Draw(canvas)
        
        draw.text((text_x, text_y), mano_text, fill=(12, 20, 40, 255), font=font_word)
        draw.text((text_x + mano_w, text_y), demy_text, fill=(0, 200, 122, 255), font=font_word)
        
        line_y = text_y + 250
        bar_h = 10
        draw.rounded_rectangle([text_x, line_y, text_x + mano_w - 12, line_y + bar_h], radius=5, fill=(0, 229, 255, 255))
        draw.rounded_rectangle([text_x + mano_w, line_y, text_x + mano_w + demy_w, line_y + bar_h], radius=5, fill=(0, 200, 122, 255))
        
        tag_y = line_y + 35
        dot_rad = 15
        dot_cx = text_x + dot_rad
        dot_cy = tag_y + 32
        draw.ellipse([dot_cx - dot_rad, dot_cy - dot_rad, dot_cx + dot_rad, dot_cy + dot_rad], fill=(0, 200, 122, 255))
        
        tag_text = "HANDS-ON EDTECH"
        draw.text((dot_cx + dot_rad + 22, tag_y), tag_text, fill=(84, 104, 132, 255), font=font_tag)
        
    return white_img, trans_img

def main():
    btn_clean = get_clean_button_asset()
    
    out_dir = Path(r"D:\Learn Python in 60days\Manodemy_Web_V2\marketing\assets")
    art_dir = Path(r"C:\Users\deepa\.gemini\antigravity-ide\brain\a09e199c-322b-4925-b003-e1aebbe5d3bc")
    
    # Generate Variant A: [Button M] + anodemy
    white_a, trans_a = build_embedded_variant_a(btn_clean)
    white_a.save(out_dir / "manodemy_button_logo_embedded_white.png", "PNG")
    white_a.convert("RGB").save(out_dir / "manodemy_button_logo_embedded_white.jpg", "JPEG", quality=98)
    trans_a.save(out_dir / "manodemy_button_logo_embedded_trans.png", "PNG")
    
    white_a.save(art_dir / "manodemy_button_logo_embedded_white.png", "PNG")
    white_a.convert("RGB").save(art_dir / "manodemy_button_logo_embedded_white.jpg", "JPEG", quality=98)
    trans_a.save(art_dir / "manodemy_button_logo_embedded_trans.png", "PNG")
    
    # Generate Variant B: [Button M Emblem] + Manodemy Lockup
    white_b, trans_b = build_embedded_variant_b(btn_clean)
    white_b.save(out_dir / "manodemy_button_logo_lockup_white.png", "PNG")
    white_b.convert("RGB").save(out_dir / "manodemy_button_logo_lockup_white.jpg", "JPEG", quality=98)
    trans_b.save(out_dir / "manodemy_button_logo_lockup_trans.png", "PNG")
    
    white_b.save(art_dir / "manodemy_button_logo_lockup_white.png", "PNG")
    white_b.convert("RGB").save(art_dir / "manodemy_button_logo_lockup_white.jpg", "JPEG", quality=98)
    trans_b.save(art_dir / "manodemy_button_logo_lockup_trans.png", "PNG")
    
    print("[SUCCESS] Both Embedded Button Logo Flavors Generated Successfully!")

if __name__ == "__main__":
    main()
