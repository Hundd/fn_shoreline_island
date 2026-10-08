from pathlib import Path
from PIL import Image,ImageDraw,ImageFont
import yaml,textwrap,xml.etree.ElementTree as ET
p=Path('specs/041-popcorn-feedback-and-learning'); d=yaml.safe_load((p/'map.yaml').read_text(encoding='utf-8')); c=next(x for x in d['devices'] if x['id']=='controller')['settings']['course_contract']; lc=yaml.safe_load((p/'learning-content.yaml').read_text(encoding='utf-8'))
def f(n):return ImageFont.truetype('C:/Windows/Fonts/arial.ttf',n)
im=Image.new('RGB',(1400,920),'#eef2f6'); dr=ImageDraw.Draw(im)
def text(x,y,s,n=22,color='#263444',width=95):
 for line in textwrap.wrap(s,width):dr.text((x,y),line,font=f(n),fill=color); y+=n+8
 return y
text(45,28,'Popcorn Parkour: hit feedback + learning',34);text(45,78,'041 DRAFT / preserved mirrored route / conceptual effects and HUD',20)
def pt(v):return (60+v[0]*36,150+(v[1]-13)*34)
ns={n['id']:n for n in c['nodes']}
for e in c['jump_edges']:
 dr.line([pt(ns[e['source']]['center']),pt(ns[e['destination']]['center'])],fill='#8292a6',width=4)
for n in c['nodes']:
 x,y=pt(n['center']);w=n['size'][0]*36;h=n['size'][1]*34
 dr.rounded_rectangle((x-w/2,y-h/2,x+w/2,y+h/2),radius=12,fill='#fff3c9',outline='#dcb354',width=3);dr.text((x-35,y-15),n['id'],font=f(22),fill='#354052')
for r in c['receivers']:
 x,y=pt(r['position']);dr.ellipse((x-21,y-21,x+21,y+21),outline='#399d8d',width=5);dr.text((x-6,y-9),str(r['target_id']),font=f(18),fill='#263444')
text(55,570,'Start on right > LOAD, HEAT, POP > five jumps > either branch > finish',20)
dr.rounded_rectangle((45,595,785,830),radius=16,fill='#172c42');text(68,617,'First reuse, after actual commit:',21,'#c2e0ed');text(68,655,'One shot ran all three saved steps.',25,'white');text(68,698,'PopBridge = LOAD > HEAT > POP.',25,'#f9d785');text(68,744,'Jump onto the new popcorn.',25,'white')
text(825,602,'Accepted hit: short pop + hollow halo. Onset target <=0.15s, fade0.5s. Machine hide timing unchanged.',21,width=41)
text(825,725,'One readable card, no pause. Outcome copy only after commit. Asset/audio/HUD live checks still open.',21,width=41)
text(45,860,'Exact copy/timing table: learning-review.html. This is a planning diagram, not gameplay evidence.',19)
im.save(p/'generated/feedback-overview.png')
# Rasterize the actual generated SVG simple primitives for offline visual inspection.
root=ET.fromstring((p/'generated/preview.svg').read_text(encoding='utf-8')); nums=list(map(float,root.attrib['viewBox'].split())); out=Image.new('RGB',(int(nums[2]),int(nums[3])),'white'); draw=ImageDraw.Draw(out)
for e in root.iter():
 tag=e.tag.split('}')[-1]; a=e.attrib
 if tag=='rect':
  x=float(a.get('x',0));y=float(a.get('y',0));w=float(a.get('width',0));h=float(a.get('height',0));draw.rectangle((x,y,x+w,y+h),fill=a.get('fill','white') if a.get('fill')!='none' else None,outline=a.get('stroke'))
 elif tag=='circle':
  x=float(a['cx']);y=float(a['cy']);r=float(a['r']);draw.ellipse((x-r,y-r,x+r,y+r),fill=a.get('fill'),outline=a.get('stroke'))
 elif tag=='text':
  x=float(a.get('x',0));y=float(a.get('y',0));s=''.join(e.itertext());ft=f(int(a.get('font-size',12)));anchor=a.get('text-anchor');w=draw.textlength(s,font=ft)
  if anchor=='middle':x-=w/2
  if anchor=='end':x-=w
  draw.text((x,y-ft.size),s,font=ft,fill='white' if 'fill:white' in a.get('style','') else '#172e43')
out.save(p/'generated/preview-raster.png')
