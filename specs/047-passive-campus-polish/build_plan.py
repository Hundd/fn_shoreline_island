"""Deterministic offline expansion of measured passive-art placements."""
import json, math, hashlib
from pathlib import Path
from collections import Counter
import yaml
R=Path(__file__).parent
read=lambda p:json.loads(Path(p).read_text(encoding='utf-8'))
A=read(R/'evidence/assemblies.json')
catalog=read(R/'evidence/candidates.json')['candidates']
B={c['path'].split('.')[-1]:c for c in catalog}
sb=read(R/'evidence/new-shrub-bounds.json')['bounds']
for path,b in sb.items():B[path.split('.')[-1]]=dict(path=path,bounds=b,materials={'native': '/Game/Environments/Props/Shrubs/Materials/PP2/MI_Cylindrical384_Ambient.MI_Cylindrical384_Ambient' if 'Cylindrical_384' in path else 'unused discovery candidate'})
pole=read(R.parent/'045-fortnite-campus-pilot/evidence/pole-bounds.json')
B['pole']=dict(path=pole['path'],bounds=dict(min=pole['min'],max=pole['max']))
trim=read(R.parent/'045-fortnite-campus-pilot/evidence/asset-bounds.json')['bounds']
tp=next(p for p in trim if p.endswith('.Neo_StoreTrim_Str'))
B['trim']=dict(path=tp,bounds=trim[tp])
P=[]; changes=[]
def xyz(v):return dict(zip('xyz',v))
def add(group,role,key,pos,scale=(1,1,1),yaw=0,source='',support=None,collision='NoCollision'):
 label=f'campus047_{group}_{role}_{sum(p["group"]==group and p["role"]==role for p in P):03d}'
 b=B[key]['bounds']; sx,sy,sz=scale;r=math.radians(yaw)
 corners=[]
 for x in (b['min']['x'],b['max']['x']):
  for y in (b['min']['y'],b['max']['y']):corners.append([pos[0]+math.cos(r)*x*sx-math.sin(r)*y*sy,pos[1]+math.sin(r)*x*sx+math.cos(r)*y*sy])
 item=dict(label=label,group=group,role=role,asset=B[key]['path'],transform=dict(location=xyz(pos),rotation=dict(pitch=0,yaw=yaw,roll=0),scale=xyz(scale)),collision=collision,materials='asset defaults; empty overrides',source=source,world_xy_corners=corners,world_z=[pos[2]+b['min']['z']*sz,pos[2]+b['max']['z']*sz])
 item['collision_settings']=dict(collisionProfileName='NoCollision' if collision=='NoCollision' else 'BlockAll',collisionEnabled='NoCollision' if collision=='NoCollision' else 'QueryOnly',bSimulatePhysics=False)
 if support:item['support']=support
 P.append(item)
def comp(name,part):return next(c for c in A[name]['components'] if c['component']['refPath'].endswith('.'+part))
def world(name,c):return [A[name]['transform']['location'][k]+c['properties']['RelativeLocation'][k] for k in 'xyz']
def hide(c,why,physics=False):
 p=c['properties']; after=dict(bVisible=False,bHiddenInGame=True)
 if physics:after['BodyInstance']=dict(collisionEnabled='NoCollision',collisionProfileName='NoCollision')
 changes.append(dict(component=c['component'],before={k:p[k] for k in ['bVisible','bHiddenInGame','BodyInstance']},after=after,reason=why,preserve='Transform, mesh, materials and all unspecified properties; BodyInstance unchanged except explicit bench exception'))
def support(z,kind,source):return dict(z=z,kind=kind,source=source)

# Exactly three passive benches. Native asset width is along X; face west.
n='campus_main_promenade'
for i in range(1,4):
 c=comp(n,f'promenade_bench_{i:02d}_seat');x,y,z=world(n,c)
 add('circulation','bench','S_NeoTilted_Bench',(x+52,y,2400.7),yaw=90,source=c['component']['refPath'],support=support(2400,'rest deck under 046 skin',f'promenade_rest_deck_{i:02d}'),collision='BlockAll / QueryOnly; native four convex hulls; no simulation')
 for q in A[n]['components']:
  if f'promenade_bench_{i:02d}_' in q['component']['refPath']:hide(q,'Retire mismatched primitive bench rendering and collision; native hulls replace only this passive furniture.',True)

