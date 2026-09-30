using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

# One solo lesson; the same three category targets serve all seven decisions.
fn_shoreline_island_signal_station := class(creative_device):
    @editable
    configured:logic = false
    @editable
    progress:fn_shoreline_island_signal_progress = fn_shoreline_island_signal_progress{}
    @editable
    targets:[]fn_shoreline_island_data_target = array{}
    # Preserve names of existing native bindings.
    @editable
    board:billboard_device = billboard_device{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    replay_button:button_device = button_device{}
    @editable
    return_button:button_device = button_device{}
    @editable
    hub_destination:teleporter_device = teleporter_device{}
    @editable
    classification_audio:audio_player_device = audio_player_device{}
    @editable
    examples_light:customizable_light_device = customizable_light_device{}
    @editable
    correction_light:customizable_light_device = customizable_light_device{}
    @editable
    new_examples_light:customizable_light_device = customizable_light_device{}
    @editable
    finale_effect:vfx_creator_device = vfx_creator_device{}
    # Native prop homes share one visual center; explicit fields retain wrappers.
    @editable
    burger:creative_prop = creative_prop{}
    @editable
    chair:creative_prop = creative_prop{}
    @editable
    car:creative_prop = creative_prop{}
    @editable
    apple:creative_prop = creative_prop{}
    @editable
    sofa:creative_prop = creative_prop{}
    @editable
    tractor:creative_prop = creative_prop{}

    success_ids:[]int = array{0, 1, 2, 1, 0, 1, 2}
    example_ids:[]int = array{0, 1, 2, 1, 3, 4, 5}
    item_names:[]string = array{"BURGER", "CHAIR", "CAR", "CHAIR", "APPLE", "SOFA", "TRACTOR"}
    category_names:[]string = array{"FOOD", "FURNITURE", "VEHICLE"}
    reasons:[]string = array{
        "A burger is food we can eat.",
        "A chair is furniture for sitting.",
        "A car is a vehicle that transports people.",
        "The chair is furniture. Pix's prediction was wrong.",
        "An apple is food we can eat too.",
        "A sofa is furniture for sitting too.",
        "A tractor is a vehicle that carries a driver and pulls loads."}
    hints:[]string = array{
        "Think about what we eat.",
        "What do we use to sit in a room?",
        "What carries people from place to place?",
        "Check the chair: what is it used for?",
        "Think about what we eat.",
        "What do we use to sit in a room?",
        "What carries a driver and pulls loads?"}

    var phase:int = -1
    var sections:int = 0
    var generation:int = 0
    var observed_round:int = -1
    var busy:logic = false
    var mistakes:int = 0
    var last_hit:float = 0.0
    var wrong_ready:float = 0.0
    var active_player:?player = false
    var active_character:?fort_character = false
    var example_homes:[]transform = array{}
    var examples:[]creative_prop = array{}
    var section_lights:[]customizable_light_device = array{}

    text<localizes>(value:string):message = "{value}"
    welcome<localizes>:message = "CLASSIFIER: SORT AND CHECK\nSHOOT ITS CATEGORY\nA FOOD    B FURNITURE    C VEHICLE"
    finished<localizes>:message = "LESSON COMPLETE! 7/7\nCLASSIFIER BADGE EARNED\nLabel. Check. Try new examples.\nUse PLAY AGAIN or RETURN TO HUB"
    finish_hud<localizes>:message = "LESSON COMPLETE!\nClassifier Badge earned - 7/7\nPlay again? Use PLAY AGAIN or RETURN TO HUB."

    OnBegin<override>()<suspends>:void =
        Hide()
        if (not configured?):
            return
        set examples = array{burger, chair, car, apple, sofa, tractor}
        set section_lights = array{examples_light, correction_light, new_examples_light}
        if (targets.Length <> 3 or examples.Length <> 6 or section_lights.Length <> 3):
            Print("CLASSIFIER: incomplete solo configuration")
            return
        Sleep(0.1)
        for (target : targets):
            set target.explicit_answer_feedback = true
            set target.answer_feedback_seconds = 1.0
            target.initialize_surface_home()
        for (example : examples):
            set example_homes += array{example.GetTransform()}
        set observed_round = progress.round_generation
        reset_run()
        replay_button.SetInteractionText(text("PLAY AGAIN"))
        return_button.SetInteractionText(text("RETURN TO HUB"))
        for (control : array{replay_button, return_button}):
            control.SetInteractionTime(0.0)
            control.SetMaxTriggerCount(0)
        return_button.Enable()
        replay_button.InteractedWithEvent.Subscribe(on_replay)
        return_button.InteractedWithEvent.Subscribe(on_return)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_departure)
        for (index -> target : targets):
            spawn { listen_hits(target, index) }
        monitor_player()

    show_board(content:message):void =
        board.SetText(content)
        board.ShowText()
        board.UpdateDisplay()

    show_feedback(input_agent:agent, content:message, duration:float):void =
        # Replace the current message instead of queuing an obsolete result.
        feedback.Hide(input_agent)
        feedback.Show(input_agent, content, ?DisplayTime := duration)

    in_bay(input_agent:agent)<transacts><decides>:void =
        character := input_agent.GetFortCharacter[]
        location := character.GetTransform().Translation
        location.X >= -4600.0
        location.X <= -2200.0
        location.Y >= -600.0
        location.Y <= 2700.0
        location.Z >= 2350.0
        location.Z <= 3300.0

    is_active_player(input_agent:agent)<transacts><decides>:void =
        current := active_player?
        input_agent = current
        saved_character := active_character?
        character := current.GetFortCharacter[]
        character = saved_character
        character.IsActive[]
        in_bay[current]
        observed_round = progress.round_generation

    hide_examples():void =
        for (index -> example : examples, home := example_homes[index]):
            example.Hide()
            var parked:transform = home
            set parked.Translation = home.Translation + vector3{Z := -10000.0}
            if (example.TeleportTo[parked]) {}

    show_example():void =
        hide_examples()
        if (index := example_ids[phase], example := examples[index], home := example_homes[index]):
            if (example.TeleportTo[home]) {}
            example.Show()

    reset_run():void =
        set generation += 1
        if (current := active_player?):
            feedback.Hide(current)
        set phase = -1
        set sections = 0
        set active_player = false
        set active_character = false
        set busy = false
        set mistakes = 0
        set wrong_ready = 0.0
        for (target : targets):
            target.deactivate()
        hide_examples()
        for (light : section_lights):
            light.TurnOff()
        replay_button.Disable()
        finale_effect.End()
        show_board(welcome)

    begin_solo(input_player:player):void =
        if (character := input_player.GetFortCharacter[], character.IsActive[], in_bay[input_player]):
            reset_run()
            set active_player = option{input_player}
            set active_character = option{character}
            progress.ensure_player(input_player)
            set phase = 0
            show_example()
            show_prompt("")
            for (target : targets):
                target.activate()

    monitor_player()<suspends>:void =
        loop:
            if (observed_round <> progress.round_generation):
                set observed_round = progress.round_generation
                reset_run()
            if (current := active_player?):
                if (not is_active_player[current]):
                    reset_run()
            else:
                for (candidate : GetPlayspace().GetPlayers(), not active_player?):
                    begin_solo(candidate)
            Sleep(0.1)

    on_departure(input_player:player):void =
        if (current := active_player?, current = input_player):
            reset_run()

    on_replay(input_agent:agent):void =
        if (phase = 7, is_active_player[input_agent], current := active_player?):
            begin_solo(current)

    on_return(input_agent:agent):void =
        if (current := active_player?, current = input_agent):
            reset_run()
        hub_destination.Teleport(input_agent)

    prompt_header():string =
        if (phase < 3):
            return "{sections}/3 SECTIONS | LABEL EXAMPLES {phase + 1}/3"
        if (phase = 3):
            return "{sections}/3 SECTIONS | CHECK A PREDICTION 1/1"
        return "{sections}/3 SECTIONS | NEW EXAMPLES {phase - 3}/3"

    show_prompt(guidance:string):void =
        if (item := item_names[phase]):
            var question:string = "{item} - SHOOT ITS CATEGORY"
            if (phase = 3):
                set question = "CHAIR | PIX PREDICTS: VEHICLE\nSHOOT THE CATEGORY YOU THINK FITS"
            show_board(text("{prompt_header()}\n{question}\n{guidance}"))

    listen_hits(target:fn_shoreline_island_data_target, index:int)<suspends>:void =
        loop:
            input_agent := target.Hit.Await()
            on_hit(input_agent, target, index)

    on_hit(input_agent:agent, target:fn_shoreline_island_data_target, index:int):void =
        if (not is_active_player[input_agent]):
            return
        set last_hit = GetSimulationElapsedTime()
        if (busy? or phase < 0 or phase >= 7):
            return
        if (correct := success_ids[phase], reason := reasons[phase]):
            if (index <> correct):
                if (GetSimulationElapsedTime() < wrong_ready):
                    return
                set wrong_ready = GetSimulationElapsedTime() + 0.4
                set mistakes += 1
                target.reject(input_agent)
                if (hint := hints[phase], category := category_names[correct]):
                    var guidance:string = "TRY AGAIN - {hint}"
                    if (mistakes >= 2):
                        set guidance = "TRY AGAIN - Choose {category}. {reason}"
                    show_prompt(guidance)
                    show_feedback(input_agent, text(guidance), 0.0)
                return
            # Lock before any suspended work or persistent writes.
            set busy = true
            feedback.Hide(input_agent)
            target.accept(input_agent, false)
            for (choice : targets):
                choice.hit_surface.Disable()
            if (phase = 2):
                set sections = 1
            else if (phase = 3):
                set sections = 2
            else if (phase = 6):
                set sections = 3
                if (current := active_player?):
                    state := progress.ensure_player(current)
                    if (not state.badge_earned?):
                        for (section := 0..2):
                            set state.challenge = section
                            progress.complete(current)
            for (index_light -> light : section_lights, index_light < sections):
                light.TurnOn()
            if (item := item_names[phase], category := category_names[correct]):
                show_board(text("CORRECT! {phase + 1}/7 | {sections}/3 SECTIONS\n{item} = {category}\n{reason}\nRelease fire to continue"))
                show_feedback(input_agent, text("CORRECT! {phase + 1}/7\n{item} = {category}"), 1.5)
            classification_audio.Play(input_agent)
            spawn { next_item(generation, phase) }

    next_item(token:int, solved_phase:int)<suspends>:void =
        if (solved_phase = 6):
            finale_effect.Begin()
        Sleep(1.0)
        if (generation <> token):
            return
        finale_effect.End()
        if (current := active_player?, is_active_player[current]):
            # The last answer has no next item to guard against held fire.
            if (solved_phase = 6):
                Sleep(0.5)
                if (generation = token, is_active_player[current]):
                    set phase = 7
                    set busy = false
                    hide_examples()
                    for (choice : targets):
                        choice.deactivate()
                    show_board(finished)
                    show_feedback(current, finish_hud, 0.0)
                    replay_button.Enable()
                return
            # Observe fire under the scoring lock, keeping the old result visible.
            set last_hit = GetSimulationElapsedTime()
            for (choice : targets):
                choice.hit_surface.Enable()
            loop:
                Sleep(0.05)
                if (generation <> token):
                    return
                if (not is_active_player[current]):
                    reset_run()
                    return
                if (GetSimulationElapsedTime() - last_hit >= 0.5):
                    break
            set phase += 1
            set mistakes = 0
            set wrong_ready = 0.0
            set busy = false
            feedback.Hide(current)
            show_example()
            show_prompt("")
        else:
            reset_run()
