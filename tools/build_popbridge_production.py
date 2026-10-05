"""Emit only the source profile from the human-approved embedded contract."""
from pathlib import Path
import yaml

root = Path(__file__).resolve().parents[1]
spec = yaml.safe_load((root / 'specs/039-popcorn-parkour/map.yaml').read_text(encoding='utf-8'))
contract = next(d for d in spec['devices'] if d['id'] == 'controller')['settings']['course_contract']
scene = yaml.safe_load((root / 'specs/039-popcorn-parkour/production-scene.yaml').read_text(encoding='utf-8'))
origin = scene['origin_cm']
def vec(values):
    return 'vector3{' + ', '.join(f'{axis} := {float(value):.3f}' for axis,value in zip('XYZ', values)) + '}'
def world(values):
    return vec([a + b * 100 for a,b in zip(origin, values)])
def boolean(value):
    return 'true' if value else 'false'
lines = ['using { /Fortnite.com/Devices }', 'using { /Fortnite.com/Characters }', 'using { /Verse.org/Simulation }', 'using { /UnrealEngine.com/Temporary/SpatialMath }', '', '# Reviewed profile data only; the generic controller owns every transition.', 'fn_shoreline_island_popbridge_production := class(fn_shoreline_island_popbridge_controller):']
arrays = [('course_decks','creative_prop',7),('course_targets','fn_shoreline_island_data_target',0),('course_mechanisms','creative_prop',24),('course_instructions','vfx_creator_device',24),('course_puffs','vfx_creator_device',8),('course_flourishes','vfx_creator_device',8),('course_decor','creative_prop',53),('course_returns','button_device',2)]
for name,kind,count in arrays:
    lines += ['    @editable', f'    {name}:[]{kind} = array{{' + ', '.join(kind+'{}' for _ in range(count)) + '}']
lines += ['    @editable', '    mission_board:billboard_device = billboard_device{}', '    @editable', '    final_board:billboard_device = billboard_device{}']
lines += ['    @editable', '    navigation_journal:fn_shoreline_island_academy_journal = fn_shoreline_island_academy_journal{}', '    @editable', '    pix:creative_prop = creative_prop{}', '    var pix_home:transform = transform{}', '    var decor_homes:[]transform = array{}', '    var claimed_station:logic = false', '', '    OnBegin<override>()<suspends>:void =', '        Hide()', '        set return_buttons = course_returns', '        if (course_decks.Length <> 7 or course_targets.Length <> 8 or course_mechanisms.Length <> 24 or course_instructions.Length <> 24 or course_puffs.Length <> 8 or course_flourishes.Length <> 8 or course_decor.Length <> 53 or return_buttons.Length <> 2):', '            Print("PopBridge production support count invalid; inactive")', '            return', '        reference_failure := supports_failure()', '        if (reference_failure <> 0):', '            Print("PopBridge production reference invalid code={reference_failure}; inactive")', '            return', '        set pix_home = pix.GetTransform()', '        for (prop : course_decor):', '            set decor_homes += array{prop.GetTransform()}', '        set landings = array{}', '        set machines = array{}']
nodes = contract['nodes']
ids = {n['id']:n['index'] for n in nodes}
for n in nodes:
    lines += [f"        if (deck := course_decks[{n['index']}]):", f"            set landings += array{{popbridge_landing{{node := popbridge_node{{id := {n['index']}, center := {world(n['center'])}, size := {vec([x*100 for x in n['size']])}, initially_built := {boolean(n['initially_built'])}, milestone := {n['milestone']}, route_stage := {n['route_stage']}, terminal := {boolean(n['terminal'])}}}, deck := deck}}}}"]
lines += ['        set edges = array{']
for e in contract['jump_edges']:
    lines += [f"            popbridge_edge{{source := {ids[e['source']]}, destination := {ids[e['destination']]}, gap_cm := {e['edge_gap_m']*100:.3f}}},"]
