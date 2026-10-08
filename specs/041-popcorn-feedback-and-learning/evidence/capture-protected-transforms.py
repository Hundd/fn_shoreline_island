import importlib,json
m=importlib.import_module('implementation-client'); P=m.P
refs=m.unpack(json.loads((P/'implementation-baseline-refs.json').read_text()))
selected={k:refs[k] for k in ['course_decks','course_mechanisms','course_decor','course_returns','pix','mission_board','final_board','ribbon','feedback','hub_destination','replay_button']}
script='''import json
def properties(ref,names):
    return json.loads(execute_tool("editor_toolset.toolsets.object.ObjectTools.get_properties",json.dumps({"instance":ref,"properties":names}))["returnValue"])
def schema(ref):
    return json.loads(execute_tool("editor_toolset.toolsets.object.ObjectTools.list_properties",json.dumps({"instance":ref}))["returnValue"])
def transform(ref):
    return execute_tool("editor_toolset.toolsets.actor.ActorTools.get_actor_transform",json.dumps({"actor":ref}))["returnValue"]
def run():
    refs=REFS
    result={}
    natives={}
    for kind,items in refs.items():
        if not isinstance(items,list): items=[items]
        natives[kind]=[]
        for ref in items:
            if "savedActor" not in schema(ref): raise RuntimeError("Unresolved wrapper "+ref["refPath"])
            native=properties(ref,["savedActor"])["savedActor"]
            if native is None: raise RuntimeError("Unbound "+ref["refPath"])
            natives[kind].append(native)
            result[native["refPath"]]=transform(native)
    return {"native_refs":natives,"transforms":result}
'''.replace('REFS',repr(selected))
data=m.call('implementation-protected-native-baseline','editor_toolset.toolsets.programmatic.ProgrammaticToolset','execute_tool_script',{'script':script})
(P/'implementation-protected-baseline.json').write_text(json.dumps(data,indent=2))
baseline={}
for file in P.glob('implementation-baseline-*.json'):
    if file.name.endswith('-request.json') or file.name=='implementation-baseline-refs.json': continue
    try:
        req=json.loads(file.with_name(file.stem+'-request.json').read_text())['params']['arguments']['arguments']
        baseline[req['actor']['refPath']]=m.unpack(json.loads(file.read_text()))
    except (KeyError,RuntimeError): pass
baseline.update(data['transforms'])
(P/'implementation-baseline-transforms.json').write_text(json.dumps(baseline,indent=2))
