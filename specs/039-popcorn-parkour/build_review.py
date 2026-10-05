"""Offline design authoring helper; never calls editor or edits gameplay."""
from pathlib import Path
import html
import yaml

class ExplicitDumper(yaml.SafeDumper):
    def ignore_aliases(self, data):
        return True

ROOT = Path(__file__).parent
nodes = [
    dict(id='starter', center=[17,8,1.2], size=[6,4,0.4], initially_built=True),
    dict(id='first', center=[17,12.5,1.2], size=[4,4,0.4], initially_built=False),
    dict(id='reuse', center=[17,17,1.2], size=[4,4,0.4], initially_built=False),
    dict(id='fork', center=[17,21.5,1.2], size=[8,4,0.4], initially_built=False),
    dict(id='left', center=[10,26,1.2], size=[4,4,0.4], initially_built=False),
    dict(id='right', center=[24,26,1.2], size=[4,4,0.4], initially_built=False),
    dict(id='finish', center=[17,30.5,1.2], size=[12,4,0.4], initially_built=True),
]
edges = [dict(source=a,destination=b,edge_gap_m=g,kind='jump') for a,b,g in [
    ('starter','first',0.5),('first','reuse',0.5),('reuse','fork',0.5),
    ('fork','left',1.118),('fork','right',1.118),('left','finish',0.5),('right','finish',0.5)]]
receivers = [
    dict(target_id=0,name='LOAD',position=[15.5,10,2.6],from_landing='starter',creates=None),
    dict(target_id=1,name='HEAT',position=[17,10,2.6],from_landing='starter',creates=None),
    dict(target_id=2,name='POP',position=[18.5,10,2.6],from_landing='starter',creates='first'),
    dict(target_id=3,name='PopBridge',position=[17,14.8,2.6],from_landing='first',creates='reuse'),
    dict(target_id=4,name='PopBridge',position=[17,19.3,2.6],from_landing='reuse',creates='fork'),
    dict(target_id=5,name='Moustache PopBridge',position=[12,24.5,2.6],from_landing='fork',creates='left'),
    dict(target_id=6,name='Bucket PopBridge',position=[22,24.5,2.6],from_landing='fork',creates='right'),
    dict(target_id=7,name='Final PopBridge',position=[17,32.7,2.6],from_landing='finish',creates='basket_overflow'),
]
contract = dict(version=1,status='proposed_adapter_contract_not_runtime',
    coordinate_provenance='New design inside measured primary 34x37m floor; proposed dimensions, not measured jumpability',
    nodes=nodes,jump_edges=edges,receivers=receivers,
    branch_rule='Either left or right is equally valid; no preferred target; logical course milestone identical',
    required_paths=[['starter','first','reuse','fork','left','finish'],['starter','first','reuse','fork','right','finish']],
    landing_rule='Owner grounded/dwell inside inset deck footprint; ordered predecessor accepted; no airborne or floor shortcut',
    recovery=dict(catch_bounds=[6,5,28,34],floor_z=0,deck_top_z=1.2,maximum_latency_seconds=1,
        preserve=['skill','built_platforms','earned_badge'],teleport='Last accepted landing center + safe character offset',
        entry_ramp_exemption='Before first landing only; catch area excludes campus approach',
        failure='Keep progress; bounded retry with readable Return'),
    skill=dict(name='PopBridge',instructions=['Load','Heat','Pop'],wrong_order='Retain prefix; tiny puff; expected mechanism highlight',
        reuse='Play identical three instructions visibly; platform solid only after completion',consumed='Already popped; no geometry duplicate'),
    visual=dict(meshes=['/VerseEngineAssets/Cube.Cube','/VerseEngineAssets/Sphere.Sphere'],
        stable_collision='Flat cube top; 4m clear landing; spheres outside footprint; no collision animation',
        popcorn='Cream five-lobe sphere cluster with yellow center; targetable machine below far edge; visible ribbon',
        jokes=['tiny kernel failed bridge','left popcorn moustache on Pix','right overflowing bucket','final basket overflow'],
        essential_audio=False),
    milestone_mapping={'0':'First landing after teaching','1':'Reuse landing after first saved invocation','2':'Finish arrival after valid branch and final skill shot'},
    reset='Generation/round/owner cancellation; replay clears attempt and teleports starter; earned badge retained; round authority unchanged',
    adapter_gate='A01/A02 must resolve with separately approved development and verification before map execution')
