"""Offline expansion of measured architectural surfaces; never calls Unreal."""
import json, math, hashlib, re
from pathlib import Path
from collections import Counter
import yaml

ROOT=Path(__file__).parent
read=lambda p:json.loads((ROOT/p).read_text())
survey=read('evidence/live-inventory.json')
extra=read('evidence/additional-inventory.json')
assemblies=read('evidence/architecture-components.json')
assets={p.split('.')[-1]:p for p in json.loads((ROOT.parent/'045-fortnite-campus-pilot/evidence/asset-bounds.json').read_text())['bounds']}
pole=json.loads((ROOT.parent/'045-fortnite-campus-pilot/evidence/pole-bounds.json').read_text())
assets['pole']=pole['path']
FLOOR='Neo_Sidewalk_Str_1x1_NoCurb'; WALL='Neo_Residential_Wall_01'; TRIM='Neo_StoreTrim_Str'
placements=[]; render=[]; treated=[]; exclusions=[]
def add(group,role,asset,pos,scale=(1,1,1),yaw=0,rotation=None,source=''):
    label=f'campus046_{group}_{role}_{sum(p["group"]==group and p["role"]==role for p in placements):04d}'
    placements.append(dict(label=label,group=group,role=role,asset=assets[asset],transform=dict(location=dict(zip('xyz',pos)),rotation=rotation or dict(pitch=0,yaw=yaw,roll=0),scale=dict(zip('xyz',scale))),collision='NoCollision',materials='asset defaults; empty overrides',source=source))
def subtract(r,b):
    x0,y0,x1,y1=r; a0,b0,a1,b1=b
    ix0=max(x0,a0); iy0=max(y0,b0); ix1=min(x1,a1); iy1=min(y1,b1)
    if ix0>=ix1 or iy0>=iy1:return [r]
    out=[]
    for q in [(x0,y0,ix0,y1),(ix1,y0,x1,y1),(ix0,y0,ix1,iy0),(ix0,iy1,ix1,y1)]:
        if q[2]-q[0]>0.01 and q[3]-q[1]>0.01:out.append(q)
    return out
def subtract_all(r,boxes):
    parts=[r]
    for b in boxes:parts=[q for p in parts for q in subtract(p,b)]
    return parts
def tiles(group,r,z,role='paving',source='',max_size=1000):
    x0,y0,x1,y1=r; nx=math.ceil((x1-x0)/max_size); ny=math.ceil((y1-y0)/max_size)
    dx=(x1-x0)/nx; dy=(y1-y0)/ny
    if min(dx,dy)<80:
        exclusions.append(dict(group=group,role='narrow_existing_surface',rectangle=r,reason='Retain existing surface instead of a thin distorted paving strip.'))
        return
    for i in range(nx):
        for j in range(ny):add(group,role,FLOOR,(x0+i*dx,y0+(j+1)*dy,z+.8),(dx/512,dy/512,.05),source=source)
def group_floor(name):
    if name.startswith('repair'):return 'prompt'
    if name.startswith('loop'):return 'pattern'
    if name.startswith('signal'):return 'classifier'
    if name.startswith('energy') or 'confidence' in name:return 'confidence'
    if name.startswith('event'):return 'tools'
    if name.startswith('nursery'):return 'nursery'
    if 'bot' in name:return 'agent'
    return 'error'
floors=[a for a in survey['floor'] if a['nativeClass']['refPath']=='/Script/FortniteGame.FortStaticMeshActor']+[a for a in extra['loop_'] if re.fullmatch(r'loop_dock_\d',a['label'])]
covered=[]
for a in sorted(floors,key=lambda a:a['label']):
    if a['label'] in ['nursery_floor','prompt_lab_navy_floor']:
        exclusions.append(dict(actor=a['actorPath'],label=a['label'],reason='Protected active Popcorn parkour substrate or legacy Prompt gameplay/navy spatial language; no floor skin. Surrounding architecture and route still upgraded.'));continue
    b=a['bounds']; r=[b['min']['x'],b['min']['y'],b['max']['x'],b['max']['y']]
    for part in subtract_all(r,covered):tiles(group_floor(a['label']),part,b['max']['z'],source=a['actorPath'])
    covered.append(r)
    treated.append(dict(label=a['label'],actor=a['actorPath'],treatment='Neutral sand slab visual paving; original collision/pose/material retained',group=group_floor(a['label'])))

