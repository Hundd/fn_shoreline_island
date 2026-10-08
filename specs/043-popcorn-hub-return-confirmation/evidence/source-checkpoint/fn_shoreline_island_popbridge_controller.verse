using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

popbridge_landing := class<concrete>:
    @editable
    node:popbridge_node = popbridge_node{}
    @editable
    deck:creative_prop = creative_prop{}

popbridge_machine := class<concrete>:
    @editable
    receiver:popbridge_receiver = popbridge_receiver{}
    @editable
    target:fn_shoreline_island_data_target = fn_shoreline_island_data_target{}
    # Native VFX creators provide visible mechanisms without moving deck collision.
    # Ordered Load, Heat, Pop effects, configured as readable physical mechanisms.
    @editable
    instructions:[]vfx_creator_device = array{}
    # Load hopper, Heat lid, Pop trim: movable, non-colliding props, never decks.
    # Native collision must be read back at map binding time; Verse has no setter.
    @editable
    mechanisms:[]creative_prop = array{}
    var homes:[]transform = array{}
    var teaching_animation:logic = false
    @editable
    wrong_puff:vfx_creator_device = vfx_creator_device{}
    @editable
    flourish:vfx_creator_device = vfx_creator_device{}

# Source only: not placed or bound by feature039 development. The adapter accepts
# explicit editable records; defaults deliberately fail closed until configured.
fn_shoreline_island_popbridge_controller := class(creative_device):
    @editable
    var landings:[]popbridge_landing = array{}
    @editable
    var edges:[]popbridge_edge = array{}
    @editable
    var machines:[]popbridge_machine = array{}
    @editable
    progress:fn_shoreline_island_nursery_progress = fn_shoreline_island_nursery_progress{}
    @editable
    blaster:fn_shoreline_island_data_blaster = fn_shoreline_island_data_blaster{}
    @editable
    replay_button:button_device = button_device{}
    @editable
    var return_buttons:[]button_device = array{}
    @editable
    hub_destination:teleporter_device = teleporter_device{}
    @editable
    ribbon:billboard_device = billboard_device{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    bay_min:vector3 = vector3{X := -5200.0, Y := -19000.0, Z := 2300.0}
    @editable
    bay_max:vector3 = vector3{X := -1800.0, Y := -15300.0, Z := 3200.0}
    @editable
    catch_min:vector3 = vector3{X := -4600.0, Y := -18500.0, Z := 2200.0}
    @editable
    catch_max:vector3 = vector3{X := -2400.0, Y := -15600.0, Z := 2480.0}
    # Compare measured feet height with the supporting deck surface.
    @editable
    landing_height_tolerance:float = 35.0
    # Cooked standing capsule origin was77.15cm above the supporting surface.
    # Normalize feet height; widening tolerance would also accept the catch floor.
    @editable
    grounded_origin_height:float = 77.15
    @editable
    landing_inset:float = 20.0
    @editable
    debug_tag:string = ""
    fixtures:fn_shoreline_island_popbridge_fixtures = fn_shoreline_island_popbridge_fixtures{}
    state:popbridge_attempt = popbridge_attempt{}
    var owner:?player = false
    var nodes:[]popbridge_node = array{}
    var receivers:[]popbridge_receiver = array{}
    var observed_round:int = -1
    var ready:logic = false
    var last_recovery:float = -1.0
    var last_grounded_landing:int = -1
    var was_grounded:logic = false
    var airborne_eligible:logic = false
    var jump_anchor:int = -1
    var jump_generation:int = -1
    text<localizes>(value:string):message = "{value}"

    OnBegin<override>()<suspends>:void =
        targets_started := await_target_startup()
        if (targets_started?):
            initialize()

    await_target_startup()<suspends>:logic =
        # Readiness is explicit; the timeout only rejects broken/unbound profiles.
        for (check := 0..99):
            var all_ready:logic = true
            for (machine : machines):
                if (not machine.target.startup_ready?):
                    set all_ready = false
            if (all_ready?):
                return true
            Sleep(0.1)
        Print("PopBridge target startup timed out; inactive")
        return false

    # Supports native-editable arrays or a validated source profile constructing
    # records when the editor exposes only UObject references for class arrays.
    initialize():void =
        if (ready?):
            return
        Hide()
        set nodes = array{}
        set receivers = array{}
        for (landing : landings):
            set nodes += array{landing.node}
        for (machine : machines):
            set receivers += array{machine.receiver}
            if (machine.target.target_id <> machine.receiver.target_id or machine.instructions.Length <> 3 or machine.mechanisms.Length <> 3):
                Print("PopBridge invalid machine binding")
                return
            for (mechanism : machine.mechanisms):
                set mechanism.CanBeDamaged = false
                set machine.homes += array{mechanism.GetTransform()}
        if (not fixtures.validate(nodes, edges, receivers)?):
            Print("PopBridge invalid course contract; inactive")
            return
        set ready = true
        debug("READY nodes={nodes.Length} receivers={receivers.Length}")
        set observed_round = progress.round_generation
        fixtures.reset(state, nodes)
        refresh_geometry()
        for (machine : machines):
            spawn { listen(machine) }
        replay_button.InteractedWithEvent.Subscribe(replay)
        for (button : return_buttons):
            button.InteractedWithEvent.Subscribe(return_to_hub)
        GetPlayspace().PlayerRemovedEvent().Subscribe(removed)
        spawn { monitor() }

    listen(machine:popbridge_machine)<suspends>:void =
        loop:
            input_agent := machine.target.Hit.Await()
            handle_shot(machine, input_agent)

    inside(position:vector3, minimum:vector3, maximum:vector3)<transacts>:logic =
        if (position.X >= minimum.X, position.X <= maximum.X, position.Y >= minimum.Y, position.Y <= maximum.Y, position.Z >= minimum.Z, position.Z <= maximum.Z):
            return true
        return false

    present_landing(input_player:player)<transacts>:int =
        return grounded_landing(input_player, landing_inset)

    grounded_landing(input_player:player, inset:float)<transacts>:int =
        if (character := input_player.GetFortCharacter[], character.IsActive[], character.IsOnGround[]):
            position := character.GetTransform().Translation - vector3{Z := grounded_origin_height}
            for (node : nodes):
                if (state.built[node.id]?, Abs(position.X - node.center.X) <= node.size.X * 0.5 - inset, Abs(position.Y - node.center.Y) <= node.size.Y * 0.5 - inset, Abs(position.Z - node.center.Z) <= landing_height_tolerance):
                    return node.id
        return -1

    handle_shot(machine:popbridge_machine, input_agent:agent):void =
        if (not ready? or observed_round <> progress.round_generation):
            return
        if (input_player := player[input_agent]):
            if (not owner?):
                if (machine.receiver.instruction >= 3 or machine.receiver.from_landing <> 0 or present_landing(input_player) <> 0):
                    feedback.Show(input_player, text("Start at LOAD.\nFollow the ramp."), ?DisplayTime := 3.0)
                    return
                claimed := claim_owner(input_player)
                if (not claimed?):
                    return
                set owner = option{input_player}
                blaster.equip(input_player)
                owner_acquired(input_player)
            if (current := owner?, current = input_player, valid(input_player, state.generation, observed_round)?):
                shot_result := fixtures.shot(state, machine.receiver, true, state.generation, present_landing(input_player))
                debug("SHOT target={machine.receiver.target_id} result={shot_result} prefix={state.prefix} checkpoint={state.checkpoint} token={state.generation}")
                if (shot_result = 3):
                    machine.wrong_puff.Begin()
                    retry_lesson(input_player, "wrong_order")
                    teaching_cues()
                    spawn { clear_puff(machine, state.generation) }
                else if (shot_result = 4):
                    retry_lesson(input_player, "consumed")
                else if (shot_result = 1):
                    accepted_feedback(machine, input_player)
                    set machine.teaching_animation = true
                    spawn { teach_effect(machine, machine.receiver.instruction, state.generation) }
                    teaching_cues()
                else if (shot_result = 2):
                    accepted_feedback(machine, input_player)
                    spawn { execute(machine, input_player, state.generation, observed_round) }
                else if (shot_result = 0):
                    retry_lesson(input_player, "wrong_position")

    valid(input_player:player, token:int, round:int)<transacts>:logic =
        if (current := owner?, current = input_player, input_player.IsActive[], token = state.generation, round = progress.round_generation, character := input_player.GetFortCharacter[], character.IsActive[], inside(character.GetTransform().Translation, bay_min, bay_max)?):
            return true
        return false

    cancel_if_current(token:int):void =
        # A stale task must never clear a newer owner's attempt/effects.
        if (token = state.generation):
            release()

    execute(machine:popbridge_machine, input_player:player, token:int, round:int)<suspends>:void =
        # Teaching Pop executes only its mechanism. Invocations replay frozen saved
        # instructions in order; geometry is committed after the last visible beat.
        var routine:[]int = state.saved
        if (machine.receiver.instruction = 2):
            set routine = array{2}
        for (instruction : routine):
            if (not valid(input_player, token, round)?):
                cancel_if_current(token)
                return
            set_ribbon("PopBridge: {instruction_name(instruction)}")
            if (effect := machine.instructions[instruction]):
                move_mechanism(machine, instruction, true)
                effect.Begin()
                Sleep(0.25)
            if (not valid(input_player, token, round)?):
                cancel_if_current(token)
                return
            if (effect := machine.instructions[instruction]):
                effect.End()
            move_mechanism(machine, instruction, false)
        if (not valid(input_player, token, round)?):
            cancel_if_current(token)
            return
        completed := fixtures.complete(state, machine.receiver, token)
        if (completed?):
            debug("COMMIT target={machine.receiver.target_id} creates={machine.receiver.creates} token={token}")
            refresh_geometry()
            committed(machine.receiver.target_id)
            committed_lesson(input_player, machine.receiver.target_id)
            machine.flourish.Begin()
            set_ribbon("PopBridge = Load > Heat > Pop. Jump onto your popcorn!")
            if (state.finished?):
                if (not valid(input_player, token, round)?):
                    cancel_if_current(token)
                    return
                progress.complete_challenge(input_player, 2)
                if (machine.receiver.target_id = 7, valid(input_player, token, round)?, state.finished?):
                    completion_ready(input_player)
            Sleep(0.5)
            if (valid(input_player, token, round)?):
                machine.flourish.End()

    instruction_name(id:int):string =
        if (id = 0):
            return "LOAD"
        if (id = 1):
            return "HEAT"
        return "POP"

    teach_effect(machine:popbridge_machine, id:int, token:int)<suspends>:void =
        if (effect := machine.instructions[id]):
            move_mechanism(machine, id, true)
            effect.Begin()
            Sleep(0.25)
            if (token = state.generation):
                effect.End()
                move_mechanism(machine, id, false)
                set machine.teaching_animation = false
                refresh_geometry()

    move_mechanism(machine:popbridge_machine, id:int, raised:logic):void =
        if (mechanism := machine.mechanisms[id], home := machine.homes[id]):
            var pose:transform = home
            if (raised?):
                set pose.Translation = pose.Translation + vector3{Z := 25.0}
            if (mechanism.TeleportTo[pose]):
                actual := mechanism.GetTransform().Translation
                debug("MOTION target={machine.receiver.target_id} step={id} delta_z={actual.Z - home.Translation.Z} z={actual.Z} home={home.Translation.Z}")

    clear_puff(machine:popbridge_machine, token:int)<suspends>:void =
        Sleep(0.25)
        if (token = state.generation):
            machine.wrong_puff.End()

    monitor()<suspends>:void =
        loop:
            Sleep(0.1)
            if (observed_round <> progress.round_generation):
                release()
                set observed_round = progress.round_generation
            if (current := owner?):
                if (not current.IsActive[]):
                    release()
                else if (character := current.GetFortCharacter[], character.IsActive[]):
                    position := character.GetTransform().Translation - vector3{Z := grounded_origin_height}
                    if (not inside(position, bay_min, bay_max)?):
                        release()
                    else:
                        sync_card(current)
                        # A presentation exit can release/teleport this owner during sync.
                        if (valid(current, state.generation, observed_round)?):
                            # Grounded edge contact is safe to credit after a proven
                            # jump; firing still requires the separately inset area.
                            landed := grounded_landing(current, 0.0)
                            if (character.IsOnGround[]):
                                before := state.checkpoint
                                if (landed >= 0, landed = before or (jump_anchor = before and jump_generation = state.generation)):
                                    accepted := fixtures.land(state, edges, landed, true, state.generation)
                                    if (accepted?, before <> landed):
                                        debug("LAND node={landed} token={state.generation} jump_from={jump_anchor}")
                                        landed_lesson(current, landed)
                                    if (accepted?, before <> landed, node := fixtures.find_node(nodes, landed)?, node.milestone >= 0):
                                        progress.complete_challenge(current, node.milestone)
                                    if (accepted?):
                                        report_state(current)
                                # Every grounded observation consumes departure proof,
                                # including jumping in place and uncredited far decks.
                                clear_jump()
                                set was_grounded = true
                                set last_grounded_landing = landed
                            else:
                                if (was_grounded?):
                                    set airborne_eligible = false
                                    if (last_grounded_landing = state.checkpoint):
                                        set airborne_eligible = true
                                    set was_grounded = false
                                if (airborne_eligible?, node := fixtures.find_node(nodes, state.checkpoint)?, position.Z > node.center.Z + landing_height_tolerance):
                                    if (jump_anchor <> state.checkpoint or jump_generation <> state.generation):
                                        debug("JUMP from={state.checkpoint} feet_z={position.Z} token={state.generation}")
                                    set jump_anchor = state.checkpoint
                                    set jump_generation = state.generation
                            if (not state.finished?, landed < 0, state.prefix > 0, inside(position, catch_min, catch_max)?, GetSimulationElapsedTime() - last_recovery >= 0.2):
                                recover(current)
                else:
                    release()

    recover(input_player:player):void =
        if (state.finished?):
            return
        clear_jump()
        set last_recovery = GetSimulationElapsedTime()
        if (node := fixtures.find_node(nodes, state.checkpoint)?, character := input_player.GetFortCharacter[], character.IsActive[]):
            if (character.TeleportTo[node.center + vector3{Z := 20.0}, character.GetTransform().Rotation]):
                debug("RECOVER node={state.checkpoint} time={GetSimulationElapsedTime()} prefix={state.prefix} built={state.built.Length}")
                retry_lesson(input_player, "recovery")
            else:
                retry_lesson(input_player, "recovery_fail")

    machine_used(machine:popbridge_machine)<transacts>:logic =
        if (machine.receiver.instruction < 2):
            if (state.prefix > machine.receiver.instruction, not machine.teaching_animation?):
                return true
        else if (state.consumed[machine.receiver.target_id]?):
            return true
        return false

    refresh_geometry():void =
        for (landing : landings):
            set landing.deck.CanBeDamaged = false
            if (state.built[landing.node.id]?):
                landing.deck.Show()
            else:
                landing.deck.Hide()
        for (machine : machines):
            if (machine_used(machine)?):
                machine.target.deactivate()
            else:
                machine.target.activate()
        teaching_cues()
        geometry_changed()

    teaching_cues():void =
        if (current := owner?):
            report_state(current)
        for (machine : machines):
            if (machine.receiver.instruction < 3):
                machine.target.selectable_ring.End()
                machine.target.objective_cone.End()
                if (not machine_used(machine)?, state.prefix < 3, machine.receiver.instruction = state.prefix):
                    # This target's configured native cone highlights its mechanism.
                    machine.target.selectable_ring.Begin()
                    machine.target.objective_cone.Begin()
                    set machine.target.display_label = "NEXT:\n{instruction_name(state.prefix)}"
                else:
                    set machine.target.display_label = instruction_name(machine.receiver.instruction)
                machine.target.label_board.SetText(text(machine.target.display_label))
                machine.target.label_board.UpdateDisplay()
        if (state.prefix < 3):
            set_ribbon("PopBridge = LOAD > HEAT > POP. Saved {state.prefix}/3. Next: {instruction_name(state.prefix)}")

    stop_effects():void =
        stop_presentation_effects()
        for (machine : machines):
            set machine.teaching_animation = false
            for (effect : machine.instructions):
                effect.End()
            for (id -> mechanism : machine.mechanisms):
                move_mechanism(machine, id, false)
            machine.wrong_puff.End()
            machine.flourish.End()

    release():void =
        if (current := owner?):
            release_owner(current)
        clear_jump()
        debug("RELEASE token={state.generation} prefix={state.prefix} checkpoint={state.checkpoint}")
        fixtures.reset(state, nodes)
        set owner = false
        stop_effects()
        refresh_geometry()
        reset_presentation()

    # Profile hooks contain presentation/integration only, never transition rules.
    claim_owner(input_player:player):logic = true
    release_owner(input_player:player):void = {}
    report_state(input_player:player):void = {}
    committed(target_id:int):void = {}
    reset_presentation():void = {}
    geometry_changed():void = {}
    owner_acquired(input_player:player):void = {}
    accepted_feedback(machine:popbridge_machine, input_player:player):void =
        machine.target.accept(input_player, false)
    committed_lesson(input_player:player, target_id:int):void =
        if (target_id = 7):
            show(input_player, "PopBridge crossed the course! Replay tries the other route.")
    landed_lesson(input_player:player, landing_id:int):void = {}
    retry_lesson(input_player:player, event_id:string):void =
        if (event_id = "wrong_order"):
            show(input_player, "Tiny puff! Next: {instruction_name(state.prefix)}.")
        else if (event_id = "consumed"):
            show(input_player, "Already popped!")
        else if (event_id = "recovery"):
            show(input_player, "Back on your last popcorn. Your bridges are safe!")
        else if (event_id = "recovery_fail"):
            show(input_player, "Return is available. Trying your last popcorn again.")
    completion_ready(input_player:player):void = {}
    sync_card(input_player:player):void = {}
    stop_presentation_effects():void = {}

    clear_jump():void =
        set last_grounded_landing = -1
        set was_grounded = false
        set airborne_eligible = false
        set jump_anchor = -1
        set jump_generation = -1

    replay(input_agent:agent):void =
        if (current := owner?, current = input_agent):
            release()
            if (node := fixtures.find_node(nodes, 0)?, character := current.GetFortCharacter[]):
                if (character.TeleportTo[node.center + vector3{Z := 20.0}, character.GetTransform().Rotation]):
                    claimed := claim_owner(current)
                    if (claimed?):
                        set owner = option{current}
                        owner_acquired(current)
                else:
                    show(current, "Replay cleared. Return or walk to the starter.")

    return_to_hub(input_agent:agent):void =
        if (current := owner?, current = input_agent):
            release()
        hub_destination.Teleport(input_agent)

    removed(input_player:player):void =
        if (current := owner?, current = input_player):
            release()

    show(input_player:player, value:string):void =
        feedback.Show(input_player, text(value), ?DisplayTime := 1.0)

    set_ribbon(value:string):void =
        ribbon.SetText(text(value))
        ribbon.ShowText()
        ribbon.UpdateDisplay()

    debug(value:string):void =
        if (debug_tag <> ""):
            Print("POPBRIDGE_HARNESS {debug_tag} {value}", ?Duration := 0.0)


