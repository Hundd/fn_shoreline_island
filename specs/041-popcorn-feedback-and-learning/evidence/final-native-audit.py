import importlib,json
m=importlib.import_module('implementation-client'); P=m.P
baseline=json.loads((P/'implementation-baseline-transforms.json').read_text())
bindings=json.loads((P/'implementation-native-bindings-resolved.json').read_text())
receivers=[json.loads((P/f'implementation-receiver-{i}-resolved.json').read_text()) for i in range(8)]
controller={'refPath':'/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5FA0703_1938542541'}
hud={'refPath':json.loads((P/'resolved-native-configuration.json').read_text())['hud']['actor']}
actors=[controller,hud]+[t['target'] for t in bindings['targets']]+[r[k]['actor'] for r in receivers for k in ['halo','audio']]+[v['actor'] for v in bindings['boards'].values()]
script='''import json
def transform(actor):
    return execute_tool("editor_toolset.toolsets.actor.ActorTools.get_actor_transform",json.dumps({"actor":actor}))["returnValue"]
def properties(ref,keys):
    return json.loads(execute_tool("editor_toolset.toolsets.object.ObjectTools.get_properties",json.dumps({"instance":ref,"properties":keys}))["returnValue"])
def device(ref,keys):
    return json.loads(execute_tool("ValkyrieToolset.DeviceToolset.GetDeviceProperties",json.dumps({"device":ref,"propertyNames":keys}))["returnValue"])
def save_all():
    return execute_tool("editor_toolset.toolsets.asset.AssetTools.save_assets",json.dumps({"asset_paths":[]}))["returnValue"]
def package(actor):
    return execute_tool("editor_toolset.toolsets.scene.SceneTools.get_actor_asset_path",json.dumps({"actor":actor}))["returnValue"]
def dirty(path):
    return execute_tool("editor_toolset.toolsets.asset.AssetTools.is_dirty",json.dumps({"asset_path":path}))["returnValue"]
def find(name):
    return execute_tool("editor_toolset.toolsets.scene.SceneTools.find_actors",json.dumps({"name":name,"collision_channels":[]}))["returnValue"]
def run():
    baseline=BASELINE
    actors=ACTORS
    controller=CONTROLLER
    current={path:transform({"refPath":path}) for path in baseline}
    deviations={path:{"before":baseline[path],"after":pose} for path,pose in current.items() if pose!=baseline[path]}
    result={"protected_transform_count":len(current),"protected_transforms":current,"transform_deviations":deviations}
    if deviations: raise RuntimeError("Protected transform changed "+json.dumps(deviations))
    placed=find("Popcorn041_")
    result["placed_count"]=len(placed)
    result["placed"]=placed
    if len(placed)!=16: raise RuntimeError("Native cosmetic count mismatch")
    controller_values=device(controller,["course_hit_halos","course_targets","course_decks","course_returns","progress","navigation_journal","hub_destination","replay_button","feedback","ribbon"])
    result["controller"]=controller_values
    result["halo_bindings"]=[properties(ref,["savedActor"])["savedActor"] for ref in controller_values["course_hit_halos"]]
    result["targets"]=[]
    for target in TARGETS:
        values=device(target,["target_id","mission_id","hit_sound","hit_flash","hit_surface","ring_mesh","stationary_x_facing","stationary_y_facing"])
        values["hit_sound_native"]=properties(values["hit_sound"],["savedActor"])["savedActor"]
        values["hit_flash_native"]=properties(values["hit_flash"],["savedActor"])["savedActor"]
        result["targets"].append(values)
    result["hud"]=properties(HUDREF,HUDKEYS)
    result["feedback_devices"]=[]
    for record in RECORDS:
        for kind in ["halo","audio"]:
            value=record[kind]
            result["feedback_devices"].append({"kind":kind,"actor":value["actor"],"transform":transform(value["actor"]),"settings":properties(value["actor"],list(value["settings"]))})
    result["save_all_success"]=save_all()
    if not result["save_all_success"]: raise RuntimeError("Native save all failed")
    result["dirty_audit"]={}
    for actor in actors:
        path=package(actor)
        result["dirty_audit"][path]=dirty(path)
    result["level_dirty"]=dirty("/fn_shoreline_island/fn_shoreline_island")
    return result
'''.replace('BASELINE',repr(baseline)).replace('ACTORS',repr(actors)).replace('CONTROLLER',repr(controller)).replace('TARGETS',repr([t['target'] for t in bindings['targets']])).replace('HUDREF',repr(hud)).replace('HUDKEYS',repr(list(bindings['hud']))).replace('RECORDS',repr(receivers))
data=m.call('implementation-final-native-audit','editor_toolset.toolsets.programmatic.ProgrammaticToolset','execute_tool_script',{'script':script})
(P/'implementation-final-native-audit-resolved.json').write_text(json.dumps(data,indent=2))
m.call('implementation-final-game-state','ValkyrieToolset.SessionToolset','GetGameState',{})
m.call('implementation-final-session-state','ValkyrieToolset.SessionToolset','GetSessionStatus',{})
