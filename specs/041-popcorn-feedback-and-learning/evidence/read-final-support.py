import json,pathlib
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence');exec((p/'read-feasibility.py').read_text().split('if __name__')[0])
call('pop-wave-duration','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':{'refPath':'/Game/Sounds/Creative/Gadgets/Ball/Ball_Pop_01.Ball_Pop_01'},'properties':['duration','bLooping','volume']})
q=json.loads(json.loads(json.loads((p/'hud-native-schema.json').read_text())['result']['content'][0]['text'])['returnValue']);print('DISPLAY schemas',json.dumps({k:q[k] for k in ['displayTimeOption','displayTimeOverride','placementHorizontal','placementVertical']}))
# Inspect real supported texture asset metadata, no image/gameplay execution.
call('halo-shockwave-texture-tags','editor_toolset.toolsets.asset.AssetTools','get_asset_tags',{'asset_path':'/Game/Effects/Fort_Effects/Textures/Outlander/T_InTheZone_GroundRing_01.T_InTheZone_GroundRing_01'})
