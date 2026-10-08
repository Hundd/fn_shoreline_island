import json,pathlib
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence');exec((p/'read-feasibility.py').read_text().split('if __name__')[0])
def val(key):
 j=json.loads((p/f'{key}.json').read_text());return json.loads(json.loads(j['result']['content'][0]['text'])['returnValue'])
call('halo-sprite-candidates','editor_toolset.toolsets.data_table.DataTableTools','get_rows',{'data_table':{'refPath':'/CRD_VFX_Creator/Assets/DT_SpriteTable.DT_SpriteTable'},'row_names':['Shockwave','Disk01','Disk02','Bubble']})
call('audio-player-pid-schema','editor_toolset.toolsets.object.ObjectTools','list_properties',{'instance':{'refPath':'/CRD_AudioPlayer/SetupAssets/PID_CP_Devices_CRD_AudioPlayer.PID_CP_Devices_CRD_AudioPlayer'}})
q=val('hud-native-schema');print('HUD relevant keys:',[k for k in q if any(x in k.lower() for x in ['placement','anchor','position','offset','layer','time','display','message','style','size','queue'])][:50])
