"""Offline raster of this generator's simple SVG for visual review, no browser."""
from pathlib import Path
import re
import xml.etree.ElementTree as ET
from PIL import Image, ImageDraw, ImageFont

base = Path(__file__).resolve().parent
tree = ET.fromstring((base/'generated/preview.svg').read_text(encoding='utf-8'))
_,_,w,h = map(int,tree.attrib['viewBox'].split())
img = Image.new('RGB',(w,h),'white')
draw = ImageDraw.Draw(img)
for el in tree:
    tag = el.tag.rsplit('}',1)[-1]
    if tag in ('defs','style'): continue
    items = list(el) if tag == 'g' else [el]
    for item in items:
        kind=item.tag.rsplit('}',1)[-1]; a=item.attrib
        fill=a.get('fill'); stroke=a.get('stroke')
        if fill in ('none',None): fill=None
        if kind=='rect':
            x=float(a.get('x',0)); y=float(a.get('y',0)); rw=float(a['width']); rh=float(a['height'])
            draw.rectangle((x,y,x+rw,y+rh),fill=fill,outline=stroke)
        elif kind=='circle':
            x=float(a['cx']); y=float(a['cy']); r=float(a['r'])
            draw.ellipse((x-r,y-r,x+r,y+r),fill=fill,outline=stroke)
        elif kind=='polyline':
            pts=[tuple(map(float,p.split(','))) for p in a['points'].split()]
            draw.line(pts,fill=stroke or '#246486',width=2)
        elif kind=='path' and a.get('d','').startswith('M45,720'):
            draw.line([(45,720),(145,720)],fill=stroke,width=3)
        elif kind=='text':
            size=int(a.get('font-size',14 if a.get('class')=='zone' else 12))
            font=ImageFont.truetype('C:/Windows/Fonts/arial.ttf',size)
            color='white' if 'fill:white' in a.get('style','') else (fill or '#172e43')
            x=float(a['x']); y=float(a['y'])
            draw.text((x,y),''.join(item.itertext()),font=font,fill=color,anchor='ms' if a.get('text-anchor')=='middle' else 'ls')
img.save(base/'evidence/preview-review.png')
