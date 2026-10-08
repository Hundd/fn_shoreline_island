import importlib,json,copy
m=importlib.import_module('implementation-client');P=m.P
actor=json.loads((P/'popup-actor.json').read_text())
values={'autoDisplay':'None','enabledDuringPhase':'Gameplay Only','templateResponseType':'2 Buttons','backActionBoundButton':'Button2','useDialogTimeout':False,'timerOptions':'None','doNotCloseOnButtonPress':True,'contentAlignment':'Centered','templateOverrideClass':None,'title':'Return to Hub?','description':'Mission complete! Return to the hub now?','button1Text':'Return to Hub','button2Text':'Cancel','bHidden':True,'bNoCollision':True}
schema=m.unpack(json.loads((P/'popup-schema.json').read_text()));assert all(k in schema for k in values)
m.call('popup-values-before','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':actor,'properties':list(values)})
# Actor settings already applied/read back; resume primitive phase only.
after=m.call('popup-values-after','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':actor,'properties':list(values)});assert after==values,after
components=json.loads((P/'popup-primitive-schema-values-resolved.json').read_text())['primitives']
result=[]
for i,c in enumerate(components):
 ref=c['component']
 before=m.call(f'popup-primitive-{i}-current','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':ref,'properties':['bodyInstance','bHiddenInGame','bRenderInMainPass']})
 if before['bodyInstance']['collisionEnabled']!='NoCollision':
  body=copy.deepcopy(before['bodyInstance']);body['collisionEnabled']='NoCollision'
  m.call(f'popup-primitive-{i}-collision','editor_toolset.toolsets.object.ObjectTools','set_properties',{'instance':ref,'values':json.dumps({'bodyInstance':body})})
 m.call(f'popup-primitive-{i}-render','editor_toolset.toolsets.object.ObjectTools','set_properties',{'instance':ref,'values':json.dumps({'bHiddenInGame':True,'bRenderInMainPass':False})})
 after_component=m.call(f'popup-primitive-{i}-after','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':ref,'properties':['bodyInstance','bHiddenInGame','bRenderInMainPass']})
 assert after_component['bodyInstance']['collisionEnabled']=='NoCollision' and after_component['bHiddenInGame'] and not after_component['bRenderInMainPass']
 result.append({'component':ref,'values':after_component})
r={'primitives':result}
(P/'popup-primitive-configured-resolved.json').write_text(json.dumps(r,indent=2))
pose=m.call('popup-full-transform','editor_toolset.toolsets.actor.ActorTools','get_actor_transform',{'actor':actor})
assert pose=={'location':{'x':-4900,'y':-17320,'z':2000},'rotation':{'pitch':0,'yaw':0,'roll':0},'scale':{'x':1,'y':1,'z':1}}
m.call('popup-save','editor_toolset.toolsets.scene.SceneTools','save_actor',{'actor':actor})
(P/'popup-resolved.json').write_text(json.dumps({'actor':actor,'transform':pose,'settings':after,'primitive_count':len(r['primitives']),'collision_enabled':'NoCollision','world_render':False},indent=2))
