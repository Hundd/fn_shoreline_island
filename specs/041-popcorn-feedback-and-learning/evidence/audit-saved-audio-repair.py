import importlib,json,hashlib
from pathlib import Path
m=importlib.import_module('implementation-client'); P=m.P
record=json.loads((P/'validation-audio-repair-native-resolved.json').read_text())
asset=record['replacement']; old='/Game/Sounds/Quests/SFX/Device/Device_Call_End_Pop_01.Device_Call_End_Pop_01'
m.call('validation-audio-repair-save-assets','editor_toolset.toolsets.asset.AssetTools','save_assets',{'asset_paths':[asset,'/fn_shoreline_island/fn_shoreline_island']})
audit=[]
for item in record['audio']:
    package=item['package'].split('.')[0]
    relative=package.removeprefix('/fn_shoreline_island/')
    filename=Path('Content')/(relative+'.uasset')
    raw=filename.read_bytes()
    restricted='Device_Call_End_Pop_01'
    new_name='popcorn_hit_original'
    audit.append({'actor':item['actor'],'package':package,'file':str(filename),'sha256':hashlib.sha256(raw).hexdigest(),'restricted_name_ascii_present':restricted.encode() in raw,'restricted_name_utf16_present':restricted.encode('utf-16le') in raw,'original_sound_name_present':new_name.encode() in raw or new_name.encode('utf-16le') in raw})
summary={'native_reference_count':len(record['audio']),'native_replacement':asset,'saved_actor_files':audit,'original_source_md5':hashlib.md5(Path('Resources/Audio/popcorn_hit_original.wav').read_bytes()).hexdigest()}
summary['original_sound_referencers']=m.call('validation-audio-original-referencers','editor_toolset.toolsets.asset.AssetTools','get_referencers',{'asset_path':asset})
summary['restricted_sound_referencers']=m.call('validation-audio-rejected-referencers','editor_toolset.toolsets.asset.AssetTools','get_referencers',{'asset_path':old})
(P/'validation-audio-repair-saved-reference-audit.json').write_text(json.dumps(summary,indent=2))
print(json.dumps(summary,indent=2))
