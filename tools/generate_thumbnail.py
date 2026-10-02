import os
import math

from PIL import Image, ImageDraw, ImageFilter, ImageFont

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
RES = os.path.join(ROOT, "Resources")
os.makedirs(RES, exist_ok=True)

TEAL_DARK = (0, 107, 151)
TEAL = (13, 141, 184)
TEAL_MID = (31, 163, 204)
AQUA = (90, 200, 232)
AQUA_LIGHT = (168, 233, 247)
NAVY = (27, 42, 74)
GOLD = (245, 185, 60)
GOLD_LIGHT = (255, 214, 120)
CREAM = (233, 219, 206)
SAND = (246, 233, 214)
FACE = (247, 241, 230)
CORAL = (255, 138, 138)
GREEN = (72, 168, 107)
BROWN = (150, 111, 74)
WHITE = (255, 255, 255)

def lerp(a, b, t):
    return tuple(int(a[i] + (b[i] - a[i]) * t) for i in range(3))

def gradient(draw, S, c_top, c_bot, y0, y1):
    y0, y1 = int(y0), int(y1)
    for y in range(y0, y1):
        t = (y - y0) / max(1.0, float(y1 - y0 - 1))
        draw.line([(0, y), (S, y)], fill=lerp(c_top, c_bot, t) + (255,))

def glow_layer(S, center, radius, color, alpha):
    # Blur a grayscale mask so the glow keeps its pure color (avoids the dark
    # fringe caused by transparent black pixels bleeding into a Gaussian blur).
    mask = Image.new("L", (S, S), 0)
    md = ImageDraw.Draw(mask)
    md.ellipse([center[0] - radius, center[1] - radius, center[0] + radius, center[1] + radius], fill=255)
    mask = mask.filter(ImageFilter.GaussianBlur(max(1.0, radius * 0.45)))
    if alpha != 255:
        mask = mask.point(lambda v: int(v * alpha / 255.0))
    layer = Image.new("RGBA", (S, S), color + (0,))
    layer.putalpha(mask)
    return layer

