"""Offline raster rendering for the simple rect/text SVG used by this proposal."""
from pathlib import Path
import re
import xml.etree.ElementTree as ET
from PIL import Image, ImageDraw, ImageFont

root = Path(__file__).parent
tree = ET.parse(root/'generated/station-elevation.svg')
im = Image.new('RGB',(1200,820),'white')
d = ImageDraw.Draw(im)
for e in tree.getroot():
    tag=e.tag.split('}')[-1]
    if tag=='rect':
        x,y,w,h=[float(e.get(k,0)) for k in ['x','y','width','height']]
        d.rectangle([x,y,x+w,y+h],fill=e.get('fill','#000'))
    elif tag=='text':
        cls=e.get('class','');style=e.get('style','')
        size={'title':30,'note':17,'small':14}.get(cls,14)
        match=re.search(r'(\d+)px',style)
        if match:size=int(match.group(1))
        color=re.search(r'fill:([^;]+)',style)
        font=ImageFont.truetype('C:/Windows/Fonts/arialbd.ttf' if cls=='title' or 'bold' in style else 'C:/Windows/Fonts/arial.ttf',size)
        text=''.join(e.itertext());x=float(e.get('x'));y=float(e.get('y'))
        if e.get('text-anchor')=='middle':x-=d.textlength(text,font=font)/2
        d.text((x,y),text,font=font,fill=color.group(1) if color else '#172b3e',anchor='ls')
im.save(root/'generated/station-elevation.png')
