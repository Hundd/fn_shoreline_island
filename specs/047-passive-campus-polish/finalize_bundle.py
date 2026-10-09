"""Offline coverage drawing, integrity arithmetic and map-schema bundle."""
import json, math, hashlib, html
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
import yaml
R=Path(__file__).parent
load=lambda p:json.loads(Path(p).read_text(encoding='utf-8'))
D=load(R/'scene-delta.json');P=D['placements'];A=load(R/'evidence/assemblies.json')
G=R/'generated';G.mkdir(exist_ok=True)
colors={'popcorn':'#33845c','prompt':'#399b86','discovery':'#55a761','circulation':'#a87722','agent':'#446dac','confidence':'#8a59a3','error':'#bf6951','tools':'#be8a31'}
im=Image.new('RGB',(1500,1080),'#f5f7fb');dr=ImageDraw.Draw(im)
font=ImageFont.truetype('C:/Windows/Fonts/arial.ttf',16);small=ImageFont.truetype('C:/Windows/Fonts/arial.ttf',13);title=ImageFont.truetype('C:/Windows/Fonts/arialbd.ttf',23)
svg=['<svg xmlns="http://www.w3.org/2000/svg" width="1500" height="1080"><rect width="1500" height="1080" fill="#f5f7fb"/>']
def txt(x,y,s,f=font,col='#203449'):
 dr.text((x,y),s,font=f,fill=col);svg.append(f'<text x="{x}" y="{y+17}" fill="{col}" font-family="Arial" font-size="{23 if f==title else 13 if f==small else 16}">{html.escape(s)}</text>')
def poly(points,fill,outline='#ffffff'):
 dr.polygon(points,fill=fill,outline=outline);svg.append('<polygon points="'+' '.join(f'{x},{y}' for x,y in points)+f'" fill="{fill or "none"}" stroke="{outline}"/>')
def panel(box,world,label,items):
 x0,y0,x1,y1=box;wx0,wy0,wx1,wy1=world
 dr.rectangle(box,fill='#e7edf2',outline='#c3cdd7');txt(x0+10,y0+8,label)
 s=min((x1-x0-35)/(wx1-wx0),(y1-y0-50)/(wy1-wy0))
 def point(x,y):return (x0+17+(x-wx0)*s,y0+40+(y-wy0)*s)
 for p in items:
  if wx0<=p['transform']['location']['x']<=wx1 and wy0<=p['transform']['location']['y']<=wy1:
   cs=[point(x,y) for x,y in p['world_xy_corners']];poly([cs[i] for i in [0,1,3,2]],colors[p['group']])
 return point
txt(30,20,'047 | Passive campus polish: exact footprint coverage',title)
txt(30,52,'115 new meshes. 38 exact source-component changes. Grounding and shape arithmetic only; runtime acceptance remains owner walkthrough.')
panel((30,90,740,1040),(-15400,-19000,12100,4000),'Campus coverage | X right, Y down',P)
q=panel((770,90,1470,365),(2900,-850,11700,2700),'Prompt: metal trough clusters leave pillar gaps',[p for p in P if p['group']=='prompt'])
for a in load(R/'evidence/045-post-bounds.json'):
 b=a['bounds'];corners=[q(b['min']['x'],b['min']['y']),q(b['max']['x'],b['min']['y']),q(b['max']['x'],b['max']['y']),q(b['min']['x'],b['max']['y'])];poly(corners,'#6a7485')
q=panel((770,390,1470,670),(-5300,-19000,-1600,-15100),'Popcorn: green north edge, active course retained',[p for p in P if p['group']=='popcorn'])
inv=load(Path('docs/producer/evidence/remaining-assets-2026-10-09/inventory.json'))['actors']
for a in inv:
 if a['label'].startswith('pop039_deck') or a['label']=='pop039_ramp':
  b=a['bounds'];poly([q(b['min']['x'],b['min']['y']),q(b['max']['x'],b['min']['y']),q(b['max']['x'],b['max']['y']),q(b['min']['x'],b['max']['y'])],'#ead5cf','#ad6a59')
y=705
for group,col in colors.items():
 n=sum(p['group']==group for p in P);txt(800,y,f'{group.capitalize()}: {n} meshes',col=col);y+=31
txt(790,986,'Gray: protected 045 columns. Rose: protected decks/ramp.',small)
txt(790,1010,'Canopy/beam trim footprints are overhead, not floor obstacles.',small)
im.save(G/'coverage.png');(G/'coverage.svg').write_text('\n'.join(svg)+ '</svg>',encoding='utf-8')

