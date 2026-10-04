using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

tool_request_stage := class<concrete>:
    @editable
    tool_id:int = 0
    @editable
    request:string = "What's inside the mystery crate?"

fn_shoreline_island_event_station := class(creative_device):
    @editable
    navigation_journal:fn_shoreline_island_academy_journal = fn_shoreline_island_academy_journal{}
    @editable
    configured:logic = false
    @editable
    station_id:int = 0
    @editable
    progress:fn_shoreline_island_event_progress = fn_shoreline_island_event_progress{}
    @editable
    targets:[]fn_shoreline_island_data_target = array{}
    @editable
    stages:[]tool_request_stage = array{
        tool_request_stage{},
        tool_request_stage{tool_id := 1, request := "Tell the dock crew what we found."},
        tool_request_stage{tool_id := 2, request := "Brighten the dock for collection."}}
    @editable
    entry_zone:mutator_zone_device = mutator_zone_device{}
    @editable
    replay_button:button_device = button_device{}
    @editable
    return_button:button_device = button_device{}
    @editable
    hub_destination:teleporter_device = teleporter_device{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    tool_audio:audio_player_device = audio_player_device{}
    @editable
    board:billboard_device = billboard_device{}
    @editable
    response_board:billboard_device = billboard_device{}
    @editable
    chute:creative_prop = creative_prop{}
    @editable
    scan_beam:creative_prop = creative_prop{}
    @editable
    supplies:[]creative_prop = array{creative_prop{}, creative_prop{}, creative_prop{}}
    @editable
    supplies_label:billboard_device = billboard_device{}
    @editable
    speaker:creative_prop = creative_prop{}
    @editable
    lamp:creative_prop = creative_prop{}
    @editable
    pix:creative_prop = creative_prop{}
    @editable
    dock_light:customizable_light_device = customizable_light_device{}
    @editable
    lights:[]customizable_light_device = array{customizable_light_device{}, customizable_light_device{}, customizable_light_device{}}
    @editable
    hub_spawner_0:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_1:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_2:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_3:player_spawner_device = player_spawner_device{}
    @editable
    bay_min:vector3 = vector3{X := -4600.0, Y := -11600.0, Z := 2350.0}
    @editable
    bay_max:vector3 = vector3{X := -2200.0, Y := -7800.0, Z := 3300.0}
    @editable
    pix_finish:vector3 = vector3{X := -2700.0, Y := -9900.0, Z := 2450.0}

    var owner:?player = false
    var owner_character:?fort_character = false
    var phase:int = -1
    var busy:logic = false
    var generation:int = 0
    var observed_round:int = -1
    var last_hit:float = 0.0
    var last_activity:float = 0.0
    var hint_shown:logic = false
    var crate_scanned:logic = false
    var crew_notified:logic = false
    var dock_lit:logic = false
    var chute_home:transform = transform{}
    var scan_beam_home:transform = transform{}
    var speaker_home:transform = transform{}
    var pix_home:transform = transform{}
    var action_result:string = "Contents UNKNOWN | Crew waiting | Dock DARK"
    text<localizes>(value:string):message = "{value}"

    OnBegin<override>()<suspends>:void =
        Hide()
        if (not configured?):
            return
        Sleep(0.1)
        if (not valid_configuration[]):
            for (target : targets):
                target.deactivate()
            Print("TOOL LAB: incomplete configuration; choices disabled")
            return
        set chute_home = chute.GetTransform()
        set scan_beam_home = scan_beam.GetTransform()
        set speaker_home = speaker.GetTransform()
        set pix_home = pix.GetTransform()
        set observed_round = progress.round_generation
        for (target : targets):
            target.initialize_surface_home()
            set target.explicit_answer_feedback = true
        replay_button.SetInteractionText(text("REPLAY"))
        return_button.SetInteractionText(text("RETURN TO HUB"))
        for (control : array{replay_button, return_button}):
            control.SetInteractionTime(0.0)
            control.SetMaxTriggerCount(0)
        replay_button.InteractedWithEvent.Subscribe(on_replay)
        return_button.InteractedWithEvent.Subscribe(on_return)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_removed)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        for (index -> target : targets):
            spawn { listen_hits(target, index) }
        reset_bay()

        monitor_player()

    valid_configuration()<transacts><decides>:void =
        targets.Length = 3
        supplies.Length = 3
        lights.Length = 3
        stages.Length = 3
        chute.IsValid[]
        scan_beam.IsValid[]
        speaker.IsValid[]
        lamp.IsValid[]
        pix.IsValid[]
        bay_min.X < bay_max.X
        bay_min.Y < bay_max.Y
        bay_min.Z < bay_max.Z
        for (index -> target : targets):
            target.target_id = index
            target.mission_id = 7
        for (index -> stage : stages):
            stage.tool_id = index
        for (supply : supplies):
            supply.IsValid[]

    in_bay(input_agent:agent)<transacts><decides>:void =
        character := input_agent.GetFortCharacter[]
        location := character.GetTransform().Translation
        location.X >= bay_min.X
        location.X <= bay_max.X
        location.Y >= bay_min.Y
        location.Y <= bay_max.Y
        location.Z >= bay_min.Z
        location.Z <= bay_max.Z

    is_owner(input_agent:agent)<transacts><decides>:void =
        GetPlayspace().GetPlayers().Length = 1
        current := owner?
        current = input_agent
        saved := owner_character?
        character := current.GetFortCharacter[]
        character = saved
        character.IsActive[]
        in_bay[current]

    run_valid(token:int, expected_phase:int)<transacts><decides>:void =
        generation = token
        phase = expected_phase
        observed_round = progress.round_generation
        current := owner?
        is_owner[current]

    display(label:billboard_device, content:string):void =
        label.SetText(text(content))
        label.ShowText()
        label.UpdateDisplay()

    show_board():void =
        if (phase >= 0, phase < 3, stage := stages[phase]):
            display(board, "PIX'S DOCK RESCUE | {phase}/3\n{stage.request}\nShoot A, B or C.")
        else if (phase = 3):
            display(board, "3/3 | TOOL MASTER BADGE\nScanner finds. Speaker shares. Light brightens.\nReplay or Return to Hub")
        else:
            display(board, "AI TOOL LAB | PIX'S DOCK RESCUE\nHelp Pix ready the dock.\nWalk in. Shoot the tool that fits.")
        display(response_board, action_result)

    reset_bay():void =
        set generation += 1
        if (current := owner?):
            feedback.Hide(current)
        set owner = false
        set owner_character = false
        set phase = -1
        set busy = false
        set crate_scanned = false
        set crew_notified = false
        set dock_lit = false
        set hint_shown = false
        for (target : targets):
            target.deactivate()
        for (light : lights):
            light.TurnOff()
        dock_light.TurnOff()
        for (supply : supplies):
            supply.Hide()
        supplies_label.HideText()
        scan_beam.Hide()
        if (scan_beam.TeleportTo[scan_beam_home]) {}
        if (chute.TeleportTo[chute_home]) {}
        if (speaker.TeleportTo[speaker_home]) {}
        if (pix.TeleportTo[pix_home]) {}
        replay_button.Disable()
        return_button.Enable()
        set action_result = "Contents UNKNOWN | Crew waiting | Dock DARK"
        show_board()

    fixtures_home()<transacts><decides>:void =
        Distance(chute.GetTransform().Translation, chute_home.Translation) <= 5.0
        Distance(speaker.GetTransform().Translation, speaker_home.Translation) <= 5.0
        Distance(pix.GetTransform().Translation, pix_home.Translation) <= 5.0

    begin_solo(input_player:player):void =
        if (GetPlayspace().GetPlayers().Length = 1, character := input_player.GetFortCharacter[], character.IsActive[], in_bay[input_player]):
            reset_bay()
            if (not fixtures_home[]):
                display(response_board, "Display reset failed. Leave and try again.")
                return
            state := progress.ensure_player(input_player)
            set state.challenge = 0
            set state.completed = array{false, false, false}
            set state.solved = false
            set state.station_id = 0
            set owner = option{input_player}
            set owner_character = option{character}
            set phase = 0
            set last_activity = GetSimulationElapsedTime()
            for (target : targets):
                target.activate()
            show_board()
            Print("TOOL LAB: solo entry; contents unknown; step=0")

    monitor_player()<suspends>:void =
        loop:
            if (observed_round <> progress.round_generation):
                set observed_round = progress.round_generation
                reset_bay()
            if (GetPlayspace().GetPlayers().Length <> 1):
                if (owner?):
                    reset_bay()
                display(board, "AI TOOL LAB | SINGLE PLAYER ONLY\nResume with one player.")
            else if (current := owner?):
                if (not is_owner[current]):
                    reset_bay()
                else if (not busy?, phase >= 0, phase < 3, not hint_shown?, GetSimulationElapsedTime() - last_activity >= 8.0):
                    set hint_shown = true
                    var hint:string = "Scanner finds out what is inside. Shoot A SCANNER."
                    if (phase = 1):
                        set hint = "Speaker shares what we found. Shoot B SPEAKER."
                    else if (phase = 2):
                        set hint = "Light brightens the dock. Shoot C LIGHT."
                    feedback.Show(current, text(hint), ?DisplayTime := 5.0)
            else if (candidate := GetPlayspace().GetPlayers()[0]):
                begin_solo(candidate)
            report_navigation()
            Sleep(0.1)

    listen_hits(target:fn_shoreline_island_data_target, index:int)<suspends>:void =
        loop:
            input_agent := target.Hit.Await()
            on_hit(input_agent, target, index)

    on_hit(input_agent:agent, target:fn_shoreline_island_data_target, index:int):void =
        if (not is_owner[input_agent]):
            Print("TOOL LAB: ignored non-owner hit target={index}")
            return
        set last_hit = GetSimulationElapsedTime()
        if (busy? or phase < 0 or phase >= 3):
            return
        set busy = true
        set last_activity = last_hit
        set hint_shown = false
        spawn { execute_action(input_agent, target, index, generation, phase) }

    # Check cancellation and successful teleport at every animation frame.
    animate(prop:creative_prop, destination:transform, token:int, expected_phase:int)<suspends>:logic =
        start := prop.GetTransform()
        for (frame := 1..10):
            if (not run_valid[token, expected_phase]):
                return false
            var pose:transform = destination
            set pose.Translation = start.Translation + (destination.Translation - start.Translation) * (frame * 0.1)
            if (prop.TeleportTo[pose]):
                # Commit successful movement outside an inverted failure context.
            else:
                Print("TOOL ANIMATE: TeleportTo failed frame={frame} destination={pose.Translation.X},{pose.Translation.Y},{pose.Translation.Z}")
                return false
            Sleep(0.05)
        if (not run_valid[token, expected_phase]):
            return false
        if (Distance(prop.GetTransform().Translation, destination.Translation) > 5.0):
            actual := prop.GetTransform().Translation
            Print("TOOL ANIMATE: arrival failed actual={actual.X},{actual.Y},{actual.Z} wanted={destination.Translation.X},{destination.Translation.Y},{destination.Translation.Z}")
            return false
        return true

    execute_action(input_agent:agent, target:fn_shoreline_island_data_target, index:int, token:int, expected_phase:int)<suspends>:void =
        var output_ok:logic = true
        if (not run_valid[token, expected_phase]):
            return
        if (index = 0):
            if (not crate_scanned?):
                var sweep_end:transform = scan_beam_home
                set sweep_end.Translation.X += 200.0
                scan_beam.Show()
                set output_ok = animate(scan_beam, sweep_end, token, expected_phase)
                if (not run_valid[token, expected_phase]):
                    return
                scan_beam.Hide()
                var opened:transform = chute_home
                set opened.Translation.Z += 120.0
                if (output_ok?, run_valid[token, expected_phase]):
                    set output_ok = animate(chute, opened, token, expected_phase)
                if (output_ok?, run_valid[token, expected_phase]):
                    for (supply : supplies):
                        supply.Show()
                    display(supplies_label, "MEDICAL SUPPLIES x3")
                    set crate_scanned = true
            if (output_ok?):
                set action_result = "SCANNER: medical supplies found.\nThe scanner finds information."
        else if (index = 1):
            if (crate_scanned?):
                var pulse:transform = speaker_home
                set pulse.Scale = speaker_home.Scale * 1.15
                set output_ok = animate(speaker, pulse, token, expected_phase)
                if (output_ok?, run_valid[token, expected_phase]):
                    if (speaker.TeleportTo[speaker_home]):
                        # Commit successful reset.
                    else:
                        set output_ok = false
                if (output_ok?, run_valid[token, expected_phase]):
                    tool_audio.Play(input_agent)
                    set crew_notified = true
                    set action_result = "SPEAKER: crew notified - medical supplies.\n[OK] Crew ready. Speaker shares information."
            else:
                set action_result = "SPEAKER: contents unknown - scan first.\nSpeaking cannot reveal what's inside."
        else if (index = 2):
            dock_light.TurnOn()
            set action_result = "LIGHT: dock bright.\nLight cannot scan or notify the crew."
            if (expected_phase = 2, crate_scanned?, crew_notified?):
                var destination:transform = pix_home
                set destination.Translation = pix_finish
                set output_ok = animate(pix, destination, token, expected_phase)
                if (output_ok?, run_valid[token, expected_phase]):
                    set dock_lit = true
                    set action_result = "LIGHT: dock ON. Pix ready for collection!\n[OK] Crate scanned. Crew notified. Dock lit."
            else:
                Sleep(0.5)
        if (not run_valid[token, expected_phase]):
            return
        var correct:logic = false
        if (stage := stages[expected_phase], stage.tool_id = index, output_ok?):
            if (expected_phase = 0, crate_scanned?):
                set correct = true
            else if (expected_phase = 1, crate_scanned?, crew_notified?):
                set correct = true
            else if (expected_phase = 2, crate_scanned?, crew_notified?, dock_lit?):
                set correct = true
        if (correct?, current := owner?):
            target.accept(input_agent, false)
            state := progress.ensure_player(current)
            set state.challenge = expected_phase
            progress.complete(current)
            if (light := lights[expected_phase]):
                light.TurnOn()
            Print("TOOL LAB: verified step={expected_phase} tool={index} output={action_result}")
        else:
            target.reject(input_agent)
            if (not output_ok?):
                set action_result = "Tool movement failed. No credit; try again."
            else if (stage := stages[expected_phase]):
                set action_result = "{action_result}\nStill needed: {stage.request}"
            Print("TOOL LAB: retry step={expected_phase} tool={index} output={action_result}")
        show_board()
        Sleep(1.0)
        if (not run_valid[token, expected_phase]):
            return
        if (not dock_lit?):
            dock_light.TurnOff()
        if (correct?):
            set phase += 1
            if (phase = 3):
                for (choice : targets):
                    choice.deactivate()
                replay_button.Enable()
                set busy = false
                show_board()
                feedback.Show(input_agent, text("Tool Master Badge! Scanner finds. Speaker shares. Light brightens."), ?DisplayTime := 8.0)
                return
        # Keep hit surfaces active so held fire extends the lock.
        loop:
            if (generation <> token or not is_owner[input_agent]):
                return
            if (GetSimulationElapsedTime() - last_hit >= 0.5):
                break
            Sleep(0.05)
        set busy = false
        set last_activity = GetSimulationElapsedTime()
        set hint_shown = false
        if (current := owner?):
            state := progress.ensure_player(current)
            set state.solved = false
        show_board()

    on_replay(input_agent:agent):void =
        if (phase = 3, is_owner[input_agent], current := owner?):
            begin_solo(current)

    on_return(input_agent:agent):void =
        if (current := owner?, current = input_agent):
            reset_bay()
        hub_destination.Teleport(input_agent)

    on_spawn(input_agent:agent):void =
        if (current := owner?, current = input_agent):
            reset_bay()

    on_removed(input_player:player):void =
        if (current := owner?, current = input_player):
            reset_bay()


    navigation_text<localizes>(value:string):message = "{value}"

    report_navigation():void =
        if (current := owner?, is_owner[current]):
            var instruction:message = navigation_text("Completed. Replay or return to Hub.")
            if (stage := stages[phase]):
                set instruction = text(stage.request)
            if (busy?):
                set instruction = navigation_text("Watch Pix's result.")
            var step:int = phase + 1
            if (step > 3):
                set step = 3
            if (step < 1):
                set step = 1
            navigation_journal.report_activity(current, 5, 5, step, 3, instruction, generation)
