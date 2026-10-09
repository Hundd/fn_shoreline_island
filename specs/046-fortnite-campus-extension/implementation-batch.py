import json
def call(name,args):
    return execute_tool(name,json.dumps(args)).get("returnValue")
def find(prefix):
    return call("editor_toolset.toolsets.scene.SceneTools.find_actors",{"name":prefix,"collision_channels":[]})
def spawn(p):
    return call("editor_toolset.toolsets.scene.SceneTools.add_to_scene_from_asset",{"asset_path":p["asset"],"name":p["label"],"xform":p["transform"],"snap_to_ground":False})
def root(a):
    return call("editor_toolset.toolsets.actor.ActorTools.get_root_component",{"actor":a})
def configure(c):
    assert call("editor_toolset.toolsets.object.ObjectTools.set_properties",{"instance":c,"values":json.dumps({"bodyInstance":{"collisionEnabled":"NoCollision","collisionProfileName":"NoCollision"},"bUseDefaultCollision":False,"overrideMaterials":[]})})
def props(c):
    return json.loads(call("editor_toolset.toolsets.object.ObjectTools.get_properties",{"instance":c,"properties":["staticMesh","overrideMaterials","bodyInstance","bUseDefaultCollision"]}))
def transform(a):
    return call("editor_toolset.toolsets.actor.ActorTools.get_actor_transform",{"actor":a})
def label(a):
    return call("editor_toolset.toolsets.actor.ActorTools.get_label",{"actor":a})
def save(a):
    return call("editor_toolset.toolsets.scene.SceneTools.save_actor",{"actor":a})
def package(a):
    return call("editor_toolset.toolsets.scene.SceneTools.get_actor_asset_path",{"actor":a})
def dirty(p):
    return call("editor_toolset.toolsets.asset.AssetTools.is_dirty",{"asset_path":p})
def save_all():
    return call("editor_toolset.toolsets.asset.AssetTools.save_assets",{"asset_paths":[]})

# Frozen delta is loaded outside the editor sandbox and injected as JSON.
# Each run uses the following verified bounded-group body.
def run():
    placements=[]  # Inject only an approved exact slice; do not execute empty template.

    existing={a["label"] for a in find("campus046_")}
    assert not any(p["label"] in existing for p in placements)
    records=[]
    for p in placements:
        a=spawn(p)
        c=root(a)
        configure(c)
        actual=transform(a)
        properties=props(c)
        assert label(a)==p["label"]
        assert properties["staticMesh"]["refPath"]==p["asset"]
        assert properties["overrideMaterials"]==[]
        assert properties["bodyInstance"]["collisionEnabled"]=="NoCollision"
        assert properties["bodyInstance"]["collisionProfileName"]=="NoCollision"
        assert properties["bUseDefaultCollision"]==False
        for kind in p["transform"]:
            for key,value in p["transform"][kind].items():
                assert abs(actual[kind][key]-value)<0.001
        records.append({"label":p["label"],"group":p["group"],"role":p["role"],"source":p["source"],"actor":a,"component":c,"transform":actual,"properties":properties,"saved":True})
    assert save_all()
    for r in records:
        r["asset_path"]=package(r["actor"])
        r["dirty"]=dirty(r["asset_path"])
        assert r["dirty"]==False
    return {"records":records,"saved":True,"count":len(records)}

