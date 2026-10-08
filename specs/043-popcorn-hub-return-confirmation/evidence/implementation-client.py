"""Serialized official MCP evidence helper; no gameplay or test calls."""
import json, pathlib, subprocess, sys
P = pathlib.Path(__file__).resolve().parent
def unpack(data):
    if 'error' in data:
        raise RuntimeError(data['error'])
    result = data.get('result', data)
    if result.get('isError'):
        raise RuntimeError(result)
    if 'content' in result:
        result = result['content'][0]['text']
    while isinstance(result, str):
        try: result = json.loads(result)
        except json.JSONDecodeError: break
    if isinstance(result, dict) and 'returnValue' in result:
        result = result['returnValue']
        while isinstance(result, str):
            try: result = json.loads(result)
            except json.JSONDecodeError: break
    return result
def invoke(key, name, args):
    request = {'jsonrpc':'2.0','id':2,'method':'tools/call','params':{'name':name,'arguments':args}}
    req = P / (key+'-request.json'); out = P / (key+'.json')
    req.write_text(json.dumps(request, indent=2), encoding='utf-8')
    process = subprocess.run([sys.executable,str(P/'mcp-client.py'),str(req),'--output',str(out),'--timeout','45'],capture_output=True,text=True)
    if process.returncode: raise RuntimeError(process.stderr)
    value = unpack(json.loads(out.read_text(encoding='utf-8')))
    print(key, json.dumps(value,ensure_ascii=False)[:1200], flush=True)
    return value
def call(key, ts, name, args):
    if name in {'StartGame','StartSession','PushChanges'}: raise RuntimeError('Manual-testing override')
    return invoke(key,'call_tool',{'toolset_name':ts,'tool_name':name,'arguments':args})
def describe(ts):
    return invoke('implementation-describe-'+ts.split('.')[-1],'describe_toolset',{'toolset_name':ts})
if __name__ == '__main__':
    if sys.argv[1] == 'describe': describe(sys.argv[2])
    else: call(sys.argv[1],sys.argv[2],sys.argv[3],json.loads(sys.argv[4]))
