"""Authorized reference repair and editor organization; no tests or sessions."""
import importlib,json,sys
from pathlib import Path
m=importlib.import_module('implementation-client'); P=m.P
new_asset=sys.argv[1]
if not new_asset.startswith('/fn_shoreline_island/'):
    raise RuntimeError('Replacement must be our original project-owned imported sound')
records=[json.loads((P/f'implementation-receiver-{i}-resolved.json').read_text()) for i in range(8)]
targets=json.loads(Path('specs/039-popcorn-parkour/evidence/production-binding-checkpoint.json').read_text())['assemblies']
script='''import json
def properties(ref,keys):
    return json.loads(execute_tool("editor_toolset.toolsets.object.ObjectTools.get_properties",json.dumps({"instance":ref,"properties":keys}))["returnValue"])
def schema(ref):
    return json.loads(execute_tool("editor_toolset.toolsets.object.ObjectTools.list_properties",json.dumps({"instance":ref}))["returnValue"])
def set_values(ref,values):
    return execute_tool("editor_toolset.toolsets.object.ObjectTools.set_properties",json.dumps({"instance":ref,"values":json.dumps(values)}))
def transform(ref):
    return execute_tool("editor_toolset.toolsets.actor.ActorTools.get_actor_transform",json.dumps({"actor":ref}))["returnValue"]
def device(ref,keys):
    return json.loads(execute_tool("ValkyrieToolset.DeviceToolset.GetDeviceProperties",json.dumps({"device":ref,"propertyNames":keys}))["returnValue"])
def folder(ref,path):
    return execute_tool("editor_toolset.toolsets.scene.SceneTools.set_actor_folder",json.dumps({"actor":ref,"folder_path":path}))
def hidden(ref):
    return execute_tool("editor_toolset.toolsets.scene.SceneTools.is_actor_hidden",json.dumps({"actor":ref}))["returnValue"]
def set_hidden(ref,value):
    return execute_tool("editor_toolset.toolsets.scene.SceneTools.set_actor_hidden",json.dumps({"actor":ref,"hidden":value}))
def find(name):
    return execute_tool("editor_toolset.toolsets.scene.SceneTools.find_actors",json.dumps({"name":name,"collision_channels":[]}))["returnValue"]
def save(ref):
    return execute_tool("editor_toolset.toolsets.scene.SceneTools.save_actor",json.dumps({"actor":ref}))
def package(ref):
    return execute_tool("editor_toolset.toolsets.scene.SceneTools.get_actor_asset_path",json.dumps({"actor":ref}))["returnValue"]
def dirty(path):
    return execute_tool("editor_toolset.toolsets.asset.AssetTools.is_dirty",json.dumps({"asset_path":path}))["returnValue"]
def dependencies(path):
    return execute_tool("editor_toolset.toolsets.asset.AssetTools.get_dependencies",json.dumps({"asset_path":path}))["returnValue"]
def run():
    records=RECORDS
    targets=TARGETS
    replacement=ASSET
    result={"replacement":replacement,"audio":[],"editor_targets":[]}
    audio_keys=list(records[0]["audio"]["settings"])
    target_keys=["target_id","mission_id","hit_sound","hit_surface","ring_mesh","cone_mesh","label_board","selectable_ring","objective_cone","display_label","stationary_x_facing","stationary_y_facing"]
    initial_descriptors=find("pop039_target_")
    for i,record in enumerate(records):
        actor=record["audio"]["actor"]
        audio_schema=schema(actor)
        if "audio" not in audio_schema: raise RuntimeError("Audio schema missing")
        before=properties(actor,audio_keys+["toyOptionsComponent"])
        pose=transform(actor)
        save(actor)
        if before["audio"]!={"refPath":replacement}:
            set_values(actor,{"audio":{"refPath":replacement}})
        after=properties(actor,audio_keys+["toyOptionsComponent"])
        if after["audio"]!={"refPath":replacement}: raise RuntimeError("Replacement sound not bound")
        if {k:v for k,v in after.items() if k!="audio"}!={k:v for k,v in before.items() if k!="audio"}: raise RuntimeError("Unrelated audio setting changed")
        if transform(actor)!=pose: raise RuntimeError("Audio pose changed")
        component=after["toyOptionsComponent"]
        if "playerOptionData" not in schema(component): raise RuntimeError("Option registry schema missing")
        options=properties(component,["playerOptionData"])
        if "Device_Call_End_Pop_01" in json.dumps(after)+json.dumps(options): raise RuntimeError("Restricted old sound remains in native actor/option registry")
        save(actor)
        path=package(actor)
        # OFPA actor packages are not generic AssetTools assets. Native property
        # and option registry readback is followed by scoped saved-package audit.
        result["audio"].append({"actor":actor,"before":before,"after":after,"transform":pose,"options":options,"package":path,"dirty":dirty(path)})
    for item in targets:
        ref=item["device"]
        before=device(ref,target_keys)
        pose=transform(ref)
        hidden_before=hidden(ref)
        descriptors=[d for d in initial_descriptors if d["actorPath"]==ref["refPath"]]
        if len(descriptors)!=1: raise RuntimeError("Original target descriptor missing/ambiguous")
        desired_folder="Popcorn Parkour/Logic/Targets"
        if descriptors[0]["folderPath"]!=desired_folder:
            folder(ref,desired_folder)
        if not hidden_before: set_hidden(ref,True)
        after=device(ref,target_keys)
        if after!=before or transform(ref)!=pose: raise RuntimeError("Editor-only cleanup changed gameplay settings/transform")
        save(ref)
        result["editor_targets"].append({"actor":ref,"descriptor_before":descriptors[0],"transform":pose,"properties":after,"hidden_before":hidden_before,"hidden_after":hidden(ref),"ring_hidden":hidden(item["ring"]),"label_hidden":hidden(item["label"]),"package":package(ref)})
    result["folder_after"]=find("pop039_target_")
    return result
'''.replace('RECORDS',repr(records)).replace('TARGETS',repr(targets)).replace('ASSET',repr(new_asset))
result=m.call('validation-audio-repair-native-supported','editor_toolset.toolsets.programmatic.ProgrammaticToolset','execute_tool_script',{'script':script})
(P/'validation-audio-repair-native-resolved.json').write_text(json.dumps(result,indent=2))
