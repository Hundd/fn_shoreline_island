using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

# One shared definition is expanded for each caller instruction in a frozen trace.
fn_shoreline_island_nursery_station := class(creative_device):
    @editable
    station_id:int = 0
    @editable
    progress:fn_shoreline_island_nursery_progress = fn_shoreline_island_nursery_progress{}
    @editable
    claim_button:button_device = button_device{}
    @editable
    slot_0_button:button_device = button_device{}
    @editable
    slot_1_button:button_device = button_device{}
    @editable
    slot_2_button:button_device = button_device{}
    @editable
    slot_3_button:button_device = button_device{}
    @editable
    run_button:button_device = button_device{}
    @editable
    help_button:button_device = button_device{}
    @editable
    replay_button:button_device = button_device{}
    @editable
    return_button:button_device = button_device{}
    @editable
    caller_0_button:button_device = button_device{}
    @editable
    caller_1_button:button_device = button_device{}
    @editable
    caller_2_button:button_device = button_device{}
    @editable
    repeat_button:button_device = button_device{}
    @editable
    next_button:button_device = button_device{}
    @editable
    label_caller_0:billboard_device = billboard_device{}
    @editable
    label_caller_1:billboard_device = billboard_device{}
    @editable
    label_caller_2:billboard_device = billboard_device{}
    @editable
    label_repeat:billboard_device = billboard_device{}
    @editable
    label_next:billboard_device = billboard_device{}
    @editable
    planter_2_label:billboard_device = billboard_device{}
    @editable
    planter_3_label:billboard_device = billboard_device{}
    @editable
    exit_label:billboard_device = billboard_device{}
    @editable
    plant_2:creative_prop = creative_prop{}
    @editable
    plant_3:creative_prop = creative_prop{}
    @editable
    hub_destination:teleporter_device = teleporter_device{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    skill_audio:audio_player_device = audio_player_device{}
    @editable
    mission_board:billboard_device = billboard_device{}
    @editable
    program_board:billboard_device = billboard_device{}
    @editable
    execution_board:billboard_device = billboard_device{}
    @editable
    planter_label:billboard_device = billboard_device{}
    @editable
    label_0:billboard_device = billboard_device{}
    @editable
    label_1:billboard_device = billboard_device{}
    @editable
    label_2:billboard_device = billboard_device{}
    @editable
    label_3:billboard_device = billboard_device{}
    @editable
    label_4:billboard_device = billboard_device{}
    @editable
    label_5:billboard_device = billboard_device{}
    @editable
    label_6:billboard_device = billboard_device{}
    @editable
    label_7:billboard_device = billboard_device{}
    @editable
    label_8:billboard_device = billboard_device{}
    @editable
    robot:creative_prop = creative_prop{}
    @editable
    plant:creative_prop = creative_prop{}
    @editable
    hub_spawner_0:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_1:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_2:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_3:player_spawner_device = player_spawner_device{}
    @editable
    remix_button:button_device = button_device{}
    @editable
    remix_label:billboard_device = billboard_device{}

    fixtures:fn_shoreline_island_nursery_fixtures = fn_shoreline_island_nursery_fixtures{}
    var owner:?player = false
    var definition:[]int = array{0, 1, 3, 2}
    var caller:[]int = array{0, 0, 0}
    var repeats:int = 1
    var challenge:int = 0
    var hint_level:int = 0
    var running:logic = false
    var solved:logic = false
    var remix:logic = false
    var generation:int = 0
    var label_ticks:int = 0
    var display_phase:logic = false
    var board_texts:[int]message = map{}
    var board_visibility:[int]logic = map{}
    var observed_round:int = -1
    var plant_homes:[]transform = array{}
    var robot_home:transform = transform{}

    claim_text<localizes>:message = "Claim AI Skills Lab"
    slot_text<localizes>(number:int):message = "Edit GrowPlant skill step {number}"
    run_text<localizes>:message = "Run the skill plan"
    caller_text<localizes>(number:int):message = "Edit plan slot {number}: GrowPlant / Move"
    repeat_text<localizes>:message = "Change Repeat (1-4)"
    next_text<localizes>:message = "Next challenge / Replay all"
    unused_text<localizes>:message = "This control is used in another challenge."
    finish_text<localizes>:message = "Restore this challenge first. Help shows a worked answer."
    help_text<localizes>:message = "Help / Worked answer"
    replay_text<localizes>:message = "Replay this challenge"
    return_text<localizes>:message = "Return to Academy Hub"
    available_text<localizes>(number:int):message = "AI SKILLS LAB | Station {number}\nHelp Pix reuse a useful skill. Claim to begin."
    objective_text<localizes>:message = "DEFINE GROWPLANT | Challenge 1\nGive GrowPlant the steps Water, Plant, Wait, Harvest.\nYour plan uses GrowPlant once to restore this planter."
    row_objective<localizes>:message = "REUSE GROWPLANT | Restore two planters. Use GrowPlant at each bed; Move between them."
    repeat_objective<localizes>:message = "REUSE GROWPLANT | Restore three planters and reach the Exit. Repeat [GrowPlant, Move]."
    mission_text<localizes>(number:int, goal:message, a:message, b:message, c:message, badge:int):message = "AI SKILLS LAB | Challenge {number}\n{goal}\nDone: 1 {a} | 2 {b} | 3 {c} | Badge {badge}/1"
    done_name<localizes>:message = "yes"
    todo_name<localizes>:message = "no"
    program_text<localizes>(a:message, b:message, c:message, d:message, calls:message):message = "SKILL: GrowPlant\n1 {a} | 2 {b} | 3 {c} | 4 {d}\n{calls}\nChoose steps: Water, Plant, Wait, Harvest."
    one_caller<localizes>:message = "PLAN: Use GrowPlant"
    row_caller<localizes>(a:message, b:message, c:message):message = "PLAN: 1 {a} | 2 {b} | 3 {c}"
    repeat_caller<localizes>(count:int):message = "PLAN: Repeat {count} [GrowPlant, Move]"
    care_name<localizes>:message = "GrowPlant"
    move_name<localizes>:message = "Move"
    exit_text<localizes>:message = "EXIT\nTILE 3"
    water_name<localizes>:message = "Water"
    plant_name<localizes>:message = "Plant"
    wait_name<localizes>:message = "Wait"
    harvest_name<localizes>:message = "Harvest"
    empty_name<localizes>:message = "Empty"
    watered_name<localizes>:message = "Watered"
    planted_name<localizes>:message = "Planted"
    ready_name<localizes>:message = "Ready to harvest"
    harvested_name<localizes>:message = "Harvested"
    bed_text<localizes>(number:int, state:message):message = "PLANTER {number}\n{state}"
    ready_text<localizes>:message = "Ready. Run the plan to use GrowPlant and show each step."
    step_text<localizes>(call_slot:int, iteration:int, bed:int, slot:int, command:message, state:message):message = "PLAN SLOT {call_slot} | Repeat {iteration} | Planter {bed}\nCare skill > STEP {slot}: {command}\nPlanter: {state}"
    move_step_text<localizes>(call_slot:int, iteration:int, tile:int):message = "PLAN SLOT {call_slot} | Repeat {iteration}\nMove > TILE {tile}"
    error_text<localizes>(call_slot:int, iteration:int, bed:int, slot:int, command:message, state:message, needed:message):message = "STOPPED | Plan slot {call_slot} | Repeat {iteration} | Bed {bed}\nCare step {slot}: {command}. Bed is {state}; needs {needed}.\nChange the skill plan and Run again."
    harvested_error<localizes>(call_slot:int, iteration:int, bed:int):message = "STOPPED | Plan slot {call_slot} | Repeat {iteration} | Bed {bed}\nThis bed is already harvested. Move before using GrowPlant again."
    row_end_error<localizes>(slot:int, iteration:int):message = "STOPPED | Plan slot {slot} | Repeat {iteration}\nMove would leave the row. Change the plan and try again."
    exit_care_error<localizes>(iteration:int):message = "STOPPED | Repeat {iteration}: GrowPlant\nThe robot is at the Exit; there is no planter here. Reduce Repeat."
    unfinished_error<localizes>:message = "Some planters are unfinished. Use GrowPlant at every bed. Change the plan or repeat count."
    exit_error<localizes>:message = "All beds are harvested. Finish by moving to the Exit."
    malformed_text<localizes>:message = "GrowPlant needs four valid steps. Replay restores its starting definition."
    success_text<localizes>:message = "Skill used successfully! Next challenge is unlocked. A named skill can be reused when it is needed."
    final_text<localizes>:message = "PIX MODULE RESTORED: SKILLS ONLINE\nAI Skills Badge earned! A named skill is a reusable group of steps. Replay or return to the hub."
    retained_text<localizes>:message = "Skill reused again! Your AI Skills Badge stays earned: 1/1."
    concept_text<localizes>:message = "A skill is a reusable group of steps with a helpful name. Pix can reuse GrowPlant when it is needed."
    answer_text<localizes>:message = "Name the skill GrowPlant. Set its steps to Water, Plant, Wait, Harvest. Run uses them in that order."
    row_concept<localizes>:message = "Reuse the same GrowPlant definition at each bed. Move changes which planter GrowPlant works on."
    row_answer<localizes>:message = "Define GrowPlant: Water, Plant, Wait, Harvest. Set the plan: GrowPlant, Move, GrowPlant. Then Run."
    repeat_concept<localizes>:message = "Each repeat cares for one bed, then moves. Count the beds before the Exit."
    repeat_answer<localizes>:message = "Define GrowPlant: Water, Plant, Wait, Harvest. Set Repeat 3 [GrowPlant, Move]. Then Run."
    occupied_text<localizes>:message = "This AI Skills Lab station is in use. Choose another station."
    other_text<localizes>:message = "Leave your current AI Skills Lab station before claiming another."
    remix_text<localizes>:message = "Optional remix / Return to normal challenges"
    remix_label_text<localizes>:message = "REMIX / NORMAL"
    remix_locked<localizes>:message = "Finish all three AI Skills Lab challenges first. The remix is optional."
    remix_mission<localizes>(badge:int):message = "OPTIONAL AI SKILLS REMIX\nUse one GrowPlant definition to restore two beds.\nGoal: 3 plan commands.\nBadge: {badge}/1. Remix / Normal exits."
    remix_ready<localizes>:message = "Optional remix. Repair GrowPlant and the three-slot plan.\nReplay resets this remix. Remix / Normal or Hub leaves."
    remix_success<localizes>:message = "Remix restored. 3 plan instructions replace 9 expanded steps.\nNormal AI Skills Lab progress and badge stay unchanged."
    remix_next<localizes>:message = "Use Remix / Normal to return to normal challenges, or Replay this remix."

    buttons()<transacts>:[]button_device = array{claim_button, slot_0_button, slot_1_button,
        slot_2_button, slot_3_button, run_button, help_button, replay_button, return_button,
        caller_0_button, caller_1_button, caller_2_button, repeat_button, next_button}

    labels()<transacts>:[]billboard_device = array{label_0, label_1, label_2, label_3, label_4, label_5, label_6, label_7, label_8,
        label_caller_0, label_caller_1, label_caller_2, label_repeat, label_next}

    label_texts():[]message = array{claim_text, slot_text(1), slot_text(2), slot_text(3),
        slot_text(4), run_text, help_text, replay_text, return_text,
        caller_text(1), caller_text(2), caller_text(3), repeat_text, next_text}

    refreshed_text<localizes>(text:message):message = "{text} "

    draw_text(board:billboard_device, text:message):void =
        if (display_phase?):
            board.SetText(refreshed_text(text))
        else:
            board.SetText(text)
        board.ShowText()
        board.UpdateDisplay()

    display_boards()<transacts>:[]billboard_device = labels() + array{
        mission_board, program_board, execution_board,
        planter_label, planter_2_label, planter_3_label, exit_label, remix_label}

    display(index:int, text:message):void =
        if (board := display_boards()[index]):
            if (set board_texts[index] = text) {}
            if (set board_visibility[index] = true) {}
            draw_text(board, text)

    hide_display(index:int):void =
        if (set board_visibility[index] = false) {}
        if (board := display_boards()[index]):
            board.HideText()

    refresh_displays():void =
        # Changed text recovers billboards missed by a late client initialization.
        # Keep the cached trace and hidden-bed state; never reset the demonstration.
        if (display_phase?):
            set display_phase = false
        else:
            set display_phase = true
        for (index -> text : board_texts, board_visibility[index]?, board := display_boards()[index]):
            draw_text(board, text)

    refresh_labels():void =
        remix_button.SetInteractionText(remix_text)
        display(21, remix_label_text)
        texts := label_texts()
        for (index -> button : buttons(), text := texts[index]):
            button.SetInteractionText(text)
        for (index -> label : labels(), text := texts[index]):
            display(index, text)

    OnBegin<override>()<suspends>:void =
        Hide()
        set plant_homes = array{plant.GetTransform(), plant_2.GetTransform(), plant_3.GetTransform()}
        set robot_home = robot.GetTransform()
        set observed_round = progress.round_generation
        for (button : buttons()):
            button.SetInteractionTime(0.0)
            button.SetMaxTriggerCount(0)
        claim_button.InteractedWithEvent.Subscribe(on_claim)
        slot_0_button.InteractedWithEvent.Subscribe(on_slot_0)
        slot_1_button.InteractedWithEvent.Subscribe(on_slot_1)
        slot_2_button.InteractedWithEvent.Subscribe(on_slot_2)
        slot_3_button.InteractedWithEvent.Subscribe(on_slot_3)
        run_button.InteractedWithEvent.Subscribe(on_run)
        help_button.InteractedWithEvent.Subscribe(on_help)
        replay_button.InteractedWithEvent.Subscribe(on_replay)
        return_button.InteractedWithEvent.Subscribe(on_return)
        caller_0_button.InteractedWithEvent.Subscribe(on_caller_0)
        caller_1_button.InteractedWithEvent.Subscribe(on_caller_1)
        caller_2_button.InteractedWithEvent.Subscribe(on_caller_2)
        repeat_button.InteractedWithEvent.Subscribe(on_repeat)
        next_button.InteractedWithEvent.Subscribe(on_next)
        remix_button.SetInteractionTime(0.0)
        remix_button.SetMaxTriggerCount(0)
        remix_button.InteractedWithEvent.Subscribe(on_remix)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_removed)
        release()
        loop:
            Sleep(0.25)
            set label_ticks += 1
            if (label_ticks >= 8):
                set label_ticks = 0
                refresh_labels()
                refresh_displays()
            if (observed_round <> progress.round_generation):
                set observed_round = progress.round_generation
                release()
            if (input_player := owner?):
                if (character := input_player.GetFortCharacter[], character.IsActive[]):
                    if (Distance(character.GetTransform().Translation, GetTransform().Translation) > 1700.0):
                        release()
                else:
                    release()

    command_name(command:int):message =
        if (command = 4):
            return move_name
        if (command = 0):
            return water_name
        if (command = 1):
            return plant_name
        if (command = 2):
            return wait_name
        return harvest_name

    state_name(state:int):message =
        if (state = 0):
            return empty_name
        if (state = 1):
            return watered_name
        if (state = 2):
            return planted_name
        if (state = 3):
            return ready_name
        return harvested_name

    bed_count()<transacts>:int = challenge + 1

    render_frame(frame:nursery_execution_frame):void =
        plants := array{plant, plant_2, plant_3}
        bed_labels := array{planter_label, planter_2_label, planter_3_label}
        for (index -> prop : plants, label := bed_labels[index], authored := plant_homes[index]):
            if (index >= bed_count()):
                prop.Hide()
                hide_display(index + 17)
            else if (state := frame.planter_states[index]):
                display(index + 17, bed_text(index + 1, state_name(state)))
                var pose:transform = authored
                set pose.Translation.Z += state * 30.0
                if (prop.TeleportTo[pose]) {}
                if (state = 0):
                    prop.Hide()
                else:
                    prop.Show()
        if (challenge = 2):
            display(20, exit_text)
        else:
            hide_display(20)

    reset_demo():void =
        if (robot.TeleportTo[robot_home]) {}
        render_frame(nursery_execution_frame{})

    completion_name(done:logic):message =
        if (done?):
            return done_name
        return todo_name

    show_mission(input_player:player):void =
        state := progress.ensure_player(input_player)
        if (remix?):
            display(14, remix_mission(progress.badge_tracker.GetValue(input_player)))
            return
        var goal:message = objective_text
        if (challenge = 1):
            set goal = row_objective
        else if (challenge = 2):
            set goal = repeat_objective
        if (a := state.completed[0], b := state.completed[1], c := state.completed[2]):
            display(14, mission_text(challenge + 1, goal,
                completion_name(a), completion_name(b), completion_name(c), progress.badge_tracker.GetValue(input_player)))

    caller_name(instruction:int):message =
        if (instruction = 1):
            return move_name
        return care_name

    show_program():void =
        var calls:message = one_caller
        if (challenge = 1, a := caller[0], b := caller[1], c := caller[2]):
            set calls = row_caller(caller_name(a), caller_name(b), caller_name(c))
        else if (challenge = 2):
            set calls = repeat_caller(repeats)
        if (a := definition[0], b := definition[1], c := definition[2], d := definition[3]):
            display(15, program_text(command_name(a), command_name(b), command_name(c), command_name(d), calls))

    reset_attempt():void =
        set definition = fixtures.definition_defaults()
        if (remix?):
            set definition = array{1, 0, 2, 3}
        set caller = array{0, 0, 0}
        set repeats = 1
        set hint_level = 0
        set solved = false
        reset_demo()
        show_program()
        show_ready()

    show_ready():void =
        if (remix?):
            display(16, remix_ready)
        else:
            display(16, ready_text)

    release():void =
        if (input_player := owner?):
            state := progress.ensure_player(input_player)
            if (state.station_id = station_id):
                set state.station_id = -1
        set generation += 1
        set running = false
        set owner = false
        set remix = false
        set challenge = 0
        reset_attempt()
        display(14, available_text(station_id + 1))
        refresh_labels()

    on_claim(input_agent:agent):void =
        if (input_player := player[input_agent]):
            if (current := owner?):
                if (current <> input_player):
                    feedback.Show(input_agent, occupied_text, ?DisplayTime := 5.0)
                return
            state := progress.ensure_player(input_player)
            if (state.station_id >= 0, state.station_id <> station_id):
                feedback.Show(input_agent, other_text, ?DisplayTime := 5.0)
                return
            set owner = option{input_player}
            set state.station_id = station_id
            set challenge = state.challenge
            set observed_round = progress.round_generation
            reset_attempt()
            show_mission(input_player)

    edit(input_agent:agent, slot:int):void =
        if (input_player := owner?, input_player = input_agent, not running?, current := definition[slot]):
            if (set definition[slot] = fixtures.cycle_command(current)) {}
            changed()

    changed():void =
        set solved = false
        reset_demo()
        show_program()
        show_ready()

    on_remix(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            state := progress.ensure_player(input_player)
            if (remix?):
                # Exit is allowed during a frozen trace; old frames lose authority.
                set generation += 1
                set running = false
                set remix = false
                set challenge = state.challenge
                reset_attempt()
                show_mission(input_player)
                return
            if (running?):
                return
            if (state.badge_earned?, state.completed[0]?, state.completed[1]?, state.completed[2]?):
                set generation += 1
                set remix = true
                set challenge = 1
                reset_attempt()
                show_mission(input_player)
            else:
                feedback.Show(input_agent, remix_locked, ?DisplayTime := 6.0)

    edit_caller(input_agent:agent, slot:int):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            if (challenge <> 1):
                feedback.Show(input_agent, unused_text, ?DisplayTime := 5.0)
                return
            if (current := caller[slot]):
                if (set caller[slot] = 1 - current) {}
                changed()

    on_caller_0(input_agent:agent):void = edit_caller(input_agent, 0)
    on_caller_1(input_agent:agent):void = edit_caller(input_agent, 1)
    on_caller_2(input_agent:agent):void = edit_caller(input_agent, 2)

    on_repeat(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            if (challenge <> 2):
                feedback.Show(input_agent, unused_text, ?DisplayTime := 5.0)
                return
            if (repeats >= 4):
                set repeats = 1
            else:
                set repeats += 1
            changed()

    on_next(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            if (remix?):
                feedback.Show(input_agent, remix_next, ?DisplayTime := 6.0)
                return
            state := progress.ensure_player(input_player)
            if (not state.completed[challenge]?):
                feedback.Show(input_agent, finish_text, ?DisplayTime := 5.0)
                return
            if (challenge >= 2):
                set challenge = 0
            else:
                set challenge += 1
            set state.challenge = challenge
            reset_attempt()
            show_mission(input_player)

    on_slot_0(input_agent:agent):void = edit(input_agent, 0)
    on_slot_1(input_agent:agent):void = edit(input_agent, 1)
    on_slot_2(input_agent:agent):void = edit(input_agent, 2)
    on_slot_3(input_agent:agent):void = edit(input_agent, 3)

    on_run(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            set generation += 1
            set running = true
            set solved = false
            evaluation := fixtures.evaluate(challenge, definition, caller, repeats)
            reset_demo()
            spawn{execute(input_player, evaluation, generation, progress.round_generation)}

    active(input_player:player, token:int, round_token:int)<transacts><decides>:void =
        owner? = input_player
        generation = token
        progress.round_generation = round_token
        running?
        character := input_player.GetFortCharacter[]
        character.IsActive[]

    execute(input_player:player, evaluation:nursery_execution_result, token:int, round_token:int)<suspends>:void =
        for (frame : evaluation.frames, frame.caller_slot >= 0):
            if (not active[input_player, token, round_token]):
                return
            if (frame.definition_slot = 0):
                skill_audio.Play(input_player)
            if (frame.command = 4):
                display(16, move_step_text(frame.caller_slot + 1, frame.iteration, frame.position))
                var target:transform = robot_home
                set target.Translation.X -= frame.position * 450.0
                start := robot.GetTransform()
                for (part := 1..12):
                    if (not active[input_player, token, round_token]):
                        return
                    var pose:transform = start
                    set pose.Translation = start.Translation + (target.Translation - start.Translation) * (part * 1.0 / 12.0)
                    if (robot.TeleportTo[pose]) {}
                    Sleep(0.05)
            else:
                display(16, step_text(frame.caller_slot + 1, frame.iteration, frame.position + 1,
                    frame.definition_slot + 1, command_name(frame.command), state_name(frame.planter_state - 1)))
                Sleep(0.6)
            if (not active[input_player, token, round_token]):
                return
            render_frame(frame)
            if (frame.command <> 4):
                display(16, step_text(frame.caller_slot + 1, frame.iteration, frame.position + 1,
                    frame.definition_slot + 1, command_name(frame.command), state_name(frame.planter_state)))
            Sleep(0.4)
        if (not active[input_player, token, round_token]):
            return
        if (evaluation.error = 1):
            failed := evaluation.failed_frame
            if (failed.planter_state = 4):
                display(16, harvested_error(failed.caller_slot + 1, failed.iteration, failed.position + 1))
            else:
                display(16, error_text(failed.caller_slot + 1, failed.iteration, failed.position + 1,
                    failed.definition_slot + 1, command_name(failed.command), state_name(failed.planter_state), command_name(failed.planter_state)))
        else if (evaluation.error = 3):
            display(16, unfinished_error)
        else if (evaluation.error = 4):
            display(16, row_end_error(evaluation.failed_frame.caller_slot + 1, evaluation.failed_frame.iteration))
        else if (evaluation.error = 5):
            display(16, exit_care_error(evaluation.failed_frame.iteration))
        else if (evaluation.error = 6):
            display(16, exit_error)
        else if (evaluation.error <> 0):
            display(16, malformed_text)
        else:
            set solved = true
            var text:message = remix_success
            if (not remix?):
                state := progress.ensure_player(input_player)
                already_earned := state.badge_earned
                progress.complete_challenge(input_player, challenge)
                set text = success_text
                if (state.badge_earned?):
                    if (already_earned?):
                        set text = retained_text
                    else:
                        set text = final_text
            display(16, text)
            feedback.Show(input_player, text, ?DisplayTime := 10.0)
            show_mission(input_player)
        set running = false

    on_help(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            var concept:message = concept_text
            var answer:message = answer_text
            if (challenge = 1):
                set concept = row_concept
                set answer = row_answer
            else if (challenge = 2):
                set concept = repeat_concept
                set answer = repeat_answer
            if (hint_level = 0):
                set hint_level = 1
                feedback.Show(input_agent, concept, ?DisplayTime := 12.0)
            else:
                set hint_level = 2
                feedback.Show(input_agent, answer, ?DisplayTime := 12.0)

    on_replay(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            reset_attempt()

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
