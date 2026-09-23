using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

fn_shoreline_island_debug_station := class(creative_device):
    @editable
    station_id:int = 0
    @editable
    progress:fn_shoreline_island_debug_progress = fn_shoreline_island_debug_progress{}
    @editable
    claim_button:button_device = button_device{}
    @editable
    edit_button:button_device = button_device{}
    @editable
    run_button:button_device = button_device{}
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
    result_board:billboard_device = billboard_device{}
    @editable
    instruction_board:billboard_device = billboard_device{}
    @editable
    marker:creative_prop = creative_prop{}
    @editable
    hub_spawner_0:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_1:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_2:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_3:player_spawner_device = player_spawner_device{}

    fixtures:fn_shoreline_island_debug_fixtures = fn_shoreline_island_debug_fixtures{}
    var owner:?player = false
    var running:logic = false
    var generation:int = 0
    var observed_round:int = -1
    var marker_home:transform = transform{}

    claim_text<localizes>:message = "Claim AI Error Lab"
    edit_text<localizes>:message = "Correct the AI plan"
    run_text<localizes>:message = "Run the corrected plan"
    help_text<localizes>:message = "Help"
    next_text<localizes>:message = "Next challenge / Replay all"
    replay_text<localizes>:message = "Restore AI mistake"
    return_text<localizes>:message = "Return to Academy Hub"
    available_text<localizes>(number:int):message = "AI ERROR LAB | Station {number}\nClaim to check an AI mistake."
    occupied_text<localizes>:message = "This AI Error Lab station is in use. Choose another station."
    other_text<localizes>:message = "Leave your current AI Error Lab station before claiming another."
    welcome_text<localizes>:message = "Run Pix's AI plan. Compare the actual result with the expected result, then correct the bracketed mistake."
    ready_text<localizes>:message = "Ready: Run from tile 0."
    cargo_ready_text<localizes>:message = "Ready: Classify APPLE, then CAR."
    finish_text<localizes>:message = "Match the expected result first. Help is always available."
    solved_text<localizes>:message = "Results match! Next or Replay."
    wrong_text<localizes>:message = "Results differ. Compare EXPECTED with ACTUAL, edit the bracketed instruction, then run again."
    complete_text<localizes>:message = "PIX MODULE RESTORED: ERROR CHECKING ONLINE\nAI Detective Badge earned! Check the answer, find the problem, correct it, and try again."
    retained_text<localizes>:message = "Mistake corrected again! Your AI Detective Badge stays earned for this round."
    complete_board_text<localizes>:message = "AI Detective Badge earned! Replay is optional."
    east_text<localizes>:message = "East"
    west_text<localizes>:message = "West"
    wait_text<localizes>:message = "Wait"
    leaf_text<localizes>:message = "APPLE"
    plain_text<localizes>:message = "CAR"
    garden_text<localizes>:message = "Food"
    storage_text<localizes>:message = "Vehicle"
    pending_text<localizes>:message = "not run"
    empty_text<localizes>:message = "EXPECTED / ACTUAL\nClaim to begin"
    move_program_text<localizes>(move:message):message = "AI PLAN: East; [West]; East\nYOUR FIX: East; [{move}]; East\nCorrect only instruction 2."
    repeat_program_text<localizes>(count:int):message = "AI PLAN: Repeat [2]: East\nYOUR FIX: Repeat [{count}]: East\nCorrect only the repeat count."
    rule_program_text<localizes>(leaf:message, plain:message):message = "AI PLAN: [APPLE > Vehicle; else > Food]\nYOUR FIX: [APPLE > {leaf}; else > {plain}]\nCorrect only the classification rule."
    board_text<localizes>(input_player:agent, challenge:int, program:message):message = "AI Detective: {input_player} | Challenge {challenge}\n{program}"
    tile_result_text<localizes>(tile:int, status:message):message = "EXPECTED: tile 3\nACTUAL: tile {tile}\n{status}"
    cargo_result_text<localizes>(leaf:message, plain:message, status:message):message = "Items: APPLE | CAR\nEXPECTED: Food | Vehicle\nACTUAL: {leaf} | {plain}"
    step_text<localizes>(step:int, total:int, command:message):message = "AI PLAN RUNNING: {step} of {total}\nAction: {command}"
    delivery_text<localizes>(item:message, destination:message):message = "AI PLAN RUNNING: {item}\nClassification: {destination}"
    concept_move_text<localizes>:message = "Compare the expected tile 3 with Pix's actual final tile. One action points the wrong way."
    worked_move_text<localizes>:message = "Change instruction 2 to East. East, East, East reaches tile 3."
    concept_repeat_text<localizes>:message = "Compare Pix's repeat count with the distance from tile 0 to tile 3."
    worked_repeat_text<localizes>:message = "Set Repeat to 3, then Run. The marker visits tiles 1, 2, 3."
    concept_rule_text<localizes>:message = "APPLE belongs in Food and CAR belongs in Vehicle. Compare both results with Pix's classification rule."
    worked_rule_text<localizes>:message = "Use If APPLE: Food; otherwise: Vehicle. Run both items to check the repair."

    OnBegin<override>()<suspends>:void =
        Hide()
        set marker_home = marker.GetTransform()
        claim_button.SetInteractionText(claim_text)
        edit_button.SetInteractionText(edit_text)
        run_button.SetInteractionText(run_text)
        help_button.SetInteractionText(help_text)
        next_button.SetInteractionText(next_text)
        replay_button.SetInteractionText(replay_text)
        return_button.SetInteractionText(return_text)
        for (control : array{claim_button, edit_button, run_button, help_button, next_button, replay_button, return_button}):
            control.SetInteractionTime(0.0)
            control.SetMaxTriggerCount(0)
        claim_button.InteractedWithEvent.Subscribe(on_claim)
        edit_button.InteractedWithEvent.Subscribe(on_edit)
        run_button.InteractedWithEvent.Subscribe(on_run)
        help_button.InteractedWithEvent.Subscribe(on_help)
        next_button.InteractedWithEvent.Subscribe(on_next)
        replay_button.InteractedWithEvent.Subscribe(on_replay)
        return_button.InteractedWithEvent.Subscribe(on_return)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_removed)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        for (label : array{board, result_board, instruction_board}):
            label.SetTextSize(12)
        board.SetTextSize(10)
        result_board.SetTextSize(10)
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

    reset_marker():void =
        if (marker.TeleportTo[marker_home]) {}

    release():void =
        if (input_player := owner?, state := progress.states[input_player], state.station_id = station_id):
            set state.station_id = -1
        set generation += 1
        set running = false
        set owner = false
        reset_marker()
        display(board, available_text(station_id + 1))
        display(result_board, empty_text)
        display(instruction_board, welcome_text)

    move_name(choice:int):message =
        if (choice = 0):
            west_text
        else if (choice = 1):
            wait_text
        else:
            east_text

    destination_name(garden:logic):message =
        if (garden?):
            garden_text
        else:
            storage_text

    show_program(input_player:player):void =
        state := progress.ensure_player(input_player)
        var program:message = move_program_text(move_name(state.edit_choice))
        if (state.challenge = 1):
            set program = repeat_program_text(fixtures.repeat_count(state.edit_choice))
        else if (state.challenge = 2):
            set program = rule_program_text(destination_name(fixtures.goes_to_garden(state.edit_choice, 0)), destination_name(fixtures.goes_to_garden(state.edit_choice, 1)))
        display(board, board_text(input_player, state.challenge + 1, program))

    show_ready(input_player:player):void =
        state := progress.ensure_player(input_player)
        reset_marker()
        show_program(input_player)
        if (state.solved?):
            var final_pose:transform = marker_home
            if (state.challenge = 2):
                set final_pose.Translation.Y += 360.0
                display(result_board, cargo_result_text(garden_text, storage_text, solved_text))
            else:
                set final_pose.Translation.X += 540.0
                display(result_board, tile_result_text(3, solved_text))
            if (marker.TeleportTo[final_pose]) {}
            if (state.badge_earned?):
                display(instruction_board, complete_board_text)
            else:
                display(instruction_board, solved_text)
            return
        if (state.challenge = 2):
            display(result_board, cargo_result_text(pending_text, pending_text, cargo_ready_text))
        else:
            display(result_board, tile_result_text(0, ready_text))
        display(instruction_board, welcome_text)

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
            show_ready(input_player)
            feedback.Show(input_player, welcome_text, ?DisplayTime := 10.0)

    on_edit(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            set state.edit_choice += 1
            if (state.edit_choice >= fixtures.choice_count(state.challenge)):
                set state.edit_choice = 0
            set state.solved = false
            show_ready(input_player)

    on_run(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            set running = true
            set generation += 1
            set state.solved = false
            show_ready(input_player)
            spawn{execute(input_player, state.challenge, state.edit_choice, generation, progress.round_generation)}

    on_help(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            state := progress.ensure_player(input_player)
            set state.hint_level += 1
            var hint:message = concept_move_text
            if (state.challenge = 1):
                set hint = concept_repeat_text
            else if (state.challenge = 2):
                set hint = concept_rule_text
            if (state.hint_level > 1):
                if (state.challenge = 0):
                    set hint = worked_move_text
                else if (state.challenge = 1):
                    set hint = worked_repeat_text
                else:
                    set hint = worked_rule_text
            feedback.Show(input_player, hint, ?DisplayTime := 10.0)

    restart(input_player:player):void =
        set generation += 1
        set running = false
        state := progress.ensure_player(input_player)
        set state.edit_choice = 0
        set state.hint_level = 0
        set state.solved = false
        show_ready(input_player)

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

    valid_run(input_player:player, token:int, round_token:int)<transacts><decides>:void =
        owner? = input_player
        generation = token
        progress.round_generation = round_token
        running?

    animate(input_player:player, target:transform, token:int, round_token:int)<suspends>:void =
        start := marker.GetTransform()
        for (frame := 1..12):
            if (not valid_run[input_player, token, round_token]):
                return
            var position:transform = start
            set position.Translation = start.Translation + (target.Translation - start.Translation) * (frame * 1.0 / 12.0)
            if (marker.TeleportTo[position]) {}
            Sleep(0.05)

    execute(input_player:player, challenge:int, choice:int, token:int, round_token:int)<suspends>:void =
        Sleep(0.7)
        if (not valid_run[input_player, token, round_token]):
            return
        var matches:logic = false
        if (challenge < 2):
            var total:int = 3
            var tile:int = 0
            if (challenge = 1):
                set total = fixtures.repeat_count(choice)
            for (step := 1..total):
                if (not valid_run[input_player, token, round_token]):
                    return
                var delta:int = 1
                var command:message = east_text
                if (challenge = 0, step = 2):
                    set delta = fixtures.move_delta(choice)
                    set command = move_name(choice)
                display(instruction_board, step_text(step, total, command))
                set tile += delta
                var target:transform = marker_home
                set target.Translation.X += tile * 180.0
                animate(input_player, target, token, round_token)
                if (not valid_run[input_player, token, round_token]):
                    return
                display(result_board, tile_result_text(tile, step_text(step, total, command)))
                Sleep(0.5)
            if (tile = 3):
                set matches = true
            if (valid_run[input_player, token, round_token]):
                if (matches?):
                    display(result_board, tile_result_text(tile, solved_text))
                else:
                    display(result_board, tile_result_text(tile, wrong_text))
        else:
            var leaf_actual:message = pending_text
            var plain_actual:message = pending_text
            for (item := 0..1):
                if (not valid_run[input_player, token, round_token]):
                    return
                reset_marker()
                garden := fixtures.goes_to_garden(choice, item)
                destination := destination_name(garden)
                var cargo:message = leaf_text
                if (item = 1):
                    set cargo = plain_text
                display(instruction_board, delivery_text(cargo, destination))
                Sleep(0.7)
                if (not valid_run[input_player, token, round_token]):
                    return
                var target:transform = marker_home
                if (garden?):
                    set target.Translation.X += 540.0
                else:
                    set target.Translation.Y += 360.0
                animate(input_player, target, token, round_token)
                if (not valid_run[input_player, token, round_token]):
                    return
                if (item = 0):
                    set leaf_actual = destination
                else:
                    set plain_actual = destination
                display(result_board, cargo_result_text(leaf_actual, plain_actual, delivery_text(cargo, destination)))
                Sleep(0.7)
            if (choice = 1):
                set matches = true
            if (valid_run[input_player, token, round_token]):
                if (matches?):
                    display(result_board, cargo_result_text(leaf_actual, plain_actual, solved_text))
                else:
                    display(result_board, cargo_result_text(leaf_actual, plain_actual, wrong_text))
        if (not valid_run[input_player, token, round_token]):
            return
        set running = false
        if (not matches?):
            display(instruction_board, wrong_text)
            feedback.Show(input_player, wrong_text, ?DisplayTime := 10.0)
            return
        state := progress.ensure_player(input_player)
        already_earned := state.badge_earned
        progress.complete(input_player)
        if (state.badge_earned?):
            display(instruction_board, complete_board_text)
            if (already_earned?):
                feedback.Show(input_player, retained_text, ?DisplayTime := 10.0)
            else:
                feedback.Show(input_player, complete_text, ?DisplayTime := 12.0)
        else:
            display(instruction_board, solved_text)
            feedback.Show(input_player, solved_text, ?DisplayTime := 8.0)

    on_return(input_agent:agent):void =
        if (current := owner?, current = input_agent):
            release()
        hub_destination.Teleport(input_agent)

    on_spawn(input_agent:agent):void =
        if (current := owner?, current = input_agent):
            release()

    on_removed(input_player:player):void =
        if (current := owner?, current = input_player):
            release()
