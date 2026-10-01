using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

debug_route_stage := class<concrete>:
    @editable
    start_tile:int = 0
    @editable
    goal_tile:int = 3
    @editable
    commands:[]int = array{2, 0, 2}
    @editable
    editable_slot:int = 1

# LEFT=0, STOP=1, RIGHT=2. Credit follows actual execution, never answer ID.
fn_shoreline_island_debug_station := class(creative_device):
    @editable
    configured:logic = false
    @editable
    progress:fn_shoreline_island_debug_progress = fn_shoreline_island_debug_progress{}
    @editable
    targets:[]fn_shoreline_island_data_target = array{}
    @editable
    stages:[]debug_route_stage = array{
        debug_route_stage{},
        debug_route_stage{start_tile := 2, goal_tile := 1, commands := array{2}, editable_slot := 0},
        debug_route_stage{start_tile := 1, goal_tile := 2, commands := array{2, 2}, editable_slot := 1}}
    @editable
    entry_zone:mutator_zone_device = mutator_zone_device{}
    @editable
    bay_min_x:float = -4600.0
    @editable
    bay_max_x:float = -2200.0
    @editable
    bay_min_y:float = -7800.0
    @editable
    bay_max_y:float = -4100.0
    @editable
    bay_min_z:float = 2350.0
    @editable
    bay_max_z:float = 3300.0
    @editable
    replay_button:button_device = button_device{}
    @editable
    return_button:button_device = button_device{}
    @editable
    hub_destination:teleporter_device = teleporter_device{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    error_audio:audio_player_device = audio_player_device{}
    @editable
    board:billboard_device = billboard_device{}
    @editable
    instruction_board:billboard_device = billboard_device{}
    @editable
    marker:creative_prop = creative_prop{}
    @editable
    goal_marker:creative_prop = creative_prop{}
    @editable
    goal_label:billboard_device = billboard_device{}
    @editable
    lights:[]customizable_light_device = array{
        customizable_light_device{}, customizable_light_device{}, customizable_light_device{}}
    @editable
    track_origin:vector3 = vector3{X := -3600.0, Y := -6000.0, Z := 2700.0}
    @editable
    tile_spacing:float = 200.0

    fixtures:fn_shoreline_island_debug_fixtures = fn_shoreline_island_debug_fixtures{}
    var phase:int = -1
    var generation:int = 0
    var observed_round:int = -1
    var busy:logic = false
    var mistakes:int = 0
    var last_hit:float = 0.0
    var active_player:?player = false
    var active_character:?fort_character = false
    var marker_home:transform = transform{}
    var goal_home:transform = transform{}
    var before_tile:int = 0
    var actual_tile:int = 0
    var current_commands:[]int = array{}

    text<localizes>(value:string):message = "{value}"
    welcome<localizes>:message = "AI ERROR LAB\nFIX PIX'S ROUTE\nShoot LEFT, STOP or RIGHT to fix the boxed step."
    recap<localizes>:message = "3/3 - AI DETECTIVE BADGE EARNED\nCheck the goal. Change one mistake.\nRun again and check the result.\nReplay or Return to Hub"

    OnBegin<override>()<suspends>:void =
        Hide()
        if (not configured?):
            return
        Sleep(0.1)
        if (not valid_configuration[]):
            for (target : targets):
                target.deactivate()
            Print("ERROR LAB: invalid solo configuration; choices disabled")
            return
        set marker_home = marker.GetTransform()
        set goal_home = goal_marker.GetTransform()
        for (index -> stage : stages):
            Print("ERROR LAB: configured stage={index} start={stage.start_tile} goal={stage.goal_tile} slot={stage.editable_slot} program={program_text(stage.commands, stage.editable_slot)}")
        set observed_round = progress.round_generation
        for (target : targets):
            target.initialize_surface_home()
        reset_bay()
        replay_button.SetInteractionText(text("REPLAY"))
        return_button.SetInteractionText(text("RETURN TO HUB"))
        for (control : array{replay_button, return_button}):
            control.SetInteractionTime(0.0)
            control.SetMaxTriggerCount(0)
        return_button.Enable()
        replay_button.InteractedWithEvent.Subscribe(on_replay)
        return_button.InteractedWithEvent.Subscribe(on_return)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_removed)
        for (index -> target : targets):
            spawn { listen_hits(target, index) }
        monitor_player()

    valid_configuration()<transacts><decides>:void =
        targets.Length = 3
        lights.Length = 3
        stages.Length = 3
        marker.IsValid[]
        goal_marker.IsValid[]
        tile_spacing > 0.0
        bay_min_x < bay_max_x
        bay_min_y < bay_max_y
        bay_min_z < bay_max_z
        for (index -> target : targets):
            target.target_id = index
        for (stage : stages):
            stage.start_tile >= 0
            stage.start_tile <= 4
            stage.goal_tile >= 0
            stage.goal_tile <= 4
            stage.commands.Length > 0
            stage.commands.Length <= 3
            stage.editable_slot >= 0
            stage.editable_slot < stage.commands.Length
            for (command : stage.commands):
                command >= 0
                command <= 2
            valid_stage[stage]

    # Reject unsafe or ambiguous editable data before arming any hit surface.
    valid_stage(stage:debug_route_stage)<transacts><decides>:void =
        var initial_endpoint:int = stage.start_tile
        for (command : stage.commands):
            set initial_endpoint += fixtures.move_delta(command)
        initial_endpoint <> stage.goal_tile
        var matches:int = 0
        for (replacement : array{0, 1, 2}):
            var tile:int = stage.start_tile
            for (index -> original : stage.commands):
                var command:int = original
                if (index = stage.editable_slot):
                    set command = replacement
                set tile += fixtures.move_delta(command)
                tile >= 0
                tile <= 4
            if (tile = stage.goal_tile):
                set matches += 1
        matches = 1

    display(label:billboard_device, content:message):void =
        label.SetText(content)
        label.ShowText()
        label.UpdateDisplay()

    in_bay(input_agent:agent)<transacts><decides>:void =
        character := input_agent.GetFortCharacter[]
        location := character.GetTransform().Translation
        location.X >= bay_min_x
        location.X <= bay_max_x
        location.Y >= bay_min_y
        location.Y <= bay_max_y
        location.Z >= bay_min_z
        location.Z <= bay_max_z

    is_active_player(input_agent:agent)<transacts><decides>:void =
        current := active_player?
        input_agent = current
        saved_character := active_character?
        character := current.GetFortCharacter[]
        character = saved_character
        character.IsActive[]
        in_bay[current]

    run_valid(token:int, expected_phase:int)<transacts><decides>:void =
        generation = token
        phase = expected_phase
        current := active_player?
        is_active_player[current]

    move_pix(tile:int):void =
        var pose:transform = marker_home
        set pose.Translation = track_origin + vector3{X := tile * tile_spacing}
        if (marker.TeleportTo[pose]) {}

    move_goal(tile:int):void =
        var pose:transform = goal_home
        set pose.Translation = track_origin + vector3{X := tile * tile_spacing, Z := 100.0}
        if (goal_marker.TeleportTo[pose]) {}
        var label_pose:transform = goal_label.GetTransform()
        set label_pose.Translation = pose.Translation + vector3{Y := 10.0, Z := -40.0}
        if (goal_label.TeleportTo[label_pose]) {}
        display(goal_label, text("GOAL {tile}"))

    command_name(command:int):string =
        if (command = 0):
            "LEFT"
        else if (command = 1):
            "STOP"
        else:
            "RIGHT"

    program_text(commands:[]int, slot:int):string =
        var plan_string:string = ""
        for (index -> command : commands):
            if (index > 0):
                set plan_string = "{plan_string}  "
            name := command_name(command)
            if (index = slot):
                set plan_string = "{plan_string}[{name}]"
            else:
                set plan_string = "{plan_string}{name}"
        plan_string

    show_result(status:string):void =
        if (stage := stages[phase]):
            program := program_text(current_commands, stage.editable_slot)
            display(board, text("{phase}/3 FIXED | GOAL {stage.goal_tile}\nStart {stage.start_tile}: {program}\nBEFORE {before_tile} | NOW {actual_tile}\n{status}"))

    reset_bay():void =
        set generation += 1
        if (current := active_player?):
            feedback.Hide(current)
        set active_player = false
        set active_character = false
        set phase = -1
        set busy = false
        set mistakes = 0
        set before_tile = 0
        set actual_tile = 0
        set current_commands = array{}
        for (target : targets):
            target.deactivate()
        for (light : lights):
            light.TurnOff()
        replay_button.Disable()
        move_pix(0)
        move_goal(3)
        display(board, welcome)
        display(instruction_board, text("FIX THE BOXED STEP\nLEFT < : one tile left\nSTOP [] : stay for this step\nRIGHT > : one tile right"))

    on_removed(input_player:player):void =
        if (current := active_player?, current = input_player):
            reset_bay()

    begin_solo(input_player:player):void =
        if (character := input_player.GetFortCharacter[], character.IsActive[], in_bay[input_player]):
            reset_bay()
            set active_player = option{input_player}
            set active_character = option{character}
            progress.ensure_player(input_player)
            set phase = 0
            set busy = true
            for (target : targets):
                target.activate()
            spawn { demonstrate(generation, phase) }

    monitor_player()<suspends>:void =
        loop:
            if (observed_round <> progress.round_generation):
                set observed_round = progress.round_generation
                reset_bay()
            if (current := active_player?):
                if (not is_active_player[current]):
                    reset_bay()
            else:
                for (candidate : GetPlayspace().GetPlayers(), not active_player?):
                    begin_solo(candidate)
            Sleep(0.1)

    demonstrate(token:int, expected_phase:int)<suspends>:void =
        if (not run_valid[token, expected_phase]):
            return
        if (stage := stages[phase]):
            set current_commands = stage.commands
            set before_tile = stage.start_tile
            for (command : stage.commands):
                set before_tile += fixtures.move_delta(command)
            set actual_tile = stage.start_tile
            move_goal(stage.goal_tile)
            move_pix(actual_tile)
            show_result("WATCH PIX'S PLAN")
            Sleep(0.5)
            execute_plan(token, expected_phase, true)

    listen_hits(target:fn_shoreline_island_data_target, index:int)<suspends>:void =
        loop:
            input_agent := target.Hit.Await()
            on_hit(input_agent, target, index)

    on_hit(input_agent:agent, target:fn_shoreline_island_data_target, index:int):void =
        if (not is_active_player[input_agent]):
            return
        set last_hit = GetSimulationElapsedTime()
        if (busy? or phase < 0 or phase >= stages.Length):
            return
        if (stage := stages[phase]):
            set busy = true
            set current_commands = stage.commands
            if (set current_commands[stage.editable_slot] = index):
                target.accept(input_agent, false)
                feedback.Hide(input_agent)
                show_result("TESTING {command_name(index)}")
                Print("ERROR LAB: shot phase={phase} command={index}")
                spawn { execute_plan(generation, phase, false) }

    execute_plan(token:int, expected_phase:int, demonstration:logic)<suspends>:void =
        if (not run_valid[token, expected_phase]):
            return
        if (stage := stages[phase]):
            set actual_tile = stage.start_tile
            move_pix(actual_tile)
            for (step -> command : current_commands):
                if (not run_valid[token, expected_phase]):
                    return
                show_result("Step {step + 1}: {command_name(command)}")
                Sleep(0.5)
                if (not run_valid[token, expected_phase]):
                    return
                set actual_tile += fixtures.move_delta(command)
                move_pix(actual_tile)
            if (demonstration?):
                show_result("MISMATCH - SHOOT A CORRECTION")
            else if (actual_tile = stage.goal_tile):
                if (current := active_player?, light := lights[phase]):
                    state := progress.ensure_player(current)
                    set state.challenge = phase
                    progress.complete(current)
                    light.TurnOn()
                    show_result("MATCH! {phase + 1}/3 FIXED")
                    Print("ERROR LAB: verified phase={phase} goal={stage.goal_tile} actual={actual_tile}")
                Sleep(1.0)
                if (not run_valid[token, expected_phase]):
                    return
                set phase += 1
                set mistakes = 0
                if (phase = stages.Length):
                    for (target : targets):
                        target.deactivate()
                    display(board, recap)
                    replay_button.Enable()
                    set busy = false
                    return
                await_quiet(token, phase)
                if (run_valid[token, phase]):
                    set busy = true
                    demonstrate(token, phase)
                return
            else:
                set mistakes += 1
                var hint:string = "Reached {actual_tile}; goal is {stage.goal_tile}. Change the boxed step."
                if (mistakes >= 2):
                    if (phase = 0):
                        set hint = "All three steps need to go right. Shoot RIGHT."
                    else if (phase = 1):
                        set hint = "From tile 2, move left to tile 1. Shoot LEFT."
                    else:
                        set hint = "The extra step overshoots. Shoot STOP."
                show_result(hint)
                if (current := active_player?):
                    error_audio.Play(current)
                    feedback.Show(current, text(hint), ?DisplayTime := 0.0)
                Print("ERROR LAB: mismatch phase={phase} goal={stage.goal_tile} actual={actual_tile}")
            Sleep(1.0)
            if (run_valid[token, expected_phase]):
                await_quiet(token, expected_phase)

    await_quiet(token:int, expected_phase:int)<suspends>:void =
        set last_hit = GetSimulationElapsedTime()
        for (target : targets):
            target.activate()
        loop:
            Sleep(0.05)
            if (not run_valid[token, expected_phase]):
                return
            if (GetSimulationElapsedTime() - last_hit >= 0.5):
                set busy = false
                return

    on_replay(input_agent:agent):void =
        if (phase = stages.Length, is_active_player[input_agent], current := active_player?):
            begin_solo(current)

    on_return(input_agent:agent):void =
        if (current := active_player?, current = input_agent):
            reset_bay()
        hub_destination.Teleport(input_agent)
