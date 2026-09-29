using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

# Solo pattern completion: the same three stationary answers serve every round.
fn_shoreline_island_pattern_line := class(creative_device):
    @editable
    configured:logic = false
    @editable
    progress:fn_shoreline_island_loop_progress = fn_shoreline_island_loop_progress{}
    @editable
    course_min_x:float = -1100.0
    @editable
    course_max_x:float = 1100.0
    @editable
    course_min_y:float = 3600.0
    @editable
    course_max_y:float = 5200.0
    @editable
    course_min_z:float = 2350.0
    @editable
    course_max_z:float = 3300.0
    @editable
    hub_destination:teleporter_device = teleporter_device{}
    @editable
    targets:[]fn_shoreline_island_data_target = array{}
    # Keep native editable names to retain saved device bindings.
    @editable
    predict_board:billboard_device = billboard_device{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    replay_button:button_device = button_device{}
    @editable
    entry_return_button:button_device = button_device{}
    @editable
    predict_light:customizable_light_device = customizable_light_device{}
    @editable
    repair_light:customizable_light_device = customizable_light_device{}
    @editable
    motion_light:customizable_light_device = customizable_light_device{}
    @editable
    finale_effect:vfx_creator_device = vfx_creator_device{}
    @editable
    scan_audio:audio_player_device = audio_player_device{}
    @editable
    success_ids:[]int = array{1, 0, 2}
    @editable
    round_patterns:[]string = array{
        "A●  B▲  A●  B▲  A●  ?",
        "A●  B▲  ?  B▲  A●  B▲",
        "A●  B▲  C■  A●  B▲  ?"}
    @editable
    round_hints:[]string = array{
        "Circle, triangle. The pair repeats.",
        "Each pair starts with circle.",
        "Circle, triangle, square. Three repeat."}
    @editable
    round_answers:[]string = array{
        "After circle comes triangle. Shoot B ▲.",
        "The gap starts a pair. Shoot A ●.",
        "Finish the group with square. Shoot C ■."}
    @editable
    round_groups:[]string = array{"A● B▲", "A● B▲", "A● B▲ C■"}
    @editable
    solved_patterns:[]string = array{
        "A● B▲ / A● B▲ / A● B▲",
        "A● B▲ / A● B▲ / A● B▲",
        "A● B▲ C■ / A● B▲ C■"}

    var phase:int = -1
    var generation:int = 0
    var hint_generation:int = 0
    var busy:logic = false
    var mistakes:int = 0
    var last_hit:float = 0.0
    var wrong_ready:float = 0.0
    var active_player:?player = false
    var active_character:?fort_character = false
    var lights:[]customizable_light_device = array{}

    text<localizes>(value:string):message = "{value}"
    welcome<localizes>:message = "PATTERN SCANNER\nSHOOT THE MISSING SYMBOL\nA●  B▲  A●  B▲  A●  ?"
    finished<localizes>:message = "3/3 - PATTERN BADGE EARNED\nSpot the group. Fill the gap. Check the pattern.\nReplay or Return to Hub"

    OnBegin<override>()<suspends>:void =
        Hide()
        if (not configured?):
            return
        if (not valid_configuration[]):
            Print("PATTERN SCANNER: incomplete solo configuration")
            return
        set lights = array{predict_light, repair_light, motion_light}
        # Let target OnBegin capture final scene homes before activating.
        Sleep(0.1)
        for (target : targets):
            target.initialize_surface_home()
        reset_line()
        replay_button.SetInteractionText(text("REPLAY"))
        entry_return_button.SetInteractionText(text("RETURN TO HUB"))
        for (control : array{replay_button, entry_return_button}):
            control.SetInteractionTime(0.0)
            control.SetMaxTriggerCount(0)
        entry_return_button.Enable()
        replay_button.InteractedWithEvent.Subscribe(on_replay)
        entry_return_button.InteractedWithEvent.Subscribe(on_return)
        progress.round_settings.RoundBeginEvent.Subscribe(on_round)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_departure)
        for (index -> target : targets):
            spawn { listen_hits(target, index) }
        monitor_player()

    valid_configuration()<transacts><decides>:void =
        targets.Length = 3
        success_ids.Length = 3
        round_patterns.Length = 3
        round_hints.Length = 3
        round_answers.Length = 3
        round_groups.Length = 3
        solved_patterns.Length = 3
        first_answer := success_ids[0]
        second_answer := success_ids[1]
        third_answer := success_ids[2]
        first_answer >= 0
        first_answer < 3
        second_answer >= 0
        second_answer < 3
        third_answer >= 0
        third_answer < 3

    board(content:message):void =
        predict_board.SetText(content)
        predict_board.ShowText()
        predict_board.UpdateDisplay()

    in_course(input_agent:agent)<transacts><decides>:void =
        character := input_agent.GetFortCharacter[]
        location := character.GetTransform().Translation
        location.X >= course_min_x
        location.X <= course_max_x
        location.Y >= course_min_y
        location.Y <= course_max_y
        location.Z >= course_min_z
        location.Z <= course_max_z

    is_active_player(input_agent:agent)<transacts><decides>:void =
        current := active_player?
        input_agent = current
        saved_character := active_character?
        character := current.GetFortCharacter[]
        character = saved_character
        character.IsActive[]
        in_course[current]

    reset_line():void =
        set generation += 1
        set hint_generation += 1
        if (current := active_player?):
            feedback.Hide(current)
        set phase = -1
        set active_player = false
        set active_character = false
        set busy = false
        set mistakes = 0
        set wrong_ready = 0.0
        for (target : targets):
            target.deactivate()
        for (light : lights):
            light.TurnOff()
        replay_button.Disable()
        finale_effect.End()
        board(welcome)

    on_round():void =
        reset_line()

    on_departure(input_player:player):void =
        if (current := active_player?, current = input_player):
            reset_line()

    begin_solo(input_player:player):void =
        if (character := input_player.GetFortCharacter[], character.IsActive[], in_course[input_player]):
            reset_line()
            set active_player = option{input_player}
            set active_character = option{character}
            progress.ensure_player(input_player)
            set phase = 0
            show_prompt()
            for (target : targets):
                target.activate()

    monitor_player()<suspends>:void =
        loop:
            if (current := active_player?):
                if (not is_active_player[current]):
                    reset_line()
            else:
                # Solo only: no cohorts, shared answers or enrollment.
                for (candidate : GetPlayspace().GetPlayers(), not active_player?):
                    begin_solo(candidate)
            Sleep(0.1)

    on_replay(input_agent:agent):void =
        if (phase = 3, is_active_player[input_agent], current := active_player?):
            begin_solo(current)

    on_return(input_agent:agent):void =
        if (current := active_player?, current = input_agent):
            reset_line()
        hub_destination.Teleport(input_agent)

    show_prompt():void =
        if (pattern := round_patterns[phase]):
            board(text("{phase}/3 SOLVED | SHOOT THE MISSING SYMBOL\n{pattern}"))

    listen_hits(target:fn_shoreline_island_data_target, index:int)<suspends>:void =
        loop:
            input_agent := target.Hit.Await()
            on_hit(input_agent, target, index)

    on_hit(input_agent:agent, target:fn_shoreline_island_data_target, index:int):void =
        if (not is_active_player[input_agent]):
            return
        set last_hit = GetSimulationElapsedTime()
        if (busy? or phase < 0 or phase >= 3):
            return
        if (correct := success_ids[phase]):
            if (index <> correct):
                if (GetSimulationElapsedTime() < wrong_ready):
                    return
                set wrong_ready = GetSimulationElapsedTime() + 0.4
                set mistakes += 1
                target.reject(input_agent)
                set hint_generation += 1
                if (pattern := round_patterns[phase], hint := round_hints[phase], answer := round_answers[phase], group := round_groups[phase]):
                    var guidance:string = hint
                    if (mistakes >= 2):
                        set guidance = "REPEATING GROUP: [{group}]\n{answer}"
                    board(text("{phase}/3 SOLVED | SHOOT THE MISSING SYMBOL\n{pattern}\n{guidance}"))
                    feedback.Show(input_agent, text(guidance), ?DisplayTime := 3.0)
                    spawn { clear_hint(generation, hint_generation, phase) }
                return
            set busy = true
            set hint_generation += 1
            feedback.Hide(input_agent)
            target.accept(input_agent, false)
            for (choice : targets):
                choice.hit_surface.Disable()
            if (solved := solved_patterns[phase]):
                board(text("{phase + 1}/3 SOLVED - PATTERN COMPLETE!\n{solved}"))
            if (current := active_player?):
                state := progress.ensure_player(current)
                if (state.challenge = phase, not state.badge_earned?):
                    progress.complete(current, phase)
            if (light := lights[phase]):
                light.TurnOn()
            scan_audio.Play(input_agent)
            spawn { next_round(generation, phase) }

    clear_hint(token:int, hint_token:int, expected_phase:int)<suspends>:void =
        Sleep(3.0)
        if (generation = token, hint_generation = hint_token, phase = expected_phase, not busy?):
            show_prompt()

    next_round(token:int, solved_phase:int)<suspends>:void =
        if (solved_phase = 2):
            finale_effect.Begin()
        Sleep(1.0)
        if (generation <> token or phase <> solved_phase):
            return
        finale_effect.End()
        set phase += 1
        set mistakes = 0
        set wrong_ready = 0.0
        if (phase = 3):
            set busy = false
            board(finished)
            replay_button.Enable()
            return
        show_prompt()
        # Observe shots under a scoring lock; require a quiet interval to rearm.
        set last_hit = GetSimulationElapsedTime()
        for (choice : targets):
            choice.hit_surface.Enable()
        loop:
            Sleep(0.05)
            if (generation <> token):
                return
            if (GetSimulationElapsedTime() - last_hit >= 0.5):
                set busy = false
                return
