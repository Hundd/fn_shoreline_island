using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

byte_island_player_state := class:
    var next_step:int = 0
    var badge_earned:logic = false

byte_island_game_manager := class(creative_device):
    @editable
    hub_spawner_0:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_1:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_2:player_spawner_device = player_spawner_device{}
    @editable
    hub_spawner_3:player_spawner_device = player_spawner_device{}
    @editable
    water_button:button_device = button_device{}
    @editable
    plant_button:button_device = button_device{}
    @editable
    wait_button:button_device = button_device{}
    @editable
    harvest_button:button_device = button_device{}
    @editable
    pix_feedback:hud_message_device = hud_message_device{}
    @editable
    badge_tracker:tracker_device = tracker_device{}
    @editable
    round_settings:round_settings_device = round_settings_device{}
    @editable
    return_button:button_device = button_device{}
    @editable
    hub_destination:teleporter_device = teleporter_device{}
    @editable
    use_data_core_rescue:logic = false

    var player_states:[player]byte_island_player_state = map{}

    objective_text<localizes>:message = "Pix: My AI Core glitched! Restore 7 modules to unlock Agent Mode. New here? Start at 1 PROMPT WORKSHOP. Check your journal for what comes next."
    water_text<localizes>:message = "Find Seed"
    plant_text<localizes>:message = "Dig Hole"
    wait_text<localizes>:message = "Plant Seed"
    harvest_text<localizes>:message = "Water"
    return_text<localizes>:message = "Return to Academy Hub"
    badge_title<localizes>:message = "Prompt Badge"
    badge_description<localizes>:message = "Rescue the Prompt Module with clear instructions for Pix."
    water_feedback<localizes>:message = "1 of 4: Seed found. Next, dig the hole."
    plant_feedback<localizes>:message = "2 of 4: Hole ready. Next, plant the seed."
    wait_feedback<localizes>:message = "3 of 4: Seed planted. Next, water it."
    reset_feedback<localizes>(number:int, chosen:message, needed:message):message = "Step {number}: Pix tried {chosen}, but needed {needed}. Each action prepares the next. Start again with Find Seed."
    complete_feedback<localizes>:message = "PIX MODULE RESTORED: INSTRUCTIONS ONLINE\nPrompt Badge earned! Clear instructions help AI understand a task."
    repeat_feedback<localizes>:message = "Great instructions again! Your Prompt Badge is already earned. Return to the hub."

    OnBegin<override>()<suspends>:void =
        water_button.SetInteractionText(water_text)
        plant_button.SetInteractionText(plant_text)
        wait_button.SetInteractionText(wait_text)
        harvest_button.SetInteractionText(harvest_text)
        return_button.SetInteractionText(return_text)
        for (input_button : array{water_button, plant_button, wait_button, harvest_button, return_button}):
            input_button.SetMaxTriggerCount(0)
            input_button.SetInteractionTime(0.0)
        badge_tracker.SetTitleText(badge_title)
        badge_tracker.SetDescriptionText(badge_description)
        badge_tracker.SetTarget(1)
        if (not use_data_core_rescue?):
            water_button.InteractedWithEvent.Subscribe(on_water)
            plant_button.InteractedWithEvent.Subscribe(on_plant)
            wait_button.InteractedWithEvent.Subscribe(on_wait)
            harvest_button.InteractedWithEvent.Subscribe(on_harvest)
        else:
            for (legacy_button : array{water_button, plant_button, wait_button, harvest_button}):
                legacy_button.Disable()
        return_button.InteractedWithEvent.Subscribe(on_return)
        round_settings.RoundBeginEvent.Subscribe(on_round_begin)
        GetPlayspace().PlayerAddedEvent().Subscribe(on_player_added)
        for (spawner : array{hub_spawner_0, hub_spawner_1, hub_spawner_2, hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_spawned)
        for (joining_player : GetPlayspace().GetPlayers()):
            on_player_added(joining_player)

    # Respawn preserves rewards; only a new round clears them.
    ensure_player(joining_player:player):void =
        if (player_states[joining_player]):
            return
        if (set player_states[joining_player] = byte_island_player_state{}):
            badge_tracker.Assign(joining_player)
            badge_tracker.Reset(joining_player)
            badge_tracker.SetValue(joining_player, 0)

    on_player_added(joining_player:player):void =
        ensure_player(joining_player)
        pix_feedback.Show(joining_player, objective_text, ?DisplayTime := 8.0)

    on_spawned(spawned_agent:agent):void =
        if (spawned_player := player[spawned_agent]):
            on_player_added(spawned_player)

    on_round_begin():void =
        set player_states = map{}
        for (joining_player : GetPlayspace().GetPlayers()):
            on_player_added(joining_player)

    on_water(input_agent:agent):void =
        accept_input(input_agent, 0)

    on_plant(input_agent:agent):void =
        accept_input(input_agent, 1)

    on_wait(input_agent:agent):void =
        accept_input(input_agent, 2)

    on_harvest(input_agent:agent):void =
        accept_input(input_agent, 3)

    instruction_name(step:int):message =
        case (step):
            0 => water_text
            1 => plant_text
            2 => wait_text
            _ => harvest_text

    # No suspension between checking and awarding; every reward targets Agent.
    accept_input(input_agent:agent, input_step:int):void =
        if (input_player := player[input_agent]):
            ensure_player(input_player)
            if (state := player_states[input_player]):
                if (input_step <> state.next_step):
                    explanation := reset_feedback(state.next_step + 1, instruction_name(input_step), instruction_name(state.next_step))
                    set state.next_step = 0
                    pix_feedback.Show(input_agent, explanation, ?DisplayTime := 7.0)
                    return
                set state.next_step += 1
                if (input_step = 0):
                    pix_feedback.Show(input_agent, water_feedback, ?DisplayTime := 4.0)
                else if (input_step = 1):
                    pix_feedback.Show(input_agent, plant_feedback, ?DisplayTime := 4.0)
                else if (input_step = 2):
                    pix_feedback.Show(input_agent, wait_feedback, ?DisplayTime := 4.0)
                else:
                    set state.next_step = 0
                    if (state.badge_earned?):
                        pix_feedback.Show(input_agent, repeat_feedback, ?DisplayTime := 8.0)
                    else:
                        award_prompt_badge(input_player)
                        pix_feedback.Show(input_agent, complete_feedback, ?DisplayTime := 10.0)

    # The new physical mission calls this only after the player enters the
    # rescued module. The journal keeps reading this existing reward source.
    award_prompt_badge(input_player:player):void =
        ensure_player(input_player)
        if (state := player_states[input_player], not state.badge_earned?):
            set state.badge_earned = true
            badge_tracker.SetValue(input_player, 1)

    on_return(input_agent:agent):void =
        hub_destination.Teleport(input_agent)
