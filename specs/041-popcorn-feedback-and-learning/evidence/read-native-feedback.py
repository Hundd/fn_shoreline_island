import json,pathlib,sys
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence');exec((p/'read-feasibility.py').read_text().split('if __name__')[0])
j=json.loads(pathlib.Path('specs/039-popcorn-parkour/evidence/production-binding-checkpoint.json').read_text()); print('binding',str(j['binding_readback'])[:800])
for a in j['assemblies']:
 call(f'target{a["id"]}-feedback-bindings','ValkyrieToolset.DeviceToolset','GetDeviceProperties',{'device':a['device'],'propertyNames':['target_id','hit_flash','hit_sound','wrong_sound','selectable_ring','hit_surface']})
controller='/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5FA0703_1938542541'
call('controller041-schema','ValkyrieToolset.DeviceToolset','ListDeviceProperties',{'device':{'refPath':controller}})
