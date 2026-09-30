using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

# The saved station actors share this class; only the configured solo bay runs.
fn_shoreline_island_energy_station := class(creative_device):
    @editable
    configured:logic = false
    @editable
    station_id:int = 0
    @editable
    progress:fn_shoreline_island_energy_progress = fn_shoreline_island_energy_progress{}
    @editable
    bay_min_x:float = -4600.0
    @editable
    bay_max_x:float = -1800.0
    @editable
    bay_min_y:float = -4100.0
    @editable
    bay_max_y:float = -600.0
    @editable
    bay_min_z:float = 2350.0
    @editable
    bay_max_z:float = 3300.0
    @editable
    targets:[]fn_shoreline_island_data_target = array{}
    @editable
    first_light:customizable_light_device = customizable_light_device{}
    @editable
    fresh_light:customizable_light_device = customizable_light_device{}
    @editable
    release_light:customizable_light_device = customizable_light_device{}
    @editable
    cooling_effect:vfx_creator_device = vfx_creator_device{}
    @editable
    finish_effect:vfx_creator_device = vfx_creator_device{}
    @editable
    core_display:creative_prop = creative_prop{}

    @editable
    replay_button:button_device = button_device{}
    @editable
    return_button:button_device = button_device{}
    @editable
    hub_destination:teleporter_device = teleporter_device{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    confidence_audio:audio_player_device = audio_player_device{}
    @editable
    board:billboard_device = billboard_device{}
    @editable
    hub_spawner_0:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_1:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_2:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_3:player_spawner_device = player_spawner_device{}

    var phase:int = -1
    var generation:int = 0
    var busy:logic = false
    var mistakes:int = 0
    var last_hit:float = 0.0
    var wrong_ready:float = 0.0
    var hold_hint_ready:float = 0.0
    var active_player:?player = false
    var active_character:?fort_character = false
    var lights:[]customizable_light_device = array{}
    core_hot_material:DataBlaster.mi_target_grey = DataBlaster.mi_target_grey{}
    core_cooled_material:DataBlaster.m_data_ring = DataBlaster.m_data_ring{}

    text<localizes>(value:string):message = "{value}"
    welcome<localizes>:message = "MAKE THE CORE SAFE\nPix: SAFE - 90% CONFIDENT\nCheck the claim before you act."

    OnBegin<override>()<suspends>:void =
        Hide()
        if (not configured?):
            return
        if (targets.Length <> 3):
            Print("CONFIDENCE CORE: expected exactly three target devices")
            return
        set lights = array{first_light, fresh_light, release_light}
        Sleep(0.1)
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
        progress.round_settings.RoundBeginEvent.Subscribe(on_round)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_departure)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        for (index -> target : targets):
            spawn { listen_hits(target, index) }
        monitor_player()

    in_bay(input_agent:agent)<transacts><decides>:void =
        character := input_agent.GetFortCharacter[]
        location := character.GetTransform().Translation
        location.X >= bay_min_x
        location.X <= bay_max_x
        location.Y >= bay_min_y
        location.Y <= bay_max_y
        location.Z >= bay_min_z
        location.Z <= bay_max_z

    is_owner(input_agent:agent)<transacts><decides>:void =
        current := active_player?
        input_agent = current
        saved_character := active_character?
        character := current.GetFortCharacter[]
        character = saved_character
        character.IsActive[]
        in_bay[current]

    show_board(status:string):void =
        var content:message = welcome
        if (phase = 0):
            set content = text("0/3 | MAKE THE CORE SAFE\nPix: SAFE 90% | OUT COOL\nINSIDE UNKNOWN\nA CHECK  B COOL  C RELEASE\n{status}")
        else if (phase = 1):
            set content = text("1/3 | PIX WRONG FOR THIS CORE\nOUT COOL | INSIDE HOT\nA CHECK  B COOL  C RELEASE\n{status}")
        else if (phase = 2):
            set content = text("1/3 | CORE COOLED\nOUT OLD | IN NOT RECHECKED\nA CHECK  B COOL  C RELEASE\n{status}")
        else if (phase = 3):
            set content = text("2/3 | FRESH CHECK\nOUT COOL | INSIDE COOL\nA CHECK  B COOL  C RELEASE\n{status}")
        else if (phase = 4):
            set content = text("3/3 | CORE READY\nCONFIDENCE BADGE\nFRESH OUT + IN: COOL\nCheck claim. Check change. Act.")
        board.SetText(content)
        board.ShowText()
        board.UpdateDisplay()

    reset_bay():void =
        set generation += 1
        if (current := active_player?):
            feedback.Hide(current)
        set phase = -1
        set active_player = false
        set active_character = false
        set busy = false
        set mistakes = 0
        set wrong_ready = 0.0
        set hold_hint_ready = 0.0
        for (target : targets):
            target.deactivate()
        for (light : lights):
            light.TurnOff()
        cooling_effect.End()
        finish_effect.End()
        core_display.SetMaterial(core_hot_material)
        core_display.Show()
        replay_button.Disable()
        show_board("")

    on_round():void =
        reset_bay()

    on_departure(input_player:player):void =
        if (current := active_player?, current = input_player):
            reset_bay()

    on_spawn(input_agent:agent):void =
        if (current := active_player?, current = input_agent):
            reset_bay()

    begin_solo(input_player:player):void =
        if (character := input_player.GetFortCharacter[], character.IsActive[], in_bay[input_player]):
            reset_bay()
            set active_player = option{input_player}
            set active_character = option{character}
            progress.ensure_player(input_player)
            set phase = 0
            show_board("Shoot CHECK to measure inside.")
            for (target : targets):
                target.activate()

    monitor_player()<suspends>:void =
        loop:
            if (current := active_player?):
                if (not is_owner[current]):
                    reset_bay()
            else:
                for (candidate : GetPlayspace().GetPlayers(), not active_player?):
                    begin_solo(candidate)
            Sleep(0.1)

    on_replay(input_agent:agent):void =
        if (phase = 4, is_owner[input_agent], current := active_player?):
            begin_solo(current)

    on_return(input_agent:agent):void =
        if (current := active_player?, current = input_agent):
            reset_bay()
        hub_destination.Teleport(input_agent)

    listen_hits(target:fn_shoreline_island_data_target, index:int)<suspends>:void =
        loop:
            input_agent := target.Hit.Await()
            on_hit(input_agent, target, index)

    on_hit(input_agent:agent, target:fn_shoreline_island_data_target, index:int):void =
        if (not is_owner[input_agent]):
            return
        set last_hit = GetSimulationElapsedTime()
        if (busy?):
            if (GetSimulationElapsedTime() >= hold_hint_ready):
                set hold_hint_ready = GetSimulationElapsedTime() + 0.5
                feedback.Show(input_agent, text("Release fire to continue."), ?DisplayTime := 0.6)
            return
        if (phase < 0 or phase >= 4):
            return
        var correct:int = 0
        if (phase = 1):
            set correct = 1
        else if (phase = 3):
            set correct = 2
        if (index = correct):
            accept_action(input_agent, target)
            return
        if (index = 0 and phase = 1):
            show_board("HOT CONFIRMED. COOL NEXT.")
            feedback.Show(input_agent, text("Inside is still HOT. COOL it, then check again."), ?DisplayTime := 3.0)
            return
        if (index = 0 and phase = 3):
            show_board("COOL CONFIRMED. RELEASE NEXT.")
            feedback.Show(input_agent, text("Fresh readings remain COOL. RELEASE is ready."), ?DisplayTime := 3.0)
            return
        if (index = 1 and phase = 2):
            show_board("COOLED. CHECK AGAIN.")
            feedback.Show(input_agent, text("Cooling cannot replace a fresh check."), ?DisplayTime := 3.0)
            return
        if (GetSimulationElapsedTime() < wrong_ready):
            return
        set wrong_ready = GetSimulationElapsedTime() + 0.4
        set mistakes += 1
        target.reject(input_agent)
        var guidance:string = "Check the evidence before acting."
        if (phase = 0):
            set guidance = "Inside is UNKNOWN. Measure it before COOL or RELEASE."
            if (mistakes >= 2):
                set guidance = "Shoot A CHECK to learn whether the core is hot."
        else if (phase = 1):
            set guidance = "Inside is HOT. Do not release this core."
            if (mistakes >= 2):
                set guidance = "Shoot B COOL to fix the measured heat."
        else if (phase = 2):
            set guidance = "Old readings cannot prove cooling worked."
            if (mistakes >= 2):
                set guidance = "Shoot A CHECK for fresh outside and inside readings."
        else if (phase = 3):
            set guidance = "Both fresh readings are COOL. No more cooling is needed."
            if (mistakes >= 2):
                set guidance = "Shoot C RELEASE to finish with fresh evidence."
        var board_hint:string = "CHECK BEFORE ACTING."
        if (phase = 0):
            set board_hint = "SHOOT A CHECK FIRST."
        else if (phase = 1):
            set board_hint = "HOT INSIDE. SHOOT B COOL."
        else if (phase = 2):
            set board_hint = "OLD DATA. SHOOT A CHECK."
        else if (phase = 3):
            set board_hint = "FRESH COOL. SHOOT C RELEASE."
        show_board(board_hint)
        feedback.Show(input_agent, text(guidance), ?DisplayTime := 3.0)

    accept_action(input_agent:agent, target:fn_shoreline_island_data_target):void =
        set busy = true
        set mistakes = 0
        feedback.Hide(input_agent)
        target.accept(input_agent, false)
        for (choice : targets):
            choice.hit_surface.Disable()
        var action_result:string = ""
        if (phase = 0):
            set action_result = "CHECK found HOT inside. Pix's SAFE claim was wrong here."
            if (light := lights[0]):
                light.TurnOn()
        else if (phase = 1):
            set action_result = "COOL applied. Old readings are not proof; check again."
            cooling_effect.Begin()
            core_display.SetMaterial(core_cooled_material)
        else if (phase = 2):
            set action_result = "FRESH CHECK: outside COOL, inside COOL."
            if (light := lights[1]):
                light.TurnOn()
        else if (phase = 3):
            set action_result = "RELEASE accepted with fresh COOL readings."
            if (light := lights[2]):
                light.TurnOn()
        set phase += 1
        var board_result:string = ""
        if (phase = 1):
            set board_result = "HOT INSIDE. COOL THE CORE."
        else if (phase = 2):
            set board_result = "COOLED. CHECK AGAIN."
        else if (phase = 3):
            set board_result = "BOTH FRESH READINGS COOL."
        show_board(board_result)
        feedback.Show(input_agent, text(action_result), ?DisplayTime := 2.0)
        confidence_audio.Play(input_agent)
        if (phase = 4):
            finish_run(input_agent)
        else:
            spawn { rearm_after_feedback(generation, phase) }

    rearm_after_feedback(token:int, expected_phase:int)<suspends>:void =
        Sleep(1.0)
        if (generation <> token or phase <> expected_phase):
            return
        cooling_effect.End()
        show_board("")
        for (choice : targets):
            choice.hit_surface.Enable()
        Sleep(0.5)
        loop:
            Sleep(0.05)
            if (generation <> token or phase <> expected_phase):
                return
            if (GetSimulationElapsedTime() - last_hit >= 0.5):
                set busy = false
                return

    finish_run(input_agent:agent):void =
        if (current := active_player?, current = input_agent):
            state := progress.ensure_player(current)
            if (not state.badge_earned?):
                for (section := 0..2):
                    set state.challenge = section
                    progress.complete(current)
            set state.challenge = 2
        cooling_effect.End()
        finish_effect.Begin()
        replay_button.Enable()
        spawn { hide_finished_targets(generation) }
        set busy = false

    hide_finished_targets(expected_generation:int)<suspends>:void =
        Sleep(0.85)
        if (generation = expected_generation and phase = 4):
            for (choice : targets):
                choice.deactivate()
