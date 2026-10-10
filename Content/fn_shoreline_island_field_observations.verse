using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org/Colors }
using { /Fortnite.com/UI }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }

field_observation_panel := class:
    var panel:?canvas = false
    var observation:int = 0
    var generation:int = 0

field_observation_action := class:
    controller:fn_shoreline_island_field_observations
    generation:int
    choice:int
    on_click(click_message:widget_message):void =
        controller.on_choice(click_message.Player, generation, choice)

# Optional predictions only: no badge, reward or normal challenge writes.
fn_shoreline_island_field_observations := class(creative_device):
    @editable
    growth_button:button_device = button_device{}
    @editable
    lantern_button:button_device = button_device{}
    @editable
    cargo_button:button_device = button_device{}
    @editable
    human_button:button_device = button_device{}
    @editable
    growth_board:billboard_device = billboard_device{}
    @editable
    lantern_board:billboard_device = billboard_device{}
    @editable
    cargo_board:billboard_device = billboard_device{}
    @editable
    human_board:billboard_device = billboard_device{}
    @editable
    hub_spawner_0:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_1:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_2:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_3:player_spawner_device = player_spawner_device{}
    @editable
    round_settings:round_settings_device = round_settings_device{}
    var states:[player]field_observation_panel = map{}
    var next_generation:int = 0

    growth_open<localizes>:message = "AI Discovery: Check Pix's crate count"
    lantern_open<localizes>:message = "AI Discovery: Observe a pattern"
    cargo_open<localizes>:message = "AI Discovery: Observe categories"
    human_open<localizes>:message = "AI Discovery: Make a human decision"
    growth_sign<localizes>:message = "AI DISCOVERY TRAIL: CHECK PIX\nCount the data crates | Pix predicts 5\nOptional: use the button"
    lantern_sign<localizes>:message = "AI DISCOVERY TRAIL: PATTERN\n1 > 2 > 1 > 2 > 1 > ?\nOptional: use the button"
    cargo_sign<localizes>:message = "AI DISCOVERY TRAIL: CLASSIFY\nBanana > ?\nFood | Animal | Machine"
    human_sign<localizes>:message = "AI DISCOVERY TRAIL: HUMAN DECISION\nPix says Route A\nToday's signs: A CLOSED / B OPEN\nCheck new information before choosing"
    growth_question<localizes>:message = "AI DISCOVERY TRAIL: CHECK PIX\nCount the data crates near this station. Pix predicts 5.\nIs Pix correct? Choose an answer, or Close to keep exploring."
    lantern_question<localizes>:message = "AI DISCOVERY TRAIL: PATTERN\nLanterns flash in order: 1 > 2 > 1 > 2 > 1 > ?\nWhich number comes next?\nChoose a prediction, or Close to keep exploring."
    cargo_question<localizes>:message = "AI DISCOVERY TRAIL: CLASSIFY\nA Banana arrives. Which category matches?\nFood, Animal, or Machine?\nChoose a category, or Close to keep exploring."
    harvest_text<localizes>:message = "No"
    plant_text<localizes>:message = "Yes"
    one_text<localizes>:message = "1"
    two_text<localizes>:message = "2"
    garden_text<localizes>:message = "Food"
    storage_text<localizes>:message = "Animal"
    machine_text<localizes>:message = "Machine"
    again_text<localizes>:message = "Again"
    next_note_text<localizes>:message = "Next field note"
    close_text<localizes>:message = "Close"
    correct_text<localizes>:message = "Good check — your answer matches the evidence."
    retry_text<localizes>:message = "Check the evidence and try again."
    growth_explanation<localizes>:message = "Pix predicted 5, but there are 4 crates.\nAI can make mistakes, so check important answers.\nPeople use evidence to make the final decision."
    human_decision_question<localizes>:message = "AI DISCOVERY TRAIL: HUMAN DECISION\nPix suggests Route A.\nYou check today's signs: Route A is closed. Route B is open.\nWhich route should you take?"
    route_a_result<localizes>:message = "Route A is closed. Use the newest information and try again."
    route_b_result<localizes>:message = "Route B matches today's signs.\nYou used new information instead of just following Pix.\nAI can offer suggestions; people check the evidence and decide."
    route_a_text<localizes>:message = "Route A"
    route_b_text<localizes>:message = "Route B"
    lantern_explanation<localizes>:message = "Pattern prediction: 2 comes next.\nThe pair 1 > 2 repeats.\nAfter each 1, the next number is 2.\nPatterns can help predict what may come next."
    cargo_explanation<localizes>:message = "Banana is a fruit, so it belongs in Food.\nClassification means sorting items into categories.\nCheck important AI results: AI can make mistakes."
    answer_page<localizes>(selected:message, feedback:message, explanation:message):message = "YOUR FIELD NOTE\nYou chose: {selected}\n{feedback}\n{explanation}\nTry Again or keep exploring. No badge is needed."
    refreshed_sign<localizes>(text:message):message = "{text} "

    OnBegin<override>()<suspends>:void =
        Hide()
        buttons := array{growth_button, lantern_button, cargo_button, human_button}
        prompts := array{growth_open, lantern_open, cargo_open, human_open}
        for (index -> input_button : buttons, prompt := prompts[index]):
            input_button.SetInteractionText(prompt)
            input_button.SetMaxTriggerCount(0)
            input_button.SetInteractionTime(0.0)
        growth_button.InteractedWithEvent.Subscribe(on_growth)
        lantern_button.InteractedWithEvent.Subscribe(on_lantern)
        cargo_button.InteractedWithEvent.Subscribe(on_cargo)
        human_button.InteractedWithEvent.Subscribe(on_human)
        round_settings.RoundBeginEvent.Subscribe(on_round)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_departure)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        var alternate:logic = false
        loop:
            texts := array{growth_sign, lantern_sign, cargo_sign, human_sign}
            for (index -> sign : array{growth_board, lantern_board, cargo_board, human_board}, text := texts[index]):
                if (alternate?):
                    sign.SetText(refreshed_sign(text))
                else:
                    sign.SetText(text)
                sign.ShowText()
                sign.UpdateDisplay()
            if (alternate?):
                set alternate = false
            else:
                set alternate = true
            Sleep(3.0)

    on_growth(input_agent:agent):void =
        open_observation(input_agent, 0)

    on_lantern(input_agent:agent):void =
        open_observation(input_agent, 1)

    on_cargo(input_agent:agent):void =
        open_observation(input_agent, 2)

    on_human(input_agent:agent):void =
        if (input_player := player[input_agent]):
            show_human_decision(input_player, -1)

    open_observation(input_agent:agent, observation:int):void =
        if (input_player := player[input_agent]):
            show_panel(input_player, observation, -1)

    on_choice(input_player:player, generation:int, choice:int):void =
        if (state := states[input_player], state.panel?, state.generation = generation):
            if (choice = -2):
                close_panel(input_player)
            else if (choice = 3):
                show_human_decision(input_player, 0)
            else if (choice = 4):
                show_human_decision(input_player, 1)
            else if (choice = 5):
                show_human_decision(input_player, -1)
            else if (choice = 6, state.observation = 0):
                show_human_decision(input_player, -1)
            else:
                show_panel(input_player, state.observation, choice)

    show_panel(input_player:player, observation:int, answer:int):void =
        questions := array{growth_question, lantern_question, cargo_question}
        first_answers := array{harvest_text, two_text, garden_text}
        second_answers := array{plant_text, one_text, storage_text}
        explanations := array{growth_explanation, lantern_explanation, cargo_explanation}
        if:
            personal_ui := GetPlayerUI[input_player]
            question := questions[observation]
            first_answer := first_answers[observation]
            second_answer := second_answers[observation]
            explanation := explanations[observation]
        then:
            if (not states[input_player]):
                if (set states[input_player] = field_observation_panel{}) {}
            close_panel(input_player)
            if (state := states[input_player]):
                set state.observation = observation
                var text:message = question
                if (answer = 0):
                    set text = answer_page(first_answer, correct_text, explanation)
                else if (answer = 1):
                    set text = answer_page(second_answer, retry_text, explanation)
                else if (answer = 2, observation = 2):
                    set text = answer_page(machine_text, retry_text, explanation)
                center := anchors{Minimum := vector2{X := 0.5, Y := 0.5}, Maximum := vector2{X := 0.5, Y := 0.5}}
                var panel_height:float = 440.0
                var close_top:float = 130.0
                if (observation = 2, answer < 0):
                    set panel_height = 540.0
                    set close_top = 205.0
                var slots:[]canvas_slot = array:
                    canvas_slot:
                        SizeToContent := false
                        Anchors := center
                        Offsets := margin{Left := -450.0, Top := -220.0, Right := 900.0, Bottom := panel_height}
                        Widget := color_block{DefaultColor := color{R := 0.015, G := 0.04, B := 0.08}, DefaultOpacity := 0.98}
                    canvas_slot:
                        SizeToContent := false
                        Anchors := center
                        Offsets := margin{Left := -420.0, Top := -190.0, Right := 840.0, Bottom := 290.0}
                        Widget := text_block{DefaultText := text, DefaultTextColor := NamedColors.White, DefaultTextSize := 22.0}
                close_button := make_button(close_text, state.generation, -2)
                set slots += array{canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := 140.0, Top := close_top, Right := 260.0, Bottom := 55.0}, Widget := close_button}}
                if (answer >= 0):
                    again_button := make_button(again_text, state.generation, -1)
                    set slots += array{canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := -420.0, Top := 130.0, Right := 260.0, Bottom := 55.0}, Widget := again_button}}
                    if (observation = 0, answer = 0):
                        next_note_button := make_button(next_note_text, state.generation, 6)
                        set slots += array{canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := -140.0, Top := 130.0, Right := 260.0, Bottom := 55.0}, Widget := next_note_button}}
                else:
                    first_button := make_button(first_answer, state.generation, 0)
                    second_button := make_button(second_answer, state.generation, 1)
                    set slots += array{
                        canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := -420.0, Top := 130.0, Right := 260.0, Bottom := 55.0}, Widget := first_button},
                        canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := -140.0, Top := 130.0, Right := 260.0, Bottom := 55.0}, Widget := second_button}}
                    if (observation = 2):
                        machine_button := make_button(machine_text, state.generation, 2)
                        set slots += array{canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := 140.0, Top := 130.0, Right := 260.0, Bottom := 55.0}, Widget := machine_button}}
                panel := canvas{Slots := slots}
                set state.panel = option{panel}
                personal_ui.AddWidget(panel, player_ui_slot{InputMode := ui_input_mode.All})

    show_human_decision(input_player:player, answer:int):void =
        if (personal_ui := GetPlayerUI[input_player]):
            if (not states[input_player]):
                if (set states[input_player] = field_observation_panel{}) {}
            close_panel(input_player)
            if (state := states[input_player]):
                var text:message = human_decision_question
                if (answer = 0):
                    set text = route_a_result
                else if (answer = 1):
                    set text = route_b_result
                center := anchors{Minimum := vector2{X := 0.5, Y := 0.5}, Maximum := vector2{X := 0.5, Y := 0.5}}
                var slots:[]canvas_slot = array:
                    canvas_slot:
                        SizeToContent := false
                        Anchors := center
                        Offsets := margin{Left := -450.0, Top := -220.0, Right := 900.0, Bottom := 440.0}
                        Widget := color_block{DefaultColor := color{R := 0.015, G := 0.04, B := 0.08}, DefaultOpacity := 0.98}
                    canvas_slot:
                        SizeToContent := false
                        Anchors := center
                        Offsets := margin{Left := -420.0, Top := -190.0, Right := 840.0, Bottom := 290.0}
                        Widget := text_block{DefaultText := text, DefaultTextColor := NamedColors.White, DefaultTextSize := 22.0}
                close_button := make_button(close_text, state.generation, -2)
                set slots += array{canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := 140.0, Top := 130.0, Right := 260.0, Bottom := 55.0}, Widget := close_button}}
                if (answer = -1):
                    route_a_button := make_button(route_a_text, state.generation, 3)
                    route_b_button := make_button(route_b_text, state.generation, 4)
                    set slots += array{
                        canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := -420.0, Top := 130.0, Right := 260.0, Bottom := 55.0}, Widget := route_a_button},
                        canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := -140.0, Top := 130.0, Right := 260.0, Bottom := 55.0}, Widget := route_b_button}}
                else:
                    again_button := make_button(again_text, state.generation, 5)
                    set slots += array{canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := -420.0, Top := 130.0, Right := 260.0, Bottom := 55.0}, Widget := again_button}}
                panel := canvas{Slots := slots}
                set state.panel = option{panel}
                personal_ui.AddWidget(panel, player_ui_slot{InputMode := ui_input_mode.All})

    make_button(text:message, generation:int, choice:int):button_regular =
        new_button := button_regular{DefaultText := text}
        action := field_observation_action{controller := Self, generation := generation, choice := choice}
        new_button.OnClick().Subscribe(action.on_click)
        return new_button

    close_panel(input_player:player):void =
        if (state := states[input_player]):
            set next_generation += 1
            set state.generation = next_generation
            if (panel := state.panel?, personal_ui := GetPlayerUI[input_player]):
                personal_ui.RemoveWidget(panel)
            set state.panel = false

    on_spawn(input_agent:agent):void =
        if (input_player := player[input_agent]):
            close_panel(input_player)

    on_departure(input_player:player):void =
        close_panel(input_player)
        var remaining:[player]field_observation_panel = map{}
        for (other -> state : states, other <> input_player):
            if (set remaining[other] = state) {}
        set states = remaining

    on_round():void =
        for (input_player -> state : states):
            close_panel(input_player)
        set states = map{}
