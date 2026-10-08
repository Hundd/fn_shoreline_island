import importlib, json, pathlib, shutil
m = importlib.import_module('implementation-client')
P = m.P
A = 'editor_toolset.toolsets.actor.ActorTools'
S = 'editor_toolset.toolsets.scene.SceneTools'
D = 'ValkyrieToolset.DeviceToolset'
controller = {'refPath':'/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5FA0703_1938542541'}
backup = P/'source-checkpoint'; backup.mkdir(exist_ok=True)
for path in ['Content/fn_shoreline_island_popbridge_controller.verse','Content/fn_shoreline_island_popbridge_production.verse','Content/fn_shoreline_island_data_target.verse','Content/fn_shoreline_island_academy_journal.verse','tools/build_popbridge_production.py']:
    shutil.copy2(path,backup/pathlib.Path(path).name)
m.call('implementation-initial-state','ValkyrieToolset.SessionToolset','GetGameState',{})
m.call('implementation-controller-checkpoint',S,'save_actor',{'actor':controller})
refs = m.call('implementation-baseline-refs',D,'GetDeviceProperties',{'device':controller,'propertyNames':['course_decks','course_targets','course_mechanisms','course_decor','course_returns','mission_board','final_board','ribbon','feedback','progress','blaster','navigation_journal','hub_destination','replay_button','pix']})
assemblies = json.loads(pathlib.Path('specs/039-popcorn-parkour/evidence/production-binding-checkpoint.json').read_text())['assemblies']
baseline = {}
for a in assemblies:
    for kind in ['device','surface','ring','label']:
        ref = a[kind]
        baseline[ref['refPath']] = m.call(f'implementation-baseline-{a["id"]}-{kind}',A,'get_actor_transform',{'actor':ref})
for kind in ['course_decks','course_mechanisms','course_decor','course_returns']:
    for i,ref in enumerate(refs[kind]):
        # Prop references are direct actors; native wrappers resolve savedActor.
        if kind == 'course_returns': continue
        baseline[ref['refPath']] = m.call(f'implementation-baseline-{kind}-{i}',A,'get_actor_transform',{'actor':ref})
(P/'implementation-baseline-transforms.json').write_text(json.dumps(baseline,indent=2))
