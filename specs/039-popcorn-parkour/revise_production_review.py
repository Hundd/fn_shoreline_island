"""Offline production revision authoring. No editor/source mutations or approvals."""
from pathlib import Path
import json, yaml, math, html
P=Path(__file__).parent
class D(yaml.SafeDumper):
    def ignore_aliases(self,data): return True
def save(name,obj): (P/name).write_text(yaml.dump(obj,Dumper=D,sort_keys=False,allow_unicode=True),encoding='utf-8')
old=yaml.safe_load((P/'map.yaml').read_text(encoding='utf-8'))
if not (P/'evidence/original-reviewed-map.yaml').exists(): save('evidence/original-reviewed-map.yaml',old)
data=old
ids=['starter','first','reuse','fork','left','right','finish']
centers=[[4,17.2,1.2],[10,17.2,1.2],[15,17.2,1.2],[20,19.2,1.2],[25,15.2,1.2],[25,23.2,1.2],[30,19.2,1.2]]
sizes=[[6,4,.4],[4,4,.4],[4,4,.4],[4,8,.4],[4,4,.4],[4,4,.4],[4,8,.4]]
nodes=[dict(id=n,index=i,center=c,size=s,initially_built=i in [0,6],route_stage=[0,1,2,3,4,4,5][i],milestone=[-1,0,1,-1,-1,-1,-1][i],terminal=i==6) for i,(n,c,s) in enumerate(zip(ids,centers,sizes))]
edges=[dict(source=ids[a],destination=ids[b],edge_gap_m=1.0,kind='jump') for a,b in [(0,1),(1,2),(2,3),(3,4),(3,5),(4,6),(5,6)]]
pos=[[6.8,16,2.8],[6.8,17.2,2.8],[6.8,18.4,2.8],[11.8,17.2,2.8],[16.8,19.2,2.8],[21.8,15.2,2.8],[21.8,23.2,2.8],[30,22,2.8]]
receivers=[dict(target_id=i,name=['LOAD','HEAT','POP','PopBridge','PopBridge','Moustache PopBridge','Bucket PopBridge','Final PopBridge'][i],position=p,from_landing=ids[[0,0,0,1,2,3,3,6][i]],creates=[None,None,'first','reuse','fork','left','right','basket_overflow'][i],instruction=[0,1,2,3,3,3,3,3][i],face='toward -Y' if i==7 else 'toward -X') for i,p in enumerate(pos)]
c=data['devices'][0]['settings']['course_contract']
c.update(status='production_revision_supported_adapter_pending_profile',coordinate_provenance='Live native protected-primitives and sampled rays in evidence/production-planning-readback.json; proposal dimensions, final cooked acceptance pending',nodes=nodes,jump_edges=edges,receivers=receivers)
c['landing_rule']='Grounded inset deck footprint plus consumed checkpoint/owner/generation airborne token (>35cm normalized feet rise); next landing cannot be credited by grounded AutoRun. Actual five jumps required per route.'
c['recovery']=dict(catch_bounds=[0,0,34,37],floor_z_range_m=[0,.12],normalized_feet_z_range_cm=[2300,2480],maximum_latency_seconds=1,preserve=['skill','built_platforms','earned_badge'],teleport='Last accepted deck center + tested standing offset/safe spawn offset',entry_ramp_exemption='No recovery before owner acquires starter; thereafter floor catch anywhere in primary bay',failure='Retry keeping progress; Return remains available',boundary='Full primary bay covers 2m east and 1m west floor buffer; owner outside bay releases as tested. Production fall/crouch boundary tests pending.')
c['adapter_gate']='A01/A02 supported by actual full-contract fixture result0 and cooked B r04 QA. Production profile, cosmetic visibility, journal/station migration are explicit implementation work using existing APIs; compile/ref validation before placement; final cooked acceptance after placement.'
c['visual']['stable_collision']='Flat Cube decks at2520cm; decorative spheres remain below2520 and NoCollision; mechanisms independent from deck collision.'
d=data['devices'][0]; d['class']='fn_shoreline_island_popbridge_production';d['source']='Planned flat-ref production subclass of runtime-proven generic controller; evidence/production-adapter-feasibility.md';d['settings'].update(profile='Source constructs7nodes/7edges/8receivers from exact contract, then await_target_startup and initialize; no harness startup teleports',flat_bindings=dict(decks=7,targets=8,mechanisms=24,instruction_vfx=24,puffs=8,flourishes=8),bay_min_cm=[-5200,-19000,2300],bay_max_cm=[-1800,-15300,3300],catch_min_cm=[-5200,-19000,2300],catch_max_cm=[-1800,-15300,2480],grounded_origin_height_cm=77.15,landing_height_tolerance_cm=35,landing_inset_cm=20,station_id=0,journal_activity=dict(source=6,module_index=6,steps=3),scene_manifest='production-scene.yaml')
data['devices'][1]['settings']['mission_id']=39
data['devices'][1]['settings']['surface_size_m']=[1.2,1.2]
data['devices'][-1]['settings']['starter_ramp']=dict(width_m=3,length_m=11,rise_m=1.2,**{'from':[4,30.2,0],'to':[4,19.2,1.2]},slope_percent=10.91,world_surface_endpoints_cm=[[-4800,-15980,2400],[-4800,-17080,2520]],cube_center_cm=[-4800,-16530,2450],cube_scale=[3,11.0653,.2],pitch_degrees=6.225,note='Ramp local long axis-Y; exact top-endpoints determine rotation sign with native readback. Proposed slab thickness20cm, subtract10cm normal from surface midpoint. No unsupported walk connections.')
data['devices'][-1]['settings']['scene_manifest']='production-scene.yaml'
data['markers']=[m for m in data['markers'] if not (m['id'].endswith('_landing') or m['id'].startswith('target_'))]
for m in data['markers']:
    if m['id']=='arrival':m.update(position=[33,28.7,0],label='Existing east campus walk access; follow Popcorn arrow',source='Native floor2400/rays clear; no Skills arrival teleporter exists')
    if m['id']=='weapon':m.update(position=[4,30.2,0],source='Shared rifle existing loadout annotation; no new granter')
    if m['id']=='ribbon':m.update(position=[4,18.7,2.6])
    if m['id']=='reward':m.update(position=[30,19.2,1.2])
