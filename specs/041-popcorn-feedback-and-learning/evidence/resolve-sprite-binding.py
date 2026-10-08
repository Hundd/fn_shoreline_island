import importlib,json,sys
m=importlib.import_module('implementation-client'); P=m.P
actor=m.unpack(json.loads((P/'implementation-halo-0-place-v2.json').read_text()))
icon='/CRD_VFX_Creator/Assets/Icons_64/T_UI_IconLibrary_Shockwave01_64.T_UI_IconLibrary_Shockwave01_64'
value={'spriteShape':{'smallIcon':{'refPath':icon},'largeIcon':{'refPath':icon}}} if sys.argv[1]=='loaded' else {'spriteShape':{'smallIcon':icon,'largeIcon':icon}}
m.call('implementation-sprite-'+sys.argv[1]+'-set','editor_toolset.toolsets.object.ObjectTools','set_properties',{'instance':actor,'values':json.dumps(value)})
m.call('implementation-sprite-'+sys.argv[1]+'-read','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':actor,'properties':['spriteShape']})