groups={'campus_loop_dock_sheds':'pattern','campus_path_greenhouse':'discovery','campus_signal_beacon_hall':'classifier','campus_variable_vault_shell':'confidence','campus_debug_repair_garage':'error','campus_event_stepped_factory':'tools','campus_bot_aframe_hangar':'agent','campus_nursery_canopy_garden':'nursery','campus_main_promenade':'circulation'}
def component_geometry(a,c):
    p=c['properties']; loc=[a['transform']['location'][k]+p['RelativeLocation'][k] for k in 'xyz']; size=[abs(p['RelativeScale3D'][k])*100 for k in 'xyz']
    return loc,size,p['RelativeRotation']
def hide(c,why):
    p=c['properties'];render.append(dict(component=c['component'],before=dict(bVisible=p['bVisible'],bHiddenInGame=p['bHiddenInGame']),after=dict(bVisible=False,bHiddenInGame=True),preserve='All other properties including BodyInstance, transform, mesh, materials',reason=why))
def trim_edge(group,x,y,z,length,yaw,source):
    n=math.ceil(length/800); step=length/n
    rad=math.radians(yaw)
    for i in range(n):
        off=-length/2+(i+.5)*step
        add(group,'cornice',TRIM,(x+math.cos(rad)*off,y+math.sin(rad)*off,z),(step/512,1,1),yaw=yaw,source=source)
def wall_face(group,cx,cy,bottom,length,height,yaw,source):
    nx=math.ceil(length/800); nz=math.ceil(height/600); dx=length/nx; dz=height/nz; rad=math.radians(yaw)
    for i in range(nx):
        off=-length/2+(i+.5)*dx
        for j in range(nz):add(group,'wall_panels',WALL,(cx+math.cos(rad)*off,cy+math.sin(rad)*off,bottom+j*dz),(dx/536.0145874023438,.05,dz/384),yaw=yaw,source=source)
    trim_edge(group,cx,cy,bottom+height+54.5,length,yaw,source)

# Render-only replacement of narrow support posts; original collision persists.
pole_match=re.compile(r'(loop_shed_1_.*pylon|garden_entrance_arch_|signal_portal_\d_(north|south)|vault_front_column_|debug_entrance_post_|event_conveyor_support_|bot_front_rib_|nursery_entrance_pod_)')
for name,a in assemblies.items():
    group=groups[name]
    for c in a['components']:
        p=c['properties']; cn=c['component']['refPath'].split('.')[-1]; source=c['component']['refPath']; loc,size,rot=component_geometry(a,c)
        if not p['bVisible']:continue
        if pole_match.search(cn):
            sz=size[2]/(pole['max']['z']-pole['min']['z']); xy=min(3.2,max(.9,size[0]/70))
            bottom=loc[2]-size[2]/2
            add(group,'columns','pole',(loc[0],loc[1],bottom-pole['min']['z']*sz),(xy,xy,sz),source=source);hide(c,'Detailed Neo column replaces primitive support rendering; unchanged collision.');continue
        # Opaque wall faces are skin only. No new wall crosses an opening.
        iswall=cn in ['vault_back_wall','vault_east_wall','vault_east_wall_north','vault_west_wall','debug_rear_service_wall','debug_west_tool_wall','bot_rear_knee_wall','bot_east_end_buttress','bot_east_end_buttress_north','bot_west_end_buttress'] or cn.startswith('event_factory_tower_')
        if iswall and all(abs(rot[k])<.001 for k in ['pitch','yaw','roll']):
            x,y,z=loc; sx,sy,sz=size; bottom=z-sz/2
            # Two broad faces for thin walls; all four faces for existing solid towers.
            if sx>=sy or cn.startswith('event_factory_tower_'):
                wall_face(group,x,y-sy/2-1.5,bottom,sx,sz,180,source)
                wall_face(group,x,y+sy/2+1.5,bottom,sx,sz,0,source)
            if sy>sx or cn.startswith('event_factory_tower_'):
                wall_face(group,x-sx/2-1.5,y,bottom,sy,sz,90,source)
                wall_face(group,x+sx/2+1.5,y,bottom,sy,sz,-90,source)
            continue
        # Low-profile Neo roof-edge pieces follow unchanged existing horizontal header/beam bounds.
        if cn in ['loop_shed_1_roof','vault_roof','debug_front_header','event_overhead_conveyor'] or re.fullmatch(r'signal_portal_\d_beam',cn):
            x,y,z=loc;sx,sy,sz=size
            if sx>=sy:
                trim_edge(group,x,y-sy/2,z+sz/2+54.5,sx,180,source)
                trim_edge(group,x,y+sy/2,z+sz/2+54.5,sx,0,source)
            else:
                trim_edge(group,x-sx/2,y,z+sz/2+54.5,sy,90,source)
                trim_edge(group,x+sx/2,y,z+sz/2+54.5,sy,-90,source)
        if cn.startswith('nursery_canopy_roof_'):
            # Existing round disks remain; short tangent-facing detail fits inside circular silhouette.
            x,y,z=loc
            trim_edge(group,x,y-1100,z+size[2]/2+54.5,1600,180,source)
            trim_edge(group,x,y+1100,z+size[2]/2+54.5,1600,0,source)
    treated.append(dict(label=name,actor=a['actor'],group=group,treatment='Measured structure treatment; preserve every non-listed component and all gameplay bindings'))

