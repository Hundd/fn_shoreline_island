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
    var panels:[player]?canvas = map{}
    var panel_generations:[player]int = map{}
    var next_generation:int = 0
    var core_routes:[player]?canvas = map{}
    var core_route_generations:[player]int = map{}
    var next_core_route_generation:int = 0
    var core_celebrations:[player]?canvas = map{}
    var core_celebration_generations:[player]int = map{}
    var next_core_celebration_generation:int = 0
    var round_generation:int = 0

    close_text<localizes>:message = "Close"
    work_text<localizes>:message = "Work"
    overview_text<localizes>:message = "Back"
    open_text<localizes>:message = "Open my AI Core journal"
    earned_text<localizes>:message = "ONLINE"
    earned_badge_text<localizes>:message = "ONLINE"
    ready_text<localizes>:message = "OFFLINE"
    locked_text<localizes>:message = "LOCKED"
    agent_ready_text<localizes>:message = "READY"
    unavailable_text<localizes>:message = "Not yet available"
    garden_next<localizes>:message = "Prompt Workshop: choose a core, size and destination for Pix."
    loop_next<localizes>:message = "Pattern Scanner: find patterns and predict the next step."
    signal_next<localizes>:message = "AI Classifier: sort incoming items into categories."
    energy_next<localizes>:message = "Confidence Core: use clues to improve Pix's confidence."
    debug_next<localizes>:message = "AI Error Lab: check and correct an AI mistake."
    event_next<localizes>:message = "AI Tool Lab: choose a useful tool response."
    nursery_next<localizes>:message = "AI Skills Lab: reuse Pix's GrowPlant skill."
    bot_next<localizes>:message = "AI Agent Mission: combine Pix's restored abilities."
    replay_next<localizes>:message = "Try a replay or explore another open path."
    core_progress<localizes>(online_modules:int):message = "PIX AI CORE: {online_modules}/8 MODULES ONLINE"
    core_restored_title<localizes>:message = "PIX AI CORE FULLY RESTORED"
    core_restored_body<localizes>:message = "All eight modules are ONLINE.\nYou helped Pix follow instructions, spot patterns, classify, check confidence, fix mistakes, use tools, build skills, and complete an agent mission."
    journal_text<localizes>(core_state:message, guidance:message, garden_status:message, loop_status:message, signal_status:message, energy_status:message, debug_status:message, event_status:message, nursery_status:message, bot_status:message, destination:message):message = "{core_state}\n{guidance}\nPrompt Lab: {garden_status} | Pattern Scanner: {loop_status}\nAI Classifier: {signal_status} | Confidence Core: {energy_status}\nAI Error Lab: {debug_status} | AI Tool Lab: {event_status}\nAI Skills Lab: {nursery_status} | AI Agent Mission: {bot_status}\nNext: {destination}\nEvery open module is yours to explore."
    garden_name<localizes>:message = "Prompt Lab"
    loop_name<localizes>:message = "Pattern Scanner"
    signal_name<localizes>:message = "AI Classifier"
    energy_name<localizes>:message = "Confidence Core"
    debug_name<localizes>:message = "AI Error Lab"
    event_name<localizes>:message = "AI Tool Lab"
    bot_name<localizes>:message = "AI Agent Mission"
    nursery_name<localizes>:message = "AI Skills Lab"
    garden_work<localizes>:message = "Clear instructions help AI understand what you want."
    loop_work<localizes>:message = "AI can use patterns in examples to help make predictions."
    signal_work<localizes>:message = "Classification means sorting things into categories."
    energy_work<localizes>:message = "AI can be more or less confident about an answer."
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
        if (first_seven_online(input_player)?):
            return agent_ready_text
        return locked_text

    first_seven_online(input_player:player)<transacts>:logic =
        if (not has_garden[input_player] or not has_loop[input_player]):
            return false
        required_tracker_indices := array{0, 1, 2, 3, 5}
        for (index : required_tracker_indices):
            if (badge := later_badge_trackers[index]):
                if (badge.GetValue(input_player) < 1):
                    return false
            else:
                return false
        return true

    completed_modules(input_player:player)<transacts>:int =
        var completed:int = 0
        if (has_garden[input_player]):
            set completed += 1
        if (has_loop[input_player]):
            set completed += 1
        for (index := 0..5):
            if (badge := later_badge_trackers[index], badge.GetValue(input_player) >= 1):
                set completed += 1
        return completed

    core_guidance(input_player:player)<transacts>:message =
        if (completed_modules(input_player) >= 8):
            return core_work_done
        return core_work_left

    recommendation(input_player:player):message =
        if (not has_garden[input_player]):
            return garden_next
        if (not has_loop[input_player]):
            return loop_next
        destinations := array{signal_next, energy_next, debug_next, event_next, nursery_next, bot_next}
        tracker_order := array{0, 1, 2, 3, 5, 4}
        for (position -> destination : destinations):
            if (index := tracker_order[position], badge := later_badge_trackers[index], badge.GetValue(input_player) < 1):
                return destination
        return replay_next

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
        if (round_generation <> expected_round):
            return
        if (personal_ui := GetPlayerUI[input_player]):
            sources := array{garden_name, loop_name, signal_name, energy_name, debug_name, event_name, bot_name, nursery_name}
            if (source := sources[source_index]):
                close_data_transfer(input_player)
                generation := next_core_route_generation
                online_modules := completed_modules(input_player)
                title := text_block{DefaultText := data_transfer_title(online_modules),
                    DefaultTextColor := color{R := 0.05, G := 0.72, B := 1.0}, DefaultTextSize := 22.0}
                path := text_block{DefaultText := data_transfer_text(source, "[o----->]"),
                    DefaultTextColor := NamedColors.White, DefaultTextSize := 22.0}
                center := anchors{Minimum := vector2{X := 0.5, Y := 0.5}, Maximum := vector2{X := 0.5, Y := 0.5}}
                route := canvas:
                    Slots := array:
                        canvas_slot:
                            Anchors := center
                            SizeToContent := false
                            Offsets := margin{Left := -390.0, Top := -285.0, Right := 780.0, Bottom := 100.0}
                            Widget := color_block{DefaultColor := color{R := 0.015, G := 0.04, B := 0.08}, DefaultOpacity := 0.93}
                        canvas_slot:
                            Anchors := center
                            SizeToContent := false
                            Offsets := margin{Left := -365.0, Top := -270.0, Right := 730.0, Bottom := 35.0}
                            Widget := title
                        canvas_slot:
                            Anchors := center
                            SizeToContent := false
                            Offsets := margin{Left := -365.0, Top := -230.0, Right := 730.0, Bottom := 45.0}
                            Widget := path
                if (set core_routes[input_player] = option{route}):
                    personal_ui.AddWidget(route, player_ui_slot{ZOrder := 11, InputMode := ui_input_mode.None})
                    frames := array{"[-o---->]", "[--o--->]", "[---o-->]", "[----o->]", "[-----o>]"}
                    for (frame : frames):
                        Sleep(0.22)
                        if (core_route_generations[input_player] <> generation):
                            return
                        path.SetText(data_transfer_text(source, frame))
                    Sleep(0.45)
                    if (core_route_generations[input_player] = generation):
                        close_data_transfer(input_player)

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
        if (personal_ui := GetPlayerUI[input_player]):
            close_panel(input_player)
            set next_generation += 1
            generation := next_generation
            if (set panel_generations[input_player] = generation) {}
            var page_text:message = journal_text(
                core_progress(completed_modules(input_player)),
                core_guidance(input_player),
                get_garden_status(input_player), get_loop_status(input_player),
                later_status(input_player, 0), later_status(input_player, 1),
                later_status(input_player, 2), later_status(input_player, 3),
                later_status(input_player, 5), agent_status(input_player), recommendation(input_player))
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
        if (round_generation <> expected_round):
            return
        if (personal_ui := GetPlayerUI[input_player]):
            close_core_restored(input_player)
            generation := next_core_celebration_generation
            title := text_block{DefaultText := core_restored_title,
                DefaultTextColor := color{R := 0.05, G := 0.72, B := 1.0}, DefaultTextSize := 34.0}
            body := text_block{DefaultText := core_restored_body,
                DefaultTextColor := NamedColors.White, DefaultTextSize := 20.0}
            center := anchors{Minimum := vector2{X := 0.5, Y := 0.5}, Maximum := vector2{X := 0.5, Y := 0.5}}
            celebration := canvas:
                Slots := array:
                    canvas_slot:
                        Anchors := center
                        SizeToContent := false
                        Offsets := margin{Left := -430.0, Top := -150.0, Right := 860.0, Bottom := 300.0}
                        Widget := color_block{DefaultColor := color{R := 0.01, G := 0.08, B := 0.16}, DefaultOpacity := 0.96}
                    canvas_slot:
                        Anchors := center
                        SizeToContent := false
                        Offsets := margin{Left := -380.0, Top := -105.0, Right := 760.0, Bottom := 65.0}
                        Widget := title
                    canvas_slot:
                        Anchors := center
                        SizeToContent := false
                        Offsets := margin{Left := -380.0, Top := -25.0, Right := 760.0, Bottom := 155.0}
                        Widget := body
            if (set core_celebrations[input_player] = option{celebration}):
                personal_ui.AddWidget(celebration, player_ui_slot{ZOrder := 10, InputMode := ui_input_mode.None})
                Sleep(8.0)
                if (core_celebration_generations[input_player] = generation):
                    close_core_restored(input_player)

    close_panel(input_player:player):void =
        if (panel := panels[input_player]?, personal_ui := GetPlayerUI[input_player]):
            personal_ui.RemoveWidget(panel)
        if (set panels[input_player] = false) {}

    on_spawn(input_agent:agent):void =
        if (input_player := player[input_agent]):
            close_panel(input_player)
            close_data_transfer(input_player)
            close_core_restored(input_player)

    on_departure(input_player:player):void =
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