# Native bushes replace passive coral/topiary primitive silhouettes, not nursery plants.
n='campus_nursery_station_identity'
for c in A[n]['components']:
 x,y,z=world(n,c);cn=c['component']['refPath'].split('.')[-1]
 if 'spire' in cn:key='Shrub_Cylindrical_384';sc=(1,1,1)
 elif cn.endswith('_a'):key='Shrub_23';sc=(1.75,1.8,2.4)
 else:key='Shrub_23';sc=(1.25,1.3,1.7)
 add('popcorn','greenery',key,(x,y,2400),sc,source=c['component']['refPath'],support=support(2400,'nursery slab','existing nursery floor'))
 hide(c,'Passive architectural planting only; old simple collision remains within foliage silhouette. No controller-owned growth prop.')

# Lower roof-edge detail mirrors existing 046 upper trim, without duplicating it.
n='campus_nursery_canopy_garden'
for i in range(1,5):
 c=comp(n,f'nursery_canopy_roof_{i}');x,y,z=world(n,c)
 for dy,yaw in [(-1100,180),(1100,0)]:
  for dx in [-400,400]:add('popcorn','canopy_trim','trim',(x+dx,y+dy,4544.5),(800/512,1,1),yaw,source=c['component']['refPath'])

# Eight thin existing Prompt planter beams stay as grounded plinths. Three metal
# planter modules per beam sit on their measured 2442 cm top; no invisible beam.
n='campus_path_greenhouse_extension'
for c in A[n]['components']:
 if '_planter_' not in c['component']['refPath']:continue
 x,y,z=world(n,c);src=c['component']['refPath']
 for dx in [-420,-150,120]:
  add('prompt','planter','S_NeoTilted_Planter_Rectangle',(x+dx,y,2442.05),(268/507.24822998,136/252.67463684,.6),source=src,support=support(2442,'existing planter beam',src))
 for dx in [-420,-150,120]:add('prompt','shrub','Shrub_23',(x+dx,y,2480),(.45,.45,.45),source=src,support=support(2480,'new planter soil; root embedded','new planter module'))

# Two passive Discovery spine plinths; preserve structural wings and growing plants.
n='campus_path_station_identity'
for part in ['planter_spine','planter_spine_north']:
 c=comp(n,part);x,y,z=world(n,c);src=c['component']['refPath']
 add('discovery','planter','S_NeoTilted_Planter_Rectangle',(x,y,2490.1),(596/507.24822998,216/252.67463684,.85),90,src,support(2490,'existing spine plinth',src))
 for dy in [-150,150]:add('discovery','shrub','Shrub_23',(x,y+dy,2545),(.65,.65,.65),source=src,support=support(2545,'new planter soil; root embedded','new planter module'))

# Four Agent passive assembly arches: detailed native columns and beam trim.
n='campus_bot_station_identity'
for i in range(1,5):
 for side in ['left','right']:
  c=comp(n,f'assembly_{side}_{i}');x,y,z=world(n,c)
  add('agent','column','pole',(x,y,2400.2),(110/70,110/70,965/1249.167114),source=c['component']['refPath'],support=support(2400,'bot floor','existing bot slab'))
  hide(c,'Passive assembly upright only; 110 cm shaft match, base collar wider but noncolliding. Existing physics retained.')
 c=comp(n,f'assembly_bridge_{i}');x,y,z=world(n,c)
 for dx in [-825,-275,275,825]:add('agent','beam_trim','trim',(x+dx,y-55,3420),(550/512,1,1),180,source=c['component']['refPath'])

# Six passive lab furnishings, clear rear-edge pockets, no new interaction.
for group,y in [('confidence',-3750),('error',-7450),('tools',-10750)]:
 add(group,'worktable','S_NeoTilted_ComputerStore_Display_02',(-4250,y,2400.8),source='clear peripheral floor pocket',support=support(2400,'existing lab slab',group+' first bay'))
 key='Prop_Server_Racks_01_a' if group=='confidence' else 'Prop_Industrial_Control_Module_01'
 add(group,'service_cabinet',key,(-3980,y-35,2400.8),source='adjacent passive service pocket',support=support(2400,'existing lab slab',group+' first bay'))

delta=dict(version=1,feature='047-passive-campus-polish',origin='world XYZ centimeters',placements=P,component_changes=changes,counts=dict(placements=len(P),component_changes=len(changes),by_group=dict(Counter(p['group'] for p in P)),by_role=dict(Counter(p['role'] for p in P))),preservation='045 corrected columns, all 046, all Verse/devices/bindings, active Popcorn course and semantic growth/targets unchanged. Only exact 18 old bench physics components retire; 3 native bench hulls replace them.')
(R/'scene-delta.json').write_text(json.dumps(delta,indent=2)+'\n',encoding='utf-8')
(R/'evidence/used-assets.json').write_text(json.dumps({p['asset']:next(v for v in B.values() if v['path']==p['asset']) for p in P},indent=2)+'\n',encoding='utf-8')
print(json.dumps(delta['counts'],indent=2))
