from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
import html, json
p=Path('specs/044-hub-pix-mission-travel'); g=p/'generated';g.mkdir(exist_ok=True)
names=['Prompt Workshop','Pattern Scanner','AI Classifier','Confidence Core','AI Error Lab','AI Tool Lab',"Pix's Popcorn Parkour",'AI Agent Mission']
def F(n,b=False): return ImageFont.truetype('C:/Windows/Fonts/segoeuib.ttf' if b else 'C:/Windows/Fonts/segoeui.ttf',n)
im=Image.new('RGB',(1360,1120),'#102033');d=ImageDraw.Draw(im)
def text(x,y,s,n=20,c='#d8e8ee',b=False):d.text((x,y),s,font=F(n,b),fill=c)
def box(r,c='#1e3548'):d.rounded_rectangle(r,radius=16,fill=c,outline='#355a6a',width=2)
text(40,22,'Pix: choose your next adventure',36,'#ffffff',True)
text(40,78,'PLANNING PROPOSAL • interface wireframe, not a Fortnite screenshot',19)
box((35,120,440,430));text(60,140,'1  Approach Pix',25,'#73e5d2',True)
text(60,195,'Ready for an adventure?',25,'#fff',True)
text(60,238,"Choose a mission and I'll",21);text(60,267,'take you there.',21)
box((60,323,415,371),'#276559');text(86,333,'Choose a mission',23,'#fff',True)
text(182,390,'Not now',20)
box((35,455,440,755));text(60,475,'3  Confirm destination',25,'#73e5d2',True)
text(60,533,'Go to Prompt Workshop?',24,'#fff',True)
text(60,581,'Give Pix clear instructions.',21)
box((60,637,210,687),'#276559');text(112,646,'Go',23,'#fff',True)
box((225,637,415,687));text(284,646,'Back',23,'#fff',True)
text(62,709,'Back returns to all eight choices.',18)
box((465,120,1325,755));text(492,141,'2  Where shall we go?',29,'#73e5d2',True)
text(492,191,'All eight missions available in any order',23)
for i,name in enumerate(names):
 col=0 if i<4 else 1; row=i%4;x=490+col*412;y=247+row*103
 box((x,y,x+391,y+88),'#253e52')
 text(x+15,y+13,f'{i+1}  {name}',21,'#fff',True)
 text(x+15,y+47,'Completed • visit again' if i==1 else 'Ready',19,'#85e5d1')
text(494,680,'No travel until you confirm.',20);text(1183,711,'Cancel',20)
text(490,790,'Example statuses only • actual rows read current-round progress',17)
box((35,790,440,1080));text(58,809,'Hub placement',24,'#73e5d2',True)
# Local inset with X right, Y down; each screen preserves existing pose.
for row in range(2):
 for col in range(4):
  x=70+col*55;y=870+row*34
  d.rectangle((x,y,x+40,y+22),fill='#2d6871');text(x+14,y+1,str(row*4+col+1),15,'white')