# Preserve each actual Discovery support center; no midpoint replacement hiding collision wings.
a=assemblies['campus_path_greenhouse']
for x in [1100,2900]:
    for y in [900,1000,2000,2100]:add('discovery','columns','pole',(x,y,2400.288985),(2.4,2.4,1500/(pole['max']['z']-pole['min']['z'])),source=a['actor'])
for c in a['components']:
    if re.fullmatch(r'garden_frame_\d_(east|west)',c['component']['refPath'].split('.')[-1]):hide(c,'One Neo column at each original support center; all original collision retained.')

# Paving on non-instructional route centers; retain 50 cm teal edge strips.
routecovered=[[-750,-3000,-50,3000]] # exact existing045 footprint; never duplicate it
a=assemblies['campus_main_promenade']
for c in sorted(a['components'],key=lambda c:('spine' not in c['component']['refPath'],c['component']['refPath'])):
    cn=c['component']['refPath'].split('.')[-1]
    if not ('branch' in cn or cn=='promenade_spine' or 'rest_deck' in cn):continue
    loc,size,rot=component_geometry(a,c); x,y,z=loc;sx,sy,sz=size
    r=[x-sx/2,y-sy/2,x+sx/2,y+sy/2]
    if 'rest_deck' not in cn:
        if sx>sy:r[1]+=50;r[3]-=50
        else:r[0]+=50;r[2]-=50
    else:
        for part in subtract_all(r,covered):tiles('circulation',part,z+sz/2,source=c['component']['refPath'])
        continue
    # No cosmetic skins inside the active Popcorn parkour envelope.
    for part in subtract_all(r,routecovered+[[-5200,-19000,-1800,-15300]]):tiles('circulation',part,z+sz/2,source=c['component']['refPath'])
    routecovered.append(r)