lines[-1] = lines[-1].rstrip(',') + '}'
for r in contract['receivers']:
    i=r['target_id']; creates=ids.get(r['creates'], -2 if r['creates']=='basket_overflow' else -1)
    refs=', '.join(f'{name} := {arr}[{index}]' for name,arr,index in [('target','course_targets',i),('a','course_mechanisms',i*3),('b','course_mechanisms',i*3+1),('c','course_mechanisms',i*3+2),('ea','course_instructions',i*3),('eb','course_instructions',i*3+1),('ec','course_instructions',i*3+2),('puff','course_puffs',i),('flourish','course_flourishes',i)])
    lines += [f'        if ({refs}):', f"            set machines += array{{popbridge_machine{{receiver := popbridge_receiver{{target_id := {i}, from_landing := {ids[r['from_landing']]}, creates := {creates}, instruction := {r['instruction']}}}, target := target, mechanisms := array{{a, b, c}}, instructions := array{{ea, eb, ec}}, wrong_puff := puff, flourish := flourish}}}}"]
lines += ['        checks := fixtures.self_check(array{', *[f'            landing.node,' for n in []], '        }, array{}, array{})'] if False else []
lines += ['        var checked_nodes:[]popbridge_node = array{}', '        var checked_receivers:[]popbridge_receiver = array{}', '        for (landing : landings):', '            set checked_nodes += array{landing.node}', '        for (machine : machines):', '            set checked_receivers += array{machine.receiver}', '        fixture_result := fixtures.self_check(checked_nodes, edges, checked_receivers)', '        Print("POPBRIDGE_PRODUCTION FIXTURE result={fixture_result}")', '        if (fixture_result <> 0):', '            return', '        targets_started := await_target_startup()', '        if (targets_started?):', '            if (final_machine := machines[7]):', '                set final_machine.target.display_label = "FINISH"', '            initialize()', '            if (ready?, debug_tag <> ""):','                spawn { observe_playtest() }', '            reset_presentation()', '            mission_board.SetText(text("POPCORN PARKOUR -> ramp. Shoot LOAD HEAT POP. Jump onto what you make."))', '            mission_board.ShowText()', '            mission_board.UpdateDisplay()', '            final_board.SetText(text("\\nSTART AT LOAD <-\\nFollow the ramp."))', '            final_board.ShowText()', '            final_board.UpdateDisplay()', '            replay_button.SetInteractionText(text("Replay Popcorn Parkour"))', '            for (button : return_buttons):', '                button.SetInteractionText(text("Return to Hub"))', '']
lines += '''    # Diagnostic codes retain the same strict checks; prop order: decks, mechanisms, decor, Pix.
    supports_failure()<transacts>:int =
        for (index -> prop : course_decks + course_mechanisms + course_decor + array{pix}):
            if (not prop.IsValid[]):
                return 1000 + index
        for (index -> target : course_targets):
            if (target.target_id <> index):
                return 2100 + index
            if (target.mission_id <> 39):
                return 2200 + index
            if (target.GetTransform().Translation = vector3{}):
                return 2300 + index
            if (target.hit_surface.GetTransform().Translation = vector3{}):
                return 2400 + index
            if (target.label_board.GetTransform().Translation = vector3{}):
                return 2500 + index
            if (target.selectable_ring.GetTransform().Translation = vector3{}):
                return 2600 + index
            if (target.objective_cone.GetTransform().Translation = vector3{}):
                return 2700 + index
            if (not target.ring_mesh.IsValid[]):
                return 3000 + index
            if (not target.cone_mesh.IsValid[]):
                return 4000 + index
            for (other_index -> other : course_targets):
                if (index <> other_index, target.GetTransform().Translation = other.GetTransform().Translation):
                    return 5000 + index
        for (index -> effect : course_instructions + course_puffs + course_flourishes):
            if (effect.GetTransform().Translation = vector3{}):
                return 6000 + index
        if (progress.GetTransform().Translation = vector3{} or blaster.GetTransform().Translation = vector3{} or navigation_journal.GetTransform().Translation = vector3{} or hub_destination.GetTransform().Translation = vector3{} or replay_button.GetTransform().Translation = vector3{} or ribbon.GetTransform().Translation = vector3{} or feedback.GetTransform().Translation = vector3{}):
            return 7000
        for (index -> button : return_buttons):
            if (button.GetTransform().Translation = vector3{}):
                return 8000 + index
        return 0

    claim_owner<override>(input_player:player):logic =
        player_state := progress.ensure_player(input_player)
        if (player_state.station_id >= 0):
            show(input_player, "Return from your other Skills lesson first.")
            return false
        set player_state.station_id = 0
        set claimed_station = true
        return true

    release_owner<override>(input_player:player):void =
        player_state := progress.ensure_player(input_player)
        if (claimed_station?, player_state.station_id = 0):
            set player_state.station_id = -1
        if (activity := navigation_journal.navigation[input_player], activity.source = 6, activity.module_index = 6, activity.token = state.generation):
            navigation_journal.clear_activity(input_player)
        set claimed_station = false

    report_state<override>(input_player:player):void =
        if (current := owner?, current = input_player, claimed_station?, valid(input_player, state.generation, observed_round)?):
            var step:int = 1
            if (state.checkpoint >= 1):
                set step = 2
            if (state.checkpoint >= 2):
                set step = 3
            navigation_journal.report_activity(input_player, 6, 6, step, 3, text("PopBridge: LOAD > HEAT > POP. Shoot, then jump onto what you make."), state.generation)

    geometry_changed<override>():void =
        for (deck_index := 1..5):
            for (part := 0..5):
                if (prop := course_decor[(deck_index - 1) * 6 + part]):
                    if (state.built[deck_index]?):
                        prop.Show()
                    else:
                        prop.Hide()

    committed<override>(target_id:int):void =
        if (target_id = 5):
            var pose:transform = pix_home
            set pose.Translation = vector3{X := -2610.0, Y := -17390.0, Z := 2520.0}
            if (pix.TeleportTo[pose]) {}
            for (index := 30..32):
                if (prop := course_decor[index]):
                    prop.Show()
        if (target_id = 6):
            for (index := 33..42):
                if (prop := course_decor[index]):
                    prop.Show()
        if (target_id = 7):
            if (pix.TeleportTo[pix_home]) {}
            for (index := 30..32):
                if (prop := course_decor[index], home := decor_homes[index]):
                    var pose:transform = home
                    set pose.Translation = home.Translation + vector3{X := 520.0, Y := 460.0}
                    if (prop.TeleportTo[pose]) {}
            for (index := 48..52):
                if (prop := course_decor[index]):
                    prop.Show()

    reset_presentation<override>():void =
        if (pix.TeleportTo[pix_home]) {}
        for (index -> prop : course_decor):
            if (home := decor_homes[index]):
                if (prop.TeleportTo[home]) {}
            if (index >= 30):
                if (index >= 43, index <= 47):
                    prop.Show()
                else:
                    prop.Hide()
        geometry_changed()
'''.splitlines()
lines += '''
    observe_playtest()<suspends>:void =
        loop:
            Sleep(0.5)
            for (input_player : GetPlayspace().GetPlayers()):
                if (character := input_player.GetFortCharacter[], character.IsActive[]):
                    pose := character.GetTransform().Translation
                    var grounded:int = 0
                    if (character.IsOnGround[]):
                        set grounded = 1
                    debug("PROBE time={GetSimulationElapsedTime()} x={pose.X} y={pose.Y} z={pose.Z} ground={grounded} present={present_landing(input_player)} prefix={state.prefix} checkpoint={state.checkpoint} pending={state.pending}")
'''.splitlines()
(root/'Content/fn_shoreline_island_popbridge_production.verse').write_text('\n'.join(lines)+'\n',encoding='utf-8')