for n in nodes:data['markers'].append(dict(id=n['id']+'_landing',kind='checkpoint',zone='course',label=n['id'].title()+' landing',position=n['center'],source='Concrete proposed deck; generic controller airborne/grounded checkpoint'))
for r in receivers:data['markers'].append(dict(id='target_'+str(r['target_id']),kind='target',zone='course',label=r['name'],position=r['position'],target_id=r['target_id'],source='Damage-only receiver; gated from '+r['from_landing']))
data['assumptions']=[dict(id='a01_adapter',status='resolved',detail='Generic sequence/recovery/jump capability implemented and independently cooked-tested; production flat-ref wrapper, cosmetics/journal/station hooks are bounded approved-implementation tasks, not claims of current placement.',evidence='evidence/runtime-diagnostic.md result0; runtime-qa-report.md r04; production-adapter-feasibility.md'),dict(id='a02_route_contract',status='resolved',detail='Full7node/7edge/8receiver logic self_check result0 proves both routes and rejects malformed graphs. 1m gaps remain below existing120cm ceiling. v1 stage spine is linear; supplementary graph explicitly represents equal physical paths.',evidence='Actual diagnostic-A r02; fixtures validator and production-revision-check.json; final physical route QA pending'),dict(id='a03_entry_ramp',status='resolved',detail='Existing east campus walk access via 3m wide localY28.7 corridor to rampfoot4,30.2; 3x11m ramp rise1.2. Native parallel body-height rays and floors checked; final cooked ramp acceptance pending.',evidence='evidence/production-arrival-readback.json'),dict(id='a04_art',status='resolved',detail='Known100cm Cube/Sphere native meshes intentional final stylized art, dedicated effects; exact production-scene manifest. No imported art dependency.',evidence='evidence/planning-inspection.json; production-scene.yaml'),dict(id='a05_bay',status='resolved',detail='Measured primary floor34x37m; revised footprint1..32,13.2..25.2 avoids protected exact primitive bounds. Old primary-owned fixtures retired; shared shell and other bays preserved.',evidence='evidence/production-planning-readback.json; production-revision.md')]
save('map.yaml',data)
readback=json.loads((P/'evidence/production-planning-readback.json').read_text())
bindings={b['field']:b['actor']['refPath'] for b in readback['bindings']}
keep={'return_button','label_8','replay_button','mission_board','program_board','execution_board','robot','feedback','progress','navigation_journal','hub_destination','skill_audio','hub_spawner_0','hub_spawner_1','hub_spawner_2','hub_spawner_3'}
retire=[dict(field=f,actor=ref,action='Disable control/HideText or Hide prop; NoCollision and park at sameXY Z1800; retain source audit binding') for f,ref in bindings.items() if f not in keep]
scene=dict(revision='production-02-unapproved',units='local meters except explicit cm',origin_cm=[-5200,-19000,2400],runtime_profile='fn_shoreline_island_popbridge_production',native_assets=dict(cube='/VerseEngineAssets/Cube.Cube',sphere='/VerseEngineAssets/Sphere.Sphere'),collision=dict(decks='BlockAllDynamic, can_be_damaged false; physical scale verified',decor='NoCollision, movable, can_be_damaged false',gun_surfaces='Damage-only triggers, no player collision'),decks=[dict(label='pop039_deck_'+n['id'],mesh='cube',center=[n['center'][0],n['center'][1],1.0],scale=n['size'],controller_top=n['center']) for n in nodes],targets=receivers,retire_primary=retire,reuse_bindings=bindings,shared_blaster_actor='/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5860503_1128908701',journal_ref='/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5EE0003_1737524934.fn_shoreline_island_academy_journal_0',progress_ref='/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5160103_1358634782.fn_shoreline_island_nursery_progress_0',moves=dict(mission_board=[4,30.7,2.0],program_board=[4,18.7,2.6],execution_board=[30,22.7,2.8],replay_button=[28.6,21.7,2.1],finish_return_new=[31.4,21.7,2.1],entry_return='Existing untouched5.3,13,1',pix_home=[31.1,20.7,1.2],pix_left_pose=[25.9,16.1,1.2],pix_final_pose=[31.1,20.7,1.2]),profile_actor_world_cm=[-4800,-17000,1800],old_primary_controller=dict(actor='/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5160103_1359952783',pose_world_cm=[-3500,-17000,1800],retired_primary=True,source_hook='Early Hide/return before all setup/subscriptions, including dormant Return. Keep other station defaults false. Profile owns bothReturn callbacks.'),entry=dict(type='Existing physical campus access; no new teleport',corridor_centerline=[[34,28.7,0],[4,28.7,0],[4,30.2,0]],corridor_width=3,wayfinding='Reuse mission board: POPCORN PARKOUR → ramp; shoot LOAD HEAT POP',ramp=data['devices'][-1]['settings']['starter_ramp']),target_template='Existing production fn_shoreline_island_data_target/native damage-trigger assembly; rebind all independent supports; do not duplicate stale wrapper refs',target_support_recipe=dict(surface_offset=[0,0,0],surface_dimensions=[.15,1.2,1.2],ring_sphere_offset=[0,0,0],ring_scale=[.12,1.4,1.4],cone_offset=[0,0,1],cone_scale=[.5,.5,.5],label_offset=[0,0,.9],label_text='Receiver name; stages communicated by genericcyan/orange cue',instruction_offsets=[[0,-.4,-.2],[0,0,-.2],[0,.4,-.2]],instruction_meshes=['sphere','cube','sphere'],instruction_scales=[[.3,.3,.3],[.35,.35,.15],[.4,.4,.4]],mechanism_motion_cm=[0,0,25],instruction_vfx='Dedicated1 per mechanism at its home; Begin/End ordered',puff_offset=[0,0,.3],flourish_offset=[0,0,.5],final_receiver_rotation='Rotate assembly90deg aboutZ to face-Y; all offsets rotate together'),decor=[])
# Six noncolliding pieces under each created deck; never cover target at localZ2.8.
for n in nodes[1:6]:
    x,y,_=n['center']
    for j,(dx,dy) in enumerate([[-1.6,-1.4],[1.6,-1.4],[-1.6,1.4],[1.6,1.4],[0,0]]):scene['decor'].append(dict(label=f'pop039_kernel_{n["id"]}_{j}',mesh='sphere',center=[x+dx,y+dy,.55],scale=[1,1,1],color='cream',visible_when='deck '+n['id']+' built'))
    scene['decor'].append(dict(label='pop039_center_'+n['id'],mesh='sphere',center=[x,y,.55],scale=[.55,.55,.55],color='yellow',visible_when='deck '+n['id']+' built'))