def draw_scene(S, with_text=True):
    img = Image.new("RGBA", (S, S), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    gradient(d, S, (168, 233, 247), (63, 177, 216), 0, 0.60 * S)
    gradient(d, S, (47, 166, 201), (30, 143, 181), 0.60 * S, 0.76 * S)
    gradient(d, S, (246, 233, 214), (233, 219, 206), 0.76 * S, S)
    img.alpha_composite(glow_layer(S, (0.5 * S, 0.30 * S), 0.26 * S, (255, 210, 120), 210))
    for fx, fy, fr in [(0.16, 0.18, 0.008), (0.84, 0.14, 0.010), (0.12, 0.42, 0.006), (0.88, 0.38, 0.007), (0.26, 0.09, 0.005), (0.74, 0.22, 0.006)]:
        img.alpha_composite(glow_layer(S, (fx * S, fy * S), fr * S, WHITE, 230))
    d.ellipse([0.20 * S, 0.74 * S, 0.80 * S, 0.98 * S], fill=CREAM + (255,))
    for wy in (0.63, 0.66, 0.69, 0.72):
        d.line([(0.06 * S, wy * S), (0.24 * S, wy * S)], fill=AQUA_LIGHT + (140,), width=int(0.006 * S))
        d.line([(0.72 * S, wy * S), (0.94 * S, wy * S)], fill=AQUA_LIGHT + (140,), width=int(0.006 * S))
    bw, bh = 0.16 * S, 0.20 * S
    bx0, by0 = 0.10 * S, 0.70 * S
    d.rounded_rectangle([bx0, by0, bx0 + bw, by0 + bh], radius=0.02 * S, fill=WHITE + (255,), outline=TEAL_DARK + (255,), width=int(0.004 * S))
    d.rounded_rectangle([bx0 + 0.015 * S, by0 - 0.03 * S, bx0 + bw - 0.015 * S, by0 + 0.03 * S], radius=0.015 * S, fill=TEAL + (255,))
    for wx in (0.035, 0.07, 0.105):
        d.rounded_rectangle([bx0 + wx * S, by0 + 0.05 * S, bx0 + wx * S + 0.03 * S, by0 + 0.095 * S], radius=0.006 * S, fill=AQUA + (255,))
    d.rounded_rectangle([bx0 + 0.062 * S, by0 + 0.12 * S, bx0 + 0.098 * S, by0 + bh - 0.01 * S], radius=0.008 * S, fill=NAVY + (255,))
    px, py = 0.86 * S, 0.80 * S
    d.line([(px, py), (px + 0.02 * S, py - 0.11 * S)], fill=BROWN + (255,), width=int(0.015 * S))
    for i in range(6):
        ang = -3.14159 + i * 0.55
        x1 = px + 0.06 * S * math.cos(ang)
        y1 = py - 0.11 * S + 0.06 * S * math.sin(ang)
        x2 = px + 0.12 * S * math.cos(ang)
        y2 = py - 0.11 * S + 0.12 * S * math.sin(ang)
        d.line([(x1, y1), (x2, y2)], fill=GREEN + (255,), width=int(0.016 * S))
    d.ellipse([px - 0.03 * S, py - 0.01 * S, px + 0.05 * S, py + 0.03 * S], fill=BROWN + (255,))
    cx, cy = 0.5 * S, 0.40 * S
    rbw, rbh = 0.30 * S, 0.30 * S
    bx0 = cx - rbw / 2
    by0 = cy - rbh / 2
    bx1 = cx + rbw / 2
    by1 = cy + rbh / 2
    img.alpha_composite(glow_layer(S, (cx, 0.60 * S), 0.19 * S, (255, 214, 120), 150))
    d.rounded_rectangle([bx0, by0, bx1, by1], radius=0.06 * S, fill=TEAL + (255,), outline=NAVY + (255,), width=int(0.006 * S))
    d.rounded_rectangle([bx0 + 0.02 * S, by0 + 0.015 * S, bx1 - 0.02 * S, by0 + 0.07 * S], radius=0.03 * S, fill=TEAL_MID + (255,))
    pod_w, pod_h = 0.055 * S, 0.10 * S
    for side in (-1, 1):
        p0 = (cx - rbw / 2 - 0.035 * S) if side == -1 else (cx + rbw / 2 + 0.035 * S - pod_w)
        py0 = cy - pod_h / 2
        d.rounded_rectangle([p0, py0, p0 + pod_w, py0 + pod_h], radius=0.02 * S, fill=TEAL_DARK + (255,))
        capx = p0 if side == -1 else p0 + pod_w - 0.013 * S
        d.rounded_rectangle([capx, py0 + 0.012 * S, capx + 0.013 * S, py0 + pod_h - 0.012 * S], radius=0.006 * S, fill=GOLD + (255,))
    d.line([(cx, by0), (cx, cy - 0.23 * S)], fill=NAVY + (255,), width=int(0.016 * S))
    tip = (cx, cy - 0.23 * S)
    img.alpha_composite(glow_layer(S, tip, 0.055 * S, GOLD, 210))
    d.ellipse([tip[0] - 0.028 * S, tip[1] - 0.028 * S, tip[0] + 0.028 * S, tip[1] + 0.028 * S], fill=GOLD + (255,), outline=WHITE + (255,), width=int(0.005 * S))
    fx0, fy0 = 0.39 * S, 0.30 * S
    fx1, fy1 = 0.61 * S, 0.47 * S
    d.rounded_rectangle([fx0, fy0, fx1, fy1], radius=0.05 * S, fill=FACE + (255,))
    eye_y = fy0 + 0.02 * S
    eye_h = 0.055 * S
    d.rounded_rectangle([cx - 0.075 * S, eye_y, cx - 0.028 * S, eye_y + eye_h], radius=0.018 * S, fill=NAVY + (255,))
    d.rounded_rectangle([cx + 0.028 * S, eye_y, cx + 0.075 * S, eye_y + eye_h], radius=0.018 * S, fill=NAVY + (255,))
    for hx in (cx - 0.06 * S, cx + 0.043 * S):
        d.ellipse([hx, eye_y + 0.012 * S, hx + 0.016 * S, eye_y + 0.028 * S], fill=WHITE + (255,))
    for chx in (cx - 0.135 * S, cx + 0.135 * S):
        d.ellipse([chx - 0.018 * S, fy0 + 0.075 * S, chx + 0.018 * S, fy0 + 0.105 * S], fill=CORAL + (120,))
    d.arc([0.44 * S, 0.375 * S, 0.56 * S, 0.46 * S], start=20, end=160, fill=NAVY + (255,), width=int(0.011 * S))
    core_c = (cx, 0.505 * S)
    core_r = 0.035 * S
    img.alpha_composite(glow_layer(S, core_c, core_r * 2.2, GOLD, 175))
    d.ellipse([core_c[0] - core_r, core_c[1] - core_r, core_c[0] + core_r, core_c[1] + core_r], fill=GOLD + (255,), outline=WHITE + (255,), width=int(0.008 * S))
    d.ellipse([core_c[0] - core_r * 0.5, core_c[1] - core_r * 0.5, core_c[0] + core_r * 0.5, core_c[1] + core_r * 0.5], fill=GOLD_LIGHT + (255,))
    for tx in (cx - 0.10 * S, cx + 0.10 * S):
        d.ellipse([tx - 0.014 * S, by1 - 0.02 * S, tx + 0.014 * S, by1 + 0.006 * S], fill=GOLD + (255,), outline=WHITE + (255,), width=int(0.003 * S))
    if with_text:
        title = "AI ISLAND ACADEMY"
        fpath = r"C:\Windows\Fonts\bahnschrift.ttf"
        if not os.path.exists(fpath):
            fpath = r"C:\Windows\Fonts\arialbd.ttf"
        size = int(0.075 * S)
        while size > 20:
            font = ImageFont.truetype(fpath, size)
            bb = d.textbbox((0, 0), title, font=font, stroke_width=int(0.008 * S))
            if bb[2] - bb[0] <= 0.80 * S:
                break
            size -= int(size * 0.05)
        font = ImageFont.truetype(fpath, size)
        bb = d.textbbox((0, 0), title, font=font, stroke_width=int(0.008 * S))
        tw = bb[2] - bb[0]
        th = bb[3] - bb[1]
        tx = (S - tw) / 2 - bb[0]
        ty = 0.055 * S - bb[1]
        d.text((tx, ty), title, font=font, fill=NAVY + (255,), stroke_width=int(0.008 * S), stroke_fill=WHITE + (255,))
        uy = ty + th + 0.012 * S
        d.rounded_rectangle([0.5 * S - 0.10 * S, uy, 0.5 * S + 0.10 * S, uy + 0.009 * S], radius=0.0045 * S, fill=GOLD + (255,))
    return img

def main():
    M = 4096
    key = draw_scene(M, with_text=True).convert("RGB").resize((2048, 2048), Image.LANCZOS)
    key_path = os.path.join(RES, "KeyArt.png")
    key.save(key_path)
    icon = draw_scene(M, with_text=False).convert("RGBA").resize((128, 128), Image.LANCZOS)
    icon_path = os.path.join(RES, "Icon128.png")
    icon.save(icon_path)
    print("wrote", key_path, key.size, key.mode)
    print("wrote", icon_path, icon.size, icon.mode)

if __name__ == "__main__":
    main()
