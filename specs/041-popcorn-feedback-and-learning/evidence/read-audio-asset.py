import json,pathlib
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence');exec((p/'read-feasibility.py').read_text().split('if __name__')[0])
def val(key):
 j=json.loads((p/f'{key}.json').read_text());return json.loads(json.loads(j['result']['content'][0]['text'])['returnValue'])
wave={'refPath':'/Game/Sounds/Creative/Gadgets/Ball/Ball_Pop_01.Ball_Pop_01'}
call('pop-wave-schema','editor_toolset.toolsets.object.ObjectTools','list_properties',{'instance':wave})
q=val('audio-native-schema'); keys=[k for k in q if any(x in k.lower() for x in ['attenuation','min distance','max distance','spatial','fade','enableduring'])];print('AUDIO ATTEN',json.dumps({k:q[k] for k in keys})[:5500])
call('audio-native-current-settings','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':{'refPath':'/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.Device_CRD_AudioPlayer_C_UAID_E89C2592D1B5CB0403_1556941814'},'properties':['audio','volume','play On Hit','can Be Heard By','play Location','loopAudio','restart Audio When Activated','playDuringWaitingForPlayers','playDuringGameCountdown','playDuringGameplay','playDuringRoundEnd','playDuringGameEnd']+keys})
