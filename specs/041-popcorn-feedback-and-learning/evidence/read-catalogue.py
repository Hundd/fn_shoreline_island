import json,pathlib,subprocess,sys
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence');exec((p/'read-feasibility.py').read_text().split('if __name__')[0])
def val(key):
 j=json.loads((p/f'{key}.json').read_text());return json.loads(json.loads(j['result']['content'][0]['text'])['returnValue'])
v=val('controller041-feedback-refs');call('hud-saved-actor','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':v['feedback'],'properties':['savedActor']})
call('audio-player-catalogue','ValkyrieToolset.DeviceToolset','ListDeviceAssets',{'nameFilter':'AudioPlayer'})
t='editor_toolset.toolsets.data_table.DataTableTools';req=p/'describe-DataTableTools-request.json';req.write_text(json.dumps({'jsonrpc':'2.0','id':2,'method':'tools/call','params':{'name':'describe_toolset','arguments':{'toolset_name':t}}}));r=subprocess.run([sys.executable,str(p/'mcp-client.py'),str(req),'--output',str(p/'describe-DataTableTools.json'),'--timeout','20'],capture_output=True,text=True);print('DataTableTools',r.returncode)
call('halo-toy-options-schema','editor_toolset.toolsets.object.ObjectTools','list_properties',{'instance':val('halo-vfx-native-values')['toyOptionsComponent']})
