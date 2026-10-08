"""One receiver per invocation, native schema/readback/save; no auditions."""
import importlib,json,sys,copy
m=importlib.import_module('implementation-client'); P=m.P
index=int(sys.argv[1]); kind=sys.argv[2]
D='ValkyrieToolset.DeviceToolset'; O='editor_toolset.toolsets.object.ObjectTools'
A='editor_toolset.toolsets.actor.ActorTools'; S='editor_toolset.toolsets.scene.SceneTools'
config=json.loads((P/'resolved-native-configuration.json').read_text())[kind]
ring=m.unpack(json.loads((P/f'implementation-baseline-{index}-ring.json').read_text()))
pose=copy.deepcopy(ring); pose['scale']={'x':1,'y':1,'z':1}
label=f'Popcorn041_{kind}_{index}'
found=m.call(f'implementation-{kind}-{index}-reuse',S,'find_actors',{'name':label,'collision_channels':[]})
if len(found)>1: raise RuntimeError('Ambiguous existing devices')
if found:
    actor={'refPath':found[0]['actorPath']}
else:
    actor=m.call(f'implementation-{kind}-{index}-place-v2',S,'add_to_scene_from_class',{'actor_type':{'refPath':config['device_class']},'name':label,'xform':pose,'snap_to_ground':False})
    m.call(f'implementation-{kind}-{index}-label',A,'set_label',{'actor':actor,'label':label})
schema=m.call(f'implementation-{kind}-{index}-schema',O,'list_properties',{'instance':actor})
values=copy.deepcopy(config['native_values'])
if kind=='halo': values['spriteShape']=config['spriteShape']
for key in values:
    if key not in schema: raise RuntimeError('Unsupported property '+key)
before=m.call(f'implementation-{kind}-{index}-before',O,'get_properties',{'instance':actor,'properties':list(values)})
m.call(f'implementation-{kind}-{index}-settings',O,'set_properties',{'instance':actor,'values':json.dumps(values)})
after=m.call(f'implementation-{kind}-{index}-readback',O,'get_properties',{'instance':actor,'properties':list(values)})
actual=m.call(f'implementation-{kind}-{index}-transform',A,'get_actor_transform',{'actor':actor})
if after != values: raise RuntimeError('Readback mismatch '+str({k:(values[k],after.get(k)) for k in values if after.get(k)!=values[k]}))
if actual != pose: raise RuntimeError('Full transform mismatch')
m.call(f'implementation-{kind}-{index}-save',S,'save_actor',{'actor':actor})
(P/f'implementation-{kind}-{index}-resolved.json').write_text(json.dumps({'actor':actor,'transform':actual,'settings':after},indent=2))
