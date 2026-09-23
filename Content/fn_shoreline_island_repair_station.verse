using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

fn_shoreline_island_repair_station := class(creative_device):
    @editable
    station_id:int = 0
    @editable
    progress:fn_shoreline_island_repair_progress = fn_shoreline_island_repair_progress{}
    @editable
    claim_button:button_device = button_device{}
    @editable
    slot_1:button_device = button_device{}
    @editable
    slot_2:button_device = button_device{}
    @editable
    slot_3:button_device = button_device{}
    @editable
    slot_4:button_device = button_device{}
    @editable
    run_button:button_device = button_device{}
    @editable
    help_button:button_device = button_device{}
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
    watered_stage:creative_prop = creative_prop{}
    @editable
    planted_stage:creative_prop = creative_prop{}
    @editable
    grown_stage:creative_prop = creative_prop{}
    @editable
    harvested_stage:creative_prop = creative_prop{}
    @editable
    hub_spawner_0:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_1:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_2:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_3:player_spawner_device = player_spawner_device{}

    var owner:?player = false
    var selected:int = -1
    var running:logic = false
    var generation:int = 0
    var observed_round:int = -1

    claim_text<localizes>:message = "Claim Fix the Prompt station"
    run_text<localizes>:message = "Run improved instructions"
    help_text<localizes>:message = "Help"
    replay_text<localizes>:message = "Replay unclear instructions"
    hub_text<localizes>:message = "Return to Academy Hub"
    available_text<localizes>(number:int):message = "FIX THE PROMPT | Station {number}\nOptional practice: improve Pix's instructions.\nPress CLAIM to begin."
    occupied_text<localizes>:message = "This station has a prompt editor. Choose another station."
    other_text<localizes>:message = "Leave your current Fix the Prompt station before claiming another."
    objective_text<localizes>:message = "Bring the blue data cube to the scanner. Swap two slots, then Run. Your Prompt Badge stays unchanged."
    concept_text<localizes>:message = "Think about what Pix must do before scanning the cube. Which two steps are out of order?"
    answer_text<localizes>:message = "Pix must walk to the scanner before Scan Cube. Swap slots 3 and 4, then Run."
    ready_text<localizes>:message = "Select two slots to swap, then Run."
    selected_text<localizes>(number:int):message = "Slot {number} selected. Choose another slot to swap."
    slot_text<localizes>(number:int, command:message):message = "Slot {number}: {command}"
    board_text<localizes>(gardener:agent, one:message, two:message, three:message, four:message, status_text:message):message = "Prompt editor: {gardener}\n1 {one} | 2 {two}\n3 {three} | 4 {four}\n{status_text}"
    water_text<localizes>:message = "Find Cube"
    plant_text<localizes>:message = "Pick Up Cube"
    wait_text<localizes>:message = "Walk to Scanner"
    harvest_text<localizes>:message = "Scan Cube"
    step_text<localizes>(number:int, command:message):message = "Step {number}: {command} OK"
    wrong_text<localizes>(number:int, expected:message):message = "Stopped at step {number}: Pix needs {expected} here. Swap slots and try again."
    complete_text<localizes>:message = "Prompt improved! Small changes can make instructions much clearer. Replay is optional; your Prompt Badge stays unchanged."
    complete_board_text<localizes>:message = "Prompt improved! Clear order helps Pix.\nReplay is optional."

    command_name(command:int):message =
        if (command = 0):
            return water_text
        if (command = 1):
            return plant_text
        if (command = 2):
            return wait_text
        return harvest_text

    OnBegin<override>()<suspends>:void =
        Hide()
        claim_button.SetInteractionText(claim_text)
        run_button.SetInteractionText(run_text)
        help_button.SetInteractionText(help_text)
        replay_button.SetInteractionText(replay_text)
        return_button.SetInteractionText(hub_text)
        for (input_button : array{claim_button, slot_1, slot_2, slot_3, slot_4, run_button, help_button, replay_button, return_button}):
            input_button.SetInteractionTime(0.0)
            input_button.SetMaxTriggerCount(0)
        claim_button.InteractedWithEvent.Subscribe(on_claim)
        slot_1.InteractedWithEvent.Subscribe(on_slot_1)
        slot_2.InteractedWithEvent.Subscribe(on_slot_2)
        slot_3.InteractedWithEvent.Subscribe(on_slot_3)
        slot_4.InteractedWithEvent.Subscribe(on_slot_4)
        run_button.InteractedWithEvent.Subscribe(on_run)
        help_button.InteractedWithEvent.Subscribe(on_help)
        replay_button.InteractedWithEvent.Subscribe(on_replay)
        return_button.InteractedWithEvent.Subscribe(on_return)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_removed)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        board.SetTextSize(12)
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

    clear_stages():void =
        for (stage_prop : array{watered_stage, planted_stage, grown_stage, harvested_stage}):
            stage_prop.Hide()

    release():void =
        if (input_player := owner?, state := progress.states[input_player], state.station_id = station_id):
            set state.station_id = -1
        set generation += 1
        set owner = false
        set running = false
        set selected = -1
        clear_stages()
        board.SetText(available_text(station_id + 1))
        board.UpdateDisplay()

    show_board(input_player:player, status_text:message):void =
        state := progress.ensure_player(input_player)
        if (one := state.program[0], two := state.program[1], three := state.program[2], four := state.program[3]):
            board.SetText(board_text(input_player, command_name(one), command_name(two), command_name(three), command_name(four), status_text))
            board.UpdateDisplay()
        for (index -> input_button : array{slot_1, slot_2, slot_3, slot_4}, command := state.program[index]):
            input_button.SetInteractionText(slot_text(index + 1, command_name(command)))

    on_claim(input_agent:agent):void =
        if (input_player := player[input_agent]):
            if (current := owner?):
                if (current = input_player):
                    feedback.Show(input_player, objective_text, ?DisplayTime := 8.0)
                else:
                    feedback.Show(input_player, occupied_text, ?DisplayTime := 5.0)
                return
            state := progress.ensure_player(input_player)
            if (state.station_id >= 0):
                feedback.Show(input_player, other_text, ?DisplayTime := 5.0)
                return
            set state.station_id = station_id
            set owner = option{input_player}
            set observed_round = progress.round_generation
            show_board(input_player, ready_text)
            feedback.Show(input_player, objective_text, ?DisplayTime := 8.0)

    on_slot_1(input_agent:agent):void =
        select_slot(input_agent, 0)
    on_slot_2(input_agent:agent):void =
        select_slot(input_agent, 1)
    on_slot_3(input_agent:agent):void =
        select_slot(input_agent, 2)
    on_slot_4(input_agent:agent):void =
        select_slot(input_agent, 3)

    select_slot(input_agent:agent, index:int):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (selected < 0):
                set selected = index
                show_board(input_player, selected_text(index + 1))
                return
            if (first_command := state.program[selected], second_command := state.program[index]):
                if (set state.program[selected] = second_command, set state.program[index] = first_command) {}
            set selected = -1
            clear_stages()
            show_board(input_player, ready_text)

    on_help(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            state := progress.ensure_player(input_player)
            set state.hint_level += 1
            if (state.hint_level = 1):
                feedback.Show(input_player, concept_text, ?DisplayTime := 10.0)
            else:
                feedback.Show(input_player, answer_text, ?DisplayTime := 10.0)

    on_replay(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            set generation += 1
            set running = false
            set selected = -1
            state := progress.ensure_player(input_player)
            set state.program = array{0, 1, 3, 2}
            set state.hint_level = 0
            clear_stages()
            show_board(input_player, ready_text)

    on_run(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            set selected = -1
            set running = true
            set generation += 1
            state := progress.ensure_player(input_player)
            clear_stages()
            spawn{execute_program(input_player, state.program, generation, progress.round_generation)}

    valid_run(input_player:player, token:int, round_token:int)<transacts><decides>:void =
        current := owner?
        current = input_player
        generation = token
        progress.round_generation = round_token
        running?

    execute_program(input_player:player, program:[]int, token:int, round_token:int)<suspends>:void =
        for (index -> command : program):
            if (not valid_run[input_player, token, round_token]):
                return
            if (command <> index):
                set running = false
                show_board(input_player, wrong_text(index + 1, command_name(index)))
                feedback.Show(input_player, wrong_text(index + 1, command_name(index)), ?DisplayTime := 8.0)
                return
            if (stage_prop := array{watered_stage, planted_stage, grown_stage, harvested_stage}[index]):
                stage_prop.Show()
            show_board(input_player, step_text(index + 1, command_name(command)))
            Sleep(1.0)
        if (valid_run[input_player, token, round_token]):
            set running = false
            state := progress.ensure_player(input_player)
            set state.completed = true
            show_board(input_player, complete_board_text)
            feedback.Show(input_player, complete_text, ?DisplayTime := 10.0)

    on_return(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            release()
        hub_destination.Teleport(input_agent)

    on_removed(input_player:player):void =
        if (current := owner?, current = input_player):
            release()

    on_spawn(input_agent:agent):void =
        if (current := owner?, current = input_agent):
            release()
