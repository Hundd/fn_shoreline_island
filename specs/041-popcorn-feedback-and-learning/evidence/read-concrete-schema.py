import json,pathlib
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence');exec((p/'read-feasibility.py').read_text().split('if __name__')[0])
def val(key):
 j=json.loads((p/f'{key}.json').read_text());return json.loads(json.loads(j['result']['content'][0]['text'])['returnValue'])
print('sprite candidates',val('halo-sprite-candidates'))
call('audio-player-pid-native-values','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':{'refPath':'/CRD_AudioPlayer/SetupAssets/PID_CP_Devices_CRD_AudioPlayer.PID_CP_Devices_CRD_AudioPlayer'},'properties':['sourceActorBlueprint','templateMap']})
q=val('hud-native-schema'); keys=['displayTime','placement','screenAnchor','placementHorizontal','placementVertical','layer','message Priority','allow Multiple in Queue','queue Message for Join in Progress Players','size','backgroundOpacity','messageCharLimit','override Default Text Style']
print('HUD schema',json.dumps({k:q[k] for k in keys if k in q})[:7000])
call('hud-native-current-settings','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':val('hud-saved-actor')['savedActor'],'properties':[k for k in keys if k in q]})
