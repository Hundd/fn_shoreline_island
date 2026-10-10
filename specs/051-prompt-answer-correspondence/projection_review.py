import json,math,pathlib
p=pathlib.Path(__file__).parent
d=json.loads((p/'evidence/planning-inspection.json').read_text(encoding='utf-8-sig'))
targets={t['settings']['target_id']:t for t in d['targets']}
cores={dict(blue=0,red=1,green=2,small_blue=4,large_blue=5)[c['role']]:c for c in d['cores']}
views={'ramp-side':(7000,-5200),'Replay-near':(7600,-5100)}
def angle(v,x): return math.degrees(math.atan2(x[1]-v[1],x[0]-v[0]))
def xyz(loc): return [loc[k] for k in ('x','y','z')]
results=[]
for view,v in views.items():
 for posture,height in [('standing',150),('crouched',90)]:
  for tid,c in cores.items():
   h=xyz(targets[tid]['geometry']['hit_surface']['transform']['location'])
   afterh=h.copy()
   if tid==4:afterh[1]=-5000
   delta=next(x for x in d['delta'] if x['role']==c['role'])
   before=xyz(c['transform']['location']);after=xyz(delta['after']['location'])
   radius=75 if tid==4 else 125
   row={'view':view,'posture':posture,'target':tid,'before_core_ring_bearing_deg':abs(angle(v,before)-angle(v,h)),'after_core_ring_bearing_deg':abs(angle(v,after)-angle(v,afterh))}
   # Approximate ray intersection with unchanged west-facing trigger plane.
   # Center and outer-thirds are visual samples, not collision/weapon proof.
   samples=[]
   eye=[*v,2410+height]
   for sy,sz in [(0,0),(-2*radius/3,0),(2*radius/3,0),(0,-2*radius/3),(0,2*radius/3)]:
    aim=[after[0],after[1]+sy,after[2]+sz]
    ratio=(afterh[0]-eye[0])/(aim[0]-eye[0])
    yy=eye[1]+ratio*(aim[1]-eye[1]);zz=eye[2]+ratio*(aim[2]-eye[2])
    samples.append({'offset_y':yy-afterh[1],'offset_z':zz-afterh[2]})
   row['projected_samples']=samples
   # Mesh local X[-70.1875,64.125],Y[-64.125,63.875]; actor pitch90 scale3.5.
   row['inside_render_mesh_envelope']=all(-224.44<s['offset_y']<223.57 and abs(s['offset_z'])<224 for s in samples)
   results.append(row)
summary={'method':'STATIC geometry prediction, no gameplay/weapon testing. Eyes estimated 150/90cm above measured floor2410; representative XY selected beside measured Replay and west ramp. Trigger render envelope is not exact collision shape.','views':views,'results':results,'stage_active_sets':[[0,1,2],[3],[1,4,5],[5],[6,7,8]],'moving_sweep':'target5 hit and core both X9800,Y[-3650,-3150],Z2630; co-centered for entire unchanged sweep'}
(p/'evidence/projections.json').write_text(json.dumps(summary,indent=2))
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
fig,axes=plt.subplots(2,2,figsize=(12,7))
colors={0:'royalblue',1:'firebrick',2:'green',4:'deepskyblue',5:'royalblue'}
for r,(view,v) in enumerate(views.items()):
 for col,version in enumerate(['before','after']):
  ax=axes[r,col]
  for tid in [1,4,5]:
   c=cores[tid];h=xyz(targets[tid]['geometry']['hit_surface']['transform']['location'])
   loc=xyz(c['transform']['location']) if version=='before' else xyz(next(x for x in d['delta'] if x['role']==c['role'])['after']['location'])
   if version=='after' and tid==4:h[1]=-5000
   radius=75 if tid==4 else 125
   coreang=angle(v,loc);ringang=angle(v,h)
   rad=math.degrees(math.asin(radius/math.hypot(loc[0]-v[0],loc[1]-v[1])))
   ax.plot([coreang-rad,coreang+rad],[tid,tid],lw=10,color=colors[tid],alpha=.65)
   rang=[angle(v,[h[0]-10,h[1]+j*148.4,h[2]]) for j in [-1,1]]
   ax.plot(rang,[tid+.2,tid+.2],lw=3,color='darkcyan')
   ax.plot(ringang,tid+.2,'|',color='black')
  ax.set_yticks([1,4,5],['RED','SMALL BLUE','LARGE BLUE'])
  ax.set_xlim(-5,50);ax.grid(axis='x',alpha=.3)
  ax.set_title(view+' / '+version);ax.set_xlabel('Horizontal bearing (degrees); thick core / thin pulsing ring')
fig.suptitle('Static projected correspondence at stage 3 — not gameplay readability acceptance')
fig.tight_layout()
fig.savefig(p/'evidence/projection-review.png',dpi=130)
print('projection samples within render envelope:',sum(x['inside_render_mesh_envelope'] for x in results),'/',len(results))
