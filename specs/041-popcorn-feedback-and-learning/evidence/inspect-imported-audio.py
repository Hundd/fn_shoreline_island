import importlib,json
m=importlib.import_module('implementation-client'); P=m.P
asset='/fn_shoreline_island/Audio/popcorn_hit_original.popcorn_hit_original'
T='editor_toolset.toolsets.asset.AssetTools'; O='editor_toolset.toolsets.object.ObjectTools'
record={}
record['asset_class']=m.call('validation-audio-original-class',T,'get_asset_class',{'asset_path':asset})
if record['asset_class']!='SoundWave': raise RuntimeError('Original imported asset is not SoundWave')
record['tags']=m.call('validation-audio-original-tags',T,'get_asset_tags',{'asset_path':asset})
record['object']=m.call('validation-audio-original-load',T,'load_asset',{'asset_path':asset})
record['schema']=m.call('validation-audio-original-schema',O,'list_properties',{'instance':record['object']})
record['properties']=m.call('validation-audio-original-properties',O,'get_properties',{'instance':record['object'],'properties':[k for k in ['duration','numChannels','importedSampleRate','sampleRate','assetImportData','bLooping'] if k in record['schema']]})
record['dependencies']=m.call('validation-audio-original-dependencies',T,'get_dependencies',{'asset_path':asset})
data=json.loads((P/'original-pop-audio-provenance.json').read_text())
data.update({'native_imported_asset':asset,'native_type':record['asset_class'],'imported_source_tags':record['tags'],'native_properties':record['properties'],'native_dependencies':record['dependencies']})
(P/'original-pop-audio-provenance-imported.json').write_text(json.dumps(data,indent=2))
