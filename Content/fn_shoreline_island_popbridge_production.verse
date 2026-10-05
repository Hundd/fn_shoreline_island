using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

# Reviewed profile data only; the generic controller owns every transition.
fn_shoreline_island_popbridge_production := class(fn_shoreline_island_popbridge_controller):
    @editable
    course_decks:[]creative_prop = array{creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}}
    @editable
    course_targets:[]fn_shoreline_island_data_target = array{}
    @editable
    course_mechanisms:[]creative_prop = array{creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}}
    @editable
    course_instructions:[]vfx_creator_device = array{vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}}
    @editable
    course_puffs:[]vfx_creator_device = array{vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}}
    @editable
    course_flourishes:[]vfx_creator_device = array{vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}}
    @editable
    course_decor:[]creative_prop = array{creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}}
    @editable
    course_returns:[]button_device = array{button_device{}, button_device{}}
    @editable
    mission_board:billboard_device = billboard_device{}
    @editable
    final_board:billboard_device = billboard_device{}
    @editable
    navigation_journal:fn_shoreline_island_academy_journal = fn_shoreline_island_academy_journal{}
    @editable
    pix:creative_prop = creative_prop{}
    var pix_home:transform = transform{}
    var decor_homes:[]transform = array{}
    var claimed_station:logic = false

    OnBegin<override>()<suspends>:void =
        Hide()
        set return_buttons = course_returns
        if (course_decks.Length <> 7 or course_targets.Length <> 8 or course_mechanisms.Length <> 24 or course_instructions.Length <> 24 or course_puffs.Length <> 8 or course_flourishes.Length <> 8 or course_decor.Length <> 53 or return_buttons.Length <> 2):
            Print("PopBridge production support count invalid; inactive")
            return
        reference_failure := supports_failure()
        if (reference_failure <> 0):
            Print("PopBridge production reference invalid code={reference_failure}; inactive")
            return
        set pix_home = pix.GetTransform()
        for (prop : course_decor):
            set decor_homes += array{prop.GetTransform()}
        set landings = array{}
        set machines = array{}
        if (deck := course_decks[0]):
            set landings += array{popbridge_landing{node := popbridge_node{id := 0, center := vector3{X := -2300.000, Y := -17280.000, Z := 2520.000}, size := vector3{X := 600.000, Y := 400.000, Z := 40.000}, initially_built := true, milestone := -1, route_stage := 0, terminal := false}, deck := deck}}
        if (deck := course_decks[1]):
            set landings += array{popbridge_landing{node := popbridge_node{id := 1, center := vector3{X := -2900.000, Y := -17280.000, Z := 2520.000}, size := vector3{X := 400.000, Y := 400.000, Z := 40.000}, initially_built := false, milestone := 0, route_stage := 1, terminal := false}, deck := deck}}
        if (deck := course_decks[2]):
            set landings += array{popbridge_landing{node := popbridge_node{id := 2, center := vector3{X := -3400.000, Y := -17280.000, Z := 2520.000}, size := vector3{X := 400.000, Y := 400.000, Z := 40.000}, initially_built := false, milestone := 1, route_stage := 2, terminal := false}, deck := deck}}
        if (deck := course_decks[3]):
            set landings += array{popbridge_landing{node := popbridge_node{id := 3, center := vector3{X := -3900.000, Y := -17080.000, Z := 2520.000}, size := vector3{X := 400.000, Y := 800.000, Z := 40.000}, initially_built := false, milestone := -1, route_stage := 3, terminal := false}, deck := deck}}
        if (deck := course_decks[4]):
            set landings += array{popbridge_landing{node := popbridge_node{id := 4, center := vector3{X := -4400.000, Y := -17480.000, Z := 2520.000}, size := vector3{X := 400.000, Y := 400.000, Z := 40.000}, initially_built := false, milestone := -1, route_stage := 4, terminal := false}, deck := deck}}
        if (deck := course_decks[5]):
            set landings += array{popbridge_landing{node := popbridge_node{id := 5, center := vector3{X := -4400.000, Y := -16680.000, Z := 2520.000}, size := vector3{X := 400.000, Y := 400.000, Z := 40.000}, initially_built := false, milestone := -1, route_stage := 4, terminal := false}, deck := deck}}
        if (deck := course_decks[6]):
            set landings += array{popbridge_landing{node := popbridge_node{id := 6, center := vector3{X := -4900.000, Y := -17080.000, Z := 2520.000}, size := vector3{X := 400.000, Y := 800.000, Z := 40.000}, initially_built := true, milestone := -1, route_stage := 5, terminal := true}, deck := deck}}
        set edges = array{
            popbridge_edge{source := 0, destination := 1, gap_cm := 100.000},
            popbridge_edge{source := 1, destination := 2, gap_cm := 100.000},
            popbridge_edge{source := 2, destination := 3, gap_cm := 100.000},
            popbridge_edge{source := 3, destination := 4, gap_cm := 100.000},
            popbridge_edge{source := 3, destination := 5, gap_cm := 100.000},
            popbridge_edge{source := 4, destination := 6, gap_cm := 100.000},
            popbridge_edge{source := 5, destination := 6, gap_cm := 100.000}}
        if (target := course_targets[0], a := course_mechanisms[0], b := course_mechanisms[1], c := course_mechanisms[2], ea := course_instructions[0], eb := course_instructions[1], ec := course_instructions[2], puff := course_puffs[0], flourish := course_flourishes[0]):
            set machines += array{popbridge_machine{receiver := popbridge_receiver{target_id := 0, from_landing := 0, creates := -1, instruction := 0}, target := target, mechanisms := array{a, b, c}, instructions := array{ea, eb, ec}, wrong_puff := puff, flourish := flourish}}
        if (target := course_targets[1], a := course_mechanisms[3], b := course_mechanisms[4], c := course_mechanisms[5], ea := course_instructions[3], eb := course_instructions[4], ec := course_instructions[5], puff := course_puffs[1], flourish := course_flourishes[1]):
            set machines += array{popbridge_machine{receiver := popbridge_receiver{target_id := 1, from_landing := 0, creates := -1, instruction := 1}, target := target, mechanisms := array{a, b, c}, instructions := array{ea, eb, ec}, wrong_puff := puff, flourish := flourish}}
        if (target := course_targets[2], a := course_mechanisms[6], b := course_mechanisms[7], c := course_mechanisms[8], ea := course_instructions[6], eb := course_instructions[7], ec := course_instructions[8], puff := course_puffs[2], flourish := course_flourishes[2]):
            set machines += array{popbridge_machine{receiver := popbridge_receiver{target_id := 2, from_landing := 0, creates := 1, instruction := 2}, target := target, mechanisms := array{a, b, c}, instructions := array{ea, eb, ec}, wrong_puff := puff, flourish := flourish}}
        if (target := course_targets[3], a := course_mechanisms[9], b := course_mechanisms[10], c := course_mechanisms[11], ea := course_instructions[9], eb := course_instructions[10], ec := course_instructions[11], puff := course_puffs[3], flourish := course_flourishes[3]):
            set machines += array{popbridge_machine{receiver := popbridge_receiver{target_id := 3, from_landing := 1, creates := 2, instruction := 3}, target := target, mechanisms := array{a, b, c}, instructions := array{ea, eb, ec}, wrong_puff := puff, flourish := flourish}}
        if (target := course_targets[4], a := course_mechanisms[12], b := course_mechanisms[13], c := course_mechanisms[14], ea := course_instructions[12], eb := course_instructions[13], ec := course_instructions[14], puff := course_puffs[4], flourish := course_flourishes[4]):
            set machines += array{popbridge_machine{receiver := popbridge_receiver{target_id := 4, from_landing := 2, creates := 3, instruction := 3}, target := target, mechanisms := array{a, b, c}, instructions := array{ea, eb, ec}, wrong_puff := puff, flourish := flourish}}
        if (target := course_targets[5], a := course_mechanisms[15], b := course_mechanisms[16], c := course_mechanisms[17], ea := course_instructions[15], eb := course_instructions[16], ec := course_instructions[17], puff := course_puffs[5], flourish := course_flourishes[5]):
            set machines += array{popbridge_machine{receiver := popbridge_receiver{target_id := 5, from_landing := 3, creates := 4, instruction := 3}, target := target, mechanisms := array{a, b, c}, instructions := array{ea, eb, ec}, wrong_puff := puff, flourish := flourish}}
        if (target := course_targets[6], a := course_mechanisms[18], b := course_mechanisms[19], c := course_mechanisms[20], ea := course_instructions[18], eb := course_instructions[19], ec := course_instructions[20], puff := course_puffs[6], flourish := course_flourishes[6]):
            set machines += array{popbridge_machine{receiver := popbridge_receiver{target_id := 6, from_landing := 3, creates := 5, instruction := 3}, target := target, mechanisms := array{a, b, c}, instructions := array{ea, eb, ec}, wrong_puff := puff, flourish := flourish}}
        if (target := course_targets[7], a := course_mechanisms[21], b := course_mechanisms[22], c := course_mechanisms[23], ea := course_instructions[21], eb := course_instructions[22], ec := course_instructions[23], puff := course_puffs[7], flourish := course_flourishes[7]):
            set machines += array{popbridge_machine{receiver := popbridge_receiver{target_id := 7, from_landing := 6, creates := -2, instruction := 3}, target := target, mechanisms := array{a, b, c}, instructions := array{ea, eb, ec}, wrong_puff := puff, flourish := flourish}}
        var checked_nodes:[]popbridge_node = array{}
        var checked_receivers:[]popbridge_receiver = array{}
        for (landing : landings):
            set checked_nodes += array{landing.node}
        for (machine : machines):
            set checked_receivers += array{machine.receiver}
        fixture_result := fixtures.self_check(checked_nodes, edges, checked_receivers)
        Print("POPBRIDGE_PRODUCTION FIXTURE result={fixture_result}")
        if (fixture_result <> 0):
            return
        targets_started := await_target_startup()
        if (targets_started?):
            if (final_machine := machines[7]):
                set final_machine.target.display_label = "FINISH"
            initialize()
            if (ready?, debug_tag <> ""):
                spawn { observe_playtest() }
            reset_presentation()
            mission_board.SetText(text("POPCORN PARKOUR -> ramp. Shoot LOAD HEAT POP. Jump onto what you make."))
            mission_board.ShowText()
            mission_board.UpdateDisplay()
            final_board.SetText(text("\nSTART AT LOAD ->\nFollow the ramp."))
            final_board.ShowText()
            final_board.UpdateDisplay()
            replay_button.SetInteractionText(text("Replay Popcorn Parkour"))
            for (button : return_buttons):
                button.SetInteractionText(text("Return to Hub"))

    # Diagnostic codes retain the same strict checks; prop order: decks, mechanisms, decor, Pix.
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
        for (machine_index := 0..7):
            if (balloon := course_mechanisms[machine_index * 3 + 2]):
                if (state.consumed[machine_index]?):
                    balloon.Hide()
                else:
                    balloon.Show()

    committed<override>(target_id:int):void =
        if (target_id = 5):
            var pose:transform = pix_home
            set pose.Translation = vector3{X := -4490.0, Y := -17390.0, Z := 2520.0}
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
                    set pose.Translation = home.Translation + vector3{X := -520.0, Y := 460.0}
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