for j in range(3):scene['decor'].append(dict(label=f'pop039_moustache_{j}',mesh='sphere',center=[25.6+j*.3,15.7,2.05],scale=[.35,.25,.3],color='cream',visible_when='left receiver commit; Pix teleports to left pose; reset hides. Finale moves Pix+moustache together.'))
def bucket(name,x,y,event):
    for j,(dx,dy,z,s) in enumerate([(0,0,1.35,[.8,.8,.1]),(-.4,0,1.7,[.1,.8,.7]),(.4,0,1.7,[.1,.8,.7]),(0,-.4,1.7,[.8,.1,.7]),(0,.4,1.7,[.8,.1,.7])]):scene['decor'].append(dict(label=f'pop039_{name}_wall{j}',mesh='cube',center=[x+dx,y+dy,z],scale=s,color='coral',visible_when='static empty container'))
    for j,(dx,dy,z) in enumerate([[-.25,-.25,2],[.25,-.25,2],[-.25,.25,2],[.25,.25,2],[0,0,2.35]]):scene['decor'].append(dict(label=f'pop039_{name}_overflow{j}',mesh='sphere',center=[x+dx,y+dy,z],scale=[.45,.45,.45],color='cream',visible_when=event))
bucket('bucket',26.1,24.1,'right receiver commit; reset hides')
bucket('basket',31.1,17.2,'final receiver commit after actual finish landing; reset hides')
scene['actor_counts']=dict(new_base=129,new_decor=53,new_ramp=1,total_new=183,explanation='133 all-new baseline less reusedReplay+entryReturn+ribbon+HUD=129; sixpieces x5 decks30+moustache3+two containers20=53; ramp1. Mission/finalboards and Pix reused. 183 is allocation target, native readback actual authoritative.')
scene['source_tasks']=['flat-profile seed/strictref countidentity validation','perdeck53decoration refs and visibility homes; Pix poses; reset/cancel guards','journal activity guardedsource6/module6; primary station_id0 claim/release','old primaryretired earlyreturn; existing otherbaybehavior preserved','update nursery tracker/journal PopBridge text only; same Core/Agent authorities']
scene['entry']['ramp']['cube_center_cm']=[-4800,-16531.084,2450.059]
scene['entry']['ramp'].pop('pitch_degrees',None)
scene['entry']['ramp']['rotation_degrees']={'pitch':0,'yaw':0,'roll':-6.225}
scene['board_faces']={'mission_board':'toward south/-Y; text POPCORN PARKOUR → / Shoot LOAD HEAT POP / Jump onto what you make','program_board':'toward south/-Y beside starter; text PopBridge: LOAD → HEAT → POP, updated with accepted prefix','execution_board':'toward south/-Y; text One shot reuses your skill / Replay | Return'}
scene['old_primary_controller']['flag_name']='retired_primary'
scene['old_primary_controller']['flag_default']=False
scene['station_ownership']='On first accepted starter shot claim existing progress station_id0 if unoccupied; refuse conflicting authority. On release clear only matching owned0; preserve other stations.'
scene['materials']={k: '/fn_shoreline_island/Campus/Materials/'+v+'.'+v for k,v in {'cream':'MI_CampusCream','yellow':'MI_CampusSignalGold','coral':'MI_CampusDebugCoral','navy':'MI_CampusDeepNavy','cyan':'MI_CampusBotCyan'}.items()}
scene['material_slot']=0
scene['material_slot_names']={'/VerseEngineAssets/Cube.Cube':'WorldGridMaterial','/VerseEngineAssets/Sphere.Sphere':'DefaultMaterial'}
scene['material_mapping']={'decks/ramp/kernel_lobes/moustache/overflow':'cream','kernel_heart/load':'yellow','containers/heat':'coral','instruction_pop':'cream','target_ring':'cyan','target_cone':'yellow'}
for item in scene['retire_primary']:
    f=item['field']
    if f.endswith('_button'): item['action']='Native button disabled, visibleInGame false, native bodyNoCollision, park sameXY Z1800; no Verse subscriptions from retired primary'
    elif f in ['plant','plant_2','plant_3']: item['action']='Native prop hidden, can_be_damaged false, NoCollision, park sameXY Z1800; retain audit refs'
    else: item['action']='Native billboard HideText/visibleInGame false, NoCollision, park sameXY Z1800; retain audit refs'
