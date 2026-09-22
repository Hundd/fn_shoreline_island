using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

fn_shoreline_island_energy_station := class(creative_device):
    @editable
    station_id:int = 0
    @editable
    progress:fn_shoreline_island_energy_progress = fn_shoreline_island_energy_progress{}
    @editable
    claim_button:button_device = button_device{}
    @editable
    add_button:button_device = button_device{}
    @editable
    subtract_button:button_device = button_device{}
    @editable
    count_button:button_device = button_device{}
    @editable
    start_button:button_device = button_device{}
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
    energy_board:billboard_device = billboard_device{}
    @editable
    door_board:billboard_device = billboard_device{}
    @editable
    preview_door:creative_prop = creative_prop{}
    @editable
    hub_spawner_0:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_1:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_2:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_3:player_spawner_device = player_spawner_device{}

    fixtures:fn_shoreline_island_energy_fixtures = fn_shoreline_island_energy_fixtures{}
    var owner:?player = false
    var running:logic = false
    var generation:int = 0
    var observed_round:int = -1
    var door_home:transform = transform{}

    claim_text<localizes>:message = "Claim Confidence Core station"
    add_text<localizes>:message = "New clue: confidence +10%"
    subtract_text<localizes>:message = "Remove clue: confidence -10%"
    count_text<localizes>:message = "Change repeats: 1 to 5"
    start_text<localizes>:message = "Start / Run Add 2"
    help_text<localizes>:message = "Help"
    next_text<localizes>:message = "Next challenge / Replay all"
    replay_text<localizes>:message = "Replay current challenge"
    return_text<localizes>:message = "Return to Academy Hub"
    available_text<localizes>(number:int):message = "CONFIDENCE CORE | Station {number}\nPress CLAIM to help Pix use new clues."
    occupied_text<localizes>:message = "This Confidence Core station is in use. Choose another station."
    other_text<localizes>:message = "Leave your current Confidence Core station before claiming another."
    manual_text<localizes>:message = "Give Pix useful clues. Change confidence with +10% or -10%, then press Start."
    repeat_text<localizes>:message = "Choose how many times to Add 2. Run starts energy at 0. Can it finish at 6?"
    manual_controls_text<localizes>:message = "Use +1 or -1 here. Repeats begin in challenge 3."
    repeat_controls_text<localizes>:message = "This challenge uses Repeat Add 2. Choose a count, then Run."
    boundary_text<localizes>:message = "Energy stays between 0 and 10. Try the other adjustment."
    finish_text<localizes>:message = "Open this preview door first. Help is always available."
    ready_text<localizes>:message = "Edit energy, then Start."
    ready_repeat_text<localizes>:message = "Choose repeats, then Run."
    solved_text<localizes>:message = "Door open! Press Next or Replay."
    complete_text<localizes>:message = "Confidence Badge earned! More useful information can sometimes help an AI make a better prediction. Replay or return to the hub."
    retained_text<localizes>:message = "Confidence reached again! Your Confidence Badge stays earned for this round."
    complete_board_text<localizes>:message = "Confidence Badge earned! Replay is optional."
    concept_text<localizes>:message = "AI answers can have different confidence. High confidence does not automatically mean an answer is correct."
    worked_manual_text<localizes>(target:int):message = "Use +1 or -1 until energy reads {target}. Then press Start. Replay restores the starting value."
    worked_repeat_text<localizes>:message = "Try 3 repeats of Add 2: energy changes 0, 2, 4, 6. Then the door opens."
    energy_text<localizes>(energy:int, target:int, current_percent:int, target_percent:int):message = "AI CONFIDENCE: {current_percent}%\nTARGET: {target_percent}%\nClue score: {energy} / {target}"
    empty_energy_text<localizes>:message = "AI CONFIDENCE\nClaim to begin"
    closed_text<localizes>:message = "PREVIEW DOOR: CLOSED"
    opening_text<localizes>:message = "PREVIEW DOOR: OPENING"
    open_text<localizes>:message = "PREVIEW DOOR: OPEN"
    board_text<localizes>(input_player:agent, challenge:int, start:int, status:message):message = "Researcher: {input_player} | Challenge {challenge}\nStarting clue score: {start} | Controls: +10% / -10%\n{status}"
    repeat_board_text<localizes>(input_player:agent, count:int, status:message):message = "Researcher: {input_player} | Challenge 3\nStarting confidence: 0% | Repeat {count}: New clue +20%\n{status}"
    addition_text<localizes>(step:int, count:int):message = "New clue +20% | Step {step} of {count}"
    initial_text<localizes>:message = "Run begins: confidence = 0%"
    wrong_text<localizes>(energy:int, target:int):message = "Confidence finished at clue score {energy}; the target is {target}. Edit and try again."

    OnBegin<override>()<suspends>:void =
        Hide()
        set door_home = preview_door.GetTransform()
        claim_button.SetInteractionText(claim_text)
        add_button.SetInteractionText(add_text)
        subtract_button.SetInteractionText(subtract_text)
        count_button.SetInteractionText(count_text)
        start_button.SetInteractionText(start_text)
        help_button.SetInteractionText(help_text)
        next_button.SetInteractionText(next_text)
        replay_button.SetInteractionText(replay_text)
        return_button.SetInteractionText(return_text)
        for (input_button : array{claim_button, add_button, subtract_button, count_button, start_button, help_button, next_button, replay_button, return_button}):
            input_button.SetInteractionTime(0.0)
            input_button.SetMaxTriggerCount(0)
        claim_button.InteractedWithEvent.Subscribe(on_claim)
        add_button.InteractedWithEvent.Subscribe(on_add)
        subtract_button.InteractedWithEvent.Subscribe(on_subtract)
        count_button.InteractedWithEvent.Subscribe(on_count)
        start_button.InteractedWithEvent.Subscribe(on_start)
        help_button.InteractedWithEvent.Subscribe(on_help)
        next_button.InteractedWithEvent.Subscribe(on_next)
        replay_button.InteractedWithEvent.Subscribe(on_replay)
        return_button.InteractedWithEvent.Subscribe(on_return)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_removed)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        for (label : array{board, energy_board, door_board}):
            label.SetTextSize(12)
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

    set_door_label(text:message):void =
        door_board.SetText(text)
        door_board.UpdateDisplay()

    reset_door():void =
        if (preview_door.TeleportTo[door_home]) {}
        set_door_label(closed_text)

    release():void =
        if (input_player := owner?, state := progress.states[input_player], state.station_id = station_id):
            set state.station_id = -1
            if (state.challenge = 2, not state.solved?):
                set state.energy = 0
        set generation += 1
        set running = false
        set owner = false
        reset_door()
        board.SetText(available_text(station_id + 1))
        board.UpdateDisplay()
        energy_board.SetText(empty_energy_text)
        energy_board.UpdateDisplay()

    confidence_percent(value:int):int =
        return value * 10

    show_board(input_player:player, status:message):void =
        state := progress.ensure_player(input_player)
        target := fixtures.target(state.challenge)
        energy_board.SetText(energy_text(state.energy, target, confidence_percent(state.energy), confidence_percent(target)))
        energy_board.UpdateDisplay()
        if (state.challenge = 2):
            board.SetText(repeat_board_text(input_player, state.repeat_count, status))
        else:
            board.SetText(board_text(input_player, state.challenge + 1, fixtures.start(state.challenge), status))
        board.UpdateDisplay()

    show_ready(input_player:player):void =
        state := progress.ensure_player(input_player)
        reset_door()
        if (state.solved?):
            var opened:transform = door_home
            set opened.Translation.Z += 350.0
            if (preview_door.TeleportTo[opened]) {}
            set_door_label(open_text)
            show_board(input_player, solved_text)
        else if (state.challenge = 2):
            show_board(input_player, ready_repeat_text)
        else:
            show_board(input_player, ready_text)

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
            if (state.challenge = 2):
                feedback.Show(input_player, repeat_text, ?DisplayTime := 10.0)
            else:
                feedback.Show(input_player, manual_text, ?DisplayTime := 10.0)

    on_add(input_agent:agent):void =
        adjust(input_agent, 1)
    on_subtract(input_agent:agent):void =
        adjust(input_agent, -1)

    adjust(input_agent:agent, delta:int):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.solved?):
                feedback.Show(input_player, solved_text, ?DisplayTime := 5.0)
                return
            if (state.challenge = 2):
                feedback.Show(input_player, repeat_controls_text, ?DisplayTime := 7.0)
                return
            updated := state.energy + delta
            if (updated < 0 or updated > 10):
                feedback.Show(input_player, boundary_text, ?DisplayTime := 7.0)
                return
            set state.energy = updated
            show_ready(input_player)

    on_count(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.challenge <> 2):
                feedback.Show(input_player, manual_controls_text, ?DisplayTime := 7.0)
                return
            if (state.solved?):
                feedback.Show(input_player, solved_text, ?DisplayTime := 5.0)
                return
            set state.repeat_count += 1
            if (state.repeat_count > 5):
                set state.repeat_count = 1
            set state.energy = 0
            show_ready(input_player)

    on_start(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.solved?):
                feedback.Show(input_player, solved_text, ?DisplayTime := 5.0)
                return
            set running = true
            set generation += 1
            reset_door()
            spawn{execute(input_player, state.repeat_count, generation, progress.round_generation)}

    on_help(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            state := progress.ensure_player(input_player)
            set state.hint_level += 1
            if (state.hint_level = 1):
                feedback.Show(input_player, concept_text, ?DisplayTime := 10.0)
            else if (state.challenge = 2):
                feedback.Show(input_player, worked_repeat_text, ?DisplayTime := 10.0)
            else:
                feedback.Show(input_player, worked_manual_text(fixtures.target(state.challenge)), ?DisplayTime := 10.0)

    restart(input_player:player):void =
        set generation += 1
        set running = false
        state := progress.ensure_player(input_player)
        set state.energy = fixtures.start(state.challenge)
        set state.repeat_count = 1
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
            if (state.challenge = 2):
                feedback.Show(input_player, repeat_text, ?DisplayTime := 10.0)
            else:
                feedback.Show(input_player, manual_text, ?DisplayTime := 10.0)

    valid_run(input_player:player, token:int, round_token:int)<transacts><decides>:void =
        owner? = input_player
        generation = token
        progress.round_generation = round_token
        running?

    execute(input_player:player, count:int, token:int, round_token:int)<suspends>:void =
        if (not valid_run[input_player, token, round_token]):
            return
        state := progress.ensure_player(input_player)
        if (state.challenge = 2):
            set state.energy = 0
            show_board(input_player, initial_text)
            Sleep(0.7)
            for (step := 1..count):
                if (not valid_run[input_player, token, round_token]):
                    return
                set state.energy += 2
                show_board(input_player, addition_text(step, count))
                Sleep(0.7)
        if (not valid_run[input_player, token, round_token]):
            return
        if (state.energy <> fixtures.target(state.challenge)):
            set running = false
            explanation := wrong_text(state.energy, fixtures.target(state.challenge))
            show_board(input_player, explanation)
            feedback.Show(input_player, explanation, ?DisplayTime := 10.0)
            return
        set_door_label(opening_text)
        for (step := 1..20):
            if (not valid_run[input_player, token, round_token]):
                return
            var position:transform = door_home
            set position.Translation.Z += step * 17.5
            if (preview_door.TeleportTo[position]) {}
            Sleep(0.05)
        if (not valid_run[input_player, token, round_token]):
            return
        set_door_label(open_text)
        already_earned := state.badge_earned
        progress.complete(input_player)
        set running = false
        if (state.badge_earned?):
            show_board(input_player, complete_board_text)
            if (already_earned?):
                feedback.Show(input_player, retained_text, ?DisplayTime := 10.0)
            else:
                feedback.Show(input_player, complete_text, ?DisplayTime := 12.0)
        else:
            show_board(input_player, solved_text)
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
