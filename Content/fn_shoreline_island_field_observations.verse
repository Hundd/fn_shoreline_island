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
    growth_board:billboard_device = billboard_device{}
    @editable
    lantern_board:billboard_device = billboard_device{}
    @editable
    cargo_board:billboard_device = billboard_device{}
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

    growth_open<localizes>:message = "Observe the growing garden"
    lantern_open<localizes>:message = "Observe the lantern pattern"
    cargo_open<localizes>:message = "Observe the cargo route"
    growth_sign<localizes>:message = "FIELD NOTE: GROWTH\nWater > Plant > Wait > ?\nOptional: use the button"
    lantern_sign<localizes>:message = "FIELD NOTE: LANTERNS\n1 > 2 > 1 > 2 > ?\nOptional: use the button"
    cargo_sign<localizes>:message = "FIELD NOTE: CARGO\nLeaf > Garden | Plain > Storage\nOptional: use the button"
    growth_question<localizes>:message = "FIELD NOTE: GROWTH\nWater > Plant > Wait > ?\nThe plant has grown. What comes next?\nChoose a prediction, or Close to keep exploring."
    lantern_question<localizes>:message = "FIELD NOTE: LANTERNS\nLanterns flash in order: 1 > 2 > 1 > 2 > ?\nWhich lantern flashes next?\nChoose a prediction, or Close to keep exploring."
    cargo_question<localizes>:message = "FIELD NOTE: CARGO\nThe signs say Leaf > Garden and Plain > Storage.\nA crate labeled Leaf arrives. Where should it go?\nChoose a prediction, or Close to keep exploring."
    harvest_text<localizes>:message = "Harvest"
    plant_text<localizes>:message = "Plant"
    one_text<localizes>:message = "1"
    two_text<localizes>:message = "2"
    garden_text<localizes>:message = "Garden"
    storage_text<localizes>:message = "Storage"
    again_text<localizes>:message = "Again"
    close_text<localizes>:message = "Close"
    correct_text<localizes>:message = "Your prediction matches."
    retry_text<localizes>:message = "Let's look at the pattern."
    growth_explanation<localizes>:message = "Harvest comes next.\nWater prepares the bed. Plant adds a seed.\nWait lets it grow. Harvest gathers supplies.\nAn algorithm keeps these steps in order."
    lantern_explanation<localizes>:message = "Lantern 1 flashes next.\nThe pair 1 > 2 repeats.\nAfter each 2, the next pair starts with 1.\nA loop repeats the same instructions."
    cargo_explanation<localizes>:message = "The Leaf crate goes to Garden.\nRead its label, then follow the matching rule.\nA Plain crate would go to Storage.\nA condition chooses which action to take."
    answer_page<localizes>(selected:message, feedback:message, explanation:message):message = "YOUR FIELD NOTE\nYou chose: {selected}\n{feedback}\n{explanation}\nTry Again or keep exploring. No badge is needed."
    refreshed_sign<localizes>(text:message):message = "{text} "

    OnBegin<override>()<suspends>:void =
        Hide()
        buttons := array{growth_button, lantern_button, cargo_button}
        prompts := array{growth_open, lantern_open, cargo_open}
        for (index -> input_button : buttons, prompt := prompts[index]):
            input_button.SetInteractionText(prompt)
            input_button.SetMaxTriggerCount(0)
            input_button.SetInteractionTime(0.0)
        growth_button.InteractedWithEvent.Subscribe(on_growth)
        lantern_button.InteractedWithEvent.Subscribe(on_lantern)
        cargo_button.InteractedWithEvent.Subscribe(on_cargo)
        round_settings.RoundBeginEvent.Subscribe(on_round)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_departure)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawn)
        var alternate:logic = false
        loop:
            texts := array{growth_sign, lantern_sign, cargo_sign}
            for (index -> sign : array{growth_board, lantern_board, cargo_board}, text := texts[index]):
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

    open_observation(input_agent:agent, observation:int):void =
        if (input_player := player[input_agent]):
            show_panel(input_player, observation, -1)

    on_choice(input_player:player, generation:int, choice:int):void =
        if (state := states[input_player], state.panel?, state.generation = generation):
            if (choice = -2):
                close_panel(input_player)
            else:
                show_panel(input_player, state.observation, choice)

    show_panel(input_player:player, observation:int, answer:int):void =
        questions := array{growth_question, lantern_question, cargo_question}
        first_answers := array{harvest_text, one_text, garden_text}
        second_answers := array{plant_text, two_text, storage_text}
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
                if (answer >= 0):
                    again_button := make_button(again_text, state.generation, -1)
                    set slots += array{canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := -420.0, Top := 130.0, Right := 260.0, Bottom := 55.0}, Widget := again_button}}
                else:
                    first_button := make_button(first_answer, state.generation, 0)
                    second_button := make_button(second_answer, state.generation, 1)
                    set slots += array{
                        canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := -420.0, Top := 130.0, Right := 260.0, Bottom := 55.0}, Widget := first_button},
                        canvas_slot{Anchors := center, SizeToContent := false, Offsets := margin{Left := -140.0, Top := 130.0, Right := 260.0, Bottom := 55.0}, Widget := second_button}}
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
