import json,pathlib
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence');exec((p/'read-feasibility.py').read_text().split('if __name__')[0])
call('audio-native-schema','editor_toolset.toolsets.object.ObjectTools','list_properties',{'instance':{'refPath':'/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.Device_CRD_AudioPlayer_C_UAID_E89C2592D1B5CB0403_1556941814'}})
call('audio-player-native-asset','editor_toolset.toolsets.asset.AssetTools','find_assets',{'folder_path':'/CRD_AudioPlayer','name':'Device_CRD_AudioPlayer','recursive':True})
call('pop-sounds-targeted','editor_toolset.toolsets.asset.AssetTools','find_assets',{'folder_path':'/Game/Sounds','name':'Pop','asset_type':{'refPath':'/Script/Engine.SoundWave'},'recursive':True})
