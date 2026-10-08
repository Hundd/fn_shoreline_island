import json,pathlib,subprocess,sys
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence')
def call(key,ts,name,args):
 req=p/f'{key}-request.json'; out=p/f'{key}.json'; req.write_text(json.dumps({'jsonrpc':'2.0','id':2,'method':'tools/call','params':{'name':'call_tool','arguments':{'toolset_name':ts,'tool_name':name,'arguments':args}}}),encoding='utf-8')
 r=subprocess.run([sys.executable,str(p/'mcp-client.py'),str(req),'--output',str(out),'--timeout','20'],capture_output=True,text=True)
 if r.returncode: print(r.stderr[-1000:]); raise SystemExit(1)
 data=json.loads(out.read_text()); print(key,json.dumps(data)[:900]); return data
if __name__=='__main__':
 call('feasibility-game-state','ValkyrieToolset.SessionToolset','GetGameState',{})
 j=json.loads(pathlib.Path('specs/039-popcorn-parkour/evidence/production-binding-checkpoint.json').read_text())
 call('target0-setting-schema','ValkyrieToolset.DeviceToolset','ListDeviceProperties',{'device':j['assemblies'][0]['device']})