scene['old_primary_controller']['source_hook']='At OnBegin Hide then earlyreturn before ANY legacy display/control Disable/subscription/Pix/reset/teleport. New profile exclusively owns reused controls/art; targeted native retirement handles only non-reused refs.'
for prop in scene['decor']:
    if prop['label'].startswith('pop039_bucket_wall'): prop['visible_when']='right deck built; reset hides'
save('production-scene.yaml',scene)
data['devices'][0]['settings']['production_scene']=scene
save('map.yaml',data)
# Bounded full-route offline checks beyond MAP_SPEC v1.
checks=[]
for e in edges:
    a=nodes[ids.index(e['source'])];b=nodes[ids.index(e['destination'])]
    gap=math.hypot(max(abs(a['center'][0]-b['center'][0])-(a['size'][0]+b['size'][0])/2,0),max(abs(a['center'][1]-b['center'][1])-(a['size'][1]+b['size'][1])/2,0))
    assert abs(gap-1)<.001 and gap<=1.2
    checks.append(dict(edge=e,gap_calculated_m=gap,center_travel_m=math.dist(a['center'],b['center'])))
assert checks[3]['center_travel_m']==checks[4]['center_travel_m'] and checks[5]['center_travel_m']==checks[6]['center_travel_m']
for n in nodes:assert 0<=n['center'][0]-n['size'][0]/2 and n['center'][0]+n['size'][0]/2<=34 and 0<=n['center'][1]-n['size'][1]/2 and n['center'][1]+n['size'][1]/2<=37
(P/'evidence/production-revision-check.json').write_text(json.dumps(dict(checks=checks,bounds='pass',symmetric_branch_travel='pass',limitations='Offline dimensions only, not native collision/cooked acceptance'),indent=2))
parts=['<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 900 910" role="img" aria-label="Full revised popcorn course with protected shell and access"><rect width="900" height="910" fill="#132933"/><text x="30" y="35" fill="white" font-size="23">Pix’s Popcorn Parkour — production revision</text><text x="30" y="63" fill="#d0e5e8" font-size="16">Five jumps · either joke route · teach once / reuse many</text><rect x="30" y="90" width="680" height="740" fill="#234956" stroke="#8dcad4"/>']
def xy(x,y):return 30+x*20,90+y*20
def rect(x,y,w,h,color,label):
    a,b=xy(x,y);parts.append(f'<rect x="{a}" y="{b}" width="{w*20}" height="{h*20}" fill="{color}" stroke="#afc2c4"/><text x="{a+w*10}" y="{b+h*10}" text-anchor="middle" fill="white" font-size="13">{label}</text>')
