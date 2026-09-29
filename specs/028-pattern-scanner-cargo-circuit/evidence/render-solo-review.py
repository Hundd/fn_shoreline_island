"""Approximate offline raster for geometry/text review; not a browser or game render.

Dashed strokes render solid and SVG arrowheads/opacity are omitted.
The generated SVG/HTML remain the authoritative preview.
"""
from pathlib import Path
import xml.etree.ElementTree as ET
from PIL import Image, ImageDraw, ImageFont

feature = Path(__file__).resolve().parent.parent
root = ET.fromstring((feature / 'generated/preview.svg').read_text(encoding='utf-8'))
_, _, width, height = map(float, root.attrib['viewBox'].split())
scale = 2
im = Image.new('RGB', (int(width * scale), int(height * scale)), 'white')
draw = ImageDraw.Draw(im)

def color(value, default):
    return default if not value or value == 'none' else value

for element in root.iter():
    tag = element.tag.split('}')[-1]
    a = element.attrib
    if tag == 'rect':
        x, y = float(a.get('x', 0))*scale, float(a.get('y', 0))*scale
        draw.rectangle((x, y, x+float(a['width'])*scale, y+float(a['height'])*scale),
                       fill=color(a.get('fill'), 'white'), outline=color(a.get('stroke'), None), width=2)
    elif tag == 'circle':
        x, y, r = [float(a[k])*scale for k in ('cx', 'cy', 'r')]
        draw.ellipse((x-r, y-r, x+r, y+r), fill=color(a.get('fill'), 'black'),
                     outline=color(a.get('stroke'), None), width=2)
    elif tag == 'polyline':
        points = [tuple(float(v)*scale for v in s.split(',')) for s in a['points'].split()]
        draw.line(points, fill=color(a.get('stroke'), 'black'), width=int(float(a.get('stroke-width', 1))*scale))
    elif tag == 'line':
        draw.line(tuple(float(a[k])*scale for k in ('x1', 'y1', 'x2', 'y2')),
                  fill=color(a.get('stroke'), 'black'), width=2)
    elif tag == 'text':
        label = ''.join(element.itertext())
        bold = a.get('class') == 'zone'
        font = ImageFont.truetype('C:/Windows/Fonts/' + ('arialbd.ttf' if bold else 'arial.ttf'),
                                 int(float(a.get('font-size', 14 if bold else 12))*scale))
        x, y = float(a.get('x', 0))*scale, float(a.get('y', 0))*scale
        if a.get('text-anchor') == 'middle':
            x -= draw.textlength(label, font=font)/2
        fill = 'white' if 'fill:white' in a.get('style', '') else a.get('fill', '#172e43')
        draw.text((x, y), label, font=font, fill=fill, anchor='ls')

im.save(feature / 'evidence/solo-blockout-review-2026-09-29.png')
