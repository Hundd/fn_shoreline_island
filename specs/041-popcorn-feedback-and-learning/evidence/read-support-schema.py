import json,pathlib
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence');exec((p/'read-feasibility.py').read_text().split('if __name__')[0])
def val(key):
 j=json.loads((p/f'{key}.json').read_text());return json.loads(json.loads(j['result']['content'][0]['text'])['returnValue'])
v=val('target0-feedback-bindings')
call('sound-wrapper-schema','editor_toolset.toolsets.object.ObjectTools','list_properties',{'instance':v['hit_sound']})
j=json.loads(pathlib.Path('specs/039-popcorn-parkour/evidence/production-binding-checkpoint.json').read_text())
call('halo-vfx-native-schema','editor_toolset.toolsets.object.ObjectTools','list_properties',{'instance':j['assemblies'][0]['cues'][0]})
controller='/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5FA0703_1938542541'
call('controller041-feedback-refs','ValkyrieToolset.DeviceToolset','GetDeviceProperties',{'device':{'refPath':controller},'propertyNames':['feedback','ribbon','navigation_journal','course_targets']})
