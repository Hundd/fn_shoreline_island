"""Generate the authored geometry and supplementary station elevation, offline only."""
import hashlib
import json
from pathlib import Path
import yaml

ROOT = Path(__file__).parent
# Reviewed correction is an update/delete delta, never a fresh spawn list.
candidate=json.loads((ROOT/'closure-pix-delta.json').read_text())
candidate['status']='approved_closure_pix_pending_execution'
parts=candidate['desired_feature_actors_for_verification_only']
cream, navy, teal = 'MI_CampusCream','MI_CampusDeepNavy','MI_CampusLagoonTeal'
(ROOT/'scene-delta.json').write_text(json.dumps(candidate,indent=2)+'\n')

# Dimensioned elevation: approach from negative world Y, looking toward positive Y at the revised widget fronts.
svg=['<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="820" viewBox="0 0 1200 820">',
 '<rect width="1200" height="820" fill="#edf1ee"/>',
 '<style>text{font-family:Arial,sans-serif;fill:#172b3e}.title{font-size:30px;font-weight:700}.note{font-size:17px}.small{font-size:14px}</style>',
 '<text x="60" y="55" class="title">Hub / station information wall</text>',
 '<text x="60" y="86" class="note">Arrival-facing elevation · eight existing screens · cream / navy / teal</text>']
def rect(x,y,w,h,fill):
    svg.append(f'<rect x="{x}" y="{y}" width="{w}" height="{h}" fill="{fill}"/>')
def project(lo,hi,fill):
    rect(100+(-420-hi[0])*.72,620-(hi[2]-2400)*.72,(hi[0]-lo[0])*.72,(hi[2]-lo[2])*.72,fill)
for p in parts:
    if 'tv_' not in p['label']:
        project(p['bounds_cm']['min'],p['bounds_cm']['max'], '#dedfd4' if p['material'].endswith(cream) else '#137f85' if p['material'].endswith(teal) else '#172b3e')
names=["1 Prompt Workshop","2 Pattern Scanner","3 AI Classifier","4 Confidence Core","5 AI Error Lab","6 AI Tool Lab","7 Pix's Popcorn Parkour","8 AI Agent Mission"]
for row,z in enumerate([2902.5,2702.5]):
    for col,x in enumerate([-1500,-1200,-900,-600]):
        px=100+(-420-x)*.72; py=620-(z-2400)*.72
        rect(px-88,py-42,176,84,'#102735');rect(px-82,py-36,164,72,'#253f4a')
        svg.append(f'<text x="{px}" y="{py-5}" text-anchor="middle" style="font: bold 11px Arial;fill:#faf6e7">{names[row*4+col]}</text>')
        svg.append(f'<text x="{px}" y="{py+17}" text-anchor="middle" style="font: 12px Arial;fill:#87d8cf">WAITING</text>')
rect(80,620,970,4,'#172b3e')
svg += ['<text x="550" y="550" text-anchor="middle" class="note">CLOSED WALL</text>',
 '<text x="550" y="578" text-anchor="middle" class="small">Pix stands at the center, facing arrival</text>',
 '<text x="550" y="665" text-anchor="middle" class="note">12.6m wall width · 6.6m wall height · 0.35m wall depth</text>',
 '<text x="60" y="714" class="note">Every TV: navy bezel + shallow rear housing + wall mounting block.</text>',
 '<text x="60" y="747" class="note">Opening filled; Pix centered 2.85m in front of wall. Use the existing east-side route.</text>',
 '<text x="60" y="788" class="small">Schematic, not an Unreal render. Text is illustrative; existing runtime labels and status logic remain authoritative.</text></svg>']
