import importlib,json,sys
m=importlib.import_module('implementation-client'); P=m.P
hud={'refPath':json.loads((P/'resolved-native-configuration.json').read_text())['hud']['actor']}
if sys.argv[1]=='priority':
    m.call('implementation-hud-priority-numeric','editor_toolset.toolsets.object.ObjectTools','set_properties',{'instance':hud,'values':json.dumps({'message Priority':2})})
    m.call('implementation-hud-priority-read','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':hud,'properties':['message Priority']})
elif sys.argv[1]=='inspect':
    data=m.unpack(json.loads((P/'implementation-hud-options-current.json').read_text()))
    print(json.dumps(data,indent=2))