delta=dict(version=1,feature='046-fortnite-campus-extension',origin='world XYZ centimeters',placements=placements,component_render_changes=render,retained='All existing physics, transforms, gameplay actors/components, Verse and045. Only listed primitive structural support rendering changes.',verification='Serialized short groups, native full transforms/assets/default materials/NoCollision, exact original BodyInstance preserved, save each actor and level; editor images. No gameplay testing or cook.',counts=dict(placements=len(placements),render_changes=len(render),by_group=dict(Counter(p['group'] for p in placements)),by_role=dict(Counter(p['role'] for p in placements))))
(ROOT/'scene-delta.json').write_text(json.dumps(delta,indent=2)+'\n')
(ROOT/'coverage.json').write_text(json.dumps(dict(treated=treated,exclusions=exclusions,counts=delta['counts']),indent=2)+'\n')
digest=hashlib.sha256((ROOT/'scene-delta.json').read_bytes()).hexdigest()
coveragehash=hashlib.sha256((ROOT/'coverage.json').read_bytes()).hexdigest()
data=dict(version=1,map=dict(id='fortnite_campus_extension',title='Fortnite Neo architecture across the remaining Academy',theme='shoreline_research_campus',units='meters',origin_cm=[-17000,-20000,2200],size=[310,270,45],learning_objective='Recognize each numbered AI lesson and follow the existing routes; preserve the teaching evidence, actions, retries and rewards.',source_feature='specs/046-fortnite-campus-extension/spec.md',intent='propose_change',min_path_width=1.2,position_tolerance=.02),player_flow=['campus'],zones=[dict(id='campus',label='Existing Academy survey envelope; not a new room',pattern='corridor',position=[0,0,0],size=[310,270,45],purpose='Art-pass inventory of independent existing zones; not a mandatory long mission route.',parameters=dict(width_m=1.2,access='All existing eight arrivals, return paths, gates and gameplay remain.'),devices=['architecture'],overlap_with=[],completion='Existing lesson controllers remain authoritative.',reset='Existing controllers reset transient state and preserve earned badge data.')],connections=[],markers=[dict(id='arrival',kind='spawn',zone='campus',label='Existing Hub return',position=[163,215,3],source='044/045 existing Hub; no new spawn'),dict(id='return',kind='exit',zone='campus',label='Existing Return network',position=[163,215,3],source='Existing devices retained; no new teleport'),dict(id='learning',kind='knowledge',zone='campus',label='Existing numbered lesson signs and boards',position=[196,202,4],source='Existing Prompt entrance illustration only; all actual boards retained')],devices=[dict(id='architecture',**{'class':'static_mesh_actor'},count=len(placements),source='Measured architectural components and neutral floor inventories in evidence; scene-delta.json is exact execution source',settings=dict(scene_delta_sha256=digest,coverage_sha256=coveragehash,collision='NoCollision',default_materials=True,render_only_changes=len(render)))],stages=[dict(id='visit',zone='campus',purpose='Choose any existing independent numbered lesson using unchanged Pix travel or physical routes.',requires=[],active_targets=[],completion='Existing controller handles learning and legitimate reward.')],assumptions=[dict(id='scope',status='resolved',detail='All remaining primary labs, circulation and Discovery greenhouse receive the measured art pass. Authentic optional cottage/east hangar retained. Active parkour substrate and legacy navy teaching surfaces explicitly excluded from cosmetic floor skins.',evidence='coverage.json; plan.md'),dict(id='assets',status='resolved',detail='Reuse actual measured Neo sidewalk, wall panel, cornice and conduit column meshes; scaled modular panels max1000cm floor,800cm wall width,600cm wall height. No new asset import or light.',evidence='../045-fortnite-campus-pilot/evidence/asset-bounds.json and pole-bounds.json'),dict(id='authority',status='resolved',detail='Owner visually accepts045 and requests rest of map. Delegated Supervisor design review and owner manual walkthrough continue; no claim of user review of future digest.',evidence='evidence/supervisor.md'),dict(id='runtime',status='resolved',detail='Collision retained and new meshes noncolliding. Memory, cooked visibility and playability remain owner checks per skip-tests instruction; counts are scope control, not measured memory.',evidence='review.md; tasks.md')])
data['devices'][0]['settings']['review_artifacts_sha256']={str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [ROOT/'spec.md',ROOT/'plan.md',ROOT/'coverage.md',ROOT/'generated/coverage.svg',ROOT/'generated/coverage.png'] if p.exists()}
(ROOT/'map.yaml').write_text(yaml.safe_dump(data,sort_keys=False),encoding='utf-8')
print(json.dumps(delta['counts'],indent=2))
