using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

prompt_lab_player_state := class:
    var stage:int = 0
    var target_rail_used:logic = false
    var target_known:logic = false
    var chosen_core:int = -1
    var destination_known:logic = false
    var chosen_destination:int = -1
    var size_choice:int = -1
    var green_rail_used:logic = false
    var green_known:logic = false
    var cell_known:logic = false
    var generator_known:logic = false
    var selected_green:logic = false
    var selected_cell:logic = false
    var selected_generator:logic = false
    var module_ready:logic = false

prompt_lab_button_action := class:
    controller:fn_shoreline_island_prompt_lab_controller
    choice:int
    on_press(input_agent:agent):void =
        controller.on_button(input_agent, choice)

# Physical information gathering and prompt assembly. Badge ownership remains
# in byte_island_game_manager so the established journal reads one source.
fn_shoreline_island_prompt_lab_controller := class(creative_device):
    @editable
    use_blaster_mode:logic = false
    @editable
    progress:byte_island_game_manager = byte_island_game_manager{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    target_hologram:billboard_device = billboard_device{}
    @editable
    destination_hologram:billboard_device = billboard_device{}
    @editable
    prompt_hologram:billboard_device = billboard_device{}
    @editable
    ambiguity_hologram:billboard_device = billboard_device{}
    @editable
    target_scan_vfx:vfx_creator_device = vfx_creator_device{}
    @editable
    destination_scan_vfx:vfx_creator_device = vfx_creator_device{}
    @editable
    reactor_pulse_vfx:vfx_creator_device = vfx_creator_device{}
    @editable
    reject_vfx:vfx_creator_device = vfx_creator_device{}
    @editable
    generator_vfx:vfx_creator_device = vfx_creator_device{}
    @editable
    module_vfx:vfx_creator_device = vfx_creator_device{}
    @editable
    console_vfx:vfx_creator_device = vfx_creator_device{}
    @editable
    ambiguity_vfx:vfx_creator_device = vfx_creator_device{}
    @editable
    green_clue_vfx:vfx_creator_device = vfx_creator_device{}
    @editable
    energy_scan_vfx:vfx_creator_device = vfx_creator_device{}
    @editable
    receiver_vfx:vfx_creator_device = vfx_creator_device{}
    @editable
    selection_audio:audio_player_device = audio_player_device{}
    @editable
    success_audio:audio_player_device = audio_player_device{}
    @editable
    retry_audio:audio_player_device = audio_player_device{}
    @editable
    target_rail:grind_rail_device = grind_rail_device{}
    @editable
    green_rail:grind_rail_device = grind_rail_device{}
    @editable
    target_scanner:button_device = button_device{}
    @editable
    destination_scanner:button_device = button_device{}
    @editable
    blue_selector:button_device = button_device{}
    @editable
    red_selector:button_device = button_device{}
    @editable
    green_selector:button_device = button_device{}
    @editable
    reactor_selector:button_device = button_device{}
    @editable
    research_selector:button_device = button_device{}
    @editable
    storage_selector:button_device = button_device{}
    @editable
    send_button:button_device = button_device{}
    @editable
    small_selector:button_device = button_device{}
    @editable
    large_selector:button_device = button_device{}
    @editable
    energy_scanner:button_device = button_device{}
    @editable
    final_green_selector:button_device = button_device{}
    @editable
    final_cell_selector:button_device = button_device{}
    @editable
    final_generator_selector:button_device = button_device{}
    @editable
    module_connection:button_device = button_device{}
    @editable
    replay_button:button_device = button_device{}
    @editable
    data_cube:carryable_spawner_device = carryable_spawner_device{}
    @editable
    cube_receiver:creative_prop = creative_prop{}
    @editable
    pix:creative_prop = creative_prop{}
    @editable
    blue_delivery_core:creative_prop = creative_prop{}
    @editable
    red_delivery_core:creative_prop = creative_prop{}
    @editable
    green_delivery_core:creative_prop = creative_prop{}
    @editable
    large_blue_delivery_core:creative_prop = creative_prop{}
    @editable
    small_blue_core:creative_prop = creative_prop{}
    @editable
    green_delivery_cell:creative_prop = creative_prop{}
    @editable
    power_reactor:creative_prop = creative_prop{}
    @editable
    research_scanner:creative_prop = creative_prop{}
    @editable
    storage_bay:creative_prop = creative_prop{}
    @editable
    door_generator:creative_prop = creative_prop{}
    @editable
    lab_door:creative_prop = creative_prop{}
    @editable
    moving_platform:creative_prop = creative_prop{}

    var states:[player]prompt_lab_player_state = map{}
    var team_target_known:logic = false
    var team_destination_known:logic = false
    var team_green_known:logic = false
    var team_cell_known:logic = false
    var team_generator_known:logic = false
    var execution_owner:?player = false
    var round_generation:int = 0
    var pix_home:transform = transform{}
    var blue_home:transform = transform{}
    var red_home:transform = transform{}
    var green_core_home:transform = transform{}
    var large_home:transform = transform{}
    var green_home:transform = transform{}
    var door_home:transform = transform{}
    var platform_home:transform = transform{}

    target_scan_text<localizes>:message = "Scan target"
    destination_scan_text<localizes>:message = "Scan destination"
    blue_text<localizes>:message = "Choose BLUE core"
    red_text<localizes>:message = "Choose RED core"
    green_text<localizes>:message = "Choose GREEN core"
    reactor_text<localizes>:message = "Choose POWER REACTOR"
    research_text<localizes>:message = "Choose RESEARCH SCANNER"
    storage_text<localizes>:message = "Choose STORAGE BAY"
    send_text<localizes>:message = "SEND TO PIX"
    small_text<localizes>:message = "Add SMALL detail"
    large_text<localizes>:message = "Add LARGE detail"
    energy_text<localizes>:message = "Scan missing item"
    final_green_text<localizes>:message = "Add GREEN"
    final_cell_text<localizes>:message = "Add ENERGY CELL"
    final_generator_text<localizes>:message = "Add DOOR GENERATOR"
    module_text<localizes>:message = "Connect Prompt Module"
    replay_text<localizes>:message = "Replay Prompt Lab"

    intro<localizes>:message = "Uh-oh! My Prompt Module is broken. Help Pix find the right Data Core."
    rail_hint<localizes>:message = "Ride the rail to the raised target scanner."
    target_found<localizes>:message = "TARGET IDENTIFIED: BLUE DATA CORE. Choose BLUE at the console."
    red_chosen<localizes>:message = "RED CORE selected. Send to see what Pix does."
    green_chosen<localizes>:message = "GREEN CORE selected. Send to see what Pix does."
    blue_chosen<localizes>:message = "YOUR PROMPT: GET BLUE CORE. Find where it belongs."
    destination_found<localizes>:message = "CORE NEEDED AT: POWER REACTOR. Choose its destination at the console."
    destination_wrong<localizes>:message = "Destination selected. Send to see what Pix does."
    red_rejected<localizes>:message = "The reactor rejected RED CORE! Change the core to BLUE and retry."
    red_wrong_place<localizes>:message = "Pix took RED CORE there. Change RED to BLUE and retry."
    green_rejected<localizes>:message = "The reactor rejected GREEN CORE! Change GREEN to BLUE and retry."
    green_wrong_place<localizes>:message = "Pix took GREEN CORE there. Change GREEN to BLUE and retry."
    wrong_destination_result<localizes>:message = "Pix delivered BLUE to the wrong place. Change only the destination."
    ready_first<localizes>:message = "GET BLUE CORE AND TAKE IT TO POWER REACTOR. Send to Pix!"
    need_target<localizes>:message = "Scan the target first, then choose a core."
    need_destination<localizes>:message = "Find the destination scanner before sending."
    need_prompt<localizes>:message = "Choose a core and destination, then send."
    pix_busy<localizes>:message = "Pix is finishing another delivery. Follow along, then send."
    first_running<localizes>:message = "Prompt received! Follow Pix to the BLUE CORE."
    first_success<localizes>:message = "PROMPT SUCCESS! Pix found the right core."
    first_lesson<localizes>:message = "You told Pix WHAT to get and WHERE to take it."
    ambiguous<localizes>:message = "GET THE BLUE CORE... Umm, which blue core? There is a small one and a large one."
    size_wrong<localizes>:message = "The target is the LARGE blue core. Add that useful detail and try again."
    size_ready<localizes>:message = "GET THE LARGE BLUE CORE. Much clearer! Send to Pix."
    size_success<localizes>:message = "Pix found the LARGE blue core!"
    size_lesson<localizes>:message = "Useful details make a prompt clearer."
    rescue_intro<localizes>:message = "PROMPT RESCUE! The lab door needs power. Find WHAT, WHICH ONE, and WHERE. Take your time."
    green_found<localizes>:message = "GREEN clue found! Scan the missing item and carry the Data Cube to its receiver."
    cell_found<localizes>:message = "Missing item: ENERGY CELL. Find the destination with the Data Cube."
    cube_found<localizes>:message = "DESTINATION FOUND: DOOR GENERATOR. Build the final prompt."
    clue_needed<localizes>:message = "Discover this clue in the lab before adding it."
    part_added<localizes>:message = "Prompt detail added. Keep building it."
    final_ready<localizes>:message = "BRING THE GREEN ENERGY CELL TO THE DOOR GENERATOR. Send to Pix!"
    final_incomplete<localizes>:message = "Find and choose GREEN, ENERGY CELL, and DOOR GENERATOR first."
    final_running<localizes>:message = "Pix is bringing the GREEN ENERGY CELL to the DOOR GENERATOR. Follow Pix!"
    door_open<localizes>:message = "Generator online! The lab door is open. Enter and connect the PROMPT MODULE."
    module_early<localizes>:message = "Open the lab door with a clear final prompt first."
    module_done<localizes>:message = "PIX PROMPT MODULE ONLINE! Prompt Badge earned."
    module_repeat<localizes>:message = "Pix's Prompt Module is online. Your Prompt Badge is already earned."
    replay_notice<localizes>:message = "Prompt Lab replay started. Your earned badge stays yours."
    target_unknown_board<localizes>:message = "TARGET\n? CORE"
    target_blue_board<localizes>:message = "TARGET\nBLUE CORE"
    destination_unknown_board<localizes>:message = "DESTINATION\n?"
    destination_reactor_board<localizes>:message = "DESTINATION\nPOWER REACTOR"
    ambiguity_board<localizes>:message = "BLUE CORE?\nSMALL OR LARGE"
    ambiguity_clear_board<localizes>:message = "GET LARGE BLUE CORE"
    reactor_online_board<localizes>:message = "POWER REACTOR\nONLINE"
    final_ready_board<localizes>:message = "BRING GREEN ENERGY CELL\nTO DOOR GENERATOR"
    door_open_board<localizes>:message = "DOOR OPEN\nFIND PROMPT MODULE"
    module_online_board<localizes>:message = "PROMPT MODULE\nONLINE"
    unknown_core_board<localizes>:message = "? CORE"
    blue_core_board<localizes>:message = "BLUE CORE"
    red_core_board<localizes>:message = "RED CORE"
    green_core_board<localizes>:message = "GREEN CORE"
    unknown_destination_board<localizes>:message = "?"
    reactor_destination_board<localizes>:message = "POWER REACTOR"
    research_destination_board<localizes>:message = "RESEARCH SCANNER"
    storage_destination_board<localizes>:message = "STORAGE BAY"
    small_detail_board<localizes>:message = "GET SMALL BLUE CORE"
    final_unknown_board<localizes>:message = "BRING ? ENERGY CELL\nTO ?"
    unknown_component_board<localizes>:message = "?"
    green_component_board<localizes>:message = "GREEN"
    cell_component_board<localizes>:message = "ENERGY CELL"
    generator_component_board<localizes>:message = "DOOR GENERATOR"
    prompt_readout<localizes>(core:message, destination:message):message = "GET {core}\nTAKE TO {destination}"
    final_readout<localizes>(color:message, item:message, destination:message):message = "BRING {color} {item}\nTO {destination}"

    display_board(board:billboard_device, content:message):void =
        board.SetText(content)
        board.ShowText()
        board.UpdateDisplay()

    core_board_name(choice:int):message =
        case (choice):
            0 => blue_core_board
            1 => red_core_board
            2 => green_core_board
            _ => unknown_core_board

    destination_board_name(choice:int):message =
        case (choice):
            0 => reactor_destination_board
            1 => research_destination_board
            2 => storage_destination_board
            _ => unknown_destination_board

    refresh_prompt_board(state:prompt_lab_player_state):void =
        if (state.stage = 0):
            display_board(prompt_hologram, prompt_readout(core_board_name(state.chosen_core), destination_board_name(state.chosen_destination)))
        else if (state.stage = 1):
            if (state.size_choice = 1):
                display_board(prompt_hologram, ambiguity_clear_board)
            else if (state.size_choice = 0):
                display_board(prompt_hologram, small_detail_board)
            else:
                display_board(prompt_hologram, blue_core_board)
        else if (state.stage = 2):
            var color:message = unknown_component_board
            var item:message = unknown_component_board
            var destination:message = unknown_component_board
            if (state.selected_green?):
                set color = green_component_board
            if (state.selected_cell?):
                set item = cell_component_board
            if (state.selected_generator?):
                set destination = generator_component_board
            display_board(prompt_hologram, final_readout(color, item, destination))

    buttons()<transacts>:[]button_device = array{target_scanner, destination_scanner,
        blue_selector, red_selector, green_selector, reactor_selector,
        research_selector, storage_selector, send_button, small_selector,
        large_selector, energy_scanner, final_green_selector,
        final_cell_selector, final_generator_selector, module_connection,
        replay_button}

    button_texts()<transacts>:[]message = array{target_scan_text,
        destination_scan_text, blue_text, red_text, green_text, reactor_text,
        research_text, storage_text, send_text, small_text, large_text,
        energy_text, final_green_text, final_cell_text, final_generator_text,
        module_text, replay_text}

    OnBegin<override>()<suspends>:void =
        Hide()
        if (use_blaster_mode?):
            for (index -> input_button : buttons(), index < 16):
                input_button.Disable()
            target_hologram.HideText()
            destination_hologram.HideText()
            ambiguity_hologram.HideText()
            target_rail.Disable()
            target_rail.Hide()
            green_rail.Disable()
            green_rail.Hide()
            data_cube.Despawn()
            return
        set pix_home = pix.GetTransform()
        set blue_home = blue_delivery_core.GetTransform()
        set red_home = red_delivery_core.GetTransform()
        set green_core_home = green_delivery_core.GetTransform()
        set large_home = large_blue_delivery_core.GetTransform()
        set green_home = green_delivery_cell.GetTransform()
        set door_home = lab_door.GetTransform()
        set platform_home = moving_platform.GetTransform()
        small_blue_core.Hide()
        large_blue_delivery_core.Hide()
        display_board(target_hologram, target_unknown_board)
        display_board(destination_hologram, destination_unknown_board)
        display_board(prompt_hologram, prompt_readout(unknown_core_board, unknown_destination_board))
        ambiguity_hologram.HideText()
        for (index -> input_button : buttons(), label := button_texts()[index]):
            input_button.SetInteractionText(label)
            input_button.SetInteractionTime(0.0)
            input_button.SetMaxTriggerCount(0)
            input_button.InteractedWithEvent.Subscribe(prompt_lab_button_action{controller := Self, choice := index}.on_press)
        target_rail.StartedGrindingEvent.Subscribe(on_target_rail)
        green_rail.StartedGrindingEvent.Subscribe(on_green_rail)
        data_cube.DropEvent.Subscribe(on_cube_released)
        data_cube.ThrowEvent.Subscribe(on_cube_released)
        data_cube.Spawn()
        progress.round_settings.RoundBeginEvent.Subscribe(on_round)
        GetPlayspace().PlayerAddedEvent().Subscribe(on_join)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_departure)
        for (input_player : GetPlayspace().GetPlayers()):
            on_join(input_player)
        spawn { animate_platform(round_generation) }

    get_state(input_player:player):prompt_lab_player_state =
        if (existing := states[input_player]):
            return existing
        state := prompt_lab_player_state{}
        set state.target_known = team_target_known
        set state.destination_known = team_destination_known
        if (set states[input_player] = state) {}
        return state

    on_join(input_player:player):void =
        get_state(input_player)
        feedback.Show(input_player, intro, ?DisplayTime := 6.0)

    on_departure(input_player:player):void =
        var remaining:[player]prompt_lab_player_state = map{}
        for (other -> state : states, other <> input_player):
            if (set remaining[other] = state) {}
        set states = remaining

    on_round():void =
        set round_generation += 1
        set states = map{}
        set execution_owner = false
        set team_target_known = false
        set team_destination_known = false
        set team_green_known = false
        set team_cell_known = false
        set team_generator_known = false
        reset_props()
        if (moving_platform.TeleportTo[platform_home]) {}
        small_blue_core.Hide()
        large_blue_delivery_core.Hide()
        display_board(target_hologram, target_unknown_board)
        display_board(destination_hologram, destination_unknown_board)
        display_board(prompt_hologram, prompt_readout(unknown_core_board, unknown_destination_board))
        ambiguity_hologram.HideText()
        data_cube.Spawn()
        for (input_player : GetPlayspace().GetPlayers()):
            on_join(input_player)
        spawn { animate_platform(round_generation) }

    reset_props():void =
        if (pix.TeleportTo[pix_home]) {}
        if (blue_delivery_core.TeleportTo[blue_home]) {}
        if (red_delivery_core.TeleportTo[red_home]) {}
        if (green_delivery_core.TeleportTo[green_core_home]) {}
        if (large_blue_delivery_core.TeleportTo[large_home]) {}
        if (green_delivery_cell.TeleportTo[green_home]) {}
        if (not any_player_needs_open_door()?):
            if (lab_door.TeleportTo[door_home]) {}

    any_player_needs_open_door()<transacts>:logic =
        for (input_player -> state : states):
            if (state.stage >= 3):
                return true
        return false

    any_player_needs_second_core()<transacts>:logic =
        for (input_player -> state : states):
            if (state.stage >= 1):
                return true
        return false

    has_other_player(input_player:player)<transacts>:logic =
        for (other -> state : states, other <> input_player):
            return true
        return false

    animate_platform(generation:int)<suspends>:void =
        loop:
            if (generation <> round_generation):
                return
            var outer:transform = platform_home
            set outer.Translation = platform_home.Translation + vector3{Y := 300.0}
            moving_platform.MoveTo(outer, 2.0)
            if (generation <> round_generation):
                return
            moving_platform.MoveTo(platform_home, 2.0)

    on_target_rail(input_agent:agent):void =
        if (input_player := player[input_agent], state := states[input_player], state.stage = 0):
            set state.target_rail_used = true
            feedback.Show(input_player, rail_hint, ?DisplayTime := 3.0)

    on_green_rail(input_agent:agent):void =
        if (input_player := player[input_agent], state := states[input_player], state.stage = 2):
            set state.green_rail_used = true
            set team_green_known = true
            for (other -> other_state : states, other_state.stage = 2):
                set other_state.green_known = true
            green_clue_vfx.Begin()
            feedback.Show(input_player, green_found, ?DisplayTime := 5.0)

    on_cube_released(input_agent:agent):void =
        if (input_player := player[input_agent]):
            spawn { check_cube_receiver(input_player, round_generation) }

    check_cube_receiver(input_player:player, generation:int)<suspends>:void =
        for (sample := 0..20):
            if (generation <> round_generation):
                return
            if (state := states[input_player], state.stage = 2, not state.generator_known?):
                if (cube_pose := data_cube.CarryableObjectTransform?):
                    if (Distance(cube_pose.Translation, cube_receiver.GetTransform().Translation) < 220.0):
                        set team_generator_known = true
                        for (other -> other_state : states, other_state.stage = 2):
                            set other_state.generator_known = true
                        receiver_vfx.Begin()
                        feedback.Show(input_player, cube_found, ?DisplayTime := 6.0)
                        return
            Sleep(0.15)

    on_button(input_agent:agent, choice:int):void =
        if (input_player := player[input_agent]):
            state := get_state(input_player)
            if (choice = 16):
                if (execution_owner?):
                    feedback.Show(input_player, pix_busy, ?DisplayTime := 3.0)
                else:
                    replay_state := prompt_lab_player_state{}
                    if (has_other_player(input_player)?):
                        set replay_state.target_known = team_target_known
                        set replay_state.destination_known = team_destination_known
                    else:
                        set team_target_known = false
                        set team_destination_known = false
                        set team_green_known = false
                        set team_cell_known = false
                        set team_generator_known = false
                        display_board(target_hologram, target_unknown_board)
                        display_board(destination_hologram, destination_unknown_board)
                    if (set states[input_player] = replay_state) {}
                    reset_props()
                    refresh_prompt_board(get_state(input_player))
                    if (not any_player_needs_second_core()?):
                        small_blue_core.Hide()
                        large_blue_delivery_core.Hide()
                    if (not data_cube.IsSpawned[]):
                        data_cube.Spawn()
                    feedback.Show(input_player, replay_notice, ?DisplayTime := 5.0)
                return
            if (choice = 15):
                if (state.stage = 3, state.module_ready?):
                    progress.award_prompt_badge(input_player)
                    set state.module_ready = false
                    set state.stage = 4
                    display_board(prompt_hologram, module_online_board)
                    module_vfx.Begin()
                    success_audio.Play()
                    feedback.Show(input_player, module_done, ?DisplayTime := 8.0)
                else if (state.stage = 4):
                    feedback.Show(input_player, module_repeat, ?DisplayTime := 5.0)
                else:
                    feedback.Show(input_player, module_early, ?DisplayTime := 4.0)
                return
            if (choice = 8):
                send_prompt(input_player, state)
                return
            if (state.stage = 0):
                first_choice(input_player, state, choice)
                refresh_prompt_board(state)
            else if (state.stage = 1):
                size_choice(input_player, state, choice)
                refresh_prompt_board(state)
            else if (state.stage = 2):
                rescue_choice(input_player, state, choice)
                refresh_prompt_board(state)

    first_choice(input_player:player, state:prompt_lab_player_state, choice:int):void =
        if (choice = 0):
            if (state.target_rail_used? or team_target_known?):
                set team_target_known = true
                for (other -> other_state : states, other_state.stage = 0):
                    set other_state.target_known = true
                display_board(target_hologram, target_blue_board)
                target_scan_vfx.Begin()
                feedback.Show(input_player, target_found, ?DisplayTime := 5.0)
            else:
                feedback.Show(input_player, rail_hint, ?DisplayTime := 4.0)
        else if (choice >= 2 and choice <= 4):
            if (not state.target_known?):
                feedback.Show(input_player, need_target, ?DisplayTime := 4.0)
            else if (choice = 2):
                set state.chosen_core = 0
                console_vfx.Begin()
                selection_audio.Play()
                feedback.Show(input_player, blue_chosen, ?DisplayTime := 5.0)
            else:
                set state.chosen_core = choice - 2
                console_vfx.Begin()
                selection_audio.Play()
                if (choice = 3):
                    feedback.Show(input_player, red_chosen, ?DisplayTime := 4.0)
                else:
                    feedback.Show(input_player, green_chosen, ?DisplayTime := 4.0)
        else if (choice = 1):
            set team_destination_known = true
            for (other -> other_state : states, other_state.stage = 0):
                set other_state.destination_known = true
            display_board(destination_hologram, destination_reactor_board)
            destination_scan_vfx.Begin()
            feedback.Show(input_player, destination_found, ?DisplayTime := 5.0)
        else if (choice >= 5 and choice <= 7):
            if (not state.destination_known?):
                feedback.Show(input_player, need_destination, ?DisplayTime := 4.0)
            else if (choice = 5):
                set state.chosen_destination = 0
                console_vfx.Begin()
                selection_audio.Play()
                feedback.Show(input_player, ready_first, ?DisplayTime := 5.0)
            else:
                set state.chosen_destination = choice - 5
                console_vfx.Begin()
                selection_audio.Play()
                feedback.Show(input_player, destination_wrong, ?DisplayTime := 4.0)

    size_choice(input_player:player, state:prompt_lab_player_state, choice:int):void =
        if (choice = 9):
            set state.size_choice = 0
            console_vfx.Begin()
            feedback.Show(input_player, size_wrong, ?DisplayTime := 4.0)
        else if (choice = 10):
            set state.size_choice = 1
            console_vfx.Begin()
            feedback.Show(input_player, size_ready, ?DisplayTime := 5.0)

    rescue_choice(input_player:player, state:prompt_lab_player_state, choice:int):void =
        if (choice = 11):
            set team_cell_known = true
            for (other -> other_state : states, other_state.stage = 2):
                set other_state.cell_known = true
            energy_scan_vfx.Begin()
            feedback.Show(input_player, cell_found, ?DisplayTime := 5.0)
        else if (choice = 12):
            if (state.green_known?):
                set state.selected_green = true
                console_vfx.Begin()
                feedback.Show(input_player, part_added, ?DisplayTime := 3.0)
            else:
                feedback.Show(input_player, clue_needed, ?DisplayTime := 4.0)
        else if (choice = 13):
            if (state.cell_known?):
                set state.selected_cell = true
                console_vfx.Begin()
                feedback.Show(input_player, part_added, ?DisplayTime := 3.0)
            else:
                feedback.Show(input_player, clue_needed, ?DisplayTime := 4.0)
        else if (choice = 14):
            if (state.generator_known?):
                set state.selected_generator = true
                console_vfx.Begin()
                feedback.Show(input_player, part_added, ?DisplayTime := 3.0)
            else:
                feedback.Show(input_player, clue_needed, ?DisplayTime := 4.0)
        if (state.selected_green?, state.selected_cell?, state.selected_generator?):
            feedback.Show(input_player, final_ready, ?DisplayTime := 6.0)

    send_prompt(input_player:player, state:prompt_lab_player_state):void =
        if (execution_owner?):
            feedback.Show(input_player, pix_busy, ?DisplayTime := 3.0)
            return
        if (state.stage = 0):
            if (state.chosen_core = 0, state.chosen_destination = 0):
                set execution_owner = option{input_player}
                console_vfx.Begin()
                feedback.Show(input_player, first_running, ?DisplayTime := 5.0)
                spawn { run_first(input_player, round_generation) }
            else if (state.chosen_core = 1, state.chosen_destination >= 0):
                set execution_owner = option{input_player}
                console_vfx.Begin()
                spawn { run_wrong_red(input_player, state.chosen_destination, round_generation) }
            else if (state.chosen_core = 2, state.chosen_destination >= 0):
                set execution_owner = option{input_player}
                console_vfx.Begin()
                spawn { run_wrong_green(input_player, state.chosen_destination, round_generation) }
            else if (state.chosen_core = 0, state.chosen_destination > 0):
                set execution_owner = option{input_player}
                console_vfx.Begin()
                spawn { run_wrong_destination(input_player, state.chosen_destination, round_generation) }
            else if (state.chosen_core = 1):
                feedback.Show(input_player, need_destination, ?DisplayTime := 4.0)
            else if (state.chosen_core = 2):
                feedback.Show(input_player, need_destination, ?DisplayTime := 4.0)
            else if (state.chosen_destination > 0):
                feedback.Show(input_player, destination_wrong, ?DisplayTime := 4.0)
            else:
                feedback.Show(input_player, need_prompt, ?DisplayTime := 4.0)
        else if (state.stage = 1):
            if (state.size_choice = 1):
                set execution_owner = option{input_player}
                console_vfx.Begin()
                spawn { run_second(input_player, round_generation) }
            else if (state.size_choice = 0):
                feedback.Show(input_player, size_wrong, ?DisplayTime := 4.0)
            else:
                feedback.Show(input_player, ambiguous, ?DisplayTime := 5.0)
        else if (state.stage = 2):
            if (state.selected_green?, state.selected_cell?, state.selected_generator?):
                set execution_owner = option{input_player}
                console_vfx.Begin()
                feedback.Show(input_player, final_running, ?DisplayTime := 5.0)
                spawn { run_final(input_player, round_generation) }
            else:
                feedback.Show(input_player, final_incomplete, ?DisplayTime := 5.0)

    run_first(input_player:player, generation:int)<suspends>:void =
        if (pix.TeleportTo[pix_home]) {}
        if (blue_delivery_core.TeleportTo[blue_home]) {}
        pix.MoveTo(blue_home, 1.2)
        if (generation <> round_generation):
            return
        blue_delivery_core.MoveTo(power_reactor.GetTransform(), 2.0)
        pix.MoveTo(power_reactor.GetTransform(), 1.2)
        if (generation <> round_generation):
            return
        reactor_home := power_reactor.GetTransform()
        var reactor_charge:transform = reactor_home
        set reactor_charge.Translation = reactor_home.Translation + vector3{Z := 100.0}
        power_reactor.MoveTo(reactor_charge, 0.3)
        power_reactor.MoveTo(reactor_home, 0.3)
        reactor_pulse_vfx.Begin()
        success_audio.Play()
        var pix_celebration:transform = pix.GetTransform()
        set pix_celebration.Translation = pix_celebration.Translation + vector3{Z := 120.0}
        pix.MoveTo(pix_celebration, 0.35)
        if (state := states[input_player], state.stage = 0):
            set state.stage = 1
            small_blue_core.Show()
            large_blue_delivery_core.Show()
            display_board(ambiguity_hologram, ambiguity_board)
            ambiguity_vfx.Begin()
            refresh_prompt_board(state)
            feedback.Show(input_player, first_success, ?DisplayTime := 3.0)
            Sleep(3.0)
            if (generation <> round_generation):
                return
            feedback.Show(input_player, first_lesson, ?DisplayTime := 4.0)
            Sleep(4.0)
            if (generation <> round_generation):
                return
            feedback.Show(input_player, ambiguous, ?DisplayTime := 6.0)
        set execution_owner = false

    run_wrong_red(input_player:player, destination:int, generation:int)<suspends>:void =
        if (pix.TeleportTo[pix_home]) {}
        if (red_delivery_core.TeleportTo[red_home]) {}
        var destination_pose:transform = power_reactor.GetTransform()
        if (destination = 1):
            set destination_pose = research_scanner.GetTransform()
        else if (destination = 2):
            set destination_pose = storage_bay.GetTransform()
        pix.MoveTo(red_home, 1.2)
        if (generation <> round_generation):
            return
        red_delivery_core.MoveTo(destination_pose, 2.0)
        pix.MoveTo(destination_pose, 1.2)
        if (generation <> round_generation):
            return
        if (destination = 0):
            reject_vfx.Begin()
            retry_audio.Play()
            feedback.Show(input_player, red_rejected, ?DisplayTime := 5.0)
            var bounced_red:transform = destination_pose
            set bounced_red.Translation = destination_pose.Translation + vector3{Z := 180.0}
            red_delivery_core.MoveTo(bounced_red, 0.35)
        else:
            retry_audio.Play()
            feedback.Show(input_player, red_wrong_place, ?DisplayTime := 5.0)
        red_delivery_core.MoveTo(red_home, 1.0)
        pix.MoveTo(pix_home, 1.0)
        set execution_owner = false

    run_wrong_green(input_player:player, destination:int, generation:int)<suspends>:void =
        if (pix.TeleportTo[pix_home]) {}
        if (green_delivery_core.TeleportTo[green_core_home]) {}
        var destination_pose:transform = power_reactor.GetTransform()
        if (destination = 1):
            set destination_pose = research_scanner.GetTransform()
        else if (destination = 2):
            set destination_pose = storage_bay.GetTransform()
        pix.MoveTo(green_core_home, 1.2)
        if (generation <> round_generation):
            return
        green_delivery_core.MoveTo(destination_pose, 2.0)
        pix.MoveTo(destination_pose, 1.2)
        if (generation <> round_generation):
            return
        if (destination = 0):
            reject_vfx.Begin()
            retry_audio.Play()
            feedback.Show(input_player, green_rejected, ?DisplayTime := 5.0)
            var bounced_green:transform = destination_pose
            set bounced_green.Translation = destination_pose.Translation + vector3{Z := 180.0}
            green_delivery_core.MoveTo(bounced_green, 0.35)
        else:
            retry_audio.Play()
            feedback.Show(input_player, green_wrong_place, ?DisplayTime := 5.0)
        green_delivery_core.MoveTo(green_core_home, 1.0)
        pix.MoveTo(pix_home, 1.0)
        set execution_owner = false

    run_wrong_destination(input_player:player, destination:int, generation:int)<suspends>:void =
        if (pix.TeleportTo[pix_home]) {}
        if (blue_delivery_core.TeleportTo[blue_home]) {}
        var destination_pose:transform = research_scanner.GetTransform()
        if (destination = 2):
            set destination_pose = storage_bay.GetTransform()
        pix.MoveTo(blue_home, 1.2)
        if (generation <> round_generation):
            return
        blue_delivery_core.MoveTo(destination_pose, 2.0)
        pix.MoveTo(destination_pose, 1.2)
        if (generation <> round_generation):
            return
        feedback.Show(input_player, wrong_destination_result, ?DisplayTime := 5.0)
        retry_audio.Play()
        blue_delivery_core.MoveTo(blue_home, 1.0)
        pix.MoveTo(pix_home, 1.0)
        set execution_owner = false

    run_second(input_player:player, generation:int)<suspends>:void =
        if (pix.TeleportTo[pix_home]) {}
        if (large_blue_delivery_core.TeleportTo[large_home]) {}
        pix.MoveTo(large_home, 1.2)
        if (generation <> round_generation):
            return
        large_blue_delivery_core.MoveTo(power_reactor.GetTransform(), 2.0)
        pix.MoveTo(power_reactor.GetTransform(), 1.2)
        if (generation <> round_generation):
            return
        reactor_pulse_vfx.Begin()
        success_audio.Play()
        if (state := states[input_player], state.stage = 1):
            set state.stage = 2
            set state.green_known = team_green_known
            set state.cell_known = team_cell_known
            set state.generator_known = team_generator_known
            ambiguity_hologram.HideText()
            refresh_prompt_board(state)
            feedback.Show(input_player, size_success, ?DisplayTime := 3.0)
            Sleep(3.0)
            if (generation <> round_generation):
                return
            feedback.Show(input_player, size_lesson, ?DisplayTime := 3.0)
            Sleep(3.0)
            if (generation <> round_generation):
                return
            feedback.Show(input_player, rescue_intro, ?DisplayTime := 8.0)
        set execution_owner = false

    run_final(input_player:player, generation:int)<suspends>:void =
        if (pix.TeleportTo[pix_home]) {}
        if (green_delivery_cell.TeleportTo[green_home]) {}
        pix.MoveTo(green_home, 1.2)
        if (generation <> round_generation):
            return
        green_delivery_cell.MoveTo(door_generator.GetTransform(), 2.0)
        pix.MoveTo(door_generator.GetTransform(), 1.2)
        if (generation <> round_generation):
            return
        generator_vfx.Begin()
        success_audio.Play()
        var opened:transform = door_home
        set opened.Translation = door_home.Translation + vector3{Z := 450.0}
        lab_door.MoveTo(opened, 1.2)
        if (state := states[input_player], state.stage = 2):
            set state.stage = 3
            set state.module_ready = true
            display_board(prompt_hologram, door_open_board)
            feedback.Show(input_player, door_open, ?DisplayTime := 8.0)
        set execution_owner = false
