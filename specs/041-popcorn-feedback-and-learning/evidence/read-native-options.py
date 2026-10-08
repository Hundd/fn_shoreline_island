import json,pathlib
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence');exec((p/'read-feasibility.py').read_text().split('if __name__')[0])
def val(key):
 j=json.loads((p/f'{key}.json').read_text());return json.loads(json.loads(j['result']['content'][0]['text'])['returnValue'])
for i in range(8):
 v=val(f'target{i}-feedback-bindings');call(f'target{i}-sound-native-ref','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':v['hit_sound'],'properties':['savedActor']})
v=val('controller041-feedback-refs');call('hud-native-ref','editor_toolset.toolsets.object.ObjectTools','list_properties',{'instance':v['feedback']})
j=json.loads(pathlib.Path('specs/039-popcorn-parkour/evidence/production-binding-checkpoint.json').read_text());call('halo-vfx-native-values','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':j['assemblies'][0]['cues'][0],'properties':['spriteShape','spriteTable','particleCount','particleScaleMultiplier','spriteSize','spriteDuration','particleAlignment','spriteRotationAlignment','useRandomColor','spriteSpeed','effectGravity','effectGenerationAmount','spriteRotation','startEffectsWhenEnabled','toyOptionsComponent']})