def device(i,c,count,source,settings):
    return dict(id=i,**{'class':c},count=count,source=source,settings=settings)
devices=[
    device('controller','fn_shoreline_island_popbridge_controller',1,'Proposed reusable adapter; absent today; plan.md development boundary',{'course_contract':contract,'legacy_primary_replacement_only':True}),
    device('targets','fn_shoreline_island_data_target',8,'Reuse class; new primary target assemblies IDs0..7',{'mission_id':'Resolve unique namespace; do not assume module7 equals target mission7','damage_only':True,'agent_attribution':True,'surface_size_m':[1.2,1.2],'park_inactive_surfaces':True}),
    device('blaster','fn_shoreline_island_data_blaster',1,'Existing shared loadout; no duplicate granter',{'reuse_existing':True,'safe_ammunition':'Read existing granter settings; verify sustained retry','invulnerability':'Existing SetVulnerability(false)'}),
    device('progress','fn_shoreline_island_nursery_progress',1,'Existing exact primary progress in evidence/planning-inspection.json',{'reuse_existing':True,'milestones':[0,1,2],'badge_description':'Teach PopBridge and reuse it to cross the popcorn course.'}),
    device('journal','fn_shoreline_island_academy_journal',1,'Existing navigation_journal binding',{'module_id':7,'reuse_existing':True,'agent_prerequisites':'same Skills authority'}),
    device('controls','button_device',3,'Reuse primary Return/Replay; add finish Return',{'return':'Available all phases; existing hub destination','replay':'Reset attempt, preserve badge','old_primary_controls':'Hide/disable all other old primary controls and subscriptions'}),
    device('props','creative_prop',1,'Grouped art/deck reconciliation inventory; count1 denotes assembly group, not spawned-prop count',{'deck_count':7,'cube_mesh':'/VerseEngineAssets/Cube.Cube','sphere_mesh':'/VerseEngineAssets/Sphere.Sphere','existing_pix':'nursery_robot','starter_ramp':{'width_m':3,'length_m':11,'rise_m':1.2,'from':[3,8,0],'to':[14,8,1.2],'note':'Proposed straight +X ramp, 10.9 percent slope; bounds X3..14 Y6.5..9.5. Joins starter west edge. Catch recovery excludes ramp until first accepted landing.'},'collision_top_m':1.2}),
]
markers=[dict(id='arrival',kind='spawn',zone='course',label='Existing campus arrival; no spawn device',position=[17,2,0],source='Proposed local approach on measured existing floor'),
    dict(id='weapon',kind='weapon',zone='course',label='Shared Data Blaster already granted',position=[20,2,0],source='Existing loadout annotation; no new granter'),
    dict(id='return',kind='exit',zone='course',label='Keep primary Return',position=[5.3,13,1],source='Existing Return approximate design annotation; native ref resolved in evidence, final pose to read back'),
    dict(id='ribbon',kind='knowledge',zone='course',label='PopBridge = Load > Heat > Pop',position=[23,8,2.6],source='Proposed readable ribbon beside starter; not answer-bank'),
    dict(id='reward',kind='reward',zone='course',label='Skills badge once + Replay/Return',position=[17,30.5,1.2],source='Proposed final landing; actual arrival AND final shot required')]
for n in nodes:
    markers.append(dict(id=n['id']+'_landing',kind='checkpoint',zone='course',label=n['id'].title()+' landing',position=n['center'],source='Proposed stable deck; adapter position-checkpoint, not native checkpoint device'))
for r in receivers:
    markers.append(dict(id='target_'+str(r['target_id']),kind='target',zone='course',label=r['name'],position=r['position'],target_id=r['target_id'],source='Proposed damage receiver; course_contract gates from '+r['from_landing']))