rect(6.5,3.9,23,5.2,'#895157','Protected planter — untouched')
rect(16.5,7,3,3,'#895157','Post')
rect(32.2,12.7,1.6,1.6,'#895157','')
rect(32.2,25.7,1.6,1.6,'#895157','')
rect(13.3,30.7,7.9,3.6,'#895157','Protected coral')
rect(2.5,19.2,3,11,'#6f98a7','Ramp')
parts.append('<path d="M710 664 H110 V694" stroke="#63e2c7" stroke-width="8" fill="none"/><text x="395" y="687" fill="#c5fff2" text-anchor="middle" font-size="14">Existing east walk access → ramp foot</text>')
for e in edges:
    a=centers[ids.index(e['source'])];b=centers[ids.index(e['destination'])];ax,ay=xy(*a[:2]);bx,by=xy(*b[:2]);parts.append(f'<path d="M{ax} {ay} L{bx} {by}" stroke="#ffcc6a" stroke-width="4" stroke-dasharray="5 5"/>')
for n in nodes:
    x,y,z=n['center'];w,h,d=n['size'];a,b=xy(x-w/2,y-h/2);parts.append(f'<rect x="{a}" y="{b}" width="{w*20}" height="{h*20}" rx="12" fill="#fff2cd" stroke="#e6ac51" stroke-width="3"/><text x="{a+w*10}" y="{b+h*10}" text-anchor="middle" fill="#142f39" font-size="14">{n["id"].title()}</text>')
