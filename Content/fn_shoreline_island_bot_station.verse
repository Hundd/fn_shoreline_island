using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

fn_shoreline_island_bot_station := class(creative_device):
    @editable
    station_id:int = 0
    @editable
    progress:fn_shoreline_island_bot_progress = fn_shoreline_island_bot_progress{}
    # Read-only status source shared by all Agent Mission stations.
    @editable
    academy_journal:fn_shoreline_island_academy_journal = fn_shoreline_island_academy_journal{}
    @editable
    claim_button:button_device = button_device{}
    @editable
    slot_0_button:button_device = button_device{}
    @editable
    slot_1_button:button_device = button_device{}
    @editable
    slot_2_button:button_device = button_device{}
    @editable
    repeat_button:button_device = button_device{}
    @editable
    energy_button:button_device = button_device{}
    @editable
    connection_button:button_device = button_device{}
    @editable
    rule_button:button_device = button_device{}
    @editable
    cargo_button:button_device = button_device{}
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
    mission_board:billboard_device = billboard_device{}
    @editable
    program_board:billboard_device = billboard_device{}
    @editable
    execution_board:billboard_device = billboard_device{}
    @editable
    robot:creative_prop = creative_prop{}
    @editable
    seed:creative_prop = creative_prop{}
    @editable
    parcel:creative_prop = creative_prop{}
    @editable
    lamp_1:creative_prop = creative_prop{}
    @editable
    lamp_2:creative_prop = creative_prop{}
    @editable
    lamp_3:creative_prop = creative_prop{}
    @editable
    hub_spawner_0:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_1:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_2:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_3:player_spawner_device = player_spawner_device{}

    @editable
    label_claim:billboard_device = billboard_device{}
    @editable
    label_slot_0:billboard_device = billboard_device{}
    @editable
    label_slot_1:billboard_device = billboard_device{}
    @editable
    label_slot_2:billboard_device = billboard_device{}
    @editable
    label_repeat:billboard_device = billboard_device{}
    @editable
    label_energy:billboard_device = billboard_device{}
    @editable
    label_connection:billboard_device = billboard_device{}
    @editable
    label_rule:billboard_device = billboard_device{}
    @editable
    label_cargo:billboard_device = billboard_device{}
    @editable
    label_run:billboard_device = billboard_device{}
    @editable
    label_help:billboard_device = billboard_device{}
    @editable
    label_next:billboard_device = billboard_device{}
    @editable
    label_replay:billboard_device = billboard_device{}
    @editable
    label_return:billboard_device = billboard_device{}
    @editable
    label_home:billboard_device = billboard_device{}
    @editable
    label_cell1:billboard_device = billboard_device{}
    @editable
    label_cell2:billboard_device = billboard_device{}
    @editable
    label_cell3:billboard_device = billboard_device{}
    @editable
    label_garden:billboard_device = billboard_device{}
    @editable
    label_storage:billboard_device = billboard_device{}

    fixtures:fn_shoreline_island_bot_fixtures = fn_shoreline_island_bot_fixtures{}
    var owner:?player = false
    var running:logic = false
    var generation:int = 0
    var observed_round:int = -1
    var robot_home:transform = transform{}
    var seed_home:transform = transform{}
    var parcel_home:transform = transform{}
    var lamp_homes:[]transform = array{}

    claim_text<localizes>:message = "Claim AI Agent Mission"
    slot_text<localizes>(number:int):message = "Edit agent plan command {number}"
    repeat_text<localizes>:message = "Change repeat count (1-4)"
    energy_text<localizes>:message = "Change starting energy (0-6)"
    connection_text<localizes>:message = "Choose Launch tool connection"
    rule_text<localizes>:message = "Choose classification rule"
    cargo_text<localizes>:message = "Change test item"
    run_text<localizes>:message = "Run agent plan / Try Launch"
    help_text<localizes>:message = "Help / Worked answer"
    next_text<localizes>:message = "Next stage / Replay mission"
    replay_text<localizes>:message = "Replay this stage"
    return_text<localizes>:message = "Return to Academy Hub"
    occupied_text<localizes>:message = "This robot is in use. Choose another station."
    other_text<localizes>:message = "Leave your current robot station before claiming another."
    locked_text<localizes>:message = "Agent Mode is LOCKED. Restore Pix's first seven AI Core modules, then return here."
    unused_text<localizes>:message = "This control belongs to another mission stage."
    wait_text<localizes>:message = "Finish this stage first. Help shows a worked answer."
    available_text<localizes>(number:int):message = "AI AGENT MISSION | Station {number}\nHelp Pix combine restored abilities. Claim to begin.\n1 Follow instructions | 2 Use a repeat pattern | 3 Classify an item"
    seed_goal<localizes>:message = "INSTRUCTIONS: Pick up at Home, move to cell 3, then Drop."
    dock_goal<localizes>:message = "PATTERN: Light cells 1, 2, 3. Finish with energy 0."
    route_goal<localizes>:message = "CLASSIFY: Launch Apple to Food and Car to Vehicle."
    mission_text<localizes>(goal:message, seed_done:message, dock_done:message, route_done:message):message = "PIX'S AI AGENT MISSION\nInstructions: {seed_done} | Pattern: {dock_done} | Classify: {route_done}\n{goal}"
    done_text<localizes>:message = "done"
    pending_text<localizes>:message = "to do"
    solved_text<localizes>:message = "Stage complete! Next or Replay."
    agent_mode_text<localizes>:message = "We did it! Pix's Agent Mode is online.\nYou taught Pix to follow instructions, spot patterns, classify items, use tools, and combine skills.\nCheck your AI Core Journal to see every restored module. AI can help with a task, and people should check important decisions.\nAI Agent Badge earned."
    final_text<localizes>:message = "PIX AI CORE FULLY RESTORED!\nInstructions, Patterns, Classification, Confidence, Error Checking, Tools, Skills, and Agent Mode are ONLINE.\nWe did it! AI can help with a task, and people should check important decisions.\nAI Agent Badge earned."
    retained_text<localizes>:message = "Mission completed again! Your AI Agent Badge and earlier badges stay earned."
    ready_text<localizes>:message = "Ready. Run to see each command."
    pickup_name<localizes>:message = "Pickup"
    move_name<localizes>:message = "Move"
    repeat_move_name<localizes>:message = "Repeat Move"
    drop_name<localizes>:message = "Drop"
    light_name<localizes>:message = "Light"
    home_name<localizes>:message = "Start at Home"
    empty_name<localizes>:message = "empty"
    seed_name<localizes>:message = "seed"
    leaf_name<localizes>:message = "Apple"
    plain_name<localizes>:message = "Car"
    garden_name<localizes>:message = "Food"
    storage_name<localizes>:message = "Vehicle"
    disconnected_name<localizes>:message = "Disconnected"
    dispatch_name<localizes>:message = "Dispatch"
    all_garden_name<localizes>:message = "All items > Food"
    all_storage_name<localizes>:message = "All items > Vehicle"
    condition_name<localizes>:message = "If Apple > Food; else > Vehicle"
    reversed_name<localizes>:message = "If Apple > Vehicle; else > Food"
    seed_program_text<localizes>(a:message, b:message, c:message, count:int):message = "AGENT PLAN: INSTRUCTIONS\n1 {a} | 2 {b} | 3 {c}\nRepeat Move count: {count}\nChoices: Pickup, Repeat Move, Drop"
    dock_program_text<localizes>(a:message, b:message, count:int, energy:int):message = "AGENT PLAN: PATTERN\nRepeat {count} [1 {a}, 2 {b}]\nStarting energy: {energy} | Light costs 1\nChoices: Move, Light"
    route_program_text<localizes>(connection:message, rule:message, cargo:message, leaf:message, plain:message):message = "AGENT PLAN: CLASSIFY\nLaunch > {connection}\n{rule}\nTest: {cargo} | Apple: {leaf} | Car: {plain}"
    execution_text<localizes>(command:message, iteration:int, position:int, energy:int, inventory:message, lights:int):message = "NOW: {command} | Repeat step: {iteration}\nCell: {position} | Energy: {energy}\nHand: {inventory} | Dock lamps ON: {lights}/3"
    route_result_text<localizes>(cargo:message, destination_label:message, outcome:message):message = "EVENT: Launch > Dispatch\nCargo: {cargo} > {destination_label}\n{outcome}"
    route_pass_text<localizes>:message = "PASS. Test the other cargo too."
    route_complete_text<localizes>:message = "PASS. Both cargo tests complete. Replay or return to the hub."
    cell_label<localizes>(cell:int):message = "CELL {cell}"
    home_label<localizes>:message = "HOME\nCELL 0"
    planter_label<localizes>:message = "CELL 3\nPLANTER"
    route_fail_text<localizes>:message = "Wrong category. Apple needs Food; Car needs Vehicle. Change the rule and test both again."
    disconnected_text<localizes>:message = "Launch fired, but it has no connection. Connect Launch to Dispatch."
    error_text<localizes>(reason:message):message = "STOPPED SAFELY: {reason}\nChange the program and Run again."
    pickup_position_error<localizes>:message = "The seed is at Home. Pickup must happen before moving."
    pickup_twice_error<localizes>:message = "This seed was already picked up."
    move_error<localizes>:message = "The path ends at cell 3. Reduce the moves."
    drop_empty_error<localizes>:message = "The robot is not carrying the seed. Pickup first."
    drop_position_error<localizes>:message = "The planter is at cell 3. Move there before Drop."
    light_home_error<localizes>:message = "There is no lamp at Home. Move to the first lamp."
    light_twice_error<localizes>:message = "This lamp is already ON. Move to the next lamp."
    empty_energy_error<localizes>:message = "Light needs one energy. Increase starting energy."
    no_delivery_error<localizes>:message = "The seed has not been dropped at cell 3."
    lamps_error<localizes>:message = "Light all three lamps in order."
    extra_energy_error<localizes>:message = "The dock goal needs energy 0 at the end. Reduce starting energy."
    final_position_error<localizes>:message = "Finish at cell 3."
    invalid_error<localizes>:message = "Choose the commands and values shown for this stage."
    seed_hint<localizes>:message = "Pick up before moving. Repeat Move reaches the planter; Drop finishes delivery."
    seed_worked<localizes>:message = "Set Pickup / Repeat Move / Drop, repeat count 3. Press Run."
    dock_hint<localizes>:message = "Move to a lamp, then Light it. Each Light spends one energy."
    dock_worked<localizes>:message = "Set Repeat 3 [Move, Light], starting energy 3. Press Run."
    route_hint<localizes>:message = "Launch needs a tool connection. The category rule must choose a destination for both items."
    route_worked<localizes>:message = "Choose Launch > Dispatch. Choose If Apple > Food; else > Vehicle. Run Apple, change item, then run Car."

    OnBegin<override>()<suspends>:void =
        Hide()
        set robot_home = robot.GetTransform()
        set seed_home = seed.GetTransform()
        set parcel_home = parcel.GetTransform()
        set lamp_homes = array{lamp_1.GetTransform(), lamp_2.GetTransform(), lamp_3.GetTransform()}
        controls := array{claim_button, slot_0_button, slot_1_button, slot_2_button, repeat_button,
            energy_button, connection_button, rule_button, cargo_button, run_button,
            help_button, next_button, replay_button, return_button}
        names := array{claim_text, slot_text(1), slot_text(2), slot_text(3), repeat_text,
            energy_text, connection_text, rule_text, cargo_text, run_text,
            help_text, next_text, replay_text, return_text}
        for (index -> control : controls, text := names[index]):
            control.SetInteractionText(text)
            control.SetInteractionTime(0.0)
            control.SetMaxTriggerCount(0)
        claim_button.InteractedWithEvent.Subscribe(on_claim)
        slot_0_button.InteractedWithEvent.Subscribe(on_slot_0)
        slot_1_button.InteractedWithEvent.Subscribe(on_slot_1)
        slot_2_button.InteractedWithEvent.Subscribe(on_slot_2)
        repeat_button.InteractedWithEvent.Subscribe(on_repeat)
        energy_button.InteractedWithEvent.Subscribe(on_energy)
        connection_button.InteractedWithEvent.Subscribe(on_connection)
        rule_button.InteractedWithEvent.Subscribe(on_rule)
        cargo_button.InteractedWithEvent.Subscribe(on_cargo)
        run_button.InteractedWithEvent.Subscribe(on_run)
        help_button.InteractedWithEvent.Subscribe(on_help)
        next_button.InteractedWithEvent.Subscribe(on_next)
        replay_button.InteractedWithEvent.Subscribe(on_replay)
        return_button.InteractedWithEvent.Subscribe(on_return)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_removed)
        GetPlayspace().PlayerAddedEvent().Subscribe(on_joined)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        for (board : array{mission_board, program_board, execution_board}):
            board.SetTextSize(10)
        release()
        refresh_labels()
        spawn{refresh_after_join()}
        loop:
            Sleep(0.25)
            if (observed_round <> progress.round_generation):
                set observed_round = progress.round_generation
                release()
            if (input_player := owner?):
                if (character := input_player.GetFortCharacter[], character.IsActive[]):
                    if (Distance(character.GetTransform().Translation, GetTransform().Translation) > 1500.0):
                        release()
                else:
                    release()

    display(board:billboard_device, text:message):void =
        board.SetText(text)
        board.ShowText()
        board.UpdateDisplay()

    refresh_labels():void =
        labels := array{label_claim, label_slot_0, label_slot_1, label_slot_2,
            label_repeat, label_energy, label_connection, label_rule, label_cargo,
            label_run, label_help, label_next, label_replay, label_return,
            label_home, label_cell1, label_cell2, label_cell3, label_garden, label_storage}
        texts := array{claim_text, slot_text(1), slot_text(2), slot_text(3),
            repeat_text, energy_text, connection_text, rule_text, cargo_text,
            run_text, help_text, next_text, replay_text, return_text,
            home_label, cell_label(1), cell_label(2), planter_label, garden_name, storage_name}
        for (index -> label : labels, text := texts[index]):
            display(label, text)
        for (label : array{label_home, label_cell1, label_cell2, label_cell3, label_garden, label_storage}):
            label.SetTextSize(24)
        if (input_player := owner?):
            show_stage_props(progress.ensure_player(input_player).stage)
        else:
            show_stage_props(0)

    on_joined(input_player:player):void =
        spawn{refresh_after_join()}

    refresh_after_join()<suspends>:void =
        Sleep(2.0)
        refresh_labels()
        if (input_player := owner?):
            show_board(input_player)
        else:
            display(mission_board, available_text(station_id + 1))
            display(program_board, ready_text)
            display(execution_board, ready_text)

    show_stage_props(stage:int):void =
        robot.Show()
        for (label : array{label_home, label_cell1, label_cell2, label_cell3}):
            label.ShowText()
        label_garden.HideText()
        label_storage.HideText()
        seed.Hide()
        parcel.Hide()
        for (lamp : array{lamp_1, lamp_2, lamp_3}):
            lamp.Hide()
        if (stage = 0):
            seed.Show()
            display(label_cell3, planter_label)
        else if (stage = 1):
            display(label_cell3, cell_label(3))
            for (lamp : array{lamp_1, lamp_2, lamp_3}):
                lamp.Show()
        else:
            parcel.Show()
            if (not running?):
                if (robot.TeleportTo[parcel_robot_pose()]) {}
            for (label : array{label_home, label_cell1, label_cell2, label_cell3}):
                label.HideText()
            label_garden.ShowText()
            label_storage.ShowText()

    show_route_result(state:bot_player_progress):void =
        if (state.last_route < 0):
            display(execution_board, ready_text)
            return
        var outcome:message = route_fail_text
        if (state.last_route = state.cargo):
            set outcome = route_pass_text
            if (state.route_passed[0]?, state.route_passed[1]?):
                set outcome = route_complete_text
        display(execution_board, route_result_text(cargo_name(state.cargo), destination_name(state.last_route), outcome))

    command_name(command:int):message =
        case (command):
            0 => pickup_name
            1 => move_name
            2 => drop_name
            3 => light_name
            _ => home_name

    seed_command_name(command:int):message =
        if (command = 1):
            return repeat_move_name
        return command_name(command)

    done_name(done:logic):message =
        if (done?):
            return done_text
        return pending_text

    rule_name(rule:int):message =
        case (rule):
            0 => all_garden_name
            1 => all_storage_name
            2 => condition_name
            _ => reversed_name

    cargo_name(cargo:int):message =
        if (cargo = 0):
            return leaf_name
        return plain_name

    destination_name(destination_id:int):message =
        if (destination_id = 0):
            return garden_name
        return storage_name

    failure_name(error:int):message =
        case (error):
            1 => pickup_position_error
            2 => pickup_twice_error
            3 => move_error
            4 => drop_empty_error
            5 => drop_position_error
            6 => light_home_error
            7 => light_twice_error
            8 => empty_energy_error
            9 => no_delivery_error
            10 => lamps_error
            11 => extra_energy_error
            12 => final_position_error
            _ => invalid_error

    core_is_restored(input_player:player)<transacts>:logic =
        if (academy_journal.completed_modules(input_player) >= 8):
            return true
        return false

    agent_mission_ready(input_player:player)<transacts>:logic =
        if (academy_journal.completed_modules(input_player) >= 7):
            return true
        return false

    objective(input_player:player, state:bot_player_progress):message =
        if (state.solved?):
            if (state.badge_earned?):
                if (core_is_restored(input_player)?):
                    return final_text
                return agent_mode_text
            return solved_text
        case (state.stage):
            0 => seed_goal
            1 => dock_goal
            _ => route_goal

    show_board(input_player:player):void =
        state := progress.ensure_player(input_player)
        show_stage_props(state.stage)
        if (a := state.completed[0], b := state.completed[1], c := state.completed[2]):
            display(mission_board, mission_text(objective(input_player, state), done_name(a), done_name(b), done_name(c)))
        if (state.stage = 0, a := state.seed_program[0], b := state.seed_program[1], c := state.seed_program[2]):
            display(program_board, seed_program_text(seed_command_name(a), seed_command_name(b), seed_command_name(c), state.repeats))
        else if (state.stage = 1, a := state.dock_program[0], b := state.dock_program[1]):
            display(program_board, dock_program_text(command_name(a), command_name(b), state.repeats, state.initial_energy))
        else if (state.stage = 2, leaf := state.route_passed[0], plain := state.route_passed[1]):
            var connection:message = disconnected_name
            if (state.launch_connection = 1):
                set connection = dispatch_name
            display(program_board, route_program_text(connection, rule_name(state.route_rule), cargo_name(state.cargo), done_name(leaf), done_name(plain)))

    frame_text(frame:bot_execution_frame):message =
        var inventory:message = empty_name
        if (frame.carrying?):
            set inventory = seed_name
        return execution_text(command_name(frame.command.instruction), frame.command.iteration,
            frame.position, frame.energy, inventory, frame.lights)

    robot_pose(frame:bot_execution_frame)<transacts>:transform =
        var pose:transform = robot_home
        set pose.Translation.X -= frame.position * 240.0
        return pose

    seed_pose(frame:bot_execution_frame)<transacts>:transform =
        var pose:transform = seed_home
        if (frame.carrying?):
            set pose.Translation = robot_pose(frame).Translation
            set pose.Translation.Z += 100.0
        else if (frame.delivered?):
            set pose.Translation = robot_home.Translation
            set pose.Translation.X -= 720.0
            set pose.Translation.Y += 300.0
        return pose

    route_pose(destination_id:int)<transacts>:transform =
        var pose:transform = parcel_home
        if (destination_id >= 0):
            set pose.Translation.Y += 480.0
            if (destination_id = 0):
                set pose.Translation.X += 480.0
            else:
                set pose.Translation.X -= 480.0
        return pose

    parcel_robot_pose()<transacts>:transform =
        var pose:transform = robot_home
        set pose.Translation.Y += 1000.0
        return pose

    render_frame(frame:bot_execution_frame):void =
        var robot_target:transform = robot_pose(frame)
        if (input_player := owner?, state := progress.states[input_player], state.stage = 2):
            set robot_target = parcel_robot_pose()
        if (robot.TeleportTo[robot_target]) {}
        if (seed.TeleportTo[seed_pose(frame)]) {}
        for (index -> lamp : array{lamp_1, lamp_2, lamp_3}, home := lamp_homes[index]):
            var pose:transform = home
            if (index < frame.lights):
                set pose.Translation.Z += 100.0
            if (lamp.TeleportTo[pose]) {}

    reset_props():void =
        render_frame(bot_execution_frame{})
        if (parcel.TeleportTo[parcel_home]) {}

    release():void =
        if (input_player := owner?, state := progress.states[input_player], state.station_id = station_id):
            set state.station_id = -1
            if (running?):
                set state.last_frame = bot_execution_frame{energy := state.initial_energy}
                set state.last_error = -1
                set state.last_route = -1
        set generation += 1
        set running = false
        set owner = false
        reset_props()
        show_stage_props(0)
        display(mission_board, available_text(station_id + 1))
        display(program_board, ready_text)
        display(execution_board, ready_text)

    on_claim(input_agent:agent):void =
        if (input_player := player[input_agent]):
            if (current := owner?):
                if (current <> input_player):
                    feedback.Show(input_player, occupied_text, ?DisplayTime := 5.0)
                return
            state := progress.ensure_player(input_player)
            if (not state.badge_earned?, not agent_mission_ready(input_player)?):
                feedback.Show(input_player, locked_text, ?DisplayTime := 8.0)
                return
            if (state.station_id >= 0):
                feedback.Show(input_player, other_text, ?DisplayTime := 5.0)
                return
            set owner = option{input_player}
            set state.station_id = station_id
            set observed_round = progress.round_generation
            render_frame(state.last_frame)
            if (parcel.TeleportTo[route_pose(state.last_route)]) {}
            show_board(input_player)
            refresh_labels()
            display(execution_board, frame_text(state.last_frame))
            if (state.stage = 2):
                show_route_result(state)
            if (state.last_error > 0):
                display(execution_board, error_text(failure_name(state.last_error)))
            feedback.Show(input_player, objective(input_player, state), ?DisplayTime := 10.0)

    changed(input_player:player):void =
        state := progress.ensure_player(input_player)
        set state.solved = false
        set state.last_frame = bot_execution_frame{energy := state.initial_energy}
        set state.last_error = -1
        set state.last_route = -1
        reset_props()
        display(execution_board, ready_text)
        show_board(input_player)

    edit(input_agent:agent, control:int):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            var used:logic = false
            if (control < 3):
                if (state.stage = 0, current := state.seed_program[control]):
                    if (set state.seed_program[control] = fixtures.cycle(current, 2)):
                        set used = true
                else if (state.stage = 1, current := state.dock_program[control]):
                    var next:int = 1
                    if (current = 1):
                        set next = 3
                    if (set state.dock_program[control] = next):
                        set used = true
            else if (control = 3, state.stage < 2):
                set state.repeats = fixtures.cycle_repeat(state.repeats)
                set used = true
            else if (control = 4, state.stage = 1):
                set state.initial_energy = fixtures.cycle(state.initial_energy, 6)
                set used = true
            else if (control = 5, state.stage = 2):
                set state.launch_connection = fixtures.cycle(state.launch_connection, 1)
                set state.route_passed = array{false, false}
                set used = true
            else if (control = 6, state.stage = 2):
                set state.route_rule = fixtures.cycle(state.route_rule, 3)
                set state.route_passed = array{false, false}
                set used = true
            else if (control = 7, state.stage = 2):
                set state.cargo = fixtures.cycle(state.cargo, 1)
                set state.last_route = -1
                if (parcel.TeleportTo[parcel_home]) {}
                show_board(input_player)
                display(execution_board, ready_text)
                return
            if (used?):
                changed(input_player)
            else:
                feedback.Show(input_player, unused_text, ?DisplayTime := 5.0)

    on_slot_0(input_agent:agent):void = edit(input_agent, 0)
    on_slot_1(input_agent:agent):void = edit(input_agent, 1)
    on_slot_2(input_agent:agent):void = edit(input_agent, 2)
    on_repeat(input_agent:agent):void = edit(input_agent, 3)
    on_energy(input_agent:agent):void = edit(input_agent, 4)
    on_connection(input_agent:agent):void = edit(input_agent, 5)
    on_rule(input_agent:agent):void = edit(input_agent, 6)
    on_cargo(input_agent:agent):void = edit(input_agent, 7)

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

    on_run(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.stage = 2, state.launch_connection = 0):
                display(execution_board, disconnected_text)
                feedback.Show(input_player, disconnected_text, ?DisplayTime := 8.0)
                return
            set generation += 1
            set running = true
            set state.last_error = -1
            reset_props()
            spawn{execute(input_player, generation, progress.round_generation)}

    execute(input_player:player, token:int, round_token:int)<suspends>:void =
        state := progress.ensure_player(input_player)
        if (state.stage = 2):
            cargo := state.cargo
            destination_id := fixtures.route_destination(cargo, state.route_rule)
            display(execution_board, route_result_text(cargo_name(cargo), destination_name(destination_id), ready_text))
            animate(input_player, parcel, route_pose(destination_id), token, round_token)
            if (not valid_run[input_player, token, round_token]):
                return
            set state.last_route = destination_id
            if (destination_id = cargo):
                if (set state.route_passed[cargo] = true) {}
                show_route_result(state)
                if (state.route_passed[0]?, state.route_passed[1]?):
                    finish(input_player, token, round_token)
            else:
                display(execution_board, route_result_text(cargo_name(cargo), destination_name(destination_id), route_fail_text))
                feedback.Show(input_player, route_fail_text, ?DisplayTime := 10.0)
        else:
            var slots:[]int = state.seed_program
            var energy:int = 0
            if (state.stage = 1):
                set slots = state.dock_program
                set energy = state.initial_energy
            execution_result := fixtures.evaluate(state.stage, slots, state.repeats, energy)
            for (frame : execution_result.frames):
                if (not valid_run[input_player, token, round_token]):
                    return
                display(execution_board, frame_text(frame))
                # Move carried seed alongside the robot, one common interpolation.
                robot_start := robot.GetTransform()
                seed_start := seed.GetTransform()
                robot_target := robot_pose(frame)
                seed_target := seed_pose(frame)
                for (step := 1..12):
                    if (not valid_run[input_player, token, round_token]):
                        return
                    var robot_next:transform = robot_start
                    var seed_next:transform = seed_start
                    fraction := step * 1.0 / 12.0
                    set robot_next.Translation = robot_start.Translation + (robot_target.Translation - robot_start.Translation) * fraction
                    set seed_next.Translation = seed_start.Translation + (seed_target.Translation - seed_start.Translation) * fraction
                    if (robot.TeleportTo[robot_next]) {}
                    if (seed.TeleportTo[seed_next]) {}
                    Sleep(0.05)
                if (not valid_run[input_player, token, round_token]):
                    return
                render_frame(frame)
                set state.last_frame = frame
                Sleep(0.3)
            if (not valid_run[input_player, token, round_token]):
                return
            set state.last_error = execution_result.error
            if (execution_result.error = 0):
                finish(input_player, token, round_token)
            else:
                display(execution_board, error_text(failure_name(execution_result.error)))
                feedback.Show(input_player, error_text(failure_name(execution_result.error)), ?DisplayTime := 10.0)
        if (valid_run[input_player, token, round_token]):
            set running = false
            show_board(input_player)

    finish(input_player:player, token:int, round_token:int)<suspends>:void =
        if (not valid_run[input_player, token, round_token]):
            return
        state := progress.ensure_player(input_player)
        was_earned := state.badge_earned
        progress.complete_stage(input_player)
        show_board(input_player)
        var text:message = solved_text
        if (state.badge_earned?):
            set text = agent_mode_text
            if (core_is_restored(input_player)?):
                set text = final_text
            if (was_earned?):
                set text = retained_text
        feedback.Show(input_player, text, ?DisplayTime := 12.0)
        if (not was_earned?, core_is_restored(input_player)?):
            spawn{academy_journal.show_core_restored(input_player)}
        if (state.stage = 2):
            parked := parcel_robot_pose()
            var raised:transform = parked
            set raised.Translation.Z += 120.0
            animate(input_player, robot, raised, token, round_token)
            animate(input_player, robot, parked, token, round_token)

    restart(input_player:player):void =
        set generation += 1
        set running = false
        progress.reset_attempt(input_player)
        reset_props()
        show_board(input_player)
        display(execution_board, ready_text)

    on_replay(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            restart(input_player)

    on_next(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (not state.solved?):
                feedback.Show(input_player, wait_text, ?DisplayTime := 5.0)
                return
            set state.stage = fixtures.cycle(state.stage, 2)
            restart(input_player)

    on_help(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            state := progress.ensure_player(input_player)
            set state.hint_level += 1
            var hint:message = seed_hint
            if (state.stage = 1):
                set hint = dock_hint
            else if (state.stage = 2):
                set hint = route_hint
            if (state.hint_level > 1):
                case (state.stage):
                    0 => set hint = seed_worked
                    1 => set hint = dock_worked
                    _ => set hint = route_worked
            feedback.Show(input_player, hint, ?DisplayTime := 12.0)

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