stages=[]
for i,(sid,active,success,completion) in enumerate([
    ('teach_load',['target_0','target_1','target_2'],'target_0','Load accepted; retain prefix on wrong-order shot'),
    ('teach_heat',['target_0','target_1','target_2'],'target_1','Heat accepted; retain prefix on wrong-order shot'),
    ('teach_pop',['target_0','target_1','target_2'],'target_2','PopBridge saved, first deck appears; actual first landing completes milestone0'),
    ('first_reuse',['target_3'],'target_3','Requires first landing; replay three instructions then reuse deck appears; landing completes milestone1'),
    ('course_routes',[],None,'Detailed settings contract handles target4 then equal targets5 OR6; fork then either branch then finish arrival; no branch selection represented by v1 success_target'),
    ('finale',['target_7'],'target_7','Requires valid branch and finish arrival; same routine overflows basket; milestone2 and existing badge once')]):
    stage=dict(id=sid,zone='course',purpose=sid.replace('_',' '),requires=[] if i==0 else [stages[-1]['id']],active_targets=active,completion=completion)
    if success: stage['success_target']=success
    stages.append(stage)
data=dict(version=1,map=dict(id='popcorn_parkour',title="Pix's Popcorn Parkour",theme='cream_popcorn_factory_comedy',units='meters',origin_cm=[-5200,-19000,2400],size=[34,37,8],learning_objective='Teach one named sequence once, then reuse it with one shot at new machines; jump on what it creates.',source_feature='specs/039-popcorn-parkour/spec.md',intent='propose_change',min_path_width=3,position_tolerance=0.1),
    player_flow=['course'],zones=[dict(id='course',label='Primary Skills bay: teach > shoot > jump > choose > finish',pattern='shooting_gallery',position=[0,0,0],size=[34,37,8],purpose='Single existing bay envelope; detailed physical route is controller.settings.course_contract and parkour-preview.html, not a continuous walk corridor.',parameters=dict(target_count=8,friendly_fire=False),devices=[d['id'] for d in devices],overlap_with=[],completion='Actual ordered landings plus final skill shot; existing badge once.',reset='Cancel owner/generation/round work; clear attempt geometry; preserve earned badge except existing round reset.')],connections=[],markers=markers,devices=devices,stages=stages,
    assumptions=[dict(id='a01_adapter',detail='Reusable PopBridge sequence, equal-route and safe-checkpoint adapter absent. Needs separately approved code-only development/verification gate; map mutations blocked.',status='open',evidence='Current nursery gardening controller + data_target Hit(agent); plan.md development boundary'),
        dict(id='a02_route_contract',detail='v1 linear stages do not validate jump edges/equal receivers. Embedded course_contract must gain verified adapter validation before execution; no fake walk links.',status='open',evidence='design/MAP_SPEC.md; controller.settings.course_contract'),
        dict(id='a03_entry_ramp',detail='Proposed straight 11m long, 3m wide +X entry ramp from local3,8,0 to14,8,1.2 joins starter west edge; 10.9 percent slope, inside primary bay.',status='resolved',evidence='controller/props settings exact geometry; footprint separate from Return annotation at5.3,13; actual accessibility requires cooked acceptance'),
        dict(id='a04_art',detail='Known VerseEngineAssets Sphere/Cube are intentional stylized final popcorn art; existing Pix reused. No imported asset dependency.',status='resolved',evidence='Live asset bounds recorded in evidence/planning-inspection.json; final shape/collision cooking is acceptance work'),
        dict(id='a05_bay',detail='Primary 34x37m bay measured; compact two-route course stays within it.',status='resolved',evidence='Live nursery_floor descriptor in evidence/planning-inspection.json')])
(ROOT/'map.yaml').write_text(yaml.dump(data,Dumper=ExplicitDumper,sort_keys=False,allow_unicode=True),encoding='utf-8')
parts=['<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 720 790" role="img" aria-label="Proposed popcorn jump course">','<rect width="720" height="790" fill="#102030"/>','<rect x="20" y="30" width="680" height="740" fill="#203a48" stroke="#8ecad5"/>']
lookup={n['id']:n for n in nodes}
for e in edges:
    a,b=lookup[e['source']]['center'],lookup[e['destination']]['center']
    parts.append(f'<line x1="{20+a[0]*20}" y1="{30+a[1]*20}" x2="{20+b[0]*20}" y2="{30+b[1]*20}" stroke="#ffc765" stroke-width="3" stroke-dasharray="5 5"/>')
