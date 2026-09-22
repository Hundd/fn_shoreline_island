using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

fn_shoreline_island_signal_station := class(creative_device):
    @editable
    station_id:int = 0
    @editable
    progress:fn_shoreline_island_signal_progress = fn_shoreline_island_signal_progress{}
    @editable
    claim_button:button_device = button_device{}
    @editable
    garden_button:button_device = button_device{}
    @editable
    workshop_button:button_device = button_device{}
    @editable
    storage_button:button_device = button_device{}
    @editable
    rule_button:button_device = button_device{}
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
    rule_board:billboard_device = billboard_device{}
    @editable
    cargo_board:billboard_device = billboard_device{}
    @editable
    boat:creative_prop = creative_prop{}
    @editable
    garden_dock:creative_prop = creative_prop{}
    @editable
    workshop_dock:creative_prop = creative_prop{}
    @editable
    storage_dock:creative_prop = creative_prop{}
    @editable
    hub_spawner_0:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_1:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_2:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_3:player_spawner_device = player_spawner_device{}

    fixtures:fn_shoreline_island_signal_fixtures = fn_shoreline_island_signal_fixtures{}
    apple_material:Academy.Cargo.mi_ai_classifier_apple = Academy.Cargo.mi_ai_classifier_apple{}
    puppy_material:Academy.Cargo.mi_ai_classifier_puppy = Academy.Cargo.mi_ai_classifier_puppy{}
    car_material:Academy.Cargo.mi_ai_classifier_car = Academy.Cargo.mi_ai_classifier_car{}
    var owner:?player = false
    var running:logic = false
    var generation:int = 0
    var observed_round:int = -1
    var boat_home:transform = transform{}
    var cargo_home:transform = transform{}

    claim_text<localizes>:message = "Claim classifier station"
    garden_text<localizes>:message = "Classify as Food"
    workshop_text<localizes>:message = "Classify as Animal"
    storage_text<localizes>:message = "Classify as Vehicle"
    rule_text<localizes>:message = "Change rule A / B / C"
    run_text<localizes>:message = "Run selected rule"
    help_text<localizes>:message = "Help"
    next_text<localizes>:message = "Next challenge / Replay all"
    replay_text<localizes>:message = "Replay current queue"
    return_text<localizes>:message = "Return to Academy Hub"
    available_text<localizes>(number:int):message = "AI CLASSIFIER | Station {number}\nPress CLAIM to sort incoming items."
    occupied_text<localizes>:message = "This classifier is in use. Choose another station."
    other_text<localizes>:message = "Leave your current classifier before claiming another."
    manual_text<localizes>:message = "Read the incoming item, then choose its category."
    final_text<localizes>:message = "Read the whole item queue. Choose a classification rule, then Run. Watch each item reach its category."
    workshop_later_text<localizes>:message = "Animal opens in challenge 2. Here, APPLE is Food and CAR is Vehicle."
    manual_only_text<localizes>:message = "Choose a category for this item. Rules begin in challenge 3."
    rule_only_text<localizes>:message = "For this queue, choose a classification rule and press Run."
    finish_text<localizes>:message = "Classify this queue first. Help is always available."
    ready_text<localizes>:message = "Choose a category."
    ready_rule_text<localizes>:message = "Choose a rule, then Run."
    solved_text<localizes>:message = "Queue classified! Press Next."
    complete_text<localizes>:message = "Classifier Badge earned! Classification means putting things into categories. Replay or return to the hub."
    retained_text<localizes>:message = "Queue classified again! Your Classifier Badge stays earned for this round."
    complete_board_text<localizes>:message = "Classifier Badge earned! Replay is optional."
    first_rule_text<localizes>:message = "If APPLE: Food. Otherwise: Vehicle."
    second_rule_text<localizes>:message = "If APPLE: Food. If PUPPY: Animal.\nOtherwise: Vehicle."
    all_rules_text<localizes>:message = "Rule | APPLE / PUPPY / CAR\nA | Food / Animal / Vehicle\nB | Vehicle / Animal / Food\nC | Food / Food / Vehicle"
    concept_text<localizes>:message = "Classification means checking an item and choosing its category. Does every choice match the item?"
    worked_rule_text<localizes>:message = "Try Rule A: APPLE is Food, PUPPY is Animal, and CAR is Vehicle. It matches the whole queue."
    worked_manual_text<localizes>(cargo:string, destination:string):message = "This item is {cargo}. Classify it as {destination}. Then check the next label."
    cargo_text<localizes>(cargo:string):message = "INCOMING ITEM: {cargo}"
    empty_cargo_text<localizes>:message = "INCOMING ITEM QUEUE"
    board_text<localizes>(input_player:agent, challenge:int, queue:string, position:int, total:int, rule:string, status:message):message = "Classifier: {input_player} | Challenge {challenge}\nItems: {queue}\nItem {position}/{total} | Rule {rule}\n{status}"
    manual_board_text<localizes>(input_player:agent, challenge:int, queue:string, position:int, total:int, status:message):message = "Classifier: {input_player} | Challenge {challenge}\nItems: {queue}\nItem {position}/{total}\n{status}"
    moving_text<localizes>(cargo:string, destination:string):message = "{cargo} classified as {destination}"
    wrong_text<localizes>(cargo:string, actual:string, expected:string):message = "{cargo} was classified as {actual}; it belongs in {expected}. Try again."
    delivered_text<localizes>(cargo:string, destination:string):message = "{cargo} classified as {destination}."

    OnBegin<override>()<suspends>:void =
        Hide()
        set boat_home = boat.GetTransform()
        set cargo_home = cargo_board.GetTransform()
        claim_button.SetInteractionText(claim_text)
        garden_button.SetInteractionText(garden_text)
        workshop_button.SetInteractionText(workshop_text)
        storage_button.SetInteractionText(storage_text)
        rule_button.SetInteractionText(rule_text)
        run_button.SetInteractionText(run_text)
        help_button.SetInteractionText(help_text)
        next_button.SetInteractionText(next_text)
        replay_button.SetInteractionText(replay_text)
        return_button.SetInteractionText(return_text)
        for (input_button : array{claim_button, garden_button, workshop_button, storage_button, rule_button, run_button, help_button, next_button, replay_button, return_button}):
            input_button.SetInteractionTime(0.0)
            input_button.SetMaxTriggerCount(0)
        claim_button.InteractedWithEvent.Subscribe(on_claim)
        garden_button.InteractedWithEvent.Subscribe(on_garden)
        workshop_button.InteractedWithEvent.Subscribe(on_workshop)
        storage_button.InteractedWithEvent.Subscribe(on_storage)
        rule_button.InteractedWithEvent.Subscribe(on_rule)
        run_button.InteractedWithEvent.Subscribe(on_run)
        help_button.InteractedWithEvent.Subscribe(on_help)
        next_button.InteractedWithEvent.Subscribe(on_next)
        replay_button.InteractedWithEvent.Subscribe(on_replay)
        return_button.InteractedWithEvent.Subscribe(on_return)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_removed)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        board.SetTextSize(12)
        rule_board.SetTextSize(12)
        cargo_board.SetTextSize(12)
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

    reset_boat():void =
        if (boat.TeleportTo[boat_home]) {}
        if (cargo_board.TeleportTo[cargo_home]) {}

    show_cargo(cargo:int):void =
        if (cargo = 0):
            boat.SetMaterial(apple_material)
        else if (cargo = 1):
            boat.SetMaterial(puppy_material)
        else:
            boat.SetMaterial(car_material)
        cargo_board.SetText(cargo_text(fixtures.cargo_name(cargo)))
        cargo_board.UpdateDisplay()

    release():void =
        if (input_player := owner?, state := progress.states[input_player], state.station_id = station_id):
            set state.station_id = -1
            if (state.challenge = 2, not state.solved?):
                set state.cursor = 0
        set generation += 1
        set running = false
        set owner = false
        reset_boat()
        boat.SetMaterial(car_material)
        board.SetText(available_text(station_id + 1))
        board.UpdateDisplay()
        rule_board.SetText(first_rule_text)
        rule_board.UpdateDisplay()
        cargo_board.SetText(empty_cargo_text)
        cargo_board.UpdateDisplay()

    show_board(input_player:player, status:message):void =
        state := progress.ensure_player(input_player)
        queue := fixtures.queue(state.challenge)
        var position:int = state.cursor + 1
        if (position > queue.Length):
            set position = queue.Length
        if (state.challenge = 2):
            board.SetText(board_text(input_player, state.challenge + 1, fixtures.queue_text(state.challenge), position, queue.Length, fixtures.rule_name(state.selected_rule), status))
        else:
            board.SetText(manual_board_text(input_player, state.challenge + 1, fixtures.queue_text(state.challenge), position, queue.Length, status))
        board.UpdateDisplay()
        if (state.challenge = 0):
            rule_board.SetText(first_rule_text)
        else if (state.challenge = 1):
            rule_board.SetText(second_rule_text)
        else:
            rule_board.SetText(all_rules_text)
        rule_board.UpdateDisplay()

    show_ready(input_player:player):void =
        state := progress.ensure_player(input_player)
        reset_boat()
        if (cargo := fixtures.queue(state.challenge)[state.cursor]):
            show_cargo(cargo)
        if (state.solved?):
            show_board(input_player, solved_text)
        else if (state.challenge = 2):
            show_board(input_player, ready_rule_text)
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
                feedback.Show(input_player, final_text, ?DisplayTime := 10.0)
            else:
                feedback.Show(input_player, manual_text, ?DisplayTime := 10.0)

    on_garden(input_agent:agent):void =
        choose_destination(input_agent, 0)
    on_workshop(input_agent:agent):void =
        choose_destination(input_agent, 1)
    on_storage(input_agent:agent):void =
        choose_destination(input_agent, 2)

    choose_destination(input_agent:agent, destination:int):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.solved?):
                feedback.Show(input_player, solved_text, ?DisplayTime := 5.0)
                return
            if (state.challenge = 2):
                feedback.Show(input_player, rule_only_text, ?DisplayTime := 5.0)
                return
            if (state.challenge = 0, destination = 1):
                feedback.Show(input_player, workshop_later_text, ?DisplayTime := 8.0)
                return
            set running = true
            set generation += 1
            spawn{execute_manual(input_player, destination, generation, progress.round_generation)}

    on_rule(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.challenge <> 2):
                feedback.Show(input_player, manual_only_text, ?DisplayTime := 5.0)
                return
            if (state.solved?):
                return
            set state.selected_rule += 1
            if (state.selected_rule > 2):
                set state.selected_rule = 0
            set state.cursor = 0
            show_ready(input_player)

    on_run(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.challenge <> 2):
                feedback.Show(input_player, manual_only_text, ?DisplayTime := 5.0)
                return
            if (state.solved?):
                feedback.Show(input_player, solved_text, ?DisplayTime := 5.0)
                return
            set state.cursor = 0
            set running = true
            set generation += 1
            spawn{execute_rule(input_player, state.selected_rule, generation, progress.round_generation)}

    on_help(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            state := progress.ensure_player(input_player)
            set state.hint_level += 1
            if (state.hint_level = 1):
                feedback.Show(input_player, concept_text, ?DisplayTime := 10.0)
            else if (state.challenge = 2):
                feedback.Show(input_player, worked_rule_text, ?DisplayTime := 10.0)
            else if (cargo := fixtures.queue(state.challenge)[state.cursor]):
                feedback.Show(input_player, worked_manual_text(fixtures.cargo_name(cargo), fixtures.destination_name(cargo)), ?DisplayTime := 10.0)
            else:
                feedback.Show(input_player, solved_text, ?DisplayTime := 5.0)

    restart_queue(input_player:player):void =
        set generation += 1
        set running = false
        state := progress.ensure_player(input_player)
        set state.cursor = 0
        set state.hint_level = 0
        set state.solved = false
        set state.selected_rule = 1
        show_ready(input_player)

    on_replay(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            restart_queue(input_player)

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
            restart_queue(input_player)
            if (state.challenge = 2):
                feedback.Show(input_player, final_text, ?DisplayTime := 10.0)
            else:
                feedback.Show(input_player, manual_text, ?DisplayTime := 10.0)

    valid_run(input_player:player, token:int, round_token:int)<transacts><decides>:void =
        owner? = input_player
        generation = token
        progress.round_generation = round_token
        running?

    sail(input_player:player, cargo:int, destination:int, token:int, round_token:int)<suspends>:void =
        if (not valid_run[input_player, token, round_token]):
            return
        reset_boat()
        show_cargo(cargo)
        show_board(input_player, moving_text(fixtures.cargo_name(cargo), fixtures.destination_name(destination)))
        if (dock := array{garden_dock, workshop_dock, storage_dock}[destination]):
            # Moor in front of the dock so the boat remains visible on arrival.
            delta := dock.GetTransform().Translation + vector3{Y := -300.0} - boat_home.Translation
            for (step := 1..20):
                if (not valid_run[input_player, token, round_token]):
                    return
                var position:transform = boat_home
                set position.Translation = boat_home.Translation + delta * (step * 0.05)
                var label_position:transform = cargo_home
                set label_position.Translation = cargo_home.Translation + delta * (step * 0.05)
                if (boat.TeleportTo[position]) {}
                if (cargo_board.TeleportTo[label_position]) {}
                Sleep(0.1)
        Sleep(0.5)

    finish_queue(input_player:player):void =
        state := progress.ensure_player(input_player)
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

    show_mismatch(input_player:player, cargo:int, destination:int):void =
        set running = false
        explanation := wrong_text(fixtures.cargo_name(cargo), fixtures.destination_name(destination), fixtures.destination_name(cargo))
        show_board(input_player, explanation)
        feedback.Show(input_player, explanation, ?DisplayTime := 10.0)

    execute_manual(input_player:player, destination:int, token:int, round_token:int)<suspends>:void =
        if (not valid_run[input_player, token, round_token]):
            return
        state := progress.ensure_player(input_player)
        queue := fixtures.queue(state.challenge)
        if (cargo := queue[state.cursor]):
            sail(input_player, cargo, destination, token, round_token)
            if (not valid_run[input_player, token, round_token]):
                return
            if (destination <> cargo):
                show_mismatch(input_player, cargo, destination)
                return
            feedback.Show(input_player, delivered_text(fixtures.cargo_name(cargo), fixtures.destination_name(destination)), ?DisplayTime := 6.0)
            set state.cursor += 1
            if (state.cursor = queue.Length):
                finish_queue(input_player)
            else:
                set running = false
                show_ready(input_player)

    execute_rule(input_player:player, rule:int, token:int, round_token:int)<suspends>:void =
        for (index -> cargo : fixtures.queue(2)):
            if (not valid_run[input_player, token, round_token]):
                return
            state := progress.ensure_player(input_player)
            set state.cursor = index
            destination := fixtures.route(rule, cargo)
            sail(input_player, cargo, destination, token, round_token)
            if (not valid_run[input_player, token, round_token]):
                return
            if (destination <> cargo):
                show_mismatch(input_player, cargo, destination)
                return
            show_board(input_player, delivered_text(fixtures.cargo_name(cargo), fixtures.destination_name(destination)))
            Sleep(0.5)
        if (valid_run[input_player, token, round_token]):
            state := progress.ensure_player(input_player)
            set state.cursor = fixtures.queue(2).Length
            finish_queue(input_player)

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
