import json,subprocess,sys,pathlib
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence')
sets=['ValkyrieToolset.SessionToolset','editor_toolset.toolsets.object.ObjectTools','ValkyrieToolset.DeviceToolset','editor_toolset.toolsets.actor.ActorTools','editor_toolset.toolsets.asset.AssetTools']
for i,t in enumerate(sets):
 name=t.split('.')[-1]; req=p/f'describe-{name}-request.json'; out=p/f'describe-{name}.json'
 req.write_text(json.dumps({'jsonrpc':'2.0','id':2,'method':'tools/call','params':{'name':'describe_toolset','arguments':{'toolset_name':t}}}),encoding='utf-8')
 r=subprocess.run([sys.executable,str(p/'mcp-client.py'),str(req),'--output',str(out),'--timeout','20'],capture_output=True,text=True)
 print(name,r.returncode, r.stderr[-500:])
 if r.returncode: break
