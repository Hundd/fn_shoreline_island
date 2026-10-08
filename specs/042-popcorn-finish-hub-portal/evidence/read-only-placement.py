import json,pathlib,subprocess,sys
p=pathlib.Path('specs/042-popcorn-finish-hub-portal/evidence')
def call(key,ts,name,args):
 req=p/f'{key}-request.json';out=p/f'{key}.json';req.write_text(json.dumps({'jsonrpc':'2.0','id':2,'method':'tools/call','params':{'name':'call_tool','arguments':{'toolset_name':ts,'tool_name':name,'arguments':args}}}),encoding='utf-8');r=subprocess.run([sys.executable,str(p/'mcp-client.py'),str(req),'--output',str(out),'--timeout','20'],capture_output=True,text=True)
 if r.returncode:print(r.stderr[-800:]);raise SystemExit(1)
 data=json.loads(out.read_text());print(key,json.dumps(data)[:800]);return data
if __name__=='__main__':
 call('planning-game-state','ValkyrieToolset.SessionToolset','GetGameState',{})
 refs=json.loads((p/'known-native-refs.json').read_text())
 for k,v in refs.items():call(k+'-native-transform','editor_toolset.toolsets.actor.ActorTools','get_actor_transform',{'actor':v})
 call('teleporter-native-schema','editor_toolset.toolsets.object.ObjectTools','list_properties',{'instance':refs['hub_destination']})
 call('teleporter-catalogue','ValkyrieToolset.DeviceToolset','ListDeviceAssets',{'nameFilter':'Teleporter'})
