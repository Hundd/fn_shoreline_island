import importlib,json
m=importlib.import_module('implementation-client'); P=m.P
previous=json.loads((P/'implementation-final-native-audit-resolved.json').read_text())
script='''import json
def save_all():
    return execute_tool("editor_toolset.toolsets.asset.AssetTools.save_assets",json.dumps({"asset_paths":[]}))["returnValue"]
def dirty(path):
    return execute_tool("editor_toolset.toolsets.asset.AssetTools.is_dirty",json.dumps({"asset_path":path}))["returnValue"]
def run():
    saved=save_all()
    return {"save_all_success":saved,"dirty_audit":{p:dirty(p) for p in PATHS},"level_dirty":dirty("/fn_shoreline_island/fn_shoreline_island")}
'''.replace('PATHS',repr(list(previous['dirty_audit'])))
data=m.call('implementation-final-save-audit','editor_toolset.toolsets.programmatic.ProgrammaticToolset','execute_tool_script',{'script':script})
(P/'implementation-final-save-audit-resolved.json').write_text(json.dumps(data,indent=2))
m.call('implementation-release-game-state','ValkyrieToolset.SessionToolset','GetGameState',{})
m.call('implementation-release-session-state','ValkyrieToolset.SessionToolset','GetSessionStatus',{})
