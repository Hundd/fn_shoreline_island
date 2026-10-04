using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org/Verse }
using { /UnrealEngine.com/Temporary/SpatialMath }

# One cooperative room state; only players who enter participate in its badge.
fn_shoreline_island_prompt_blaster := class(creative_device):
    @editable
    navigation_journal:fn_shoreline_island_academy_journal = fn_shoreline_island_academy_journal{}
    @editable
    configured:logic = false
    @editable
    progress:byte_island_game_manager = byte_island_game_manager{}
    @editable
    entry_zone:mutator_zone_device = mutator_zone_device{}
    @editable
    replay:button_device = button_device{}
    @editable
    board:billboard_device = billboard_device{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    data_energy:fn_shoreline_island_data_energy = fn_shoreline_island_data_energy{}
    # BLUE, RED, GREEN, LARGE modifier, SMALL BLUE, LARGE BLUE,
    # REACTOR, SCANNER, STORAGE. IDs are stable across rounds.
    @editable
    targets:[]fn_shoreline_island_data_target = array{}
    @editable
    blue:creative_prop = creative_prop{}
    @editable
    red:creative_prop = creative_prop{}
    @editable
    green:creative_prop = creative_prop{}
    @editable
    small_blue:creative_prop = creative_prop{}
    @editable
    large_blue:creative_prop = creative_prop{}
    @editable
    pix:creative_prop = creative_prop{}
    @editable
    reactor:creative_prop = creative_prop{}
    @editable
    prompt_module:creative_prop = creative_prop{}
    @editable
    door:creative_prop = creative_prop{}
    @editable
    delivery_beam:creative_prop = creative_prop{}
    @editable
    spectacle:vfx_creator_device = vfx_creator_device{}
    @editable
    reactor_energy:vfx_creator_device = vfx_creator_device{}
    @editable
    module_energy:vfx_creator_device = vfx_creator_device{}
    @editable
    light_a:customizable_light_device = customizable_light_device{}
    @editable
    light_b:customizable_light_device = customizable_light_device{}
    @editable
    light_c:customizable_light_device = customizable_light_device{}
    @editable
    light_d:customizable_light_device = customizable_light_device{}
    @editable
    cable_a:vfx_creator_device = vfx_creator_device{}
    @editable
    cable_b:vfx_creator_device = vfx_creator_device{}
    @editable
    cable_c:vfx_creator_device = vfx_creator_device{}
    @editable
    cable_d:vfx_creator_device = vfx_creator_device{}
    @editable
    return_ride:grind_rail_device = grind_rail_device{}
    @editable
    success_sound:audio_player_device = audio_player_device{}

    var stage:int = 0
    var generation:int = 0
    var participants:[player]logic = map{}
    var large_home:transform = transform{}
    var blue_home:transform = transform{}
    var pix_home:transform = transform{}
    var reactor_home:transform = transform{}
    var door_home:transform = transform{}
    var target_home:transform = transform{}
    ResetEvent:event() = event(){}

    room_lights()<transacts>:[]customizable_light_device = array{light_a, light_b, light_c, light_d}
    cable_energy()<transacts>:[]vfx_creator_device = array{cable_a, cable_b, cable_c, cable_d}

    welcome<localizes>:message = "PIX NEEDS YOUR HELP!"
    knowledge<localizes>:message = "AI KNOWLEDGE\nA prompt tells AI what you want. Useful details help it choose.\nGET A CORE → GET THE LARGE BLUE CORE"
    knowledge_board<localizes>:message = "AI KNOWLEDGE\nUseful details help AI choose."
    round_one<localizes>:message = "LET'S TEST IT!\nSHOOT THE BLUE CORE"
    detail_reward<localizes>:message = "GOOD DETAIL!\nBLUE helped you choose. +1 DATA"
    vague<localizes>:message = "GET THE BLUE CORE\nTwo blue cores! Shoot LARGE."
    clear<localizes>:message = "GET THE LARGE BLUE CORE\nShoot the matching core."
    clear_reward<localizes>:message = "CLEAR PROMPT!\nUseful details make instructions clearer. +1 DATA"
    destination<localizes>:message = "LARGE BLUE CORE TO REACTOR\nWHERE? Shoot the moving core first."
    acquired<localizes>:message = "TARGET ACQUIRED\nNow shoot its destination: REACTOR."
    connected<localizes>:message = "CLEAR DESTINATION! +1 DATA\nPix is delivering the core."
    wrong<localizes>:message = "Not quite! Check the prompt and try another target."
    online<localizes>:message = "PROMPT MODULE ONLINE!\nPrompt Badge earned. Ride back to the hub!"

    OnBegin<override>()<suspends>:void =
        Hide()
        if (not configured?):
            return
        set large_home = large_blue.GetTransform()
        set blue_home = blue.GetTransform()
        set pix_home = pix.GetTransform()
        set reactor_home = reactor.GetTransform()
        set door_home = door.GetTransform()
        if (moving := targets[5]):
            moving.initialize_surface_home()
            set target_home = moving.surface_home
        reset_room()
        entry_zone.AgentEntersEvent.Subscribe(on_enter)
        entry_zone.AgentExitsEvent.Subscribe(on_exit)
        spawn{navigation_monitor()}
        replay.InteractedWithEvent.Subscribe(on_replay)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_leave)
        progress.round_settings.RoundBeginEvent.Subscribe(on_round)
        for (spawner : array{progress.hub_spawner_0, progress.hub_spawner_1, progress.hub_spawner_2, progress.hub_spawner_3}):
            spawner.SpawnedEvent.Subscribe(on_navigation_spawn)
        for (index -> target : targets):
            spawn { listen_hits(target, index) }
        Sleep(0.2)
        # Play From Here and late possession can place a player inside the zone
        # before its entry subscription is ready. Initialize before listening,
        # then include occupants so they do not need to leave and re-enter.
        for (input_agent : entry_zone.GetAgentsInVolume()):
            on_enter(input_agent)

    listen_hits(target:fn_shoreline_island_data_target, index:int)<suspends>:void =
        loop:
            input_agent := target.Hit.Await()
            on_hit(input_agent, target, index)

    show_board(content:message):void =
        board.SetText(content)
        board.ShowText()
        board.UpdateDisplay()

    on_enter(input_agent:agent):void =
        if (input_player := player[input_agent]):
            if (set participants[input_player] = true) {}
            if (stage = 0):
                set stage = -1
                spawn { intro(generation) }

    on_leave(input_player:player):void =
        var remaining:[player]logic = map{}
        for (other -> participating : participants, other <> input_player):
            if (set remaining[other] = participating) {}
        set participants = remaining
        if (participants.Length = 0):
            reset_room()

    on_round():void =
        set participants = map{}
        reset_room()

    on_replay(input_agent:agent):void =
        # A single room reset cancels every delayed reaction and moving target.
        reset_room()
        on_enter(input_agent)

    reset_room():void =
        ResetEvent.Signal()
        set generation += 1
        set stage = 0
        for (target : targets):
            target.deactivate()
        return_ride.Disable()
        return_ride.Hide()
        spectacle.End()
        reactor_energy.End()
        module_energy.End()
        for (light : room_lights()):
            light.TurnOff()
        for (effect : cable_energy()):
            effect.End()
        blue.Show()
        red.Show()
        green.Show()
        small_blue.Hide()
        large_blue.Hide()
        prompt_module.Hide()
        delivery_beam.Hide()
        if (large_blue.TeleportTo[large_home]) {}
        if (blue.TeleportTo[blue_home]) {}
        if (pix.TeleportTo[pix_home]) {}
        if (reactor.TeleportTo[reactor_home]) {}
        if (door.TeleportTo[door_home]) {}
        show_board(welcome)

    intro(expected_generation:int)<suspends>:void =
        spectacle.Begin()
        Sleep(2.0)
        if (generation <> expected_generation):
            return
        show_board(knowledge_board)
        for (input_player -> participating : participants, participating?):
            feedback.Show(input_player, knowledge, ?DisplayTime := 7.0)
        Sleep(7.0)
        if (generation <> expected_generation):
            return
        set stage = 1
        spectacle.End()
        show_board(round_one)
        for (input_player -> participating : participants, participating?):
            feedback.Show(input_player, round_one, ?DisplayTime := 4.0)
        activate_choices(array{0, 1, 2})

    activate_choices(indices:[]int):void =
        for (index : indices, target := targets[index]):
            target.activate()

    end_choices(indices:[]int):void =
        for (index : indices, target := targets[index]):
            target.deactivate()

    reward(input_player:player, target:fn_shoreline_island_data_target, content:message):void =
        hit_position := target.hit_surface.GetTransform().Translation
        target.accept(input_player, true)
        data_energy.award(input_player, target.reward_value, hit_position)
        feedback.Show(input_player, content, ?DisplayTime := 3.0)

    on_hit(input_agent:agent, target:fn_shoreline_island_data_target, index:int):void =
        if (input_player := player[input_agent], participants[input_player]?):
            if (stage = 1):
                if (index = 0):
                    set stage = 2
                    reward(input_player, target, detail_reward)
                    end_choices(array{1, 2})
                    blue.Hide()
                    green.Hide()
                    small_blue.Show()
                    large_blue.Show()
                    show_board(vague)
                    activate_choices(array{3})
                else:
                    reject(input_player, target)
            else if (stage = 2, index = 3):
                set stage = 3
                reward(input_player, target, clear_reward)
                show_board(clear)
                activate_choices(array{1, 4, 5})
            else if (stage = 3):
                if (index = 5):
                    set stage = -2
                    reward(input_player, target, clear_reward)
                    end_choices(array{1, 4})
                    spawn { start_destination(generation) }
                else:
                    reject(input_player, target)
            else if (stage = 4, index = 5):
                set stage = 5
                reward(input_player, target, acquired)
                # Freeze both visual and hit surface at their current poses.
                if (large_blue.TeleportTo[large_blue.GetTransform()]) {}
                if (target.hit_surface.TeleportTo[target.hit_surface.GetTransform()]) {}
                show_board(acquired)
                activate_choices(array{6, 7, 8})
            else if (stage = 5):
                if (index = 6):
                    set stage = 6
                    reward(input_player, target, connected)
                    end_choices(array{7, 8})
                    spawn { run_finale(generation) }
                else:
                    reject(input_player, target)

    reject(input_player:player, target:fn_shoreline_island_data_target):void =
        target.reject(input_player)
        feedback.Show(input_player, wrong, ?DisplayTime := 2.0)

    start_destination(expected_generation:int)<suspends>:void =
        show_board(destination)
        # Let the previous shot finish and give players time to read WHERE
        # before the same target becomes selectable for the moving round.
        Sleep(2.0)
        if (generation <> expected_generation):
            return
        small_blue.Hide()
        red.Hide()
        set stage = 4
        activate_choices(array{5})
        spawn { move_core(expected_generation) }

    move_core(expected_generation:int)<suspends>:void =
        race:
            animate_core(expected_generation)
            block:
                loop:
                    Sleep(0.05)
                    if (generation <> expected_generation or stage <> 4):
                        return

    animate_core(expected_generation:int)<suspends>:void =
        if (target := targets[5]):
            var direction:float = 1.0
            loop:
                if (generation <> expected_generation or stage <> 4):
                    return
                var core_pose:transform = large_home
                var hit_pose:transform = target_home
                set core_pose.Translation = core_pose.Translation + vector3{Y := direction * 250.0}
                set hit_pose.Translation = hit_pose.Translation + vector3{Y := direction * 250.0}
                sync:
                    large_blue.MoveTo(core_pose, 4.0)
                    target.hit_surface.MoveTo(hit_pose, 4.0)
                set direction = -direction

    run_finale(expected_generation:int)<suspends>:void =
        race:
            finale(expected_generation)
            ResetEvent.Await()

    finale(expected_generation:int)<suspends>:void =
        pix.MoveTo(large_blue.GetTransform(), 1.0)
        if (generation <> expected_generation):
            return
        origin := large_blue.GetTransform().Translation
        destination_pose := reactor.GetTransform().Translation
        difference := destination_pose - origin
        horizontal := Sqrt(difference.X * difference.X + difference.Y * difference.Y)
        var beam_pose:transform = delivery_beam.GetTransform()
        set beam_pose.Translation = (origin + destination_pose) * 0.5
        set beam_pose.Scale = vector3{X := 0.1, Y := 0.1, Z := Distance(origin, destination_pose) / 100.0}
        set beam_pose.Rotation = MakeRotationFromYawPitchRollDegrees(ArcTan(difference.Y, difference.X) * 180.0 / PiFloat, 90.0 - ArcTan(difference.Z, horizontal) * 180.0 / PiFloat, 0.0)
        if (delivery_beam.TeleportTo[beam_pose]):
            delivery_beam.Show()
        sync:
            large_blue.MoveTo(reactor_home, 2.0)
            pix.MoveTo(reactor_home, 2.0)
        if (generation <> expected_generation):
            return
        delivery_beam.Hide()
        reactor_energy.Begin()
        success_sound.Play()
        var spun:transform = reactor_home
        set spun.Rotation = reactor_home.Rotation.ApplyYaw(180.0)
        reactor.MoveTo(spun, 1.0)
        if (generation <> expected_generation):
            return
        for (light : room_lights()):
            if (generation <> expected_generation):
                return
            light.TurnOn()
            Sleep(0.25)
        for (effect : cable_energy()):
            if (generation <> expected_generation):
                return
            effect.Begin()
            Sleep(0.2)
        var opened:transform = door_home
        set opened.Translation = opened.Translation + vector3{Z := 700.0}
        door.MoveTo(opened, 1.0)
        if (generation <> expected_generation):
            return
        prompt_module.Show()
        module_energy.Begin()
        for (input_player -> participating : participants, participating?, input_player.IsActive[]):
            progress.award_prompt_badge(input_player)
            data_energy.award(input_player, 3, prompt_module.GetTransform().Translation)
            feedback.Show(input_player, online, ?DisplayTime := 8.0)
        show_board(online)
        return_ride.Enable()
        return_ride.Show()
        set stage = 7

    navigation_text<localizes>(value:string):message = "{value}"

    on_exit(input_agent:agent):void =
        if (input_player := player[input_agent]):
            navigation_journal.clear_activity(input_player)
            on_leave(input_player)

    navigation_monitor()<suspends>:void =
        loop:
            for (input_player -> participating : participants, participating?):
                var step:int = stage
                var instruction:string = "Get ready for the optional Prompt arena."
                if (stage = -2):
                    set step = 3
                    set instruction = "Watch Pix transform the core."
                else if (stage >= 1):
                    actions := array{"Shoot BLUE.", "Shoot LARGE.", "Shoot the matching large blue core.", "Shoot the moving core to pick it up.", "Choose the reactor destination."}
                    if (action := actions[stage - 1]):
                        set instruction = action
                    else if (stage = 6):
                        set instruction = "Watch Pix deliver the core."
                    else:
                        set instruction = "Completed. Same Prompt badge; optional replay."
                if (step < 1):
                    set step = 1
                if (step > 5):
                    set step = 5
                navigation_journal.report_activity(input_player, 8, 0, step, 5, navigation_text(instruction), generation)
            Sleep(0.25)

    on_navigation_spawn(input_agent:agent):void =
        if (input_player := player[input_agent]):
            navigation_journal.clear_activity(input_player)
            on_leave(input_player)