# Arithmetic review against actual post bounds and original passive collision envelopes.
def box(p):
 return [min(x for x,y in p['world_xy_corners']),min(y for x,y in p['world_xy_corners']),max(x for x,y in p['world_xy_corners']),max(y for x,y in p['world_xy_corners'])]
over=[]
for p in P:
 if p['group']!='prompt':continue
 r=box(p)
 for a in load(R/'evidence/045-post-bounds.json'):
  b=a['bounds']
  if min(r[2],b['max']['x'])>max(r[0],b['min']['x']) and min(r[3],b['max']['y'])>max(r[1],b['min']['y']):over.append([p['label'],a['label']])
fol=[]
for p in P:
 if p['role']!='greenery':continue
 c=next(c for c in A['campus_nursery_station_identity']['components'] if c['component']['refPath']==p['source']);pr=c['properties'];loc=pr['RelativeLocation'];sc=pr['RelativeScale3D'];b=box(p);z=p['world_z']
 original=[loc['x']-sc['x']*50,loc['y']-sc['y']*50,loc['x']+sc['x']*50,loc['y']+sc['y']*50,2400+loc['z']-sc['z']*50,2400+loc['z']+sc['z']*50]
 covered=b[0]<=original[0] and b[1]<=original[1] and b[2]>=original[2] and b[3]>=original[3] and z[0]<=original[4]+.1 and z[1]>=original[5]
 fol.append(dict(label=p['label'],original_bounds=original,new_bounds=b+z,contains_original_aabb=covered))
checks=dict(unique_labels=len({p['label'] for p in P})==len(P),prompt_045_intersections=over,foliage_envelopes=fol,grounding_samples=len(load(R/'evidence/grounding-corners-final.json')['samples']))
assert checks['unique_labels'] and not over and all(x['contains_original_aabb'] for x in fol)
(R/'evidence/offline-geometry-review.json').write_text(json.dumps(checks,indent=2)+'\n',encoding='utf-8')

m=yaml.safe_load((R.parent/'046-fortnite-campus-extension/map.yaml').read_text(encoding='utf-8'))
m['map'].update(id='passive_campus_polish',title='Passive Fortnite campus polish',source_feature='specs/047-passive-campus-polish/spec.md',learning_objective='Keep each existing AI lesson readable while adding grounded native planting, seating and passive lab detail.')
m['zones'][0].update(label='Existing campus passive-art survey',purpose='Measured passive-art improvements to existing independent destinations; no new walking requirement or lesson.')
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
files=['scene-delta.json','spec.md','plan.md','generated/coverage.svg','generated/coverage.png','evidence/grounding-corners-final.json','evidence/bench-body-setup.json','evidence/offline-geometry-review.json','evidence/assemblies.json','evidence/used-assets.json','evidence/popcorn-bindings.json','evidence/implementation-furnishing-correction-proposal.json','review.md']
m['devices'][0].update(count=len(P),source='scene-delta.json exact world transforms and component_changes; no inferred substitutions',settings=dict(scene_delta_sha256=sha(R/'scene-delta.json'),collision='112 NoCollision props; 3 native BlockAll QueryOnly benches',component_changes=38,original_collision_exceptions=18,review_artifacts_sha256={p:sha(R/p) for p in files}))
m['assumptions']=[dict(id='scope',status='resolved',detail='115 passive native meshes; exact 38 source changes. No active course, growing plant, semantic target or dynamic prop substitution.',evidence='scene-delta.json; spec.md'),dict(id='grounding',status='resolved',detail='220 corner reads match floor/plinth support. Planter roots embed in inspected native soil. Real bench convex hulls replace only retired bench collision.',evidence='evidence/grounding-corners-final.json; evidence/bench-body-setup.json; plan.md'),dict(id='authority',status='resolved',detail='Owner says Do it after this recommendation; earlier delegated Supervisor verification and skip-tests instruction persist. Supervisor reviews current concrete digest; no claim of owner digest review.',evidence='evidence/supervisor.md'),dict(id='runtime',status='resolved',detail='No gameplay testing, validation, cook, push or session. Saved editor integrity and visual checks required; owner runtime and memory acceptance pending.',evidence='tasks.md; review.md')]
(R/'map.yaml').write_text(yaml.safe_dump(m,sort_keys=False),encoding='utf-8')
print('Coverage and geometry review written; exact map hashes generated.')