text(60,934,'Existing screens: unchanged',18)
d.ellipse((335,912,381,958),fill='#73e5d2');text(331,969,'PIX',18,'white',True)
d.ellipse((320,1003,396,1070),outline='#ffd07a',width=3)
text(57,1010,'Approach radius 1.25m',17);text(57,1040,'Off normal hub transit',17)
box((465,831,1325,1080));text(490,849,'Safe travel, independent lessons',25,'#73e5d2',True)
text(490,899,'• Arrive at normal entrances; walk in to start.',22)
text(490,938,'• Agent can be first. Real progress still needs all eight badges.',22)
text(490,977,'• Cancel stays in hub. Completed badges remain.',22)
text(490,1020,'Reuse existing Pix figure • no imported NPC / voice needed',20)
im.save(g/'travel-review.png')
cards=''.join(f'<button class="card" onclick="choose({i})"><b>{i+1} {html.escape(name)}</b><span>{"Completed · visit again" if i==1 else "Ready"}</span></button>' for i,name in enumerate(names))
page='''<!doctype html><meta charset="utf-8"><title>Pix mission travel review</title><style>body{background:#102033;color:#e3f0f5;font:20px/1.45 system-ui;margin:30px auto;max-width:1100px}a{color:#73e5d2}section{background:#1e3548;border:1px solid #355a6a;border-radius:18px;padding:26px;margin:22px 0}button{background:#253e52;border:2px solid #527485;color:white;padding:18px;border-radius:12px;font:inherit;cursor:pointer}button:focus{outline:4px solid #ffd07a}.primary{background:#276559}.grid{display:grid;grid-template-columns:1fr 1fr;gap:14px}.card{text-align:left}.card span{display:block;color:#85e5d1}img{width:100%;height:auto}.hidden{display:none}small{color:#b5c9d5}h2{margin-top:0}</style><h1>Pix: choose your next adventure</h1><p>Proposed design for human review. Interactive wireframe; example status values, no real travel.</p><section id="invite"><h2>Ready for an adventure?</h2><p>Choose a mission and I'll take you there.</p><button class="primary" onclick="show('list')">Choose a mission</button> <button onclick="show('closed')">Not now</button></section><section id="list" class="hidden"><h2>Where shall we go?</h2><p>All eight missions, any order.</p><div class="grid">CARDS</div><p><button onclick="show('closed')">Cancel</button></p></section><section id="confirm" class="hidden"><h2 id="destination"></h2><p id="description"></p><button class="primary" id="go" onclick="show('arrived')">Go</button> <button id="back" onclick="show('list')">Back</button></section><section id="closed" class="hidden"><h2>You're still at Pix.</h2><p>Movement returns; no progress changes.</p><button onclick="show('invite')">Talk to Pix again</button></section><section id="arrived" class="hidden"><h2>Confirmed safe entrance</h2><p>This wireframe shows the flow only. In game, the modal closes before travel; walk into the normal lesson start.</p><button onclick="show('invite')">Preview again</button></section><small>Keyboard Tab/Enter or mouse works in this offline prototype. Fortnite controller support is specified with installed SDK SetFocus and MenuNavigationMapping / Back; actual cooked input must be verified.</small><img src="travel-review.png" alt="Three modal states and proposed hub placement"><section><h2>Concrete scope</h2><p>Move the existing Pix helper beside the screens; add one Talk control, one Verse adapter and eight destination teleports. Preserve mission geometry and rewards. Remove Agent's prerequisite badge lock, keeping its real rescue/delivery checks. Existing Return controls remain.</p><a href="../plan.md">Detailed plan and exact arrival transforms</a> · <a href="preview.html">Campus blockout</a> · <a href="implementation.yaml">Generated implementation plan</a> · <a href="../review.md">Review</a></section><script>const names=NAMES;function show(id){for(const s of ['invite','list','confirm','closed','arrived'])document.getElementById(s).classList.toggle('hidden',s!==id);const b=document.querySelector('#'+id+' button');if(b)b.focus();}function choose(i){document.getElementById('destination').textContent=(i===1?'Visit ':'Go to ')+names[i]+(i===1?' again?':'?');document.getElementById('description').textContent=i===1?'Spot the missing pattern. Your earned badge stays.':'Travel to its entrance. Walk into the normal lesson to start.';document.getElementById('go').textContent=i===1?'Visit again':'Go';show('confirm');document.getElementById('back').focus();}document.addEventListener('keydown',e=>{if(e.key==='Escape'){if(!document.getElementById('confirm').classList.contains('hidden'))show('list');else show('closed');}});</script>'''
# Grid order matches physical left1–4/right5–8.
ordered=[0,4,1,5,2,6,3,7]
cards=''.join(f'<button class="card" onclick="choose({i})"><b>{i+1} {html.escape(names[i])}</b><span>{"Completed · visit again" if i==1 else "Ready"}</span></button>' for i in ordered)
(g/'travel-review.html').write_text(page.replace('CARDS',cards).replace('NAMES',json.dumps(names)),encoding='utf-8')
