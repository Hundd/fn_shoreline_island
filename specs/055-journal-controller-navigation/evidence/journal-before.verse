using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org/Colors }
using { /Fortnite.com/UI }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }
academy_journal_action := class:
    journal:fn_shoreline_island_academy_journal
    generation:int
    choice:int
    on_click(click_message:widget_message):void =
        journal.on_choice(click_message.Player, generation, choice)
academy_core_route_action := class:
    journal:fn_shoreline_island_academy_journal
    source_index:int
    on_complete(input_agent:agent):void =
        journal.on_badge_complete(input_agent, source_index)

navigation_empty<localizes>:message = ""
academy_navigation_state := class:
    var panel:?canvas = false
    count:text_block = text_block{DefaultTextSize := 21.0, DefaultTextColor := NamedColors.White}
    action:text_block = text_block{DefaultTextSize := 18.0, DefaultTextColor := NamedColors.White}
    var initialized:logic = false
    var snapshot:[]logic = array{}
    var module_index:int = -1
    var source:int = -1
    var token:int = -1
    var step:int = 0
    var total:int = 0
    var instruction:message = navigation_empty
    var reported_at:float = -10.0
    var handoff_until:float = 0.0
    var handoff:message = navigation_empty
    var pulse:int = -1

# Displays authoritative round progress without changing or awarding it.

