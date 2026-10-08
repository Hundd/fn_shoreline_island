"""Reconcile one cosmetic receiver group through serialized native calls."""
import importlib,json,sys,copy
m=importlib.import_module('implementation-client'); P=m.P
i=int(sys.argv[1]); config=json.loads((P/'resolved-native-configuration.json').read_text())
pose=m.unpack(json.loads((P/f'implementation-baseline-{i}-ring.json').read_text()))
pose=copy.deepcopy(pose); pose['scale']={'x':1,'y':1,'z':1}
script='''import json,math
def invoke(tool,args):
    return execute_tool(tool,json.dumps(args))
def schema(actor):
    return json.loads(invoke("editor_toolset.toolsets.object.ObjectTools.list_properties",{"instance":actor})["returnValue"])
def values(actor,keys):
    return json.loads(invoke("editor_toolset.toolsets.object.ObjectTools.get_properties",{"instance":actor,"properties":keys})["returnValue"])
def set_values(actor,data):
    return invoke("editor_toolset.toolsets.object.ObjectTools.set_properties",{"instance":actor,"values":json.dumps(data)})
def find(label):
    return invoke("editor_toolset.toolsets.scene.SceneTools.find_actors",{"name":label,"collision_channels":[]})["returnValue"]
def place(class_ref,label,pose):
    return invoke("editor_toolset.toolsets.scene.SceneTools.add_to_scene_from_class",{"actor_type":{"refPath":class_ref},"name":label,"xform":pose,"snap_to_ground":False})["returnValue"]
def label(actor,label):
    return invoke("editor_toolset.toolsets.actor.ActorTools.set_label",{"actor":actor,"label":label})
def transform(actor):
    return invoke("editor_toolset.toolsets.actor.ActorTools.get_actor_transform",{"actor":actor})["returnValue"]
def save(actor):
    return invoke("editor_toolset.toolsets.scene.SceneTools.save_actor",{"actor":actor})
def close(expected,actual):
    if isinstance(expected,dict): return isinstance(actual,dict) and all(k in actual and close(v,actual[k]) for k,v in expected.items())
    if isinstance(expected,(float,int)) and not isinstance(expected,bool): return isinstance(actual,(float,int)) and abs(expected-actual)<0.00001
    return expected==actual
def run():
    config=CONFIG
    pose=POSE
    index=INDEX
    result={}
    for kind in ["halo","audio"]:
        intended=dict(config[kind]["native_values"])
        if kind=="halo": intended["spriteShape"]=config[kind]["spriteShape"]
        name="Popcorn041_"+kind+"_"+str(index)
        existing=find(name)
        if len(existing)>1: raise RuntimeError("Ambiguous label "+name)
        actor={"refPath":existing[0]["actorPath"]} if existing else place(config[kind]["device_class"],name,pose)
        label(actor,name)
        properties=schema(actor)
        if not all(k in properties for k in intended): raise RuntimeError("Unsupported native settings "+name)
        before=values(actor,list(intended))
        set_values(actor,intended)
        after=values(actor,list(intended))
        actual=transform(actor)
        if not close(intended,after): raise RuntimeError("Native setting mismatch "+name+" "+json.dumps(after))
        if not close(pose,actual): raise RuntimeError("Full transform mismatch "+name)
        save(actor)
        result[kind]={"actor":actor,"transform":actual,"settings":after,"before":before}
    return result
'''.replace('CONFIG',repr(config)).replace('POSE',repr(pose)).replace('INDEX',str(i))
result=m.call(f'implementation-receiver-{i}','editor_toolset.toolsets.programmatic.ProgrammaticToolset','execute_tool_script',{'script':script})
(P/f'implementation-receiver-{i}-resolved.json').write_text(json.dumps(result,indent=2))
