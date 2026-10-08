using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /Verse.org/Verse }
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
    course_hit_halos:[]vfx_creator_device = array{vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}}
    @editable
    course_decor:[]creative_prop = array{creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}}
    @editable
    course_returns:[]button_device = array{button_device{}, button_device{}}
    @editable
    finish_hub_portal:teleporter_device = teleporter_device{}
    @editable
    hub_return_confirmation:popup_dialog_device = popup_dialog_device{}
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
        close_finish_portal()
        finish_hub_portal.EnterEvent.Subscribe(entered_finish_portal)
        set return_buttons = course_returns
        if (course_decks.Length <> 7 or course_targets.Length <> 8 or course_mechanisms.Length <> 24 or course_instructions.Length <> 24 or course_puffs.Length <> 8 or course_flourishes.Length <> 8 or course_hit_halos.Length <> 8 or course_decor.Length <> 53 or return_buttons.Length <> 2):
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
            configure_hub_confirmation()
            if (ready?, debug_tag <> ""):
                spawn { observe_playtest() }
            reset_presentation()
            mission_board.SetText(text(card_for("entry")))
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
        for (index -> halo : course_hit_halos):
            if (halo.GetTransform().Translation = vector3{}):
                return 9000 + index
            for (other_index -> other : course_hit_halos):
                if (index <> other_index, halo.GetTransform().Translation = other.GetTransform().Translation):
                    return 9100 + index
        for (index -> target : course_targets):
            if (target.hit_sound.GetTransform().Translation = vector3{}):
                return 9300 + index
            for (other_index -> other : course_targets):
                if (index <> other_index, target.hit_sound.GetTransform().Translation = other.hit_sound.GetTransform().Translation):
                    return 9400 + index
        if (finish_hub_portal.GetTransform().Translation = vector3{} or finish_hub_portal.GetTransform().Translation = hub_destination.GetTransform().Translation):
            return 9500
        if (hub_return_confirmation.GetTransform().Translation = vector3{}):
            return 9600
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
        close_finish_portal()
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
            navigation_journal.report_activity(input_player, 6, 6, step, 3, text(card_for(lesson_id)), state.generation)

    geometry_changed<override>():void =
        for (deck_index := 1..5):
            for (part := 0..5):
                if (prop := course_decor[(deck_index - 1) * 6 + part]):
                    if (state.built[deck_index]?):
                        prop.Show()
                    else:
                        prop.Hide()
        for (machine : machines):
            for (mechanism : machine.mechanisms):
                if (machine_used(machine)?):
                    mechanism.Hide()
                else:
                    mechanism.Show()

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
        close_finish_portal()
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
        mission_board.SetText(text(card_for("entry")))
        mission_board.ShowText()
        mission_board.UpdateDisplay()
        final_board.SetText(text("START AT LOAD ->\nFollow the ramp."))
        final_board.ShowText()
        final_board.UpdateDisplay()
        set_ribbon("Draft: LOAD > HEAT > POP (0/3). Next: LOAD.")

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
    # Feature041 presentation only; fixture/progress decisions stay in controller.
    var lesson_id:string = "entry"
    var override_id:string = ""
    var lesson_epoch:int = 0
    var recipe_saved:logic = false
    var journal_masked:logic = false
    var last_rejection:float = -10.0
    var last_pop_audio:float = -10.0
    var halo_epochs:[int]int = map{}
    var audio_epochs:[int]int = map{}

    recipe_line():string =
        if (recipe_saved?):
            return "PopBridge = LOAD > HEAT > POP."
        return "Draft: LOAD > HEAT > POP ({state.prefix}/3)."

    card_for(event_id:string):string =
        return "{lesson_line(event_id)}\n{recipe_line()}\n{action_line(event_id)}"

    current_card():string =
        if (override_id <> ""):
            return card_for(override_id)
        return card_for(lesson_id)

    render_card(input_player:player):void =
        if (valid(input_player, state.generation, observed_round)?):
            set journal_masked = navigation_journal.is_panel_open(input_player)
            if (journal_masked?):
                feedback.Hide(input_player)
            else:
                # Replace this owner's previous card; never enqueue captions.
                feedback.Hide(input_player)
                feedback.Show(input_player, text(current_card()), ?DisplayTime := 0.0)

    sync_card<override>(input_player:player):void =
        arm_finish_portal(input_player)
        poll_finish_portal(input_player)
        panel_visible := navigation_journal.is_panel_open(input_player)
        if (panel_visible <> journal_masked):
            render_card(input_player)

    advance_lesson(input_player:player, event_id:string):void =
        set lesson_epoch += 1
        set override_id = ""
        set lesson_id = event_id
        render_card(input_player)
        report_state(input_player)

    owner_acquired<override>(input_player:player):void =
        set presentation_owner = option{input_player}
        set recipe_saved = false
        set last_rejection = -10.0
        set last_pop_audio = -10.0
        advance_lesson(input_player, "entry")

    accepted_feedback<override>(machine:popbridge_machine, input_player:player):void =
        id := machine.receiver.target_id
        # Snapshot before teaching refresh/commit parks the disabled hit surface.
        if (halo := course_hit_halos[id]):
            var pose:transform = halo.GetTransform()
            set pose.Translation = machine.target.hit_surface.GetTransform().Translation
            if (halo.TeleportTo[pose]):
                var epoch:int = 0
                if (previous := halo_epochs[id]):
                    set epoch = previous
                set epoch += 1
                if (set halo_epochs[id] = epoch) {}
                halo.Begin()
                spawn { finish_halo(input_player, id, state.generation, observed_round, epoch) }
        var play_pop:logic = false
        if (GetSimulationElapsedTime() - last_pop_audio >= 0.15):
            set play_pop = true
            set last_pop_audio = GetSimulationElapsedTime()
        machine.target.accept(input_player, false, ?play_audio := play_pop)
        if (play_pop?):
            var epoch:int = 0
            if (previous := audio_epochs[id]):
                set epoch = previous
            set epoch += 1
            if (set audio_epochs[id] = epoch) {}
            spawn { finish_audio(input_player, id, state.generation, observed_round, epoch) }
        advance_lesson(input_player, accepted_event(id))

    finish_halo(input_player:player, id:int, token:int, round:int, epoch:int)<suspends>:void =
        Sleep(0.5)
        if (valid(input_player, token, round)?, halo_epochs[id] = epoch, halo := course_hit_halos[id]):
            halo.End()

    finish_audio(input_player:player, id:int, token:int, round:int, epoch:int)<suspends>:void =
        Sleep(0.175)
        if (valid(input_player, token, round)?, audio_epochs[id] = epoch, target := course_targets[id]):
            target.hit_sound.Stop(input_player)

    accepted_event(id:int):string =
        if (id = 0):
            return "load"
        if (id = 1):
            return "heat"
        if (id = 2):
            return "pop_pending"
        if (id = 3):
            return "reuse_first_pending"
        if (id = 4):
            return "reuse_fork_pending"
        if (id = 5 or id = 6):
            return "branch_pending"
        return "final_pending"

    committed_lesson<override>(input_player:player, target_id:int):void =
        var event_id:string = "final_done"
        if (target_id = 2):
            set recipe_saved = true
            set event_id = "saved"
        else if (target_id = 3):
            set event_id = "reuse_first_done"
        else if (target_id = 4):
            set event_id = "reuse_fork_done"
        else if (target_id = 5 or target_id = 6):
            set event_id = "branch_done"
        advance_lesson(input_player, event_id)
        if (target_id = 7):
            final_board.SetText(text(card_for("final_done")))
            final_board.UpdateDisplay()

    landed_lesson<override>(input_player:player, landing_id:int):void =
        var event_id:string = "land_finish"
        if (landing_id = 1):
            set event_id = "land_first"
        else if (landing_id = 2):
            set event_id = "land_reuse"
        else if (landing_id = 3):
            set event_id = "land_fork"
        else if (landing_id = 4 or landing_id = 5):
            set event_id = "land_branch"
        advance_lesson(input_player, event_id)

    retry_lesson<override>(input_player:player, event_id:string):void =
        # Repeated monitor recovery/rejected callbacks cannot extend a cue.
        if (event_id = "wrong_position", GetSimulationElapsedTime() - last_rejection < 1.0):
            return
        if (override_id = event_id):
            return
        set last_rejection = GetSimulationElapsedTime()
        set lesson_epoch += 1
        set override_id = event_id
        render_card(input_player)
        spawn { finish_override(input_player, state.generation, observed_round, lesson_epoch) }

    finish_override(input_player:player, token:int, round:int, epoch:int)<suspends>:void =
        Sleep(2.0)
        if (valid(input_player, token, round)?, lesson_epoch = epoch):
            set override_id = ""
            render_card(input_player)

    stop_presentation_effects<override>():void =
        close_finish_portal()
        set lesson_epoch += 1
        for (halo : course_hit_halos):
            halo.End()
        if (current := presentation_owner?):
            for (target : course_targets):
                target.hit_sound.Stop(current)
            feedback.Hide(current)
        set presentation_owner = false
        set halo_epochs = map{}
        set audio_epochs = map{}
        set lesson_id = "entry"
        set override_id = ""
        set recipe_saved = false
        set journal_masked = false

    var presentation_owner:?player = false

    # Feature042 exit gate: reward hook is synchronous; monitor only arms fresh entry.
    var portal_player:?player = false
    var portal_token:int = -1
    var portal_round:int = -1
    var portal_pending:logic = false
    var portal_ready:logic = false

    close_finish_portal():void =
        close_hub_confirmation()
        set portal_ready = false
        set portal_pending = false
        set portal_player = false
        set portal_token = -1
        set portal_round = -1
        finish_hub_portal.Disable()

    completion_ready<override>(input_player:player):void =
        if (current := owner?, current = input_player, state.finished?, valid(input_player, state.generation, observed_round)?):
            close_finish_portal()
            set portal_player = option{input_player}
            set portal_token = state.generation
            set portal_round = observed_round
            set portal_pending = true
            arm_finish_portal(input_player)

    arm_finish_portal(input_player:player):void =
        if (portal_pending?, captured := portal_player?, captured = input_player, current := owner?, current = input_player, state.finished?, portal_round = observed_round, valid(input_player, portal_token, portal_round)?, character := input_player.GetFortCharacter[], character.IsActive[]):
            position := character.GetTransform().Translation
            centre := finish_hub_portal.GetTransform().Translation
            dx := position.X - centre.X
            dy := position.Y - centre.Y
            if (dx * dx + dy * dy > 10000.0):
                set portal_pending = false
                set portal_ready = true
                finish_hub_portal.Enable()

    entered_finish_portal(input_agent:agent):void =
        if (input_player := player[input_agent], portal_ready?, captured := portal_player?, captured = input_player, current := owner?, current = input_player, state.finished?, portal_round = observed_round, valid(input_player, portal_token, portal_round)?, inside_finish_portal(input_player)?):
            set portal_ready = false
            set portal_pending = false
            open_hub_confirmation(input_player)

    # Destinationless native rifts cannot be trusted to signal a raw overlap.
    # The owner's existing 0.1s monitor samples the measured capsule, not the 1m arm margin.
    inside_finish_portal(input_player:player)<transacts>:logic =
        if (character := input_player.GetFortCharacter[], character.IsActive[]):
            position := character.GetTransform().Translation
            centre := finish_hub_portal.GetTransform().Translation
            dx := position.X - centre.X
            dy := position.Y - centre.Y
            var dz:float = position.Z - centre.Z
            if (dz < 0.0):
                set dz = -dz
            # Effective capsule r44/h61.6: nearest point on the +/-17.6cm axis segment.
            var cap_distance:float = 0.0
            if (dz > 17.6):
                set cap_distance = dz - 17.6
            if (dx * dx + dy * dy + cap_distance * cap_distance <= 1936.0):
                return true
        return false

    poll_finish_portal(input_player:player):void =
        if (portal_ready?, inside_finish_portal(input_player)?):
            entered_finish_portal(input_player)

    # Feature043: every Show receives a new immutable callback scope.
    var dialog_owner:?player = false
    var dialog_active:logic = false
    var dialog_epoch:int = 0
    var dialog_subscriptions:[]cancelable = array{}

    configure_hub_confirmation():void =
        hub_return_confirmation.SetButtonCount(2)
        hub_return_confirmation.SetTitleText(text("Return to Hub?"))
        hub_return_confirmation.SetDescriptionText(text("Mission complete! Return to the hub now?"))
        hub_return_confirmation.SetButtonText(text("Return to Hub"), 0)
        hub_return_confirmation.SetButtonText(text("Cancel"), 1)
        hub_return_confirmation.Enable()

    close_hub_confirmation():void =
        captured := dialog_owner
        set dialog_active = false
        set dialog_epoch += 1
        set dialog_owner = false
        for (subscription : dialog_subscriptions):
            subscription.Cancel()
        set dialog_subscriptions = array{}
        if (current := captured?):
            hub_return_confirmation.Hide(current)

    open_hub_confirmation(input_player:player):void =
        close_hub_confirmation()
        set dialog_owner = option{input_player}
        set dialog_active = true
        listener := popbridge_confirmation_listener{controller := Self, captured_player := input_player, token := portal_token, round := portal_round, epoch := dialog_epoch}
        set dialog_subscriptions = array{
            hub_return_confirmation.RespondingButtonEvent.Subscribe(listener.respond),
            hub_return_confirmation.DismissedEvent.Subscribe(listener.dismiss),
            hub_return_confirmation.TimeOutEvent.Subscribe(listener.dismiss)}
        hub_return_confirmation.Show(input_player)

    hub_confirmation_response(input_agent:agent, button:int, captured_player:player, token:int, round:int, epoch:int):void =
        if (dialog_active?, epoch = dialog_epoch, displayed := dialog_owner?, displayed = captured_player, input_agent = captured_player, current := owner?, current = captured_player, state.finished?, round = observed_round, valid(captured_player, token, round)?):
            if (button = 0):
                # Invalidate/cancel BEFORE Hide and cleanup; no suspension/reward.
                close_finish_portal()
                return_to_hub(captured_player)
            else if (button = 1):
                close_hub_confirmation()
                set portal_ready = false
                set portal_pending = true
                finish_hub_portal.Disable()

    lesson_line(event_id:string):string =
        if (event_id = "entry"):
            return "A skill is a few steps you can use again."
        if (event_id = "load"):
            return "LOAD puts in a kernel. One instruction, one action."
        if (event_id = "heat"):
            return "HEAT warms the kernel. Steps work in order."
        if (event_id = "pop_pending"):
            return "POP releases the popcorn."
        if (event_id = "saved"):
            return "POP made popcorn. Three steps are saved as one skill!"
        if (event_id = "land_first"):
            return "You used the popcorn you made. Now reuse the skill."
        if (event_id = "reuse_first_pending"):
            return "One shot runs all three saved steps."
        if (event_id = "reuse_first_done"):
            return "One shot ran all three saved steps."
        if (event_id = "land_reuse"):
            return "Same steps, another bridge. You checked the result by jumping."
        if (event_id = "reuse_fork_pending"):
            return "Same skill, new machine."
        if (event_id = "reuse_fork_done"):
            return "The same steps made another bridge."
        if (event_id = "land_fork"):
            return "Pick either path. Both use the same skill."
        if (event_id = "branch_pending"):
            return "Your chosen machine runs the same three steps."
        if (event_id = "branch_done"):
            return "Same skill, a different popcorn surprise!"
        if (event_id = "land_branch"):
            return "Different path, same skill. Your instructions still work."
        if (event_id = "land_finish"):
            return "Use PopBridge once more. A skill can be reused many times."
        if (event_id = "final_pending"):
            return "The final machine runs the same saved steps."
        if (event_id = "final_done"):
            return "Mission complete! You saved three steps and reused them."
        if (event_id = "wrong_order"):
            return "Steps work in order. Your finished steps are safe."
        if (event_id = "recovery"):
            if (recipe_saved?):
                return "After committed saved recipe only: Missed the jump? Your skill and bridges are safe."
            return "Missed the jump? Your steps and bridges are safe."
        if (event_id = "recovery_fail"):
            return "Your bridges are safe. Trying your last landing again."
        if (event_id = "wrong_position"):
            return "Use the machine from your last completed landing."
        if (event_id = "consumed"):
            return "Already popped. Your bridge stays."
        return ""

    action_line(event_id:string):string =
        if (event_id = "entry"):
            return "Build PopBridge: shoot LOAD."
        if (event_id = "load"):
            return "Next: shoot HEAT."
        if (event_id = "heat"):
            return "Next: shoot POP."
        if (event_id = "pop_pending"):
            return "Running POP; wait for the platform."
        if (event_id = "saved"):
            return "Jump onto your popcorn."
        if (event_id = "land_first"):
            return "Shoot PopBridge to make the next one."
        if (event_id = "reuse_first_pending"):
            return "Running LOAD > HEAT > POP."
        if (event_id = "reuse_first_done"):
            return "Jump onto the new popcorn."
        if (event_id = "land_reuse"):
            return "Shoot PopBridge at the next machine."
        if (event_id = "reuse_fork_pending"):
            return "Running LOAD > HEAT > POP."
        if (event_id = "reuse_fork_done"):
            return "Jump to the wide popcorn landing."
        if (event_id = "land_fork"):
            return "Shoot the moustache or bucket machine."
        if (event_id = "branch_pending"):
            return "Running LOAD > HEAT > POP."
        if (event_id = "branch_done"):
            return "Jump onto your chosen popcorn."
        if (event_id = "land_branch"):
            return "Jump onto the finish landing."
        if (event_id = "land_finish"):
            return "Shoot the final machine."
        if (event_id = "final_pending"):
            return "Running LOAD > HEAT > POP."
        if (event_id = "final_done"):
            return "Walk into the glowing HUB portal, or use Return."
        if (event_id = "wrong_order"):
            return "Next: {instruction_name(state.prefix)}."
        if (event_id = "recovery"):
            return "Try the jump again."
        if (event_id = "recovery_fail"):
            return "Return is available."
        if (event_id = "wrong_position"):
            return "Next: {action_line(lesson_id)}"
        if (event_id = "consumed"):
            return "Next: {action_line(lesson_id)}"
        return ""

# Native response payload has no nonce; captured fields never mutate or get reused.
popbridge_confirmation_listener := class:
    controller:fn_shoreline_island_popbridge_production
    captured_player:player
    token:int
    round:int
    epoch:int

    respond(payload:tuple(agent, int)):void =
        controller.hub_confirmation_response(payload(0), payload(1), captured_player, token, round, epoch)

    dismiss(input_agent:agent):void =
        controller.hub_confirmation_response(input_agent, 1, captured_player, token, round, epoch)
