import importlib,json
m=importlib.import_module('implementation-client')
actor=m.unpack(json.loads((m.P/'implementation-halo-0-place.json').read_text()))
print(m.call('implementation-remove-new-legacy-only','editor_toolset.toolsets.scene.SceneTools','remove_from_scene',{'actor':actor}))
