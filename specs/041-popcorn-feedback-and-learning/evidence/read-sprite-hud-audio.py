import json,pathlib
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence');exec((p/'read-feasibility.py').read_text().split('if __name__')[0])
def val(key):
 j=json.loads((p/f'{key}.json').read_text());return json.loads(json.loads(j['result']['content'][0]['text'])['returnValue'])
call('halo-sprite-rows','editor_toolset.toolsets.data_table.DataTableTools','list_rows',{'data_table':{'refPath':'/CRD_VFX_Creator/Assets/DT_SpriteTable.DT_SpriteTable'}})
call('hud-native-schema','editor_toolset.toolsets.object.ObjectTools','list_properties',{'instance':val('hud-saved-actor')['savedActor']})
call('audio-player-blueprint-search','editor_toolset.toolsets.asset.AssetTools','find_assets',{'folder_path':'/CRD_AudioPlayer','name':'Device_AudioPlayer','recursive':True})
