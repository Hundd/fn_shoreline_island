"""Render an offline area coverage diagram from the exact placement delta."""
import json, math, html
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
root=Path(__file__).parent
data=json.loads((root/'scene-delta.json').read_text())
W,H=1500,1040
im=Image.new('RGB',(W,H),'#f4f7fb');d=ImageDraw.Draw(im)
try:
    font=ImageFont.truetype('C:/Windows/Fonts/arial.ttf',17);small=ImageFont.truetype('C:/Windows/Fonts/arial.ttf',13);title=ImageFont.truetype('C:/Windows/Fonts/arialbd.ttf',25)
except OSError:font=small=title=ImageFont.load_default()
svg=[f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}"><rect width="100%" height="100%" fill="#f4f7fb"/>']
def text(x,y,s,fill='#203449',f=small):
    d.text((x,y),s,font=f,fill=fill)
    svg.append(f'<text x="{x}" y="{y+16}" fill="{fill}" font-family="Arial" font-size="{25 if f==title else 17 if f==font else 13}">{html.escape(s)}</text>')
def P(x,y):return (40+(x+17000)/30,110+(y+20000)/30)
def rect(box,fill,outline=None,width=1):
    d.rectangle(box,fill=fill,outline=outline,width=width)
    svg.append(f'<rect x="{box[0]}" y="{box[1]}" width="{box[2]-box[0]}" height="{box[3]-box[1]}" fill="{fill or "none"}" stroke="{outline or "none"}" stroke-width="{width}"/>')
def line(points,fill,width):
    d.line(points,fill=fill,width=width)
    svg.append('<polyline points="'+' '.join(f'{x},{y}' for x,y in points)+f'" fill="none" stroke="{fill}" stroke-width="{width}"/>')
text(35,20,'046 | Remaining-campus Fortnite architecture',f=title)
text(35,55,'Exact placement footprint summary. X right, Y down. Existing geometry and all collision remain; colors show NEW visual work.',f=font)
rect((40,110,1075,1015),'#e9eff3','#cbd6de')
colors=dict(paving='#c5bda9',wall_panels='#1b6975',cornice='#7653ad',columns='#e79432')
for p in data['placements']:
    t=p['transform'];x,y=t['location']['x'],t['location']['y'];s=t['scale'];yaw=math.radians(t['rotation']['yaw']);role=p['role']
    if role=='paving':
        x0,y0=P(x,y-512*s['y']);x1,y1=P(x+512*s['x'],y)
        rect((x0,y0,x1,y1),colors[role],'#f5f2e8')
    elif role in ['wall_panels','cornice']:
        length=(536.014587 if role=='wall_panels' else 512)*s['x']/2
        line([P(x-math.cos(yaw)*length,y-math.sin(yaw)*length),P(x+math.cos(yaw)*length,y+math.sin(yaw)*length)],colors[role],2)
    else:
        cx,cy=P(x,y);rr=3
        d.ellipse((cx-rr,cy-rr,cx+rr,cy+rr),fill=colors[role]);svg.append(f'<circle cx="{cx}" cy="{cy}" r="3" fill="{colors[role]}"/>')
for label,bounds,color in [('Protected active parkour',(-5200,-19000,-1800,-15300),'#c44047'),('Existing Fortnite east hangar',(5300,-15700,11400,-11500),'#21814e'),('Existing Fortnite cottage',(-4000,4200,-1500,6600),'#21814e'),('Accepted 045 hub',(-1700,0,2800,3000),'#2973b9')]:
    x0,y0=P(bounds[0],bounds[1]);x1,y1=P(bounds[2],bounds[3]);rect((x0,y0,x1,y1),None,color,3);text(x0+4,y0+4,label,color)
zones=[('nursery','Nursery / Popcorn perimeter',-10500,-17000),('agent','AI Agent hangar',-9500,-13700),('tools','AI Tool Lab',-8500,-9800),('error','AI Error Lab',-9000,-5900),('confidence','Confidence Core',-10000,-2600),('classifier','AI Classifier',-9000,900),('pattern','Pattern Scanner docks',3500,4200),('prompt','Prompt Workshop floor',7400,800),('discovery','Discovery greenhouse',2000,1600),('circulation','Spine, branches, rest decks',-400,-8300)]
text(1100,105,'AREA COVERAGE',f=font)
for i,(g,name,x,y) in enumerate(zones,1):
    cx,cy=P(x,y);d.ellipse((cx-11,cy-11,cx+11,cy+11),fill='#152e43');svg.append(f'<circle cx="{cx}" cy="{cy}" r="11" fill="#152e43"/>');text(cx-5,cy-8,str(i),'white')
    text(1100,140+(i-1)*52,f'{i}. {name}',f=font);text(1120,161+(i-1)*52,f'{data["counts"]["by_group"][g]} new meshes')
text(1100,700,'1,457 meshes / 4 shared assets',f=font)
text(1100,730,'39 exact original render changes',f=font)
for i,(role,color) in enumerate(colors.items()):
    y=785+i*33;rect((1100,y,1120,y+16),color);text(1130,y,role.replace('_',' ').title()+f' ({data["counts"]["by_role"][role]})')
text(1100,940,'All new pieces: NoCollision')
text(1100,962,'Runtime and memory: owner checks')
svg.append('</svg>')
out=root/'generated';out.mkdir(exist_ok=True)
(out/'coverage.svg').write_text('\n'.join(svg));im.save(out/'coverage.png')
print(out/'coverage.png')