(ROOT/'generated/station-elevation.svg').write_text('\n'.join(svg),encoding='utf-8')
(ROOT/'generated/station-review.html').write_text('<!doctype html><meta charset="utf-8"><title>Hub station proposal</title><style>body{margin:0;background:#edf1ee;font:18px Arial}main{max-width:1200px;margin:auto}img{width:100%}p{margin:24px}a{color:#087477}</style><main><img src="station-elevation.svg" alt="Dimensioned station display wall elevation"><p><a href="preview.html">Top-down blockout and requirements</a> · <a href="implementation.yaml">Generated implementation plan</a></p><p>Keep55 feature pieces; extend existing lowerwall/base to close opening. Move existing Pix and Talk to center front, turn face/name toward arrival, synchronize existing invitation center. Full TV titles/poses and bindings remain unchanged.</p></main>',encoding='utf-8')
hashes={p:hashlib.sha256((ROOT/p).read_bytes()).hexdigest() for p in ['spec.md','plan.md','scene-delta.json','generated/station-elevation.svg','generated/station-review.html']}
data=dict(version=1,map=dict(id='hub_station_display_wall',title='Hub station display wall',theme='coastal_station_concourse',units='meters',origin_cm=[-3200,0,2300],size=[62,36,10],learning_objective='Keep the eight lesson status displays readable and visibly grounded while preserving access to independent activities.',source_feature='specs/060-hub-station-display-wall/spec.md',intent='propose_change',min_path_width=1.2,position_tolerance=.02),
 player_flow=['hub'],zones=[dict(id='hub',label='Existing hub and rear route',pattern='corridor',position=[0,0,0],size=[62,36,10],purpose='Ground the information bank in station architecture while preserving learning choices and existing circulation.',parameters=dict(width_m=1.2,access='Closed central wall; approach Pix in front and use existing east-side detour aroundwall toward rearwalkway.'),devices=['station'],overlap_with=[],completion='Existing lesson completion remains authoritative.',reset='Existing controllers unchanged.')],connections=[],
 markers=[dict(id='arrival',kind='spawn',zone='hub',label='Existing hub return',position=[25,15,2],source='Measured hub_destination bounds center; reuse, no new spawn.'),dict(id='displays',kind='knowledge',zone='hub',label='Eight framed existing status TVs',position=[21.5,23,4],source='Restore checkpoint positions from repair-preflight.json; same actors retain yaw0 and bindings.'),dict(id='rear_passage',kind='exit',zone='hub',label='Existing east-edge route',position=[28.5,24.5,1.12],source='East X-350 native traceclear,ground2412; cookedcapsule traversal required afterclosure.'),dict(id='pix',kind='knowledge',zone='hub',label='Existing Pix travel helper',position=[21.5,20.5,1],source='Measured helper relocation:root(-1050,2050,2400),faceyaw90;Talkandexistinginvitecenter follow.')],
 devices=[dict(id='station',**{'class':'static_mesh_actor'},count=len(parts),source='scene-delta.json exact correction update/delete geometry; existing Engine cube and project materials documented in feature048.',settings=dict(scene_delta_sha256=hashes['scene-delta.json'],review_artifacts_sha256=hashes,retained_billboard_count=8,retained_light_count=8,changed_feature_actor_count=2,pix_actor_count=2,component_rotation_count=1,collision='BlockAll for three structural pieces; other52 NoCollision'))],
 stages=[dict(id='orient',zone='hub',purpose='Read existing lesson status and choose a destination through unchanged routes or Pix.',requires=[],active_targets=[],completion='Existing lesson controllers determine progress and rewards.')],
 assumptions=[dict(id='geometry',status='resolved',detail='Measured Pixground2400 and eastedgeground2412;fillformeropeningbyextendingwall/base while retainingrightpier2412. ExistingeastdetourandPixinteractionrequirecookedverification.',evidence='evidence/pix-closure-readonly-survey.md; plan.md'),dict(id='assets',status='resolved',detail='Use existing Engine Cube and project materials; feature048 validated the same cube representation. No restricted mesh exports or new gameplay adapter.',evidence='specs/048-campus-asset-validation-repair/plan.md; Content/Campus/Materials')])
(ROOT/'map.yaml').write_text(yaml.safe_dump(data,sort_keys=False),encoding='utf-8')
print(f'Authored {len(parts)} pieces and review elevation.')
