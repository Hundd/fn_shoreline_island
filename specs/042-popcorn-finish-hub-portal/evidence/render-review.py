from pathlib import Path
import json
from PIL import Image,ImageDraw,ImageFont
p=Path('specs/042-popcorn-finish-hub-portal');g=p/'generated'
font='C:/Windows/Fonts/segoeui.ttf'; bold='C:/Windows/Fonts/segoeuib.ttf'
def F(n,b=False):return ImageFont.truetype(bold if b else font,n)
im=Image.new('RGB',(1200,900),'#0e1729');d=ImageDraw.Draw(im)
d.text((40,25),'Popcorn finish → HUB',font=F(34,True),fill='white')
d.text((40,75),'Proposal: one walk-in portal, available after mission completion',font=F(20),fill='#c7d5e9')
# Native finish bounds: 4m X by 8m Y; 60px/m. Map top is greater Y.
x0,y0=90,180; scale=60
box=(x0,y0,x0+240,y0+480)
d.rectangle(box,fill='#253750',outline='#9cacbf',width=3)
def xy(x,y):return x0+(x+5100)*.6,y0+(-16680-y)*.6
cx,cy=xy(-4900,-17320)
d.ellipse((cx-26.4,cy-26.4,cx+26.4,cy+26.4),fill='#16536b',outline='#58edff',width=5)
d.ellipse((cx-60,cy-60,cx+60,cy+60),outline='#4c91a6',width=2)
d.text((355,cy-25),'NEW: glowing HUB portal',font=F(21,True),fill='#58edff')
d.text((355,cy+5),'1 m step-clear guard before enabling',font=F(16),fill='#b6c9df')
rx,ry=xy(-4900,-16800);d.ellipse((rx-14,ry-14,rx+14,ry+14),outline='#ffc45c',width=4)
d.text((355,ry-10),'Final ring 7 — unchanged',font=F(18),fill='#ffc45c')
bx,by=xy(-4900,-16730);d.line((bx-36,by,bx+36,by),fill='#f4f4f4',width=5)
d.text((355,by-36),'Existing final board',font=F(17),fill='white')
bx,by=xy(-5040,-16830);d.rectangle((bx-8,by-8,bx+8,by+8),fill='#b793ff')
d.text((38,by+24),'Return button',font=F(16),fill='#b793ff')
d.text((38,by+48),'unchanged',font=F(16),fill='#b793ff')
fx,fy=xy(-4900,-17080);d.ellipse((fx-5,fy-5,fx+5,fy+5),fill='#ecf1ff');d.line((fx,fy+12,cx,cy-34),fill='#e3edf8',width=3)
d.text((355,fy),'2.4 m flat walk from deck centre',font=F(18),fill='white')
d.text((85,690),'Measured finish deck: 4 × 8 m',font=F(20,True),fill='white')
d.text((85,725),'Top view • dimensions to scale',font=F(17),fill='#b6c9df')
d.text((85,755),'Portal position is proposed; existing actors measured.',font=F(16),fill='#b6c9df')
d.rounded_rectangle((730,155,1160,415),radius=18,fill='#192d43',outline='#58edff',width=2)
d.text((750,175),'Completion popup',font=F(24,True),fill='white')
for i,t in enumerate(['Mission complete!','You saved three steps and reused them.','PopBridge = LOAD > HEAT > POP.','','Walk into the glowing HUB portal,','or use Return.']):d.text((750,220+i*29),t,font=F(18),fill='#edf7ff')
d.text((750,445),'Then → existing Hub destination',font=F(22,True),fill='#58edff')
d.text((750,487),'Same arrival and earned progress.',font=F(18),fill='#c7d5e9')
d.text((750,526),'No forced return on completion.',font=F(18),fill='#c7d5e9')
d.text((750,558),'Replay and both Returns remain.',font=F(18),fill='#c7d5e9')
d.text((40,832),'Planning preview • native rift appearance/disabled visibility and overlap await owner manual verification',font=F(18),fill='#c7d5e9')
im.save(g/'portal-review.png')
html='''<!doctype html><html><head><meta charset="utf-8"><title>Popcorn finish Hub portal review</title><style>body{background:#0e1729;color:#edf7ff;font:18px/1.5 system-ui;margin:24px auto;max-width:1200px}img{width:100%;height:auto}section{padding:20px;background:#192d43;border-radius:12px;margin:18px 0}a{color:#58edff}pre{white-space:pre-wrap;font:inherit}h2{margin:0}</style></head><body><img src="portal-review.png" alt="To-scale finish deck with one proposed Hub portal"><section><h2>Exact completion text · 136 characters</h2><pre>Mission complete! You saved three steps and reused them.
PopBridge = LOAD &gt; HEAT &gt; POP.
Walk into the glowing HUB portal, or use Return.</pre></section><section><h2>How it opens</h2><p>The portal becomes available after successful final completion and the existing reward. If you are already standing within 1 m of its centre, it stays disabled until you step clear, then you can deliberately walk back in. Entry clears the current attempt and sends you to the existing Hub destination.</p><p>One new native teleporter. Existing course, rewards, targets, Return buttons and Replay stay. No new sign or imported asset.</p></section><section><h2>Review status</h2><p>Offline checks pass; implementation awaits explicit human approval. Rift appearance while disabled, movement, readability and arrival remain owner manual checks. No gameplay testing was run.</p><a href="../plan.md">Plan</a> · <a href="preview.html">Full course and distant Hub annotation</a></section></body></html>'''
(g/'portal-review.html').write_text(html,encoding='utf-8')
