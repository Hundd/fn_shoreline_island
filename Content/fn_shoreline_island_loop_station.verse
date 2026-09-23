using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

fn_shoreline_island_loop_station := class(creative_device):
    @editable
    station_id:int = 0
    @editable
    progress:fn_shoreline_island_loop_progress = fn_shoreline_island_loop_progress{}
    @editable
    claim_button:button_device = button_device{}
    @editable
    count_button:button_device = button_device{}
    @editable
    run_button:button_device = button_device{}
    @editable
    help_button:button_device = button_device{}
    @editable
    next_button:button_device = button_device{}
    @editable
    return_button:button_device = button_device{}
    @editable
    hub_destination:teleporter_device = teleporter_device{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    scan_audio:audio_player_device = audio_player_device{}
    @editable
    board:billboard_device = billboard_device{}
    @editable
    robot:creative_prop = creative_prop{}
    @editable
    parcel:creative_prop = creative_prop{}
    @editable
    lantern_1:creative_prop = creative_prop{}
    @editable
    lantern_2:creative_prop = creative_prop{}
    @editable
    lantern_3:creative_prop = creative_prop{}
    @editable
    hub_spawner_0:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_1:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_2:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_3:player_spawner_device = player_spawner_device{}

    var owner:?player = false
    var count:int = 1
    var challenge:int = 0
    var hint_level:int = 0
    var color_choice:int = 0
    var color_passed:logic = false
    var running:logic = false
    var solved:logic = false
    var generation:int = 0
    var home:transform = transform{}
    var parcel_home:transform = transform{}
    var lantern_homes:[]transform = array{}
    var lit_lanterns:int = 0
    var robot_tile:int = 0
    var observed_round:int = -1

    claim_text<localizes>:message = "Claim Pattern Scanner station"
    count_text<localizes>:message = "Change repeat count (1-5)"
    run_text<localizes>:message = "Run the pattern"
    help_text<localizes>:message = "Help"
    next_text<localizes>:message = "Next challenge / Replay"
    return_text<localizes>:message = "Return to Academy Hub"
    available_text<localizes>(dock_number:int):message = "PATTERN SCANNER | Station {dock_number}\nPress CLAIM to begin."
    occupied_text<localizes>:message = "This robot has a pilot. Choose another station."
    other_station_text<localizes>:message = "You already have a robot. Leave that station before claiming another."
    claim_first_text<localizes>:message = "Claim an available Pattern Scanner station first."
    finish_first_text<localizes>:message = "Reach this target first. Help is always available."
    delivery_text<localizes>:message = "Predict how many Move steps reach the parcel. Choose that repeat count, then Run."
    color_question_text<localizes>:message = "Predict the next color: Blue, Yellow, Blue, Yellow, Blue, ?"
    color_board_text<localizes>(selected:message):message = "PATTERN SCANNER | Challenge 1\nBlue > Yellow > Blue > Yellow > Blue > ?\nYour prediction: {selected}\nChange color, then Check prediction."
    blue_name<localizes>:message = "Blue"
    yellow_name<localizes>:message = "Yellow"
    green_name<localizes>:message = "Green"
    change_color_text<localizes>:message = "Change color: Blue / Yellow / Green"
    check_color_text<localizes>:message = "Check color prediction"
    color_wrong_text<localizes>(selected:message):message = "{selected} does not continue the pair. Blue is followed by Yellow each time. Change your prediction and try again."
    color_found_text<localizes>:message = "You found the pattern! Blue and Yellow repeat, so Yellow comes next. Now choose how many Move steps reach the parcel."
    color_hint_text<localizes>:message = "Look at each Blue in the example. Which color comes after it?"
    color_answer_text<localizes>:message = "Blue, Yellow is the repeating pair. Choose Yellow, then Check prediction."
    lantern_text<localizes>:message = "Repeat Move, Light to light every marker. Then Run."
    transfer_text<localizes>:message = "The target moved! The pattern stayed the same; change its repeat count."
    hint_text<localizes>:message = "This plan repeats one Move each time. Count the tiles from 0 to the goal."
    hint_lantern_text<localizes>:message = "Each repeat moves one tile and lights one marker. Count the markers."
    success_text<localizes>:message = "You reached the goal! Press Next challenge to continue."
    complete_text<localizes>:message = "PIX MODULE RESTORED: PATTERNS ONLINE\nPattern Badge earned! You predicted the repeated moves. AI can use patterns in examples to make predictions, too. Return to the hub or Replay."
    replay_text<localizes>:message = "Pattern solved again! Your Pattern Badge is already saved for this round."
    pilot_board<localizes>(input_player:agent, challenge_number:int, repeat_count:int, target_tile:int):message = "Pilot: {input_player}\nChallenge {challenge_number} | Repeat {repeat_count} [Move]\nStart: 0 | Goal: {target_tile}"
    step_board<localizes>(input_player:agent, repeat_count:int, tile:int, action:string):message = "Pilot: {input_player} | Repeat {repeat_count}\n{action}\nRobot tile: {tile}"
    lantern_board<localizes>(input_player:agent, repeat_count:int, tile:int, action:string, lamp_one:string, lamp_two:string, lamp_three:string):message = "Pilot: {input_player} | Repeat {repeat_count}\n{action} | Tile {tile}\nLamps: 1 {lamp_one} / 2 {lamp_two} / 3 {lamp_three}"
    result_text<localizes>(tile:int, target_tile:int):message = "Robot stopped at {tile}; the goal is {target_tile}. Each repeat moves one tile. Change the count and try again."
    answer_text<localizes>(repeat_count:int):message = "Try Repeat {repeat_count}, then Run. Watch one move for each repeat."
    selected_run_text<localizes>(repeat_count:int):message = "Run: Repeat {repeat_count}"

    OnBegin<override>()<suspends>:void =
        Hide()
        set home = robot.GetTransform()
        set parcel_home = parcel.GetTransform()
        set lantern_homes = array{lantern_1.GetTransform(), lantern_2.GetTransform(), lantern_3.GetTransform()}
        claim_button.SetInteractionText(claim_text)
        count_button.SetInteractionText(count_text)
        run_button.SetInteractionText(run_text)
        help_button.SetInteractionText(help_text)
        next_button.SetInteractionText(next_text)
        return_button.SetInteractionText(return_text)
        board.SetTextSize(12)
        for (input_button : array{claim_button, count_button, run_button, help_button, next_button, return_button}):
            input_button.SetMaxTriggerCount(0)
            input_button.SetInteractionTime(0.0)
        claim_button.InteractedWithEvent.Subscribe(on_claim)
        count_button.InteractedWithEvent.Subscribe(on_count)
        run_button.InteractedWithEvent.Subscribe(on_run)
        help_button.InteractedWithEvent.Subscribe(on_help)
        next_button.InteractedWithEvent.Subscribe(on_next)
        return_button.InteractedWithEvent.Subscribe(on_return)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_removed)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        release()
        loop:
            Sleep(0.25)
            if (observed_round <> progress.round_generation):
                set observed_round = progress.round_generation
                release()
            if (input_player := owner?):
                if (character := input_player.GetFortCharacter[], character.IsActive[]):
                    if (Distance(character.GetTransform().Translation, claim_button.GetTransform().Translation) > 1200.0):
                        release()
                else:
                    release()

    goal()<transacts>:int =
        if (challenge = 2):
            return 4
        return 3

    reset_board():void =
        if (robot.TeleportTo[home]) {}
        set lit_lanterns = 0
        set robot_tile = 0
        for (index -> lantern : array{lantern_1, lantern_2, lantern_3}):
            if (authored := lantern_homes[index]):
                var unlit:transform = authored
                set unlit.Scale = authored.Scale * 0.5
                if (lantern.TeleportTo[unlit]) {}
            if (challenge = 1):
                lantern.Show()
            else:
                lantern.Hide()
        if (challenge = 1):
            parcel.Hide()
        else:
            parcel.Show()
            var target:transform = parcel_home
            set target.Translation = home.Translation + vector3{X := goal() * 180.0, Y := 0.0, Z := 0.0}
            set target.Translation.Z += 120.0
            if (parcel.TeleportTo[target]) {}

    release():void =
        if (input_player := owner?):
            state := progress.ensure_player(input_player)
            if (state.station_id = station_id):
                set state.station_id = -1
        set generation += 1
        set owner = false
        set running = false
        set solved = false
        set color_choice = 0
        set color_passed = false
        count_button.SetInteractionText(count_text)
        run_button.SetInteractionText(run_text)
        reset_board()
        board.SetText(available_text(station_id + 1))
        board.UpdateDisplay()

    show_selection(input_player:player):void =
        if (challenge = 0, not color_passed?):
            count_button.SetInteractionText(change_color_text)
            run_button.SetInteractionText(check_color_text)
            board.SetText(color_board_text(color_name(color_choice)))
            board.UpdateDisplay()
            return
        count_button.SetInteractionText(count_text)
        run_button.SetInteractionText(selected_run_text(count))
        if (challenge = 1):
            show_lantern_board(input_player, count, robot_tile, "[Move + Light] | Goal: 3")
        else:
            board.SetText(pilot_board(input_player, challenge + 1, count, goal()))
        board.UpdateDisplay()

    color_name(choice:int):message =
        if (choice = 0):
            return blue_name
        if (choice = 1):
            return yellow_name
        return green_name

    lantern_state(number:int)<transacts>:string =
        if (lit_lanterns >= number):
            return "ON"
        return "OFF"

    show_lantern_board(input_player:player, repeats:int, tile:int, action:string):void =
        board.SetText(lantern_board(input_player, repeats, tile, action, lantern_state(1), lantern_state(2), lantern_state(3)))
        board.UpdateDisplay()

    light_lantern(tile:int):void =
        if (lantern := array{lantern_1, lantern_2, lantern_3}[tile - 1], authored := lantern_homes[tile - 1]):
            if (lantern.TeleportTo[authored]) {}
            set lit_lanterns = tile

    show_objective(input_player:player):void =
        if (challenge = 0):
            if (color_passed?):
                feedback.Show(input_player, delivery_text, ?DisplayTime := 8.0)
            else:
                feedback.Show(input_player, color_question_text, ?DisplayTime := 8.0)
        else if (challenge = 1):
            feedback.Show(input_player, lantern_text, ?DisplayTime := 8.0)
        else:
            feedback.Show(input_player, transfer_text, ?DisplayTime := 8.0)

    on_claim(input_agent:agent):void =
        if (input_player := player[input_agent]):
            if (current := owner?):
                if (current = input_player):
                    show_objective(input_player)
                else:
                    feedback.Show(input_player, occupied_text, ?DisplayTime := 4.0)
                return
            state := progress.ensure_player(input_player)
            if (state.station_id >= 0):
                feedback.Show(input_player, other_station_text, ?DisplayTime := 5.0)
                return
            set state.station_id = station_id
            set owner = option{input_player}
            set challenge = state.challenge
            set count = 1
            set hint_level = 0
            set solved = false
            set color_choice = 0
            set color_passed = false
            set observed_round = progress.round_generation
            reset_board()
            show_selection(input_player)
            show_objective(input_player)

    on_count(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            if (challenge = 0, not color_passed?):
                set color_choice += 1
                if (color_choice > 2):
                    set color_choice = 0
                show_selection(input_player)
                return
            set count += 1
            if (count > 5):
                set count = 1
            show_selection(input_player)

    on_help(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            set hint_level += 1
            if (challenge = 0, not color_passed?):
                if (hint_level > 1):
                    feedback.Show(input_player, color_answer_text, ?DisplayTime := 8.0)
                else:
                    feedback.Show(input_player, color_hint_text, ?DisplayTime := 8.0)
                return
            if (hint_level > 1):
                feedback.Show(input_player, answer_text(goal()), ?DisplayTime := 8.0)
            else if (challenge = 1):
                feedback.Show(input_player, hint_lantern_text, ?DisplayTime := 8.0)
            else:
                feedback.Show(input_player, hint_text, ?DisplayTime := 8.0)

    on_next(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            if (not solved?):
                feedback.Show(input_player, finish_first_text, ?DisplayTime := 5.0)
                return
            if (challenge < 2):
                set challenge += 1
            else:
                set challenge = 0
            state := progress.ensure_player(input_player)
            set state.challenge = challenge
            set count = 1
            set hint_level = 0
            set solved = false
            set color_choice = 0
            set color_passed = false
            reset_board()
            show_selection(input_player)
            show_objective(input_player)

    on_return(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            release()
        hub_destination.Teleport(input_agent)

    on_removed(input_player:player):void =
        if (current := owner?, current = input_player):
            release()

    on_spawn(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            release()

    on_run(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            if (running?):
                return
            if (challenge = 0, not color_passed?):
                if (color_choice = 1):
                    set color_passed = true
                    set count = 1
                    set hint_level = 0
                    show_selection(input_player)
                    feedback.Show(input_player, color_found_text, ?DisplayTime := 10.0)
                else:
                    feedback.Show(input_player, color_wrong_text(color_name(color_choice)), ?DisplayTime := 8.0)
                return
            set running = true
            set generation += 1
            spawn{execute(input_player, count, challenge, generation, progress.round_generation)}
        else:
            feedback.Show(input_agent, claim_first_text, ?DisplayTime := 4.0)

    is_current(input_player:player, token:int, round_token:int)<transacts><decides>:void =
        owner? = input_player
        generation = token
        progress.round_generation = round_token

    execute(input_player:player, repeats:int, challenge_index:int, token:int, round_token:int)<suspends>:void =
        if (not is_current[input_player, token, round_token]):
            return
        reset_board()
        Sleep(0.4)
        for (tile := 1..repeats):
            if (not is_current[input_player, token, round_token]):
                return
            var position:transform = home
            set position.Translation = home.Translation + vector3{X := tile * 180.0}
            if (robot.TeleportTo[position]):
                if (tile = 1):
                    scan_audio.Play(input_player)
            set robot_tile = tile
            if (challenge_index = 1):
                show_lantern_board(input_player, repeats, tile, "Move")
            else:
                board.SetText(step_board(input_player, repeats, tile, "Move"))
            board.UpdateDisplay()
            Sleep(0.65)
            if (not is_current[input_player, token, round_token]):
                return
            if (challenge_index = 1):
                light_lantern(tile)
                show_lantern_board(input_player, repeats, tile, "Light")
                Sleep(0.65)
        if (not is_current[input_player, token, round_token]):
            return
        set running = false
        if (repeats = goal()):
            state := progress.ensure_player(input_player)
            already_earned := state.badge_earned
            set solved = true
            progress.complete(input_player, challenge_index)
            if (challenge_index = 2):
                if (already_earned?):
                    feedback.Show(input_player, replay_text, ?DisplayTime := 8.0)
                else:
                    feedback.Show(input_player, complete_text, ?DisplayTime := 10.0)
            else:
                feedback.Show(input_player, success_text, ?DisplayTime := 8.0)
        else:
            feedback.Show(input_player, result_text(repeats, goal()), ?DisplayTime := 7.0)