for n in nodes:
    x,y,z=n['center'];w,h,d=n['size']; color='#fff3cf' if n['initially_built'] else '#f8d78b'
    parts.append(f'<rect x="{20+(x-w/2)*20}" y="{30+(y-h/2)*20}" width="{w*20}" height="{h*20}" rx="15" fill="{color}" stroke="#d39530" stroke-width="3"/><text x="{20+x*20}" y="{30+y*20+5}" text-anchor="middle" fill="#19323b" font-size="17">{n["id"].title()}</text>')
for r in receivers:
    x,y,z=r['position'];parts.append(f'<circle cx="{20+x*20}" cy="{30+y*20}" r="11" fill="#39d7f1" stroke="#0b1f2b"/><text x="{20+x*20}" y="{30+y*20+5}" text-anchor="middle" font-size="13">{r["target_id"]}</text>')
parts+=['<rect x="80" y="160" width="220" height="60" fill="#79949d"/><text x="190" y="185" text-anchor="middle" fill="white" font-size="15">Entry ramp</text><text x="190" y="205" text-anchor="middle" fill="white" font-size="12">11m / 3m wide</text>','<text x="360" y="76" text-anchor="middle" fill="white" font-size="18">Existing campus approach / Return</text>','<text x="60" y="740" fill="white" font-size="15">Catch floor underneath — quick return to last landing</text>','</svg>']
svg=''.join(parts)
(ROOT/'parkour-preview.svg').write_text(svg,encoding='utf-8')
page='''<!doctype html><meta charset="utf-8"><title>Pix's Popcorn Parkour — concrete review</title><style>body{margin:30px;background:#102030;color:#eff8fa;font:17px system-ui;max-width:1150px}main{display:flex;gap:28px}svg{width:560px;max-width:55vw}p{line-height:1.5}li{margin:12px 0}a{color:#73dafa}table{border-collapse:collapse}td,th{padding:8px;border:1px solid #527483}</style><h1>Pix's Popcorn Parkour</h1><p>Teach once. Shoot one receiver. Make giant popcorn. Jump onto it.</p><main>'''+svg+'''<section><h2>The five-jump toy</h2><ol><li>From Starter, shoot LOAD → HEAT → POP (0,1,2). Tiny puff for wrong order; prefix stays.</li><li>Jump to First; shoot saved PopBridge (3). Watch the same three actions execute.</li><li>Jump to Reuse; shoot (4) to pop the broad Fork landing.</li><li>Jump to Fork; choose Moustache (5) or Bucket (6). Both are correct.</li><li>Jump to either branch, then Finish. Shoot (7); basket overflows, badge once.</li></ol><p>Landings are 4m deep, at least 4m wide, fixed at the same height. Most gaps 0.5m; outward branch gaps 1.12m diagonally. No sprint or midair shot intended. Catch floor returns you within one second; built platforms stay.</p><p>Art: cream lumpy spheres around flat stable decks, tiny yellow kernel, Pix popcorn moustache and comically overflowing baskets. Only decoration wobbles.</p><h2>Review boundary</h2><p>Proposed dimensions inside live-measured 34 × 37m primary bay. Jumpability, collision and fun require cooked testing. Cyan numbers are gun receivers; dashed edges are jumps, never walk routes.</p><p>A01/A02 adapter and route-contract development gate blocks execution. Exact starter ramp still needs resolution (A03). No approval or gameplay changes.</p><p><a href="generated/preview.html">Generated map review</a> · <a href="generated/implementation.yaml">Draft implementation</a> · <a href="review.md">Requirement-linked review</a></p></section></main>'''
page=page.replace('Exact starter ramp still needs resolution (A03).','The entry ramp is 11m long, 3m wide, rising 1.2m; it joins the starter from the west.')
(ROOT/'parkour-preview.html').write_text(page,encoding='utf-8')