fn_shoreline_island_academy_journal := class(creative_device):
    @editable
    open_button:button_device = button_device{}
    @editable
    garden:byte_island_game_manager = byte_island_game_manager{}
    @editable
    lagoon:fn_shoreline_island_loop_progress = fn_shoreline_island_loop_progress{}
    # Stable binding indices: Signal, Energy, Debug, Event, Bot, Nursery.
    @editable
    later_badge_trackers:[]tracker_device = array{}
    @editable
    marker_0:map_indicator_device = map_indicator_device{}
    @editable
    marker_1:map_indicator_device = map_indicator_device{}
    @editable
    marker_2:map_indicator_device = map_indicator_device{}
    @editable
    marker_3:map_indicator_device = map_indicator_device{}
    @editable
    marker_4:map_indicator_device = map_indicator_device{}
    @editable
    marker_5:map_indicator_device = map_indicator_device{}
    @editable
    marker_6:map_indicator_device = map_indicator_device{}
    @editable
    marker_7:map_indicator_device = map_indicator_device{}
    @editable
    marker_8:map_indicator_device = map_indicator_device{}
    @editable
    core_label_0:billboard_device = billboard_device{}
    @editable
    core_label_1:billboard_device = billboard_device{}
    @editable
    core_label_2:billboard_device = billboard_device{}
    @editable
    core_label_3:billboard_device = billboard_device{}
    @editable
    core_label_4:billboard_device = billboard_device{}
    @editable
    core_label_5:billboard_device = billboard_device{}
    @editable
    core_label_6:billboard_device = billboard_device{}
    @editable
    core_label_7:billboard_device = billboard_device{}
    @editable
    core_light_0:customizable_light_device = customizable_light_device{}
    @editable
    core_light_1:customizable_light_device = customizable_light_device{}
    @editable
    core_light_2:customizable_light_device = customizable_light_device{}
    @editable
    core_light_3:customizable_light_device = customizable_light_device{}
    @editable
    core_light_4:customizable_light_device = customizable_light_device{}
    @editable
    core_light_5:customizable_light_device = customizable_light_device{}
    @editable
    core_light_6:customizable_light_device = customizable_light_device{}
    @editable
    core_light_7:customizable_light_device = customizable_light_device{}
    var navigation:[player]academy_navigation_state = map{}
    var core_snapshot:[]logic = array{}
    var missing_completion_reported:[]int = array{}
    var navigation_ready:logic = false
    var panels:[player]?canvas = map{}
    var panel_generations:[player]int = map{}
    var next_generation:int = 0
    var core_routes:[player]?canvas = map{}
    var core_route_generations:[player]int = map{}
    var next_core_route_generation:int = 0
    var core_celebrations:[player]?canvas = map{}
    var core_celebration_generations:[player]int = map{}
    var next_core_celebration_generation:int = 0
    var travel_adapter:?fn_shoreline_island_pix_travel = false
    var round_generation:int = 0
    close_text<localizes>:message = "Close"
    work_text<localizes>:message = "Work"
    overview_text<localizes>:message = "Back"
    open_text<localizes>:message = "Open my AI Core journal"
    earned_text<localizes>:message = "Completed"
    earned_badge_text<localizes>:message = "Completed"
    ready_text<localizes>:message = "Available"
    locked_text<localizes>:message = "Unavailable"
    agent_ready_text<localizes>:message = "Available"
    unavailable_text<localizes>:message = "Not yet available"
    garden_next<localizes>:message = "1 Prompt Workshop: choose a core, size and destination for Pix."
    loop_next<localizes>:message = "2 Pattern Scanner: shoot the missing symbol."
    signal_next<localizes>:message = "3 AI Classifier: sort incoming items into categories."
    energy_next<localizes>:message = "4 Confidence Core: check Pix's claim, then check the change."
    debug_next<localizes>:message = "5 AI Error Lab: shoot a correction, then check Pix's route."
    event_next<localizes>:message = "6 AI Tool Lab: choose a useful tool response."
    nursery_next<localizes>:message = "7 Popcorn Parkour: shoot PopBridge, then jump onto what you make."
    bot_next<localizes>:message = "8 AI Agent Mission: plan and verify a rescue delivery."
    replay_next<localizes>:message = "Try a replay or explore another open path."
    core_progress<localizes>(online_modules:int):message = "PIX AI CORE: {online_modules}/8 MODULES ONLINE"
    core_restored_title<localizes>:message = "PIX AI CORE FULLY RESTORED"
    core_restored_body<localizes>:message = "All eight modules are ONLINE.\nYou helped Pix follow instructions, spot patterns, classify, check confidence, fix mistakes, use tools, build skills, and complete an agent mission."
    journal_text<localizes>(core_state:message, guidance:message, garden_status:message, loop_status:message, signal_status:message, energy_status:message, debug_status:message, event_status:message, nursery_status:message, bot_status:message, destination:message):message = "{core_state}\n{guidance}\n1 Prompt Workshop: {garden_status} | 2 Pattern Scanner: {loop_status}\n3 AI Classifier: {signal_status} | 4 Confidence Core: {energy_status}\n5 AI Error Lab: {debug_status} | 6 AI Tool Lab: {event_status}\n7 Pix's Popcorn Parkour: {nursery_status}\n8 AI Agent Mission: {bot_status}\nNext: {destination}\nEvery open module is yours to explore."
    garden_name<localizes>:message = "1 Prompt Workshop"
    loop_name<localizes>:message = "2 Pattern Scanner"
    signal_name<localizes>:message = "3 AI Classifier"
    energy_name<localizes>:message = "4 Confidence Core"
    debug_name<localizes>:message = "5 AI Error Lab"
    event_name<localizes>:message = "6 AI Tool Lab"
    bot_name<localizes>:message = "8 AI Agent Mission"
    nursery_name<localizes>:message = "7 Pix's Popcorn Parkour"
    garden_work<localizes>:message = "Clear instructions help AI understand what you want."
    loop_work<localizes>:message = "AI can use patterns in examples to help make predictions."
    signal_work<localizes>:message = "Classification means sorting things into categories."
    energy_work<localizes>:message = "A confident claim needs evidence; check again after a change."
    debug_work<localizes>:message = "AI can make mistakes, so important answers should be checked."
    event_work<localizes>:message = "AI systems can use tools to get information or perform actions."
    bot_work<localizes>:message = "AI agents combine instructions, decisions, tools, and actions to complete a goal."
    nursery_work<localizes>:message = "A reusable skill combines several steps into one useful ability."
    work_done<localizes>(zone:message, contribution:message):message = "{zone}: {contribution}"
    work_pending<localizes>(zone:message):message = "{zone}: OFFLINE — restore this module."
    work_unavailable<localizes>(zone:message):message = "{zone}: Not yet available."
    work_page<localizes>(garden_row:message, loop_row:message, signal_row:message, energy_row:message, debug_row:message, event_row:message, nursery_row:message, bot_row:message):message = "PIX AI CORE STATUS\nYour restored modules this round:\n{garden_row}\n{loop_row}\n{signal_row}\n{energy_row}\n{debug_row}\n{event_row}\n{nursery_row}\n{bot_row}"
    core_work_left<localizes>:message = "Restore Pix's offline AI modules."
    core_work_done<localizes>:message = "All eight AI Core modules are ONLINE!"
    data_transfer_title<localizes>(online_modules:int):message = "PIX AI CORE | {online_modules}/8 MODULES ONLINE"
    data_transfer_text<localizes>(source:message, path:string):message = "{source}  {path}  PIX AI CORE"
    OnBegin<override>()<suspends>:void =
        Hide()
        open_button.SetInteractionText(open_text)
        open_button.SetMaxTriggerCount(0)
        open_button.SetInteractionTime(0.0)
        open_button.InteractedWithEvent.Subscribe(on_open)
        garden.round_settings.RoundBeginEvent.Subscribe(on_round)
        garden.badge_tracker.CompleteEvent.Subscribe(academy_core_route_action{journal := Self, source_index := 0}.on_complete)
        lagoon.badge_tracker.CompleteEvent.Subscribe(academy_core_route_action{journal := Self, source_index := 1}.on_complete)
        for (index -> badge : later_badge_trackers):
            badge.CompleteEvent.Subscribe(academy_core_route_action{journal := Self, source_index := index + 2}.on_complete)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_departure)
        for (spawner : array{garden.hub_spawner_0, garden.hub_spawner_1, garden.hub_spawner_2, garden.hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        GetPlayspace().PlayerAddedEvent().Subscribe(on_join)
        for (input_player : GetPlayspace().GetPlayers()):
            initialize_navigation(input_player)
        spawn{navigation_refresh()}


    has_garden(input_player:player)<transacts><decides>:void =
        garden.player_states[input_player].badge_earned?
    has_loop(input_player:player)<transacts><decides>:void =
        lagoon.states[input_player].badge_earned?
    get_garden_status(input_player:player):message =
        if (has_garden[input_player]):
            return earned_text
        return ready_text
    get_loop_status(input_player:player):message =
        if (has_loop[input_player]):
            return earned_text
        return ready_text
    later_status(input_player:player, index:int):message =
        if (badge := later_badge_trackers[index]):
            count := badge.GetValue(input_player)
            if (count >= 1):
                return earned_badge_text
            return ready_text
        return unavailable_text
    agent_status(input_player:player):message =
        if (badge := later_badge_trackers[4], badge.GetValue(input_player) >= 1):
            return earned_badge_text
        if (module_available(input_player, 7)?):
            return agent_ready_text
        return unavailable_text
    first_seven_online(input_player:player)<transacts>:logic =
        for (index := 0..6):
            if (not module_restored(input_player, index)?):
                return false
        return true

    completed_modules(input_player:player)<transacts>:int =
        var completed:int = 0
        for (index := 0..7):
            if (module_restored(input_player, index)?):
                set completed += 1
        return completed

    core_guidance(input_player:player)<transacts>:message =
        if (completed_modules(input_player) >= 8):
            return core_work_done
        return core_work_left
    recommendation(input_player:player):message =
        destinations := array{garden_next, loop_next, signal_next, energy_next, debug_next, event_next, nursery_next, bot_next}
        if (destination := destinations[next_module(input_player)]):
            return destination
        if (completed_modules(input_player) >= 8):
            return replay_next
        return unavailable_text
    on_open(input_agent:agent):void =
        if (input_player := player[input_agent]):
            show_panel(input_player, false)
    on_badge_complete(input_agent:agent, source_index:int):void =
        if (input_player := player[input_agent]):
            spawn{show_data_transfer(input_player, source_index, round_generation)}
    close_data_transfer(input_player:player):void =
        if (route := core_routes[input_player]?, personal_ui := GetPlayerUI[input_player]):
            personal_ui.RemoveWidget(route)
        if (set core_routes[input_player] = false) {}
        set next_core_route_generation += 1
        if (set core_route_generations[input_player] = next_core_route_generation) {}
    show_data_transfer(input_player:player, source_index:int, expected_round:int)<suspends>:void =
        # Completion events may precede tracker readback. The shared refresh reconciles it.
        Sleep(0.0)
    work_row(input_player:player, index:int):message =
        names := array{garden_name, loop_name, signal_name, energy_name, debug_name, event_name, bot_name, nursery_name}
        contributions := array{garden_work, loop_work, signal_work, energy_work, debug_work, event_work, bot_work, nursery_work}
        if (zone := names[index], contribution := contributions[index]):
            if (index = 0):
                if (has_garden[input_player]):
                    return work_done(zone, contribution)
            else if (index = 1):
                if (has_loop[input_player]):
                    return work_done(zone, contribution)
            else:
                if (badge := later_badge_trackers[index - 2]):
                    if (badge.GetValue(input_player) >= 1):
                        return work_done(zone, contribution)
                else:
                    return work_unavailable(zone)
            return work_pending(zone)
        return unavailable_text
    on_choice(input_player:player, generation:int, choice:int):void =
        if (panels[input_player]?, panel_generations[input_player] = generation):
            if (choice = 0):
                close_panel(input_player)
            else if (choice = 1):
                show_panel(input_player, true)
            else:
                show_panel(input_player, false)
    show_panel(input_player:player, show_work:logic):void =
        if (travel := travel_adapter?):
            travel.close(input_player)
        if (personal_ui := GetPlayerUI[input_player]):
            close_panel(input_player)
            set next_generation += 1
            generation := next_generation
            if (set panel_generations[input_player] = generation) {}
            var page_text:message = journal_text(
                core_progress(completed_modules(input_player)),
                core_guidance(input_player),
                module_status(input_player, 0), module_status(input_player, 1),
                module_status(input_player, 2), module_status(input_player, 3),
                module_status(input_player, 4), module_status(input_player, 5),
                module_status(input_player, 6), module_status(input_player, 7), recommendation(input_player))
            var panel_top:float = -210.0
            var panel_height:float = 420.0
            var body_top:float = -180.0
            var body_height:float = 290.0
            page_button := button_regular{DefaultText := work_text}
            if (show_work?):
                set page_text = work_page(work_row(input_player, 0), work_row(input_player, 1),
                    work_row(input_player, 2), work_row(input_player, 3), work_row(input_player, 4),
                    work_row(input_player, 5), work_row(input_player, 7), work_row(input_player, 6))
                set panel_top = -290.0
                set panel_height = 500.0
                set body_top = -260.0
                set body_height = 370.0
                page_button.SetText(overview_text)
                action := academy_journal_action{journal := Self, generation := generation, choice := 2}
                page_button.OnClick().Subscribe(action.on_click)
            else:
                action := academy_journal_action{journal := Self, generation := generation, choice := 1}
                page_button.OnClick().Subscribe(action.on_click)
            body := text_block{DefaultText := page_text,
                DefaultTextColor := NamedColors.White, DefaultTextSize := 22.0}
            close_button := button_regular{DefaultText := close_text}
            close_action := academy_journal_action{journal := Self, generation := generation, choice := 0}
            close_button.OnClick().Subscribe(close_action.on_click)
            center := anchors{Minimum := vector2{X := 0.5, Y := 0.5}, Maximum := vector2{X := 0.5, Y := 0.5}}
            panel := canvas:
                Slots := array:
                    canvas_slot:
                        Anchors := center
                        SizeToContent := false
                        Offsets := margin{Left := -410.0, Top := panel_top, Right := 820.0, Bottom := panel_height}
                        Widget := color_block{DefaultColor := color{R := 0.015, G := 0.04, B := 0.08}, DefaultOpacity := 0.98}
                    canvas_slot:
                        Anchors := center
                        SizeToContent := false
                        Offsets := margin{Left := -380.0, Top := body_top, Right := 760.0, Bottom := body_height}
                        Widget := body
                    canvas_slot:
                        Anchors := center
                        SizeToContent := false
                        Offsets := margin{Left := -380.0, Top := 130.0, Right := 210.0, Bottom := 55.0}
                        Widget := page_button
                    canvas_slot:
                        Anchors := center
                        SizeToContent := false
                        Offsets := margin{Left := -140.0, Top := 130.0, Right := 280.0, Bottom := 55.0}
                        Widget := close_button
            if (set panels[input_player] = option{panel}):
                personal_ui.AddWidget(panel, player_ui_slot{InputMode := ui_input_mode.All})
    close_core_restored(input_player:player):void =
        if (celebration := core_celebrations[input_player]?, personal_ui := GetPlayerUI[input_player]):
            personal_ui.RemoveWidget(celebration)
        if (set core_celebrations[input_player] = false) {}
        set next_core_celebration_generation += 1
        if (set core_celebration_generations[input_player] = next_core_celebration_generation) {}
    show_core_restored(input_player:player, expected_round:int)<suspends>:void =
        # Kept for the Agent's existing call; presentation owns deduplication.
        Sleep(0.0)
    # Read-only presentation query; module activity/rewards remain authoritative.
    is_panel_open(input_player:player)<transacts>:logic =
        if (panels[input_player]?):
            return true
        return false

    close_panel(input_player:player):void =
        if (panel := panels[input_player]?, personal_ui := GetPlayerUI[input_player]):
            personal_ui.RemoveWidget(panel)
        if (set panels[input_player] = false) {}
    on_spawn(input_agent:agent):void =
        if (input_player := player[input_agent]):
            close_panel(input_player)
            close_data_transfer(input_player)
            close_core_restored(input_player)
            clear_activity(input_player)
            initialize_navigation(input_player)
    on_departure(input_player:player):void =
        remove_navigation(input_player)
        var remaining_navigation:[player]academy_navigation_state = map{}
        for (other -> state : navigation, other <> input_player):
            if (set remaining_navigation[other] = state) {}
        set navigation = remaining_navigation
        close_panel(input_player)
        close_data_transfer(input_player)
        close_core_restored(input_player)
        var remaining_panels:[player]?canvas = map{}
        var remaining_generations:[player]int = map{}
        var remaining_routes:[player]?canvas = map{}
        var remaining_route_generations:[player]int = map{}
        var remaining_celebrations:[player]?canvas = map{}
        var remaining_celebration_generations:[player]int = map{}
        for (other -> panel : panels, other <> input_player):
            if (set remaining_panels[other] = panel) {}
        for (other -> generation : panel_generations, other <> input_player):
            if (set remaining_generations[other] = generation) {}
        for (other -> route : core_routes, other <> input_player):
            if (set remaining_routes[other] = route) {}
        for (other -> generation : core_route_generations, other <> input_player):
            if (set remaining_route_generations[other] = generation) {}
        for (other -> celebration : core_celebrations, other <> input_player):
            if (set remaining_celebrations[other] = celebration) {}
        for (other -> generation : core_celebration_generations, other <> input_player):
            if (set remaining_celebration_generations[other] = generation) {}
        set panels = remaining_panels
        set panel_generations = remaining_generations
        set core_routes = remaining_routes
        set core_route_generations = remaining_route_generations
        set core_celebrations = remaining_celebrations
        set core_celebration_generations = remaining_celebration_generations
    on_round():void =
        for (input_player -> state : navigation):
            remove_navigation(input_player)
        set navigation = map{}
        set core_snapshot = array{}
        set round_generation += 1
        for (input_player -> panel : panels):
            close_panel(input_player)
        for (input_player -> route : core_routes):
            close_data_transfer(input_player)
        for (input_player -> celebration : core_celebrations):
            close_core_restored(input_player)
        set panels = map{}
        set panel_generations = map{}
        set core_routes = map{}
        set core_route_generations = map{}
        set core_celebrations = map{}
        set core_celebration_generations = map{}
    markers()<transacts>:[]map_indicator_device =
        array{marker_0, marker_1, marker_2, marker_3, marker_4, marker_5, marker_6, marker_7}
    core_labels()<transacts>:[]billboard_device =
        array{core_label_0, core_label_1, core_label_2, core_label_3, core_label_4, core_label_5, core_label_6, core_label_7}
    core_lights()<transacts>:[]customizable_light_device =
        array{core_light_0, core_light_1, core_light_2, core_light_3, core_light_4, core_light_5, core_light_6, core_light_7}
    module_names()<transacts>:[]message =
        array{garden_name, loop_name, signal_name, energy_name, debug_name, event_name, nursery_name, bot_name}

    navigation_count<localizes>(count:int):message = "PIX AI CORE: {count}/8 restored"
    optional_prompt_arena_name<localizes>:message = "Optional Prompt Arena"
    navigation_step<localizes>(name:message, step:int, total:int, instruction:message):message = "{name} | Step {step}/{total}\n{instruction}"
    navigation_next<localizes>(name:message):message = "Next: {name}\nFollow its numbered map marker."
    navigation_handoff<localizes>(name:message, count:int, destination:message):message = "{name} restored - {count}/8\nNext: {destination}"
    navigation_done<localizes>:message = "All eight abilities restored!\nReplay a lesson or explore an optional path."
    in_progress_text<localizes>:message = "In progress"
    segment_text<localizes>(name:string, state:string):message = "{name}\n{state}"
    # No badge mutations. Reports must come from the current guarded controller attempt.
    report_activity(input_player:player, source:int, module_index:int, step:int, total:int, instruction:message, token:int):void =
        if (state := navigation[input_player]):
            if (state.source = source, token < state.token):
                return
            set state.source = source
            set state.module_index = module_index
            set state.token = token
            set state.step = step
            set state.total = total
            set state.instruction = instruction
            set state.reported_at = GetSimulationElapsedTime()
    clear_activity(input_player:player):void =
        if (state := navigation[input_player]):
            set state.module_index = -1
            set state.source = -1
            set state.token = -1
            set state.reported_at = -10.0
    on_join(input_player:player):void =
        initialize_navigation(input_player)
    initialize_navigation(input_player:player):void =
        if (existing := navigation[input_player], existing.panel?):
            return
        if (personal_ui := GetPlayerUI[input_player]):
            state := academy_navigation_state{}
            bottom := anchors{Minimum := vector2{X := 0.0, Y := 1.0}, Maximum := vector2{X := 0.0, Y := 1.0}}
            panel := canvas:
                Slots := array:
                    canvas_slot:
                        Anchors := bottom
                        SizeToContent := false
                        Offsets := margin{Left := 24.0, Top := -260.0, Right := 430.0, Bottom := 105.0}
                        Widget := color_block{DefaultColor := color{R := 0.015, G := 0.04, B := 0.08}, DefaultOpacity := 0.9}
                    canvas_slot:
                        Anchors := bottom
                        SizeToContent := false
                        Offsets := margin{Left := 36.0, Top := -251.0, Right := 406.0, Bottom := 28.0}
                        Widget := state.count
                    canvas_slot:
                        Anchors := bottom
                        SizeToContent := false
                        Offsets := margin{Left := 36.0, Top := -221.0, Right := 406.0, Bottom := 62.0}
                        Widget := state.action
            set state.panel = option{panel}
            if (set navigation[input_player] = state):
                personal_ui.AddWidget(panel, player_ui_slot{ZOrder := 5, InputMode := ui_input_mode.None})
    remove_navigation(input_player:player):void =
        if (state := navigation[input_player]):
            if (panel := state.panel?, personal_ui := GetPlayerUI[input_player]):
                personal_ui.RemoveWidget(panel)
            if (marker := markers()[state.pulse]):
                marker.DeactivateObjectivePulse(input_player)
            set state.panel = false
            set state.pulse = -1
            clear_activity(input_player)
    module_restored(input_player:player, module_index:int)<transacts>:logic =
        if (module_index = 0):
            if (has_garden[input_player]):
                return true
        else if (module_index = 1):
            if (has_loop[input_player]):
                return true
        else:
            order := array{0, 1, 2, 3, 5, 4}
            if (index := order[module_index - 2], badge := later_badge_trackers[index], badge.GetTransform().Translation.Z > 1000.0, badge.GetValue(input_player) >= 1):
                return true
        return false
    next_module(input_player:player)<transacts>:int =
        for (module_index := 0..7):
            if (module_available(input_player, module_index)?, not module_restored(input_player, module_index)?):
                return module_index
        return -1
    module_status(input_player:player, module_index:int):message =
        if (not module_available(input_player, module_index)?):
            return unavailable_text
        if (module_restored(input_player, module_index)?):
            return earned_text
        if (module_index >= 2):
            order := array{0, 1, 2, 3, 5, 4}
            if (index := order[module_index - 2], badge := later_badge_trackers[index]):
                if (badge.GetTransform().Translation.Z < 1000.0):
                    return unavailable_text
            else:
                return unavailable_text
        if (state := navigation[input_player], state.module_index = module_index, GetSimulationElapsedTime() - state.reported_at < 0.75):
            return in_progress_text
        return ready_text
    navigation_refresh()<suspends>:void =
        # A single presentation loop; actual controllers retain their own safety monitors.
        Sleep(0.25)
        loop:
            for (input_player : GetPlayspace().GetPlayers()):
                initialize_navigation(input_player)
                if (state := navigation[input_player]):
                    now := GetSimulationElapsedTime()
                    var snapshot:[]logic = array{}
                    for (module_index := 0..7):
                        if (not module_available(input_player, module_index)?, not missing_completion_reported.Find[module_index]):
                            set missing_completion_reported += array{module_index}
                            diagnostic_names := array{"Prompt Workshop", "Pattern Scanner", "Data Classifier", "Confidence Bay", "Error Lab", "AI Tool Lab", "AI Skills Lab", "Agent Mission"}
                            if (diagnostic_name := diagnostic_names[module_index]):
                                Print("ACADEMY: missing completion binding for {module_index + 1} {diagnostic_name}; recommendation skips unavailable module")
                        restored := module_restored(input_player, module_index)
                        set snapshot += array{restored}
                        if (state.initialized?, restored?, previous := state.snapshot[module_index], not previous?, name := module_names()[module_index]):
                            destination := recommendation(input_player)
                            set state.handoff = navigation_handoff(name, completed_modules(input_player), destination)
                            if (completed_modules(input_player) >= 8):
                                set state.handoff = navigation_done
                            set state.handoff_until = now + 4.0
                    set state.snapshot = snapshot
                    set state.initialized = true
                    state.count.SetText(navigation_count(completed_modules(input_player)))
                    var pulse:int = next_module(input_player)
                    if (state.module_index >= 0, now - state.reported_at < 0.75):
                        set pulse = -1
                    if (now < state.handoff_until):
                        state.action.SetText(state.handoff)
                    else if (state.module_index >= 0, now - state.reported_at < 0.75, name := module_names()[state.module_index]):
                        var activity_name:message = name
                        if (state.source = 8, state.module_index = 0):
                            set activity_name = optional_prompt_arena_name
                        state.action.SetText(navigation_step(activity_name, state.step, state.total, state.instruction))
                        set pulse = -1
                    else if (completed_modules(input_player) >= 8):
                        state.action.SetText(navigation_done)
                    else if (name := module_names()[pulse]):
                        if (not module_available(input_player, pulse)?):
                            state.action.SetText(unavailable_text)
                            set pulse = -1
                        else:
                            state.action.SetText(navigation_next(name))
                    else:
                        state.action.SetText(unavailable_text)
                    if (state.pulse <> pulse):
                        if (previous := markers()[state.pulse]):
                            previous.DeactivateObjectivePulse(input_player)
                        if (next := markers()[pulse], next.GetTransform().Translation.Z > 1000.0):
                            next.ActivateObjectivePulse(input_player)
                        set state.pulse = pulse
                    names := array{"1 PROMPT", "2 PATTERN", "3 CLASSIFIER", "4 CONFIDENCE", "5 ERROR", "6 TOOLS", "7 SKILLS", "8 AGENT"}
                    for (module_index -> restored : snapshot):
                        var changed:logic = true
                        if (previous := core_snapshot[module_index], previous = restored):
                            set changed = false
                        if (changed?, board := core_labels()[module_index], light := core_lights()[module_index], name := names[module_index]):
                            if (board.GetTransform().Translation.Z > 1000.0):
                                if (restored?):
                                    board.SetText(segment_text(name, "RESTORED"))
                                    light.TurnOn()
                                else:
                                    board.SetText(segment_text(name, "WAITING"))
                                    light.TurnOff()
                                board.UpdateDisplay()
                            else:
                                Print("ACADEMY: missing Core segment binding {module_index}")
                    set core_snapshot = snapshot
            Sleep(0.25)


    module_available(input_player:player, module_index:int)<transacts>:logic =
        if (module_index = 0):
            if (garden.GetTransform().Translation.Z > 1000.0):
                return true
            return false
        if (module_index = 1):
            if (lagoon.GetTransform().Translation.Z > 1000.0):
                return true
            return false
        order := array{0, 1, 2, 3, 5, 4}
        if (index := order[module_index - 2], badge := later_badge_trackers[index], badge.GetTransform().Translation.Z > 1000.0):
            return true
        return false
