using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

fn_shoreline_island_event_station := class(creative_device):
    @editable
    station_id:int = 0
    @editable
    progress:fn_shoreline_island_event_progress = fn_shoreline_island_event_progress{}
    @editable
    claim_button:button_device = button_device{}
    @editable
    link_bell_button:button_device = button_device{}
    @editable
    link_lever_button:button_device = button_device{}
    @editable
    bell_button:button_device = button_device{}
    @editable
    lever_button:button_device = button_device{}
    @editable
    demo_button:button_device = button_device{}
    @editable
    help_button:button_device = button_device{}
    @editable
    next_button:button_device = button_device{}
    @editable
    replay_button:button_device = button_device{}
    @editable
    return_button:button_device = button_device{}
    @editable
    hub_destination:teleporter_device = teleporter_device{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    board:billboard_device = billboard_device{}
    @editable
    recent_board:billboard_device = billboard_device{}
    @editable
    response_board:billboard_device = billboard_device{}
    @editable
    chute:creative_prop = creative_prop{}
    @editable
    parcel:creative_prop = creative_prop{}
    @editable
    lamp:creative_prop = creative_prop{}
    @editable
    hub_spawner_0:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_1:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_2:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_3:player_spawner_device = player_spawner_device{}

    fixtures:fn_shoreline_island_event_fixtures = fn_shoreline_island_event_fixtures{}
    var owner:?player = false
    var running:logic = false
    var generation:int = 0
    var observed_round:int = -1
    var chute_home:transform = transform{}
    var parcel_home:transform = transform{}
    var lamp_home:transform = transform{}

    claim_text<localizes>:message = "Claim AI Tool Lab"
    link_bell_text<localizes>:message = "Choose Bell tool action"
    link_lever_text<localizes>:message = "Choose Lever tool action"
    bell_text<localizes>:message = "Try Bell input / Identify Bell"
    lever_text<localizes>:message = "Try Lever input / Identify Lever"
    demo_text<localizes>:message = "Show the recent input again"
    help_text<localizes>:message = "Help"
    next_text<localizes>:message = "Next challenge / Replay all"
    replay_text<localizes>:message = "Replay this challenge"
    return_text<localizes>:message = "Return to Academy Hub"
    available_text<localizes>(number:int):message = "AI TOOL LAB | Station {number}\nClaim to choose useful tool responses."
    occupied_text<localizes>:message = "This AI Tool Lab station is in use. Choose another station."
    other_text<localizes>:message = "Leave your current AI Tool Lab station before claiming another."
    first_text<localizes>:message = "Choose Open chute for the Bell input, then try the input."
    identify_text<localizes>:message = "Read the recent input. Which input asked for the action: Bell or Lever?"
    final_text<localizes>:message = "Choose Open chute for Bell and Light lamp for Lever. Try both inputs."
    solved_text<localizes>:message = "Challenge complete! Next or Replay."
    finish_text<localizes>:message = "Complete this challenge first. Help is always available."
    complete_text<localizes>:message = "Tool Master Badge earned! Some AI systems can choose tools to help complete tasks. Replay or return to the hub."
    retained_text<localizes>:message = "Tool action completed again! Your Tool Master Badge stays earned for this round."
    complete_board_text<localizes>:message = "Tool Master Badge earned. Replay is optional."
    wrong_text<localizes>:message = "That tool action does not match the goal. Choose again and try again."
    wrong_answer_text<localizes>:message = "Watch the same input again. Read its name on the recent-input board."
    later_text<localizes>:message = "This control is used in a later challenge."
    fixed_text<localizes>:message = "This demonstration has fixed connections. Identify its event."
    bell_name<localizes>:message = "Bell"
    lever_name<localizes>:message = "Lever"
    chute_name<localizes>:message = "Open chute"
    lamp_name<localizes>:message = "Light lamp"
    yes_text<localizes>:message = "PASS"
    no_text<localizes>:message = "not tested"
    recent_empty<localizes>:message = "RECENT INPUT: none\nTOOL ACTION: none"
    recent_text<localizes>(event_id:message, response:message):message = "RECENT INPUT: {event_id}\nCHOSEN TOOL ACTION: {response}"
    idle_text<localizes>:message = "CHUTE: CLOSED | PARCEL: waiting\nLAMP: OFF"
    chute_status<localizes>:message = "CHUTE: OPEN | PARCEL: released\nLAMP: OFF"
    lamp_status<localizes>:message = "CHUTE: CLOSED | PARCEL: waiting\nLAMP: ON"
    board_text<localizes>(number:int, goal:message, bell:message, lever:message):message = "AI TOOL LAB | Challenge {number}\n{goal}\nBell input > {bell}\nLever input > {lever}"
    first_goal<localizes>:message = "GOAL: Bell chooses Open chute."
    final_goal<localizes>:message = "GOAL: Bell chooses Open chute; Lever chooses Light lamp."
    demo_board_text<localizes>(number:int):message = "TRACE THE INPUT | Example {number} of 3\nRead RECENT INPUT, then identify Bell or Lever.\nShow input repeats the demonstration."
    tests_text<localizes>(recent:message, bell:message, lever:message):message = "{recent}\nBell > Open chute: {bell}\nLever > Light lamp: {lever}"
    first_hint<localizes>:message = "A tool choice decides which action follows an input. Try the current action."
    first_worked<localizes>:message = "Use Choose Bell tool action until Bell input > Open chute. Then try Bell."
    identify_hint<localizes>:message = "The recent-input board names the input that started the tool action."
    identify_worked<localizes>:message = "Read RECENT INPUT. Select Bell when it says Bell, or Lever when it says Lever."
    final_hint<localizes>:message = "Each input has its own tool choice. Trying Bell should leave the lamp OFF."
    final_worked<localizes>:message = "Set Bell input > Open chute and Lever input > Light lamp. Try Bell, then Lever."

    OnBegin<override>()<suspends>:void =
        Hide()
        set chute_home = chute.GetTransform()
        set parcel_home = parcel.GetTransform()
        set lamp_home = lamp.GetTransform()
        claim_button.SetInteractionText(claim_text)
        link_bell_button.SetInteractionText(link_bell_text)
        link_lever_button.SetInteractionText(link_lever_text)
        bell_button.SetInteractionText(bell_text)
        lever_button.SetInteractionText(lever_text)
        demo_button.SetInteractionText(demo_text)
        help_button.SetInteractionText(help_text)
        next_button.SetInteractionText(next_text)
        replay_button.SetInteractionText(replay_text)
        return_button.SetInteractionText(return_text)
        for (control : array{claim_button, link_bell_button, link_lever_button, bell_button, lever_button, demo_button, help_button, next_button, replay_button, return_button}):
            control.SetInteractionTime(0.0)
            control.SetMaxTriggerCount(0)
        claim_button.InteractedWithEvent.Subscribe(on_claim)
        link_bell_button.InteractedWithEvent.Subscribe(on_link_bell)
        link_lever_button.InteractedWithEvent.Subscribe(on_link_lever)
        bell_button.InteractedWithEvent.Subscribe(on_bell)
        lever_button.InteractedWithEvent.Subscribe(on_lever)
        demo_button.InteractedWithEvent.Subscribe(on_demo)
        help_button.InteractedWithEvent.Subscribe(on_help)
        next_button.InteractedWithEvent.Subscribe(on_next)
        replay_button.InteractedWithEvent.Subscribe(on_replay)
        return_button.InteractedWithEvent.Subscribe(on_return)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_removed)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        for (label : array{board, recent_board, response_board}):
            label.SetTextSize(10)
        release()
        loop:
            Sleep(0.25)
            if (observed_round <> progress.round_generation):
                set observed_round = progress.round_generation
                release()
            if (input_player := owner?):
                if (character := input_player.GetFortCharacter[], character.IsActive[]):
                    if (Distance(character.GetTransform().Translation, GetTransform().Translation) > 1400.0):
                        release()
                else:
                    release()

    display(label:billboard_device, text:message):void =
        label.SetText(text)
        label.UpdateDisplay()

    event_name(event_id:int):message =
        if (event_id = 0):
            bell_name
        else:
            lever_name

    response_name(response:int):message =
        if (response = 0):
            chute_name
        else:
            lamp_name

    test_name(tested:logic):message =
        if (tested?):
            yes_text
        else:
            no_text

    objective(state:event_player_progress):message =
        if (state.solved?):
            if (state.badge_earned?):
                complete_board_text
            else:
                solved_text
        else if (state.challenge = 0):
            first_text
        else if (state.challenge = 1):
            identify_text
        else:
            final_text

    reset_props():void =
        if (chute.TeleportTo[chute_home]) {}
        if (parcel.TeleportTo[parcel_home]) {}
        if (lamp.TeleportTo[lamp_home]) {}
        display(response_board, idle_text)

    restore_response(response:int):void =
        reset_props()
        if (response = 0):
            var opened:transform = chute_home
            set opened.Translation.Z += 250.0
            var delivered:transform = parcel_home
            set delivered.Translation.X += 480.0
            if (chute.TeleportTo[opened]) {}
            if (parcel.TeleportTo[delivered]) {}
            display(response_board, chute_status)
        else if (response = 1):
            var lit:transform = lamp_home
            set lit.Translation.Z += 120.0
            if (lamp.TeleportTo[lit]) {}
            display(response_board, lamp_status)

    show_board(input_player:player):void =
        state := progress.ensure_player(input_player)
        if (state.challenge = 1):
            display(board, demo_board_text(state.demo_index + 1))
        else:
            var goal:message = first_goal
            if (state.challenge = 2):
                set goal = final_goal
            display(board, board_text(state.challenge + 1, goal, response_name(state.bell_response), response_name(state.lever_response)))
        if (state.last_event >= 0):
            display(recent_board, recent_text(event_name(state.last_event), response_name(state.last_response)))
        else:
            display(recent_board, recent_empty)
        if (state.challenge = 2, not running?):
            var recent:message = recent_empty
            if (state.last_event >= 0):
                set recent = recent_text(event_name(state.last_event), response_name(state.last_response))
            display(recent_board, tests_text(recent, test_name(state.bell_tested), test_name(state.lever_tested)))

    release():void =
        if (input_player := owner?, state := progress.states[input_player], state.station_id = station_id):
            set state.station_id = -1
            if (running?):
                set state.last_event = -1
                set state.last_response = -1
        set generation += 1
        set running = false
        set owner = false
        reset_props()
        display(board, available_text(station_id + 1))
        display(recent_board, recent_empty)

    on_claim(input_agent:agent):void =
        if (input_player := player[input_agent]):
            if (current := owner?):
                if (current <> input_player):
                    feedback.Show(input_player, occupied_text, ?DisplayTime := 5.0)
                return
            state := progress.ensure_player(input_player)
            if (state.station_id >= 0):
                feedback.Show(input_player, other_text, ?DisplayTime := 5.0)
                return
            set state.station_id = station_id
            set owner = option{input_player}
            set observed_round = progress.round_generation
            restore_response(state.last_response)
            show_board(input_player)
            feedback.Show(input_player, objective(state), ?DisplayTime := 10.0)
            if (state.challenge = 1, not state.solved?):
                demonstrate(input_player)

    edit_connection(input_agent:agent, event_id:int):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.challenge = 1):
                feedback.Show(input_player, fixed_text, ?DisplayTime := 5.0)
                return
            if (event_id = 1, state.challenge = 0):
                feedback.Show(input_player, later_text, ?DisplayTime := 5.0)
                return
            if (event_id = 0):
                set state.bell_response = fixtures.toggle_response(state.bell_response)
            else:
                set state.lever_response = fixtures.toggle_response(state.lever_response)
            set state.bell_tested = false
            set state.lever_tested = false
            set state.solved = false
            set state.last_event = -1
            set state.last_response = -1
            reset_props()
            show_board(input_player)

    on_link_bell(input_agent:agent):void =
        edit_connection(input_agent, 0)

    on_link_lever(input_agent:agent):void =
        edit_connection(input_agent, 1)

    on_bell(input_agent:agent):void =
        input_event(input_agent, 0)

    on_lever(input_agent:agent):void =
        input_event(input_agent, 1)

    input_event(input_agent:agent, event_id:int):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.challenge = 1):
                if (state.solved?):
                    feedback.Show(input_player, objective(state), ?DisplayTime := 5.0)
                    return
                expected_event := fixtures.demonstration_event(state.demo_index)
                if (event_id = expected_event):
                    if (state.demo_index < 2):
                        set state.demo_index += 1
                        demonstrate(input_player)
                    else:
                        finish(input_player)
                else:
                    feedback.Show(input_player, wrong_answer_text, ?DisplayTime := 10.0)
                    demonstrate(input_player)
                return
            if (state.challenge = 0, event_id = 1):
                feedback.Show(input_player, later_text, ?DisplayTime := 5.0)
                return
            var response:int = state.bell_response
            if (event_id = 1):
                set response = state.lever_response
            begin_response(input_player, event_id, response, false)

    demonstrate(input_player:player):void =
        state := progress.ensure_player(input_player)
        begin_response(input_player, fixtures.demonstration_event(state.demo_index), fixtures.demonstration_response(state.demo_index), true)

    on_demo(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.challenge = 1):
                demonstrate(input_player)
            else:
                feedback.Show(input_player, objective(state), ?DisplayTime := 8.0)

    begin_response(input_player:player, event_id:int, response:int, demonstration:logic):void =
        set generation += 1
        set running = true
        state := progress.ensure_player(input_player)
        set state.last_event = event_id
        set state.last_response = response
        reset_props()
        show_board(input_player)
        spawn{execute_response(input_player, event_id, response, demonstration, generation, progress.round_generation)}

    valid_run(input_player:player, token:int, round_token:int)<transacts><decides>:void =
        owner? = input_player
        generation = token
        progress.round_generation = round_token
        running?

    animate(input_player:player, prop:creative_prop, target:transform, token:int, round_token:int)<suspends>:void =
        start := prop.GetTransform()
        for (frame := 1..12):
            if (not valid_run[input_player, token, round_token]):
                return
            var pose:transform = start
            set pose.Translation = start.Translation + (target.Translation - start.Translation) * (frame * 1.0 / 12.0)
            if (prop.TeleportTo[pose]) {}
            Sleep(0.05)

    execute_response(input_player:player, event_id:int, response:int, demonstration:logic, token:int, round_token:int)<suspends>:void =
        Sleep(0.5)
        if (not valid_run[input_player, token, round_token]):
            return
        if (response = 0):
            var opened:transform = chute_home
            set opened.Translation.Z += 250.0
            animate(input_player, chute, opened, token, round_token)
            var delivered:transform = parcel_home
            set delivered.Translation.X += 480.0
            animate(input_player, parcel, delivered, token, round_token)
        else:
            var lit:transform = lamp_home
            set lit.Translation.Z += 120.0
            animate(input_player, lamp, lit, token, round_token)
        if (not valid_run[input_player, token, round_token]):
            return
        restore_response(response)
        set running = false
        state := progress.ensure_player(input_player)
        if (demonstration?):
            feedback.Show(input_player, objective(state), ?DisplayTime := 10.0)
            return
        if (state.challenge = 0):
            if (event_id = 0, response = 0):
                finish(input_player)
            else:
                feedback.Show(input_player, wrong_text, ?DisplayTime := 8.0)
        else if (state.challenge = 2):
            if (event_id = 0, response = 0):
                set state.bell_tested = true
            else if (event_id = 1, response = 1):
                set state.lever_tested = true
            else:
                feedback.Show(input_player, wrong_text, ?DisplayTime := 8.0)
            if (state.bell_tested?, state.lever_tested?):
                finish(input_player)
            show_board(input_player)

    finish(input_player:player):void =
        state := progress.ensure_player(input_player)
        was_earned := state.badge_earned
        progress.complete(input_player)
        var text:message = solved_text
        if (state.badge_earned?):
            if (was_earned?):
                set text = retained_text
            else:
                set text = complete_text
        feedback.Show(input_player, text, ?DisplayTime := 12.0)
        show_board(input_player)

    restart(input_player:player):void =
        set generation += 1
        set running = false
        state := progress.ensure_player(input_player)
        set state.bell_response = 1
        set state.lever_response = 0
        set state.demo_index = 0
        set state.bell_tested = false
        set state.lever_tested = false
        set state.last_event = -1
        set state.last_response = -1
        set state.hint_level = 0
        set state.solved = false
        reset_props()
        show_board(input_player)
        feedback.Show(input_player, objective(state), ?DisplayTime := 10.0)
        if (state.challenge = 1):
            demonstrate(input_player)

    on_replay(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            restart(input_player)

    on_next(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (not state.solved?):
                feedback.Show(input_player, finish_text, ?DisplayTime := 5.0)
                return
            if (state.challenge < 2):
                set state.challenge += 1
            else:
                set state.challenge = 0
            restart(input_player)

    on_help(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            state := progress.ensure_player(input_player)
            set state.hint_level += 1
            var hint:message = first_hint
            if (state.challenge = 1):
                set hint = identify_hint
            else if (state.challenge = 2):
                set hint = final_hint
            if (state.hint_level > 1):
                if (state.challenge = 0):
                    set hint = first_worked
                else if (state.challenge = 1):
                    set hint = identify_worked
                else:
                    set hint = final_worked
            feedback.Show(input_player, hint, ?DisplayTime := 10.0)

    on_return(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            release()
        hub_destination.Teleport(input_agent)

    on_spawn(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            release()

    on_removed(input_player:player):void =
        if (current := owner?, current = input_player):
            release()
