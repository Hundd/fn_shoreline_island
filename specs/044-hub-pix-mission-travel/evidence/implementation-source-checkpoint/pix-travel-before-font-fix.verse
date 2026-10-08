using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Fortnite.com/UI }
using { /Verse.org/Simulation }
using { /Verse.org/Colors }
using { /Verse.org/Input }
using { /Verse.org/Input/UI }
using { /Verse.org/Verse }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }

pix_travel_action := class:
    controller:fn_shoreline_island_pix_travel
    input_player:player
    epoch:int
    round:int
    choice:int
    on_click(click_message:widget_message):void =
        if (click_message.Player = input_player):
            controller.on_choice(input_player, epoch, round, choice)

pix_travel_state := class:
    var panel:?canvas = false
    var subscriptions:[]cancelable = array{}
    var epoch:int = 0
    var stage:int = 0
    var selected:int = -1
    var armed:logic = false
    var character:?fort_character = false
    var confirm_after:float = 0.0
    var mapping_owned:logic = false
    var destination:?teleporter_device = false
    var destination_position:vector3 = vector3{}

# Transport only: never calls lesson entry, replay, completion or reward functions.
fn_shoreline_island_pix_travel := class(creative_device):
    @editable
    configured:logic = false
    @editable
    talk:button_device = button_device{}
    @editable
    journal:fn_shoreline_island_academy_journal = fn_shoreline_island_academy_journal{}
    @editable
    arrival_0:teleporter_device = teleporter_device{}
    @editable
    arrival_1:teleporter_device = teleporter_device{}
    @editable
    arrival_2:teleporter_device = teleporter_device{}
    @editable
    arrival_3:teleporter_device = teleporter_device{}
    @editable
    arrival_4:teleporter_device = teleporter_device{}
    @editable
    arrival_5:teleporter_device = teleporter_device{}
    @editable
    arrival_6:teleporter_device = teleporter_device{}
    @editable
    arrival_7:teleporter_device = teleporter_device{}
    @editable
    destination_enabled:[]logic = array{}
    @editable
    workshop:fn_shoreline_island_prompt_workshop = fn_shoreline_island_prompt_workshop{}
    @editable
    pattern:fn_shoreline_island_pattern_line = fn_shoreline_island_pattern_line{}
    @editable
    classifier:fn_shoreline_island_signal_station = fn_shoreline_island_signal_station{}
    @editable
    confidence:fn_shoreline_island_energy_station = fn_shoreline_island_energy_station{}
    @editable
    error_lab:fn_shoreline_island_debug_station = fn_shoreline_island_debug_station{}
    @editable
    tool_lab:fn_shoreline_island_event_station = fn_shoreline_island_event_station{}
    @editable
    popcorn:fn_shoreline_island_popbridge_production = fn_shoreline_island_popbridge_production{}
    @editable
    agent_mission:fn_shoreline_island_bot_station = fn_shoreline_island_bot_station{}
    var states:[player]pix_travel_state = map{}
    var round:int = 0
    text<localizes>(value:string):message = "{value}"
    names:[]string = array{"Prompt Workshop", "Pattern Scanner", "AI Classifier", "Confidence Core", "AI Error Lab", "AI Tool Lab", "Pix's Popcorn Parkour", "AI Agent Mission"}
    activities:[]string = array{"Choose instructions for Pix.", "Shoot the missing pattern symbol.", "Sort items into categories.", "Check a claim and the change.", "Correct Pix's route.", "Choose a useful tool response.", "Build PopBridge and jump across.", "Plan and verify a rescue delivery."}

    OnBegin<override>()<suspends>:void =
        Hide()
        if (not configured? or destinations().Length <> 8 or destination_enabled.Length <> 8 or journal.GetTransform().Translation.Z < 1000.0 or talk.GetTransform().Translation.Z < 1000.0):
            Print("PIX TRAVEL: incomplete configuration; inactive")
            return
        set journal.travel_adapter = option{Self}
        talk.SetInteractionText(text("Talk to Pix"))
        talk.SetInteractionTime(0.0)
        talk.SetMaxTriggerCount(0)
        talk.InteractedWithEvent.Subscribe(on_talk)
        journal.garden.round_settings.RoundBeginEvent.Subscribe(on_round)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_departure)
        for (spawner : array{journal.garden.hub_spawner_0, journal.garden.hub_spawner_1, journal.garden.hub_spawner_2, journal.garden.hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        monitor()

    destinations()<transacts>:[]teleporter_device =
        array{arrival_0, arrival_1, arrival_2, arrival_3, arrival_4, arrival_5, arrival_6, arrival_7}

    state_for(input_player:player):pix_travel_state =
        if (state := states[input_player]):
            return state
        new_state := pix_travel_state{}
        if (set states[input_player] = new_state) {}
        return new_state

    # Check live owners, including pending PopBridge portal/dialog presentation.
    owner_clear(input_player:player)<transacts>:logic =
        if (workshop.execution_owner? = input_player or pattern.active_player? = input_player or classifier.active_player? = input_player or confidence.active_player? = input_player or error_lab.active_player? = input_player or tool_lab.owner? = input_player or popcorn.owner? = input_player or popcorn.dialog_owner? = input_player or popcorn.portal_player? = input_player or agent_mission.owner? = input_player):
            return false
        if (state := agent_mission.progress.states[input_player], state.station_id >= 0):
            return false
        return true

    near(input_player:player, radius:float)<transacts><decides>:void =
        character := input_player.GetFortCharacter[]
        character.IsActive[]
        position := character.GetTransform().Translation
        # Existing controllers use feet-normalized bounds; hub surface is2412cm.
        feet := position.Z - 77.15
        feet >= 2350.0
        feet <= 2650.0
        dx := position.X + 100.0
        dy := position.Y - 2450.0
        dx * dx + dy * dy <= radius * radius

    destination_ready(input_player:player, index:int)<transacts>:logic =
        if (configured?, destinations().Length = 8, enabled := destination_enabled[index], enabled?, destination := destinations()[index], destination.GetTransform().Translation.Z > 1000.0, journal.module_available(input_player, index)?):
            if (index = 0):
                return workshop.configured
            if (index = 1):
                return pattern.configured
            if (index = 2):
                return classifier.configured
            if (index = 3):
                return confidence.configured
            if (index = 4):
                return error_lab.configured
            if (index = 5):
                return tool_lab.configured
            if (index = 6):
                return popcorn.ready
            if (index = 7):
                return agent_mission.agent_mission_ready(input_player)
        return false

    close(input_player:player):void =
        if (state := states[input_player]):
            # Invalidate actions and unsubscribe before widget removal.
            set state.epoch += 1
            for (subscription : state.subscriptions):
                subscription.Cancel()
            set state.subscriptions = array{}
            if (panel := state.panel?, personal_ui := GetPlayerUI[input_player]):
                personal_ui.RemoveWidget(panel)
            if (state.mapping_owned?, input := GetPlayerInput[input_player]):
                input.RemoveInputMapping(MenuNavigationMapping)
            set state.mapping_owned = false
            set state.panel = false
            set state.selected = -1
            set state.destination = false

    on_talk(input_agent:agent):void =
        if (input_player := player[input_agent], near[input_player, 125.0], owner_clear(input_player)?):
            journal.close_panel(input_player)
            show(input_player, 0, -1)

    on_spawn(input_agent:agent):void =
        if (input_player := player[input_agent]):
            close(input_player)
            state := state_for(input_player)
            set state.armed = false
            set state.character = false

    on_departure(input_player:player):void =
        close(input_player)
        var remaining:[player]pix_travel_state = map{}
        for (other -> state : states, other <> input_player):
            if (set remaining[other] = state) {}
        set states = remaining

    on_round():void =
        set round += 1
        for (input_player -> state : states):
            close(input_player)
        set states = map{}

    monitor()<suspends>:void =
        loop:
            for (input_player : GetPlayspace().GetPlayers()):
                state := state_for(input_player)
                if (character := input_player.GetFortCharacter[], character.IsActive[]):
                    if (previous := state.character?, previous <> character):
                        close(input_player)
                        set state.armed = false
                    set state.character = option{character}
                    if (not near[input_player, 200.0]):
                        close(input_player)
                        set state.armed = true
                    else if (not owner_clear(input_player)?):
                        close(input_player)
                        set state.armed = false
                    else if (state.panel?, not near[input_player, 125.0]):
                        close(input_player)
                    else if (near[input_player, 125.0], state.armed?, not state.panel?, not journal.is_panel_open(input_player)?):
                        set state.armed = false
                        show(input_player, 0, -1)
                else:
                    close(input_player)
                    set state.armed = false
            Sleep(0.1)

    on_choice(input_player:player, epoch:int, expected_round:int, choice:int):void =
        if (state := states[input_player], state.panel?, state.epoch = epoch, round = expected_round, near[input_player, 125.0], owner_clear(input_player)?, character := input_player.GetFortCharacter[], state.character? = character, character.IsActive[], GetPlayspace().GetPlayers().Find[input_player]):
            if (choice = -1):
                close(input_player)
            else if (choice = -2):
                show(input_player, 1, -1)
            else if (choice = -3):
                index := state.selected
                if (state.stage = 2, GetSimulationElapsedTime() >= state.confirm_after, destination_ready(input_player, index)?, destination := state.destination?, Distance(destination.GetTransform().Translation, state.destination_position) <= 0.1):
                    # Captured index/ref are immutable for this dialog; close first.
                    close(input_player)
                    set state.armed = false
                    destination.Teleport(input_player)
                else if (not destination_ready(input_player, index)?):
                    show(input_player, 1, -1)
            else if (state.stage = 1, destination_ready(input_player, choice)?):
                show(input_player, 2, choice)

    slot(item:widget, left:float, top:float, width:float, height:float):canvas_slot =
        canvas_slot{Anchors := anchors{Minimum := vector2{X := 0.5, Y := 0.5}, Maximum := vector2{X := 0.5, Y := 0.5}}, SizeToContent := false, Offsets := margin{Left := left, Top := top, Right := width, Bottom := height}, Widget := item}

    # Fortnite's normal button styling provides pointer hover, pressed and
    # keyboard/controller focus feedback; raw UI.button has no such style.
    make_button(input_player:player, state:pix_travel_state, label:string, choice:int, is_back:logic):button_regular =
        action_button := button_regular{DefaultText := text(label)}
        if (is_back?):
            set action_button.TriggeringInputAction = option{Back}
        action := pix_travel_action{controller := Self, input_player := input_player, epoch := state.epoch, round := round, choice := choice}
        set state.subscriptions += array{action_button.OnClick().Subscribe(action.on_click)}
        return action_button

    make_card(input_player:player, state:pix_travel_state, label:string, status:string, choice:int):button_regular =
        # Keep the status in the accessible/focused button label as well.
        make_button(input_player, state, "{label}\n{status}", choice, false)

    show(input_player:player, stage:int, selected:int):void =
        if (not configured? or not owner_clear(input_player)?):
            return
        if (personal_ui := GetPlayerUI[input_player], character := input_player.GetFortCharacter[], character.IsActive[]):
            close(input_player)
            state := state_for(input_player)
            set state.armed = false
            set state.character = option{character}
            set state.stage = stage
            set state.selected = selected
            if (destination := destinations()[selected]):
                set state.destination = option{destination}
                set state.destination_position = destination.GetTransform().Translation
            set state.confirm_after = GetSimulationElapsedTime() + 0.2
            var slots:[]canvas_slot = array{slot(color_block{DefaultColor := color{R := 0.015, G := 0.04, B := 0.08}, DefaultOpacity := 0.98}, -460.0, -310.0, 920.0, 620.0)}
            var heading:string = "Pix"
            var body:string = "Ready for an adventure?\nChoose a mission and I'll take you there."
            var initial:?widget = false
            if (stage = 0):
                choose := make_button(input_player, state, "Choose a mission", -2, false)
                cancel := make_button(input_player, state, "Not now", -1, true)
                set slots += array{slot(choose, -420.0, 180.0, 400.0, 72.0), slot(cancel, 20.0, 180.0, 400.0, 72.0)}
                set initial = option{choose}
            else if (stage = 1):
                set heading = "Choose a mission"
                set body = "Choose freely. Your earned badges stay."
                # Row-major slots give focus order1,5,2,6,3,7,4,8.
                for (row := 0..3, column := 0..1):
                    index := row + column * 4
                    if (name := names[index]):
                        var status:string = "Unavailable - travel is not ready"
                        available := destination_ready(input_player, index)
                        if (available?):
                            set status = "Ready"
                            if (journal.module_restored(input_player, index)?):
                                set status = "Completed"
                        card := make_card(input_player, state, "{index + 1} {name}", status, index)
                        card.SetEnabled(available)
                        set slots += array{slot(card, -420.0 + column * 440.0, -160.0 + row * 80.0, 400.0, 72.0)}
                        if (available?, not initial?):
                            set initial = option{card}
                cancel := make_button(input_player, state, "Cancel", -1, true)
                set slots += array{slot(cancel, -180.0, 190.0, 360.0, 72.0)}
                if (not initial?):
                    set initial = option{cancel}
            else if (name := names[selected], activity := activities[selected]):
                set heading = "Go to {name}?"
                set body = activity
                var label:string = "Go"
                if (journal.module_restored(input_player, selected)?):
                    set heading = "Visit {name} again?"
                    set body = "Your earned badge stays.\n{activity}"
                    set label = "Visit again"
                go := make_button(input_player, state, label, -3, false)
                back := make_button(input_player, state, "Back", -2, true)
                set slots += array{slot(go, -420.0, 180.0, 400.0, 72.0), slot(back, 20.0, 180.0, 400.0, 72.0)}
                set initial = option{back}
            set slots += array{slot(text_block{DefaultText := text(heading), DefaultTextSize := 28.0, DefaultTextColor := NamedColors.White}, -420.0, -280.0, 840.0, 48.0), slot(text_block{DefaultText := text(body), DefaultTextSize := 22.0, DefaultTextColor := NamedColors.White}, -420.0, -225.0, 840.0, 60.0)}
            panel := canvas{Slots := slots}
            set state.panel = option{panel}
            if (input := GetPlayerInput[input_player]):
                input.AddInputMapping(MenuNavigationMapping)
                set state.mapping_owned = true
            personal_ui.AddWidget(panel, player_ui_slot{InputMode := ui_input_mode.All, ZOrder := 20})
            if (focus := initial?):
                personal_ui.SetFocus(focus)