for r in receivers:
    x,y=xy(*r['position'][:2]);parts.append(f'<circle cx="{x}" cy="{y}" r="10" fill="#36ddf5"/><text x="{x}" y="{y+4}" fill="#16323b" font-size="12" text-anchor="middle">{r["target_id"]}</text>')
parts+=['<text x="740" y="170" fill="white" font-size="15">Shoot cyan</text><text x="740" y="200" fill="white" font-size="15">Jump dashed</text><text x="740" y="230" fill="white" font-size="15">All gaps 1m</text><text x="740" y="260" fill="white" font-size="15">Top 1.2m</text><text x="740" y="320" fill="#ffbfbd" font-size="14">Red: protected</text><text x="740" y="350" fill="#b7fff1" font-size="14">Green: access</text><text x="740" y="410" fill="white" font-size="14">Moustache /</text><text x="740" y="435" fill="white" font-size="14">Bucket: equal</text><text x="30" y="862" fill="white" font-size="16">Full bay catch floor; missed jump returns to last earned landing.</text><text x="30" y="888" fill="#d0e5e8" font-size="14">Concrete changed layout: human review pending. Native sampled clearance; final cooked QA after placement.</text></svg>']
svg=''.join(parts);(P/'parkour-preview.svg').write_text(svg,encoding='utf-8')
page='<!doctype html><meta charset="utf-8"><title>Popcorn Parkour full production review</title><style>body{background:#132933;color:#e9f6f7;font:17px system-ui;margin:28px}main{display:flex;gap:28px}svg{width:800px;max-width:65vw}article{max-width:430px}li,p{line-height:1.5}a{color:#65e4f4}</style><main>'+svg+'<article><h1>Shoot. Pop. Jump.</h1><ol><li>Walk from the existing east campus access along the marked route and ramp.</li><li>Shoot LOAD → HEAT → POP. Wrong order gives a tiny puff; your good steps stay.</li><li>Jump onto First; one shot replays the same three moves and pops Reuse.</li><li>Jump Reuse, then Fork. Choose popcorn moustache or overflowing bucket; both are correct.</li><li>Jump the branch, then Finish. Shoot the final receiver to overflow the basket and earn Skills badge once.</li></ol><p>Five essential jumps, 4m minimum landing, 1m edge gaps. Actual airborne proof gates progress even if ordinary movement can cross a gap. Symmetric branch travel is 6.40m center-to-center. Audio is optional.</p><p>Protected planter/canopy/corals stay. Only primary old controls retire. Full 34×37m floor catches misses; 2m east buffer. Return and Replay use existing hub and badge authority.</p><p>Runtime sequence/jump adapter was independently tested. Production profile, explicit cosmetics and journal migration are included implementation tasks. Final full-course collision/jump/recovery/comedy checks occur after approved placement.</p><p><a href="production-revision.md">Scope and implementation</a> · <a href="production-scene.yaml">Exact actor/config manifest</a> · <a href="review.md">Requirement review</a> · <a href="generated/preview.html">Generated review</a></p></article></main>'
(P/'parkour-preview.html').write_text(page,encoding='utf-8')
