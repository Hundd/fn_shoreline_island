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
    scanner_command_text<localizes>:message = "Choose Move / Light to reach scanner"
    scanner_repeat_text<localizes>:message = "Set Move repeats (1-4)"
    navigation_complete_text<localizes>:message = "At scanner"
    navigation_pending_text<localizes>:message = "Not at scanner"
    navigate_action_text<localizes>:message = "Run Move repeats to scanner"
    energy_text<localizes>:message = "Change starting energy (0-6)"
    transport_text<localizes>:message = "Choose Bridge / Dock route"
    connection_text<localizes>:message = "Connect Scanner to marker"
    crate_choice_text<localizes>:message = "Choose Food / Medical / Mechanical crate"
    rule_text<localizes>:message = "Choose classification rule"
    cargo_text<localizes>:message = "Change test item"
    run_text<localizes>:message = "Run agent plan"
    scan_action_text<localizes>:message = "Scan destination marker"
    blocked_run_text<localizes>:message = "Bridge blocked: choose Dock"
    test_route_text<localizes>:message = "Optional: test selected item"
    run_after_delivery_text<localizes>:message = "Delivery complete: press Verify"
    help_text<localizes>:message = "Help / Worked answer"
    next_text<localizes>:message = "Next stage / Replay mission"
    deliver_skill_text<localizes>:message = "Run DeliverPackage skill"
    verify_text<localizes>:message = "Verify delivery"
    replay_text<localizes>:message = "Replay this stage"
    return_text<localizes>:message = "Return to Academy Hub"
    occupied_text<localizes>:message = "This robot is in use. Choose another station."
    other_text<localizes>:message = "Leave your current AI Agent Mission station before claiming another."
    locked_text<localizes>:message = "Agent Mode is LOCKED. Restore Pix's first seven AI Core modules, then return here."
    unused_text<localizes>:message = "This control belongs to another mission stage."
    wait_text<localizes>:message = "Finish this stage first. Help shows a worked answer."
    available_text<localizes>(number:int):message = "AI AGENT MISSION | Station {number}\nAn AI agent gets a goal, makes choices, uses tools, and acts to finish a task.\nEmergency supplies for Animal Research Station.\nUnlock: 7 modules online. Claim to begin.\n1 Medical practice | 2 Pattern dock | 3 Final delivery"
    seed_goal<localizes>:message = "MEDICAL PRACTICE: Choose Medical for Animal Research Station.\nUse Pickup, Repeat Move, Drop."
    dock_goal<localizes>:message = "PATTERN PRACTICE: Light dock cells 1, 2, 3. Finish with energy 0."
    route_goal<localizes>:message = "FINAL MISSION: Medical crate to Animal Research Station.\nReach the scanner and choose an open route.\nRun DeliverPackage, then Verify."
    mission_text<localizes>(goal:message, seed_done:message, dock_done:message, route_done:message):message = "PIX'S AI AGENT MISSION\nMedical practice: {seed_done} | Pattern: {dock_done} | Final: {route_done}\n{goal}"
    done_text<localizes>:message = "done"
    pending_text<localizes>:message = "to do"
    solved_text<localizes>:message = "Stage complete! Next or Replay."
    agent_mode_text<localizes>:message = "We did it! Pix's Agent Mode is online.\nYou taught me to follow instructions, spot patterns, classify, check uncertainty, fix mistakes, use tools, and combine skills.\nAI can help with a task; people should check important decisions. See your AI Core Journal for every module.\nAI Agent Badge earned."
    final_text<localizes>:message = "PIX AI CORE FULLY RESTORED!\nInstructions, Patterns, Classification, Confidence, Error Checking, Tools, Skills, and Agent Mode are ONLINE.\nYou taught me to follow instructions, spot patterns, classify, check uncertainty, fix mistakes, use tools, and combine skills.\nAI can help with a task; people should check important decisions. AI Agent Badge earned."
    retained_text<localizes>:message = "Mission completed again! Your AI Agent Badge and earlier badges stay earned."
    ready_text<localizes>:message = "Ready. Run to see each command."
    pickup_name<localizes>:message = "Pickup"
    move_name<localizes>:message = "Move"
    repeat_move_name<localizes>:message = "Repeat Move"
    drop_name<localizes>:message = "Drop"
    light_name<localizes>:message = "Light"
    home_name<localizes>:message = "Start at Home"
    empty_name<localizes>:message = "empty"
    seed_name<localizes>:message = "Medical crate"
    food_crate_name<localizes>:message = "Food"
    medical_crate_name<localizes>:message = "Medical"
    mechanical_crate_name<localizes>:message = "Mechanical"
    leaf_name<localizes>:message = "Apple"
    plain_name<localizes>:message = "Car"
    garden_name<localizes>:message = "Food"
    storage_name<localizes>:message = "Vehicle"
    disconnected_name<localizes>:message = "Disconnected"
    dispatch_name<localizes>:message = "Destination marker"
    not_scanned_name<localizes>:message = "Not scanned"
    scanned_name<localizes>:message = "Bridge blocked; Dock open"
    bridge_name<localizes>:message = "Bridge"
    dock_name<localizes>:message = "Dock"
    all_garden_name<localizes>:message = "All items > Food"
    all_storage_name<localizes>:message = "All items > Vehicle"
    condition_name<localizes>:message = "If Apple > Food; else > Vehicle"
    reversed_name<localizes>:message = "If Apple > Vehicle; else > Food"
    seed_program_text<localizes>(crate:message, a:message, b:message, c:message, count:int):message = "AGENT PLAN: DELIVER SUPPLIES\nChosen crate: {crate}\n1 {a} | 2 {b} | 3 {c}\nRepeat Move: {count} | Pickup / Move / Drop"
    dock_program_text<localizes>(a:message, b:message, count:int, energy:int):message = "AGENT PLAN: PATTERN\nRepeat {count} [1 {a}, 2 {b}]\nStarting energy: {energy} | Light costs 1\nChoices: Move, Light"
    route_program_text<localizes>(command:message, count:int, navigation:message, connection:message, scan:message, transport:message, rule:message, cargo:message, leaf:message, plain:message):message = "AGENT PLAN: NAVIGATE + SCAN\n{command} x{count}: {navigation} | Scanner > {connection}\nScan: {scan} | Route: {transport} | {rule}\nOptional test {cargo} | Apple {leaf}, Car {plain}"
    execution_text<localizes>(command:message, iteration:int, position:int, energy:int, inventory:message, lights:int):message = "NOW: {command} | Repeat step: {iteration}\nCell: {position} | Energy: {energy}\nHand: {inventory} | Dock lamps ON: {lights}/3"
    route_result_text<localizes>(cargo:message, destination_label:message, outcome:message):message = "OPTIONAL CLASSIFIER TEST\nItem: {cargo} > {destination_label}\n{outcome}"
    route_pass_text<localizes>:message = "PASS. Optional: test the other item or run DeliverPackage."
    route_practice_complete_text<localizes>:message = "Both optional item tests passed. Run DeliverPackage or replay."
    route_complete_text<localizes>:message = "VERIFIED. Medical crate reached Animal Research Station. Replay or return to the hub."
    deliver_skill_prompt<localizes>:message = "Dock route is open. Run DeliverPackage: Pickup, Repeat Move, Drop."
    delivery_skill_start_text<localizes>:message = "SKILL: DeliverPackage\nPickup, Repeat Move, Drop."
    delivery_skill_frame_text<localizes>(step:message):message = "DELIVERPACKAGE SKILL\n{step}"
    delivery_skill_done_text<localizes>:message = "Medical crate delivered to Animal Research Station. Verify the destination next."
    verify_prompt<localizes>:message = "CHECK: Is the Medical crate at Animal Research Station? Press Verify to confirm delivery."
    cell_label<localizes>(cell:int):message = "CELL {cell}"
    home_label<localizes>:message = "HOME\nCELL 0"
    planter_label<localizes>:message = "CELL 3\nANIMAL RESEARCH\nSTATION"
    wrong_crate_text<localizes>(crate:message):message = "You chose {crate}. Animal Research Station needs the Medical crate. Choose Medical, then Run again."
    route_fail_text<localizes>:message = "Wrong category. Apple needs Food; Car needs Vehicle. Change the rule and test both again."
    disconnected_text<localizes>:message = "Scanner has no marker connection. Connect Scanner to the destination marker."
    scanner_result_text<localizes>:message = "SCANNER RESULT\nBridge: BLOCKED | Dock: OPEN\nChoose an open route for the Medical crate. Apple/Car tests are optional."
    navigation_error_text<localizes>:message = "Scanner is 2 Moves away. Choose Move and Repeat 2, then Run."
    navigation_prompt_text<localizes>:message = "Choose a command and repeat count to reach the scanner marker, then Run."
    navigation_step_text<localizes>(step:int):message = "NAVIGATE: Move {step}/2 toward scanner."
    scanner_ready_text<localizes>:message = "At scanner. Connect Scanner to the marker, then Run Scan."
    scan_first_text<localizes>:message = "Run the scanner before choosing a route. Connect Scanner to the marker, then Run."
    blocked_route_text<localizes>:message = "Bridge is BLOCKED. Choose the open Dock route, then Run again."
    error_text<localizes>(reason:message):message = "STOPPED SAFELY: {reason}\nChange the agent plan and Run again."
    pickup_position_error<localizes>:message = "The Medical crate is at Home. Pickup must happen before moving."
    pickup_twice_error<localizes>:message = "The Medical crate was already picked up."
    move_error<localizes>:message = "The path ends at cell 3. Reduce the moves."
    drop_empty_error<localizes>:message = "The robot is not carrying the Medical crate. Pickup first."
    drop_position_error<localizes>:message = "Animal Research Station is at cell 3. Move there before Drop."
    light_home_error<localizes>:message = "There is no lamp at Home. Move to the first lamp."
    light_twice_error<localizes>:message = "This lamp is already ON. Move to the next lamp."
    empty_energy_error<localizes>:message = "Light needs one energy. Increase starting energy."
    no_delivery_error<localizes>:message = "The Medical crate has not been dropped at cell 3."
    lamps_error<localizes>:message = "Light all three lamps in order."
    extra_energy_error<localizes>:message = "The dock goal needs energy 0 at the end. Reduce starting energy."
    final_position_error<localizes>:message = "Finish at cell 3."
    invalid_error<localizes>:message = "Choose the commands and values shown for this stage."
    seed_hint<localizes>:message = "Medical supplies go to Animal Research Station. Pick up before moving; Drop at cell 3."
    seed_worked<localizes>:message = "Choose Medical. Set Pickup / Repeat Move / Drop, repeat count 3. Press Run."
    dock_hint<localizes>:message = "Move to a lamp, then Light it. Each Light spends one energy."
    dock_worked<localizes>:message = "Set Repeat 3 [Move, Light], starting energy 3. Press Run."
    route_hint<localizes>:message = "Look at the scanner marker. Count how many moves it is from Home."
    route_worked<localizes>:message = "Choose Move and Repeat 2, then Run to reach the scanner."
    route_scan_hint<localizes>:message = "Which tool can read a destination marker? Check its connection before running it."
    route_scan_worked<localizes>:message = "Connect Scanner to the marker, then Run to scan it."
    route_decision_hint<localizes>:message = "The scan shows a blocked route and an open one. Which can carry supplies?"
    route_decision_worked<localizes>:message = "Bridge is blocked. Choose Dock, then run DeliverPackage."

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

    set_next_prompt(verification_ready:logic):void =
        if (verification_ready?):
            next_button.SetInteractionText(verify_text)
            display(label_next, verify_text)
        else:
            next_button.SetInteractionText(next_text)
            display(label_next, next_text)

    set_skill_prompt():void =
        next_button.SetInteractionText(deliver_skill_text)
        display(label_next, deliver_skill_text)

    set_transport_prompt(stage:int):void =
        if (stage = 2):
            energy_button.SetInteractionText(transport_text)
            display(label_energy, transport_text)
        else:
            energy_button.SetInteractionText(energy_text)
            display(label_energy, energy_text)

    set_navigation_prompts(stage:int, reached:logic):void =
        if (stage = 2):
            if (reached?):
                slot_0_button.SetInteractionText(navigation_complete_text)
                repeat_button.SetInteractionText(navigation_complete_text)
                display(label_slot_0, navigation_complete_text)
                display(label_repeat, navigation_complete_text)
            else:
                slot_0_button.SetInteractionText(scanner_command_text)
                repeat_button.SetInteractionText(scanner_repeat_text)
                display(label_slot_0, scanner_command_text)
                display(label_repeat, scanner_repeat_text)
        else:
            slot_0_button.SetInteractionText(slot_text(1))
            repeat_button.SetInteractionText(repeat_text)
            display(label_slot_0, slot_text(1))
            display(label_repeat, repeat_text)

    set_run_prompt(stage:int, reached:logic, scanned:logic, route:int):void =
        if (stage = 2):
            if (input_player := owner?, state := progress.states[input_player], state.delivery_skill_complete?):
                run_button.SetInteractionText(run_after_delivery_text)
                display(label_run, run_after_delivery_text)
            else if (not reached?):
                run_button.SetInteractionText(navigate_action_text)
                display(label_run, navigate_action_text)
            else if (scanned?, route = 0):
                run_button.SetInteractionText(blocked_run_text)
                display(label_run, blocked_run_text)
            else if (scanned?):
                run_button.SetInteractionText(test_route_text)
                display(label_run, test_route_text)
            else:
                run_button.SetInteractionText(scan_action_text)
                display(label_run, scan_action_text)
        else:
            run_button.SetInteractionText(run_text)
            display(label_run, run_text)

    set_connection_prompt(stage:int):void =
        if (stage = 0):
            connection_button.SetInteractionText(crate_choice_text)
            display(label_connection, crate_choice_text)
        else if (stage = 2):
            connection_button.SetInteractionText(connection_text)
            display(label_connection, connection_text)
        else:
            connection_button.SetInteractionText(unused_text)
            display(label_connection, unused_text)

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
        label_cell3.SetTextSize(16)
        if (input_player := owner?):
            state := progress.ensure_player(input_player)
            show_stage_props(state.stage)
            set_transport_prompt(state.stage)
            set_navigation_prompts(state.stage, state.scanner_reached)
            set_run_prompt(state.stage, state.scanner_reached, state.destination_scanned, state.transport_route)
            set_connection_prompt(state.stage)
        else:
            show_stage_props(0)
            set_transport_prompt(0)
            set_navigation_prompts(0, false)
            set_run_prompt(0, false, false, 0)
            set_connection_prompt(0)

    on_joined(input_player:player):void =
        spawn{refresh_after_join()}

    refresh_after_join()<suspends>:void =
        Sleep(2.0)
        # An active run refreshes its own boards on completion; do not hide
        # the moving Medical crate when another player joins mid-skill.
        if (running?):
            return
        refresh_labels()
        if (input_player := owner?):
            show_board(input_player)
            state := progress.ensure_player(input_player)
            if (state.stage = 2):
                show_route_result(state)
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
            if (input_player := owner?, state := progress.states[input_player], state.delivery_skill_complete?):
                seed.Show()
                if (seed.TeleportTo[seed_pose(bot_execution_frame{delivered := true})]) {}
                display(label_cell3, planter_label)
            else:
                parcel.Show()
            if (not running?):
                if (input_player := owner?, state := progress.states[input_player], state.scanner_reached?):
                    if (robot.TeleportTo[parcel_robot_pose()]) {}
                else:
                    if (robot.TeleportTo[robot_home]) {}
            for (label : array{label_home, label_cell1, label_cell2, label_cell3}):
                label.HideText()
            label_garden.ShowText()
            label_storage.ShowText()
            if (input_player := owner?, state := progress.states[input_player], state.delivery_skill_complete?):
                label_cell3.ShowText()

    show_route_result(state:bot_player_progress):void =
        if (state.scanner_reached?, state.destination_scanned?, state.transport_route = 1, not state.solved?):
            if (state.delivery_skill_complete?):
                set_next_prompt(true)
                display(execution_board, verify_prompt)
            else:
                set_skill_prompt()
                display(execution_board, deliver_skill_prompt)
            return
        set_next_prompt(false)
        if (state.last_route < 0):
            if (state.destination_scanned?):
                display(execution_board, scanner_result_text)
            else if (state.scanner_reached?):
                display(execution_board, scanner_ready_text)
            else:
                display(execution_board, navigation_prompt_text)
            return
        var outcome:message = route_fail_text
        if (state.last_route = state.cargo):
            set outcome = route_pass_text
            if (state.route_passed[0]?, state.route_passed[1]?):
                set outcome = route_practice_complete_text
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

    crate_name(choice:int):message =
        if (choice = 0):
            return food_crate_name
        if (choice = 1):
            return medical_crate_name
        return mechanical_crate_name

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
        return academy_journal.first_seven_online(input_player)

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
        set_transport_prompt(state.stage)
        set_navigation_prompts(state.stage, state.scanner_reached)
        set_run_prompt(state.stage, state.scanner_reached, state.destination_scanned, state.transport_route)
        set_connection_prompt(state.stage)
        if (a := state.completed[0], b := state.completed[1], c := state.completed[2]):
            display(mission_board, mission_text(objective(input_player, state), done_name(a), done_name(b), done_name(c)))
        if (state.stage = 0, a := state.seed_program[0], b := state.seed_program[1], c := state.seed_program[2]):
            display(program_board, seed_program_text(crate_name(state.medical_crate_choice), seed_command_name(a), seed_command_name(b), seed_command_name(c), state.repeats))
        else if (state.stage = 1, a := state.dock_program[0], b := state.dock_program[1]):
            display(program_board, dock_program_text(command_name(a), command_name(b), state.repeats, state.initial_energy))
        else if (state.stage = 2, leaf := state.route_passed[0], plain := state.route_passed[1]):
            var navigation:message = navigation_pending_text
            if (state.scanner_reached?):
                set navigation = navigation_complete_text
            var connection:message = disconnected_name
            if (state.launch_connection = 1):
                set connection = dispatch_name
            var scan:message = not_scanned_name
            if (state.destination_scanned?):
                set scan = scanned_name
            var transport:message = bridge_name
            if (state.transport_route = 1):
                set transport = dock_name
            display(program_board, route_program_text(command_name(state.scanner_command), state.scanner_repeats, navigation,
                connection, scan, transport, rule_name(state.route_rule), cargo_name(state.cargo), done_name(leaf), done_name(plain)))

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
            set pose.Translation.Y += 100.0
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

    scanner_step_pose(step:int)<transacts>:transform =
        var pose:transform = robot_home
        set pose.Translation.Y += step * 500.0
        return pose

    render_frame(frame:bot_execution_frame):void =
        var robot_target:transform = robot_pose(frame)
        if (input_player := owner?, state := progress.states[input_player], state.stage = 2):
            if (state.scanner_reached?):
                set robot_target = parcel_robot_pose()
            else:
                set robot_target = robot_home
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
        set_next_prompt(false)
        set_transport_prompt(0)
        set_navigation_prompts(0, false)
        set_run_prompt(0, false, false, 0)
        set_connection_prompt(0)
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
        set state.delivery_skill_complete = false
        set state.last_frame = bot_execution_frame{energy := state.initial_energy}
        set state.last_error = -1
        set state.last_route = -1
        reset_props()
        set_next_prompt(false)
        display(execution_board, ready_text)
        show_board(input_player)
        if (state.stage = 2):
            show_route_result(state)

    edit(input_agent:agent, control:int):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.stage = 2, state.delivery_skill_complete?, not state.solved?, (control = 6 or control = 7)):
                feedback.Show(input_player, verify_prompt, ?DisplayTime := 8.0)
                return
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
                else if (state.stage = 2, control = 0, not state.scanner_reached?):
                    var next_scanner_command:int = 1
                    if (state.scanner_command = 1):
                        set next_scanner_command = 3
                    set state.scanner_command = next_scanner_command
                    set used = true
            else if (control = 3, state.stage < 2):
                set state.repeats = fixtures.cycle_repeat(state.repeats)
                set used = true
            else if (control = 3, state.stage = 2, not state.scanner_reached?):
                set state.scanner_repeats = fixtures.cycle_repeat(state.scanner_repeats)
                set used = true
            else if (control = 4, state.stage = 1):
                set state.initial_energy = fixtures.cycle(state.initial_energy, 6)
                set used = true
            else if (control = 4, state.stage = 2):
                if (not state.destination_scanned?):
                    feedback.Show(input_player, scan_first_text, ?DisplayTime := 8.0)
                    return
                set state.transport_route = fixtures.cycle(state.transport_route, 1)
                set state.route_passed = array{false, false}
                set used = true
            else if (control = 5, state.stage = 0):
                set state.medical_crate_choice = fixtures.cycle(state.medical_crate_choice, 2)
                set used = true
            else if (control = 5, state.stage = 2):
                set state.launch_connection = fixtures.cycle(state.launch_connection, 1)
                set state.destination_scanned = false
                set state.transport_route = 0
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
                show_route_result(state)
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

    animate_delivery_frame(input_player:player, frame:bot_execution_frame, token:int, round_token:int)<suspends>:void =
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

    on_run(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.stage = 2, state.delivery_skill_complete?):
                feedback.Show(input_player, verify_prompt, ?DisplayTime := 8.0)
                return
            if (state.stage = 0, state.medical_crate_choice <> 1):
                explanation := wrong_crate_text(crate_name(state.medical_crate_choice))
                display(execution_board, explanation)
                feedback.Show(input_player, explanation, ?DisplayTime := 9.0)
                return
            if (state.stage = 2, not state.scanner_reached?):
                if (state.scanner_command <> 1 or state.scanner_repeats <> 2):
                    display(execution_board, navigation_error_text)
                    feedback.Show(input_player, navigation_error_text, ?DisplayTime := 8.0)
                    return
            if (state.stage = 2, state.scanner_reached?, state.launch_connection = 0):
                display(execution_board, disconnected_text)
                feedback.Show(input_player, disconnected_text, ?DisplayTime := 8.0)
                return
            if (state.stage = 2, state.destination_scanned?, state.transport_route = 0):
                display(execution_board, blocked_route_text)
                feedback.Show(input_player, blocked_route_text, ?DisplayTime := 8.0)
                return
            set generation += 1
            set running = true
            set state.last_error = -1
            reset_props()
            spawn{execute(input_player, generation, progress.round_generation)}

    execute(input_player:player, token:int, round_token:int)<suspends>:void =
        state := progress.ensure_player(input_player)
        if (state.stage = 2):
            if (not state.scanner_reached?):
                for (step := 1..2):
                    if (not valid_run[input_player, token, round_token]):
                        return
                    display(execution_board, navigation_step_text(step))
                    animate(input_player, robot, scanner_step_pose(step), token, round_token)
                    if (not valid_run[input_player, token, round_token]):
                        return
                    Sleep(0.3)
                if (not valid_run[input_player, token, round_token]):
                    return
                set state.scanner_reached = true
                set state.hint_level = 0
                display(execution_board, scanner_ready_text)
                feedback.Show(input_player, scanner_ready_text, ?DisplayTime := 8.0)
            else if (not state.destination_scanned?):
                if (not valid_run[input_player, token, round_token]):
                    return
                set state.destination_scanned = true
                set state.hint_level = 0
                display(execution_board, scanner_result_text)
                feedback.Show(input_player, scanner_result_text, ?DisplayTime := 10.0)
            else:
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
                # Move the carried medical crate alongside the robot.
                animate_delivery_frame(input_player, frame, token, round_token)
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
            spawn{academy_journal.show_core_restored(input_player, round_token)}
        if (state.stage = 2):
            parked := parcel_robot_pose()
            var raised:transform = parked
            set raised.Translation.Z += 120.0
            animate(input_player, robot, raised, token, round_token)
            animate(input_player, robot, parked, token, round_token)

    execute_delivery_skill(input_player:player, token:int, round_token:int)<suspends>:void =
        if (not valid_run[input_player, token, round_token]):
            return
        state := progress.ensure_player(input_player)
        delivery := fixtures.evaluate(0, array{0, 1, 2}, 3, 0)
        if (delivery.error <> 0):
            display(execution_board, error_text(failure_name(delivery.error)))
            set running = false
            show_route_result(state)
            return
        parcel.Hide()
        seed.Show()
        if (seed.TeleportTo[seed_home]) {}
        display(execution_board, delivery_skill_start_text)
        Sleep(0.5)
        for (frame : delivery.frames):
            if (not valid_run[input_player, token, round_token]):
                return
            display(execution_board, delivery_skill_frame_text(frame_text(frame)))
            animate_delivery_frame(input_player, frame, token, round_token)
            if (not valid_run[input_player, token, round_token]):
                return
            Sleep(0.3)
        if (not valid_run[input_player, token, round_token]):
            return
        set state.delivery_skill_complete = true
        feedback.Show(input_player, delivery_skill_done_text, ?DisplayTime := 10.0)
        Sleep(1.0)
        if (valid_run[input_player, token, round_token]):
            set running = false
            show_board(input_player)
            show_route_result(state)

    restart(input_player:player):void =
        set generation += 1
        set running = false
        progress.reset_attempt(input_player)
        reset_props()
        set_next_prompt(false)
        show_board(input_player)
        display(execution_board, ready_text)

    confirm_final_route(input_player:player, token:int, round_token:int)<suspends>:void =
        if (not valid_run[input_player, token, round_token]):
            return
        state := progress.ensure_player(input_player)
        if (state.stage = 2, state.scanner_reached?, state.destination_scanned?, state.transport_route = 1, state.delivery_skill_complete?, not state.solved?):
            finish(input_player, token, round_token)
            if (valid_run[input_player, token, round_token]):
                display(execution_board, route_complete_text)
                set running = false
        else:
            if (valid_run[input_player, token, round_token]):
                set running = false

    on_replay(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            restart(input_player)

    on_next(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent, not running?):
            state := progress.ensure_player(input_player)
            if (state.stage = 2, state.scanner_reached?, state.destination_scanned?, state.transport_route = 1, not state.solved?):
                set generation += 1
                set running = true
                set_next_prompt(false)
                if (state.delivery_skill_complete?):
                    spawn{confirm_final_route(input_player, generation, progress.round_generation)}
                else:
                    spawn{execute_delivery_skill(input_player, generation, progress.round_generation)}
                return
            if (not state.solved?):
                feedback.Show(input_player, wait_text, ?DisplayTime := 5.0)
                return
            set state.stage = fixtures.cycle(state.stage, 2)
            restart(input_player)

    on_help(input_agent:agent):void =
        if (input_player := owner?, input_player = input_agent):
            state := progress.ensure_player(input_player)
            if (state.stage = 2, state.scanner_reached?, state.destination_scanned?, state.transport_route = 1, not state.solved?):
                if (state.delivery_skill_complete?):
                    feedback.Show(input_player, verify_prompt, ?DisplayTime := 10.0)
                else:
                    feedback.Show(input_player, deliver_skill_prompt, ?DisplayTime := 10.0)
                return
            set state.hint_level += 1
            var hint:message = seed_hint
            if (state.stage = 1):
                set hint = dock_hint
            else if (state.stage = 2):
                set hint = route_hint
                if (state.scanner_reached?):
                    set hint = route_scan_hint
                    if (state.destination_scanned?):
                        set hint = route_decision_hint
            if (state.hint_level > 1):
                case (state.stage):
                    0 => set hint = seed_worked
                    1 => set hint = dock_worked
                    _ =>
                        set hint = route_worked
                        if (state.scanner_reached?):
                            set hint = route_scan_worked
                            if (state.destination_scanned?):
                                set hint = route_decision_worked
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
