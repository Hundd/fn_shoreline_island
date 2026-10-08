import importlib,json
m=importlib.import_module('implementation-client'); P=m.P
repair=json.loads((P/'validation-audio-repair-native-resolved.json').read_text())
paths=[item['package'] for item in repair['audio']+repair['editor_targets']]+[repair['replacement'],'/fn_shoreline_island/fn_shoreline_island']
script='''import json
def save_all():
    return execute_tool("editor_toolset.toolsets.asset.AssetTools.save_assets",json.dumps({"asset_paths":[]}))["returnValue"]
def dirty(path):
    return execute_tool("editor_toolset.toolsets.asset.AssetTools.is_dirty",json.dumps({"asset_path":path}))["returnValue"]
def folders():
    return execute_tool("editor_toolset.toolsets.scene.SceneTools.get_folders","{}")["returnValue"]
def members():
    return execute_tool("editor_toolset.toolsets.scene.SceneTools.get_actors_in_folder",json.dumps({"folder_path":"Popcorn Parkour/Logic/Targets","recursive":False}))["returnValue"]
def run():
    saved=save_all()
    return {"save_all_success":saved,"dirty_audit":{p:dirty(p) for p in PATHS},"folders":folders(),"target_folder_members":members()}
'''.replace('PATHS',repr(paths))
data=m.call('validation-audio-repair-final-save','editor_toolset.toolsets.programmatic.ProgrammaticToolset','execute_tool_script',{'script':script})
(P/'validation-audio-repair-final-save-resolved.json').write_text(json.dumps(data,indent=2))
m.call('validation-audio-repair-final-game-state','ValkyrieToolset.SessionToolset','GetGameState',{})
m.call('validation-audio-repair-final-session-state','ValkyrieToolset.SessionToolset','GetSessionStatus',{})
