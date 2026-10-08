import importlib,json
m=importlib.import_module('implementation-client'); P=m.P
controller={'refPath':'/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5FA0703_1938542541'}
receivers=[json.loads((P/f'implementation-receiver-{i}-resolved.json').read_text()) for i in range(8)]
targets=json.loads(__import__('pathlib').Path('specs/039-popcorn-parkour/evidence/production-binding-checkpoint.json').read_text())['assemblies']
hud_config=json.loads((P/'resolved-native-configuration.json').read_text())['hud']
native=m.unpack(json.loads((P/'implementation-protected-native-baseline.json').read_text()))['native_refs']
script='''import json
def device_schema(ref):
    return json.loads(execute_tool("ValkyrieToolset.DeviceToolset.ListDeviceProperties",json.dumps({"device":ref}))["returnValue"])
def device_properties(ref,keys):
    return json.loads(execute_tool("ValkyrieToolset.DeviceToolset.GetDeviceProperties",json.dumps({"device":ref,"propertyNames":keys}))["returnValue"])
def schema(ref):
    return json.loads(execute_tool("editor_toolset.toolsets.object.ObjectTools.list_properties",json.dumps({"instance":ref}))["returnValue"])
def properties(ref,keys):
    return json.loads(execute_tool("editor_toolset.toolsets.object.ObjectTools.get_properties",json.dumps({"instance":ref,"properties":keys}))["returnValue"])
def set_values(ref,values):
    return execute_tool("editor_toolset.toolsets.object.ObjectTools.set_properties",json.dumps({"instance":ref,"values":json.dumps(values)}))
def save(ref):
    return execute_tool("editor_toolset.toolsets.scene.SceneTools.save_actor",json.dumps({"actor":ref}))
def run():
    controller=CONTROLLER
    receivers=RECEIVERS
    targets=TARGETS
    native=NATIVE
    config=HUD
    fields=device_schema(controller)
    if "course_hit_halos" not in fields: raise RuntimeError("Compiled halo editable missing")
    controller_values=device_properties(controller,["course_hit_halos","course_targets"])
    halos=controller_values["course_hit_halos"]
    if len(halos)!=8: raise RuntimeError("Halo wrapper count")
    result={"targets":[],"halos":[]}
    for i in range(8):
        wrapper=halos[i]
        if "savedActor" not in schema(wrapper): raise RuntimeError("Halo wrapper schema")
        set_values(wrapper,{"savedActor":receivers[i]["halo"]["actor"]})
        bound=properties(wrapper,["savedActor"])["savedActor"]
        if bound!=receivers[i]["halo"]["actor"]: raise RuntimeError("Halo binding mismatch")
        result["halos"].append(bound)
        target=targets[i]["device"]
        target_values=device_properties(target,["target_id","mission_id","hit_sound","hit_flash","hit_surface","ring_mesh"])
        if target_values["target_id"]!=i or target_values["mission_id"]!=39: raise RuntimeError("Target identity")
        sound=target_values["hit_sound"]
        if "savedActor" not in schema(sound): raise RuntimeError("Sound wrapper schema")
        set_values(sound,{"savedActor":receivers[i]["audio"]["actor"]})
        bound_sound=properties(sound,["savedActor"])["savedActor"]
        if bound_sound!=receivers[i]["audio"]["actor"]: raise RuntimeError("Sound binding mismatch")
        flash=target_values["hit_flash"]
        if "savedActor" not in schema(flash): raise RuntimeError("Flash wrapper schema")
        flash_native=properties(flash,["savedActor"])["savedActor"]
        result["targets"].append({"target":target,"target_id":i,"hit_sound":bound_sound,"hit_flash":flash_native})
        save(target)
    hud=config["actor"]
    hud={"refPath":hud}
    hud_schema=schema(hud)
    intended=dict(config["native_values"])
    # Synthetic/read-only fields are recorded but not written. The actual native
    # priority override flag has documented immediate, unqueued semantics.
    for key in ["message Priority","displayTimeOption","messageCharLimit"]:
        intended.pop(key)
    intended.update({"priority_Override":False,"showForDuration":False,"playSound":None,"text Justification":"Left","intro Animation":"None","outro Animation":"None"})
    if not all(k in hud_schema for k in intended): raise RuntimeError("HUD unsupported setting")
    result["hud_before"]=properties(hud,list(intended))
    set_values(hud,intended)
    result["hud"]=properties(hud,list(intended)+["message Priority","displayTimeOption","messageCharLimit"])
    save(hud)
    board_values={"mission_board":"A skill is a few steps you can use again.\\nDraft: LOAD > HEAT > POP (0/3).\\nBuild PopBridge: shoot LOAD.","final_board":"START AT LOAD ->\\nFollow the ramp.","ribbon":"Draft: LOAD > HEAT > POP (0/3). Next: LOAD."}
    result["boards"]={}
    for kind,value in board_values.items():
        board=native[kind][0]
        board_schema=schema(board)
        if "text" not in board_schema: raise RuntimeError("Board text schema "+kind+" "+json.dumps(list(board_schema)))
        set_values(board,{"text":value})
        actual=properties(board,["text"])
        if actual["text"]!=value: raise RuntimeError("Board text mismatch")
        save(board)
        result["boards"][kind]={"actor":board,"values":actual}
    save(controller)
    return result
'''.replace('CONTROLLER',repr(controller)).replace('RECEIVERS',repr(receivers)).replace('TARGETS',repr(targets)).replace('NATIVE',repr(native)).replace('config=HUD','config='+repr(hud_config))
result=m.call('implementation-native-bindings-supported','editor_toolset.toolsets.programmatic.ProgrammaticToolset','execute_tool_script',{'script':script})
(P/'implementation-native-bindings-resolved.json').write_text(json.dumps(result,indent=2))
