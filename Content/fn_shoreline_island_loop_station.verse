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
    var running:logic = false
    var solved:logic = false
    var generation:int = 0
    var home:transform = transform{}
    var parcel_home:transform = transform{}
    var observed_round:int = -1

    claim_text<localizes>:message = "Claim robot station"
    count_text<localizes>:message = "Change repeat count (1-5)"
    run_text<localizes>:message = "Run your loop"
    help_text<localizes>:message = "Help"
    next_text<localizes>:message = "Next challenge / Replay"
    return_text<localizes>:message = "Return to Academy Hub"
    available_text<localizes>:message = "LOOP LAGOON\nPress CLAIM to begin."
    occupied_text<localizes>:message = "This robot has a pilot. Choose another station."
    other_station_text<localizes>:message = "You already have a robot. Leave that station before claiming another."
    claim_first_text<localizes>:message = "Claim an available robot station first."
    finish_first_text<localizes>:message = "Reach this target first. Help is always available."
    delivery_text<localizes>:message = "Guide the robot to the parcel. Choose a repeat count, then Run."
    lantern_text<localizes>:message = "Light every dock lantern. Repeat Move, Light. Then Run."
    transfer_text<localizes>:message = "The parcel moved! Change your loop to reach its new tile."
    hint_text<localizes>:message = "A loop repeats its steps. Count the tiles from the robot to its goal."
    hint_lantern_text<localizes>:message = "Each repeat moves one tile and lights one lantern. Count the lanterns."
    success_text<localizes>:message = "You reached the goal! Press Next challenge to continue."
    complete_text<localizes>:message = "Loop Badge earned! A loop repeats steps. Return to the hub or Replay."
    replay_text<localizes>:message = "Solved again! Your Loop Badge is already saved for this round."
    pilot_board<localizes>(input_player:agent, challenge_number:int, repeat_count:int, target_tile:int):message = "Pilot: {input_player}\nChallenge {challenge_number} | Repeat {repeat_count}\nStart: 0 | Goal: {target_tile}"
    step_board<localizes>(input_player:agent, repeat_count:int, tile:int, action:string):message = "Pilot: {input_player} | Repeat {repeat_count}\n{action}\nRobot tile: {tile}"
    result_text<localizes>(tile:int, target_tile:int):message = "Robot stopped at {tile}. Goal: {target_tile}. Change the count and try again."
    answer_text<localizes>(repeat_count:int):message = "Try Repeat {repeat_count}, then Run. Watch one move for each repeat."
    selected_run_text<localizes>(repeat_count:int):message = "Run: Repeat {repeat_count}"

    OnBegin<override>()<suspends>:void =
        set home = robot.GetTransform()
        set parcel_home = parcel.GetTransform()
        claim_button.SetInteractionText(claim_text)
        count_button.SetInteractionText(count_text)
        run_button.SetInteractionText(run_text)
        help_button.SetInteractionText(help_text)
        next_button.SetInteractionText(next_text)
        return_button.SetInteractionText(return_text)
        board.SetTextSize(16)
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
        lantern_1.Hide()
        lantern_2.Hide()
        lantern_3.Hide()
        if (challenge = 1):
            parcel.Hide()
        else:
            parcel.Show()
            var target:transform = parcel_home
            set target.Translation = home.Translation + vector3{X := goal() * 180.0, Y := 0.0, Z := 0.0}
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
        reset_board()
        board.SetText(available_text)
        board.UpdateDisplay()

    show_selection(input_player:player):void =
        run_button.SetInteractionText(selected_run_text(count))
        board.SetText(pilot_board(input_player, challenge + 1, count, goal()))
        board.UpdateDisplay()

    show_objective(input_player:player):void =
        if (challenge = 0):
            feedback.Show(input_player, delivery_text, ?DisplayTime := 8.0)
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
            set observed_round = progress.round_generation
            reset_board()
            show_selection(input_player)
            show_objective(input_player)

    on_count(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            set count += 1
            if (count > 5):
                set count = 1
            show_selection(input_player)

    on_help(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            set hint_level += 1
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
            set count = 1
            set hint_level = 0
            set solved = false
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
            if (robot.TeleportTo[position]) {}
            board.SetText(step_board(input_player, repeats, tile, "Move"))
            board.UpdateDisplay()
            Sleep(0.65)
            if (not is_current[input_player, token, round_token]):
                return
            if (challenge_index = 1):
                if (tile = 1):
                    lantern_1.Show()
                else if (tile = 2):
                    lantern_2.Show()
                else if (tile = 3):
                    lantern_3.Show()
                board.SetText(step_board(input_player, repeats, tile, "Light"))
                board.UpdateDisplay()
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
