import importlib,json,pathlib,sys
m=importlib.import_module('implementation-client');P=m.P
old=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence')
transforms=json.loads((old/'implementation-baseline-transforms.json').read_text())
repair=json.loads((old/'validation-audio-repair-native-resolved.json').read_text())
refs=list(transforms)
for entry in repair['audio']+repair['editor_targets']: refs.append(entry['actor']['refPath'])
refs=list(dict.fromkeys(refs))
script='import json\n\ndef transform(ref):\n    return execute_tool("editor_toolset.toolsets.actor.ActorTools.get_actor_transform",json.dumps({"actor":ref}))["returnValue"]\n\ndef values(ref,keys):\n    return json.loads(execute_tool("editor_toolset.toolsets.object.ObjectTools.get_properties",json.dumps({"instance":ref,"properties":keys}))["returnValue"])\n\ndef hidden(ref):\n    return execute_tool("editor_toolset.toolsets.scene.SceneTools.is_actor_hidden",json.dumps({"actor":ref}))["returnValue"]\n\ndef run():\n    return {"transforms":{r:transform({"refPath":r}) for r in REFS},"audio":{r["actor"]["refPath"]:values(r["actor"],list(r["before"])) for r in AUDIO},"target_hidden":{r["actor"]["refPath"]:hidden(r["actor"]) for r in TARGETS}}\n'.replace('REFS',repr(refs)).replace('AUDIO',repr(repair['audio'])).replace('TARGETS',repr(repair['editor_targets']))
key=sys.argv[1]
data=m.call(key,'editor_toolset.toolsets.programmatic.ProgrammaticToolset','execute_tool_script',{'script':script})
(P/(key+'-resolved.json')).write_text(json.dumps(data,indent=2))
