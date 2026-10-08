import importlib,json
m=importlib.import_module('implementation-client');P=m.P
controller={'refPath':'/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5FA0703_1938542541'}
schema=m.call('controller-schema','ValkyrieToolset.DeviceToolset','ListDeviceProperties',{'device':controller});assert 'hub_return_confirmation' in schema
before=m.call('controller-before','ValkyrieToolset.DeviceToolset','GetDeviceProperties',{'device':controller,'propertyNames':list(schema)})
wrapper=before['hub_return_confirmation']
ws=m.call('popup-wrapper-schema','editor_toolset.toolsets.object.ObjectTools','list_properties',{'instance':wrapper});assert 'savedActor' in ws
m.call('popup-binding-before','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':wrapper,'properties':['savedActor']})
actor=json.loads((P/'popup-actor.json').read_text())
m.call('popup-binding-set','editor_toolset.toolsets.object.ObjectTools','set_properties',{'instance':wrapper,'values':json.dumps({'savedActor':actor})})
after=m.call('popup-binding-after','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':wrapper,'properties':['savedActor']});assert after['savedActor']==actor
m.call('controller-save','editor_toolset.toolsets.scene.SceneTools','save_actor',{'actor':controller})
full=m.call('controller-after','ValkyrieToolset.DeviceToolset','GetDeviceProperties',{'device':controller,'propertyNames':list(schema)});assert before==full
found=m.call('popup-count','editor_toolset.toolsets.scene.SceneTools','find_actors',{'name':'pop043_hub_return_confirmation','collision_channels':[]});assert len(found)==1 and found[0]['actorPath']==actor['refPath']
(P/'binding-resolved.json').write_text(json.dumps({'controller':controller,'wrapper':wrapper,'popup':after['savedActor'],'count':len(found),'other_controller_properties_unchanged':True},indent=2))
