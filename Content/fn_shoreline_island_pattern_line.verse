using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /Verse.org/Verse }
using { /UnrealEngine.com/Temporary/SpatialMath }

pattern_line_button_action := class:
    controller:fn_shoreline_island_pattern_line
    index:int
    on_press(input_agent:agent):void =
        controller.on_button(input_agent, index)

# Configured linear observe/select/animate controller. Phase arrays describe
# choices and lessons; the four animation roles are predict, lift, repair, test.
fn_shoreline_island_pattern_line := class(creative_device):
    @editable
    configured:logic = false
    @editable
    progress:fn_shoreline_island_loop_progress = fn_shoreline_island_loop_progress{}
    @editable
    entry_zone:mutator_zone_device = mutator_zone_device{}
    # The native volume remains a cue, while these measured floor bounds keep
    # enrollment and reward checks stable across cooked volume implementations.
    @editable
    course_min_x:float = -1100.0
    @editable
    course_max_x:float = 7700.0
    @editable
    course_min_y:float = 3000.0
    @editable
    course_max_y:float = 5500.0
    @editable
    course_min_z:float = 2350.0
    @editable
    course_max_z:float = 3300.0
    @editable
    hub_destination:teleporter_device = teleporter_device{}
    @editable
    targets:[]fn_shoreline_island_data_target = array{}
    # Scalar editable references create native-device wrappers that MCP can bind.
    # Runtime arrays preserve the approved order: three carriers, six inspection
    # crates, delivery, shuttle, and shutter.
    @editable
    carrier_a:creative_prop = creative_prop{}
    @editable
    carrier_b:creative_prop = creative_prop{}
    @editable
    carrier_c:creative_prop = creative_prop{}
    @editable
    inspection_1:creative_prop = creative_prop{}
    @editable
    inspection_2:creative_prop = creative_prop{}
    @editable
    inspection_3:creative_prop = creative_prop{}
    @editable
    inspection_4:creative_prop = creative_prop{}
    @editable
    inspection_5:creative_prop = creative_prop{}
    @editable
    inspection_6:creative_prop = creative_prop{}
    @editable
    delivery_cargo:creative_prop = creative_prop{}
    @editable
    shuttle_prop:creative_prop = creative_prop{}
    @editable
    dispatch_shutter:creative_prop = creative_prop{}
    var cargo:[]creative_prop = array{}
    @editable
    arrival_board:billboard_device = billboard_device{}
    @editable
    predict_board:billboard_device = billboard_device{}
    @editable
    repair_board:billboard_device = billboard_device{}
    @editable
    motion_board:billboard_device = billboard_device{}
    var boards:[]billboard_device = array{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    start_button:button_device = button_device{}
    @editable
    predict_help_button:button_device = button_device{}
    @editable
    predict_watch_button:button_device = button_device{}
    @editable
    repair_help_button:button_device = button_device{}
    @editable
    repair_watch_button:button_device = button_device{}
    @editable
    motion_help_button:button_device = button_device{}
    @editable
    motion_watch_button:button_device = button_device{}
    @editable
    freeze_button:button_device = button_device{}
    @editable
    replay_button:button_device = button_device{}
    @editable
    entry_return_button:button_device = button_device{}
    @editable
    finish_return_button:button_device = button_device{}
    var buttons:[]button_device = array{}
    @editable
    predict_light:customizable_light_device = customizable_light_device{}
    @editable
    repair_light:customizable_light_device = customizable_light_device{}
    @editable
    motion_light:customizable_light_device = customizable_light_device{}
    var lights:[]customizable_light_device = array{}
    @editable
    finale_effect:vfx_creator_device = vfx_creator_device{}
    @editable
    scan_audio:audio_player_device = audio_player_device{}
    @editable
    phase_first:[]int = array{0, 3, 9, 12}
    @editable
    phase_count:[]int = array{3, 6, 3, 3}
    @editable
    phase_success:[]int = array{1, 6, 10, 12}
    @editable
    phase_round:[]int = array{0, -1, 1, 2}
    @editable
    phase_board:[]int = array{1, 2, 2, 3}
    @editable
    prompts:[]string = array{
        "TEAM RUN 1/3 | PREDICT\nA CIRCLE > B TRIANGLE > A > B > A > ?\nShoot the next symbol.",
        "TEAM RUN 2/3 | FIND THE EXCEPTION\n1:A  2:B  3:A  4:A  5:A  6:B\nShoot the crate that breaks A/B.",
        "TEAM RUN 2/3 | REPAIR\nThe fourth crate is lifted.\nShoot its replacement: A, B or C.",
        "TEAM RUN 3/3 | TEST YOUR PREDICTION\n1 > 2 > 3 > 4 > 3 > 2 > ?\nMoving toward 1. Shoot the next stop."}
    @editable
    hints:[]string = array{
        "A circle and B triangle repeat as a pair. Follow the last A.",
        "Odd slots are A. Even slots should be B. Compare the six crates.",
        "The missing member of the A/B pair belongs in slot 4.",
        "The shuttle reverses at the ends. After 4, it visits 3, then 2."}
    @editable
    answers:[]string = array{
        "Shoot B TRIANGLE. A is followed by B.",
        "Shoot SLOT 4. It is A, but the repeating pair needs B.",
        "Shoot replacement B TRIANGLE to restore A/B/A/B/A/B.",
        "Shoot STOP 1. The shuttle is returning from 4 toward 1."}
    @editable
    enrollment_seconds:float = 5.0
    @editable
    carrier_half_span:float = 150.0
    @editable
    carrier_leg_seconds:float = 6.0
    @editable
    inspection_seconds:float = 3.0
    @editable
    shuttle_step_cm:float = 400.0
    @editable
    shuttle_demo:[]int = array{0, 1, 2, 3, 2, 1}

    var phase:int = -1
    var generation:int = 0
    var motion_generation:int = 0
    var busy:logic = false
    var frozen:logic = false
    var slow:logic = false
    var mistakes:int = 0
    var participants:[player]fort_character = map{}
    var hint_counts:[player]int = map{}
    var homes:[]transform = array{}
    var ready_after:float = 0.0
    reset_event:event() = event(){}
    freeze_event:event() = event(){}

    text<localizes>(value:string):message = "{value}"
    welcome<localizes>:message = "PATTERN SCANNER: CARGO CIRCUIT\nPress START TEAM RUN beside the hub walkway.\nWatch the cargo. Shoot your prediction. Repair the scanner."
    joining<localizes>:message = "RUN STARTING | 5 seconds for friends to join.\nStay on the dock. The first pattern appears next."
    spectator<localizes>:message = "A team run is in progress. Watch the cargo, then join the next run."
    running_notice<localizes>:message = "Finish this team run first. Return is always available."
    finished<localizes>:message = "CARGO DISPATCHED!\nSpot the rule. Check the exception. Test your prediction.\nPattern Badge earned. Replay or Return."
    frozen_notice<localizes>:message = "Targets frozen. Take your time; your reward stays the same."
    assist_notice<localizes>:message = "Need more time? Use FREEZE or HELP to stop the moving answers."

    OnBegin<override>()<suspends>:void =
        Hide()
        if (not configured?):
            return
        set cargo = array{carrier_a, carrier_b, carrier_c, inspection_1,
            inspection_2, inspection_3, inspection_4, inspection_5,
            inspection_6, delivery_cargo, shuttle_prop, dispatch_shutter}
        set boards = array{arrival_board, predict_board, repair_board, motion_board}
        set buttons = array{start_button, predict_help_button, predict_watch_button,
            repair_help_button, repair_watch_button, motion_help_button,
            motion_watch_button, freeze_button, replay_button,
            entry_return_button, finish_return_button}
        set lights = array{predict_light, repair_light, motion_light}
        # Reject incomplete editor configuration instead of starting a partial game.
        if (targets.Length <> 15 or cargo.Length <> 12 or boards.Length <> 4 or buttons.Length <> 11):
            Print("PATTERN LINE: incomplete device arrays; controller disabled")
            return
        for (item : cargo):
            set homes += array{item.GetTransform()}
        for (target : targets):
            target.initialize_surface_home()
        reset_line()
        labels := array{"START TEAM RUN", "HELP", "WATCH AGAIN", "HELP", "WATCH AGAIN",
            "HELP", "WATCH AGAIN", "FREEZE TARGETS", "REPLAY", "RETURN TO HUB", "RETURN TO HUB"}
        for (index -> input_button : buttons, label := labels[index]):
            input_button.SetInteractionText(text(label))
            input_button.SetInteractionTime(0.0)
            input_button.SetMaxTriggerCount(0)
            input_button.InteractedWithEvent.Subscribe(pattern_line_button_action{controller := Self, index := index}.on_press)
        entry_zone.AgentEntersEvent.Subscribe(on_enter)
        entry_zone.AgentExitsEvent.Subscribe(on_exit)
        progress.round_settings.RoundBeginEvent.Subscribe(on_round)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_departure)
        for (index -> target : targets):
            spawn { listen_hits(target, index) }
        spawn { monitor_participants() }

    board(index:int, content:message):void =
        if (display := boards[index]):
            display.SetText(content)
            display.ShowText()
            display.UpdateDisplay()

    announce(content:message):void =
        for (input_player -> character : participants):
            feedback.Show(input_player, content, ?DisplayTime := 8.0)

    deactivate_targets():void =
        for (target : targets):
            target.deactivate()

    freeze_carriers():void =
        set frozen = true
        set motion_generation += 1
        freeze_event.Signal()
        for (index := 0..2, item := cargo[index], target := targets[index]):
            if (item.TeleportTo[item.GetTransform()]) {}
            if (target.hit_surface.TeleportTo[target.hit_surface.GetTransform()]) {}

    reset_line():void =
        set generation += 1
        set motion_generation += 1
        reset_event.Signal()
        freeze_event.Signal()
        set phase = -1
        set busy = false
        set frozen = false
        set slow = false
        set mistakes = 0
        set participants = map{}
        set hint_counts = map{}
        set ready_after = 0.0
        deactivate_targets()
        for (index -> item : cargo, home := homes[index]):
            if (item.TeleportTo[home]) {}
            item.Show()
        if (delivery := cargo[9]):
            delivery.Hide()
        for (light : lights):
            light.TurnOff()
        finale_effect.End()
        board(0, welcome)
        board(1, text("1 PREDICT\nA CIRCLE / B TRIANGLE / C SQUARE"))
        board(2, text("2 REPAIR\nFind the crate that breaks the repeating pair."))
        board(3, text("3 TEST MOTION\nWatch the shuttle. Predict its next stop."))

    on_round():void =
        reset_line()

    in_course(input_agent:agent)<transacts><decides>:void =
        character := input_agent.GetFortCharacter[]
        position := character.GetTransform().Translation
        position.X >= course_min_x
        position.X <= course_max_x
        position.Y >= course_min_y
        position.Y <= course_max_y
        position.Z >= course_min_z
        position.Z <= course_max_z

    enroll(input_agent:agent):void =
        if (input_player := player[input_agent], participants[input_player]):
            return
        if (input_player := player[input_agent], character := input_player.GetFortCharacter[], character.IsActive[], in_course[input_player]):
            if (set participants[input_player] = character) {}
            progress.ensure_player(input_player)
            feedback.Show(input_player, joining, ?DisplayTime := enrollment_seconds)

    on_enter(input_agent:agent):void =
        if (phase = -2):
            enroll(input_agent)
        else if (phase >= 0, phase < 4):
            feedback.Show(input_agent, spectator, ?DisplayTime := 6.0)
        else:
            feedback.Show(input_agent, welcome, ?DisplayTime := 6.0)

    on_exit(input_agent:agent):void =
        if (input_player := player[input_agent], not in_course[input_player]):
            on_departure(input_player)

    on_departure(input_player:player):void =
        var remaining:[player]fort_character = map{}
        for (other -> character : participants, other <> input_player):
            if (set remaining[other] = character) {}
        set participants = remaining
        if (participants.Length = 0, phase <> -1):
            reset_line()

    monitor_participants()<suspends>:void =
        loop:
            Sleep(0.1)
            for (input_player -> enrolled_character : participants):
                if (current := input_player.GetFortCharacter[], current = enrolled_character,
                    current.IsActive[], in_course[input_player]):
                else:
                    on_departure(input_player)

    on_button(input_agent:agent, index:int):void =
        if (index >= 9):
            on_exit(input_agent)
            hub_destination.Teleport(input_agent)
            return
        if (index = 0 or index = 8):
            if (phase <> -1, phase <> 4):
                feedback.Show(input_agent, running_notice, ?DisplayTime := 4.0)
                return
            if (not in_course[input_agent]):
                return
            reset_line()
            set phase = -2
            set busy = true
            for (occupant : GetPlayspace().GetPlayers()):
                enroll(occupant)
            board(0, joining)
            spawn { track_enrollment(generation) }
            spawn { start_run(generation) }
            return
        if (input_player := player[input_agent], participants[input_player], phase >= 0, phase < 4):
            if (index = 7):
                if (phase = 0, not busy?):
                    freeze_carriers()
                    feedback.Show(input_player, frozen_notice, ?DisplayTime := 5.0)
            else if (index = 1 or index = 3 or index = 5):
                var count:int = 1
                if (old := hint_counts[input_player]):
                    set count = old + 1
                if (set hint_counts[input_player] = count) {}
                if (phase = 0, not busy?):
                    freeze_carriers()
                if (count > 1, answer := answers[phase]):
                    feedback.Show(input_player, text(answer), ?DisplayTime := 9.0)
                else if (hint := hints[phase]):
                    feedback.Show(input_player, text(hint), ?DisplayTime := 9.0)
            else if (not busy?):
                set busy = true
                freeze_carriers()
                deactivate_targets()
                spawn { show_demonstration(generation, phase) }

    start_run(token:int)<suspends>:void =
        Sleep(enrollment_seconds)
        if (generation <> token or participants.Length = 0):
            return
        set phase = 0
        show_demonstration(token, 0)

    track_enrollment(token:int)<suspends>:void =
        loop:
            if (generation <> token or phase <> -2):
                return
            for (occupant : GetPlayspace().GetPlayers()):
                enroll(occupant)
            Sleep(0.1)

    listen_hits(target:fn_shoreline_island_data_target, index:int)<suspends>:void =
        loop:
            input_agent := target.Hit.Await()
            on_hit(input_agent, target, index)

    is_choice(index:int)<transacts><decides>:void =
        first_index := phase_first[phase]
        count := phase_count[phase]
        index >= first_index
        index < first_index + count

    on_hit(input_agent:agent, target:fn_shoreline_island_data_target, index:int):void =
        if (busy? or GetSimulationElapsedTime() < ready_after):
            return
        if (not is_choice[index]):
            return
        if (input_player := player[input_agent], enrolled := participants[input_player], current := input_player.GetFortCharacter[], current = enrolled, current.IsActive[], in_course[input_player], correct := phase_success[phase]):
            set ready_after = GetSimulationElapsedTime() + 1.0
            if (index <> correct):
                target.reject(input_agent)
                set mistakes += 1
                if (hint := hints[phase]):
                    feedback.Show(input_player, text(hint), ?DisplayTime := 7.0)
                if (phase = 0, mistakes >= 2):
                    if (not slow?, not frozen?):
                        freeze_carriers()
                        set slow = true
                        set frozen = false
                        for (carrier_index := 0..2):
                            spawn { animate_carrier(carrier_index, generation, motion_generation) }
                    feedback.Show(input_player, assist_notice, ?DisplayTime := 7.0)
                return
            set busy = true
            freeze_carriers()
            target.accept(input_agent, false)
            for (other : targets):
                other.hit_surface.Disable()
            scan_audio.Play(input_player)
            spawn { accepted(token := generation, accepted_phase := phase) }

    activate_phase():void =
        deactivate_targets()
        if (phase = 0):
            for (index := 0..2, item := cargo[index], home := homes[index]):
                if (item.TeleportTo[home]) {}
        if (first_index := phase_first[phase], count := phase_count[phase]):
            for (index := first_index..first_index+count-1, target := targets[index]):
                target.activate()
        set busy = false
        set ready_after = GetSimulationElapsedTime() + 1.0
        if (phase = 0, not frozen?):
            set motion_generation += 1
            for (index := 0..2):
                spawn { animate_carrier(index, generation, motion_generation) }

    show_prompt():void =
        if (content := prompts[phase], index := phase_board[phase]):
            board(index, text(content))
            announce(text(content))

    show_demonstration(token:int, expected_phase:int)<suspends>:void =
        if (generation <> token or phase <> expected_phase):
            return
        race:
            block:
                if (expected_phase = 0):
                    for (symbol : array{"A CIRCLE", "B TRIANGLE", "A CIRCLE", "B TRIANGLE", "A CIRCLE"}):
                        board(1, text("WATCH THE PATTERN\n{symbol}\nA > B > A > B > A > ?"))
                        Sleep(0.8)
                else if (expected_phase = 1):
                    for (index := 3..8, item := cargo[index], home := homes[index]):
                        var start:transform = home
                        set start.Translation.Y += 200.0
                        if (item.TeleportTo[start]) {}
                        spawn { move_home(index, token) }
                    Sleep(inspection_seconds + 0.1)
                else if (expected_phase = 3):
                    for (stop : shuttle_demo):
                        move_shuttle(stop, 0.8)
                        board(3, text("WATCH THE SHUTTLE\nSTOP {stop + 1}\n1 > 2 > 3 > 4 > 3 > 2 > ?"))
                        Sleep(0.4)
                else:
                    Sleep(0.5)
                if (generation = token, phase = expected_phase):
                    show_prompt()
                    activate_phase()
            reset_event.Await()

    move_home(index:int, token:int)<suspends>:void =
        if (generation = token, item := cargo[index], home := homes[index]):
            race:
                item.MoveTo(home, inspection_seconds)
                reset_event.Await()

    animate_carrier(index:int, token:int, motion_token:int)<suspends>:void =
        if (generation <> token or motion_generation <> motion_token):
            return
        if (item := cargo[index], home := homes[index], target := targets[index]):
            race:
                block:
                    var direction:float = 1.0
                    loop:
                        if (generation <> token or phase <> 0 or busy? or frozen? or motion_generation <> motion_token):
                            return
                        var pose:transform = home
                        var hit_pose:transform = target.surface_home
                        set pose.Translation.X += direction * carrier_half_span
                        set hit_pose.Translation.X += direction * carrier_half_span
                        var duration:float = carrier_leg_seconds * Distance(item.GetTransform().Translation, pose.Translation) / (2.0 * carrier_half_span)
                        if (slow?):
                            set duration *= 2.0
                        if (duration < 0.05):
                            set duration = 0.05
                        sync:
                            item.MoveTo(pose, duration)
                            target.hit_surface.MoveTo(hit_pose, duration)
                        Sleep(0.5)
                        set direction = -direction
                freeze_event.Await()
                reset_event.Await()

    move_shuttle(stop:int, duration:float)<suspends>:void =
        if (shuttle := cargo[10], home := homes[10]):
            var pose:transform = home
            set pose.Translation.X += stop * shuttle_step_cm
            shuttle.MoveTo(pose, duration)

    credit(round_index:int):void =
        for (input_player -> enrolled : participants):
            if (current := input_player.GetFortCharacter[], current = enrolled,
                current.IsActive[], in_course[input_player]):
                state := progress.ensure_player(input_player)
                if (state.challenge = round_index, not state.badge_earned?):
                    progress.complete(input_player, round_index)
        if (light := lights[round_index]):
            light.TurnOn()

    accepted(token:int, accepted_phase:int)<suspends>:void =
        if (generation <> token or phase <> accepted_phase):
            return
        race:
            block:
                Sleep(0.4)
                deactivate_targets()
                if (accepted_phase = 0):
                    if (item := cargo[1], home := homes[1]):
                        var pose:transform = home
                        set pose.Translation.Y += 300.0
                        item.MoveTo(pose, 1.2)
                    announce(text("B follows A. The first cargo segment is powered!"))
                else if (accepted_phase = 1):
                    if (item := cargo[6], home := homes[6]):
                        var pose:transform = home
                        set pose.Translation.Z += 100.0
                        item.MoveTo(pose, 1.0)
                else if (accepted_phase = 2):
                    if (item := cargo[6], home := homes[6]):
                        item.MoveTo(home, 1.0)
                    board(2, text("REPAIRED!\nA CIRCLE > B TRIANGLE > A > B > A > B"))
                    for (slot_index := 3..8, slot := targets[slot_index]):
                        if (slot_index = 3 or slot_index = 5 or slot_index = 7):
                            slot.label_board.SetText(text("A CIRCLE"))
                        else:
                            slot.label_board.SetText(text("B TRIANGLE"))
                        slot.label_board.ShowText()
                        slot.label_board.UpdateDisplay()
                    for (index := 3..8, item := cargo[index], home := homes[index]):
                        var pose:transform = home
                        set pose.Translation.Y += 150.0
                        item.MoveTo(pose, 0.3)
                    announce(text("Slot 4 needed B. The repeating pair is restored!"))
                else if (accepted_phase = 3):
                    move_shuttle(0, 1.2)
                    if (delivery := cargo[9], shuttle := cargo[10]):
                        var pickup:transform = shuttle.GetTransform()
                        set pickup.Translation.Z += 100.0
                        if (delivery.TeleportTo[pickup]) {}
                        delivery.Show()
                        var dispatch:transform = pickup
                        set dispatch.Translation.X += 2400.0
                        if (shutter := cargo[11], home := homes[11]):
                            var opened:transform = home
                            set opened.Translation.Z += 400.0
                            sync:
                                delivery.MoveTo(dispatch, 3.0)
                                shutter.MoveTo(opened, 3.0)
                    finale_effect.Begin()
                if (generation <> token):
                    return
                if (round_index := phase_round[accepted_phase], round_index >= 0):
                    credit(round_index)
                set phase += 1
                set mistakes = 0
                set hint_counts = map{}
                set frozen = false
                if (phase = 4):
                    set busy = false
                    board(0, finished)
                    board(3, finished)
                    announce(finished)
                    Sleep(3.0)
                    if (generation = token):
                        finale_effect.End()
                else:
                    Sleep(1.0)
                    show_demonstration(token, phase)
            reset_event.Await()
