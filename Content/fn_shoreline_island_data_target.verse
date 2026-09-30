using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

# Damage-only trigger surfaces retain the shooting agent, unlike target dummy
# HitEvent. Mission controllers decide correctness before invoking feedback.
data_target_state := enum:
    inactive
    active
    hit
    complete

fn_shoreline_island_data_target := class(creative_device):
    @editable
    target_id:int = 0
    @editable
    mission_id:int = 0
    @editable
    reward_value:int = 1
    @editable
    objective:logic = false
    @editable
    hit_surface:trigger_device = trigger_device{}
    @editable
    ring_mesh:creative_prop = creative_prop{}
    @editable
    cone_mesh:creative_prop = creative_prop{}
    @editable
    label_board:billboard_device = billboard_device{}
    @editable
    display_label:string = "DATA TARGET"
    # Opt-in for the solo bay; existing moving mission targets retain their cues.
    @editable
    stationary_y_facing:logic = false
    # Label clearance for fixed category icons; preserve existing targets' offset.
    @editable
    stationary_label_offset_z:float = -12.0
    @editable
    selectable_ring:vfx_creator_device = vfx_creator_device{}
    @editable
    objective_cone:vfx_creator_device = vfx_creator_device{}
    @editable
    active_particles:vfx_creator_device = vfx_creator_device{}
    @editable
    hit_flash:vfx_creator_device = vfx_creator_device{}
    @editable
    complete_burst:vfx_creator_device = vfx_creator_device{}
    @editable
    wrong_sparks:vfx_creator_device = vfx_creator_device{}
    @editable
    hit_sound:audio_player_device = audio_player_device{}
    @editable
    wrong_sound:audio_player_device = audio_player_device{}

    Activated:event() = event(){}
    Hit:event(agent) = event(agent){}
    CorrectHit:event(agent) = event(agent){}
    WrongHit:event(agent) = event(agent){}
    Completed:event(agent) = event(agent){}
    var state:data_target_state = data_target_state.inactive
    var generation:int = 0
    var ring_home:transform = transform{}
    var surface_home:transform = transform{}
    var surface_home_saved:logic = false
    var feedback_generation:int = 0
    var wrong_until:float = 0.0
    # Controllers opt in; other missions keep their existing feedback timing.
    var explicit_answer_feedback:logic = false
    var answer_feedback_seconds:float = 0.4
    neutral_ring_material:DataBlaster.m_data_ring = DataBlaster.m_data_ring{}
    wrong_ring_material:DataBlaster.mi_target_grey = DataBlaster.mi_target_grey{}
    label_text<localizes>(content:string):message = "{content}"
    wrong_label<localizes>:message = "X\nCHECK THE PROMPT"

    OnBegin<override>()<suspends>:void =
        Hide()
        set ring_home = ring_mesh.GetTransform()
        deactivate()
        hit_surface.TriggeredEvent.Subscribe(on_damage)

    activate():void =
        initialize_surface_home()
        if (hit_surface.TeleportTo[surface_home]) {}
        set generation += 1
        set state = data_target_state.active
        set wrong_until = 0.0
        hit_flash.End()
        complete_burst.End()
        wrong_sparks.End()
        hit_surface.Reset()
        hit_surface.SetMaxTriggerCount(0)
        hit_surface.SetTransmitDelay(0.0)
        hit_surface.Enable()
        ring_mesh.Show()
        ring_mesh.SetMaterial(neutral_ring_material)
        label_board.SetText(label_text(display_label))
        label_board.ShowText()
        label_board.UpdateDisplay()
        if (objective?):
            cone_mesh.Show()
        else:
            cone_mesh.Hide()
        spawn { pulse_cues(generation) }
        selectable_ring.Begin()
        active_particles.Begin()
        if (objective?):
            objective_cone.Begin()
        else:
            objective_cone.End()
        Activated.Signal()

    deactivate():void =
        initialize_surface_home()
        set generation += 1
        set state = data_target_state.inactive
        hit_surface.Disable()
        park_surface()
        ring_mesh.Hide()
        cone_mesh.Hide()
        label_board.HideText()
        selectable_ring.End()
        objective_cone.End()
        active_particles.End()
        hit_flash.End()
        complete_burst.End()
        wrong_sparks.End()

    on_damage(maybe_agent:?agent):void =
        if (state = data_target_state.active, input_agent := maybe_agent?):
            Hit.Signal(input_agent)

    # The controller may initialize before this device's OnBegin.
    initialize_surface_home():void =
        if (not surface_home_saved?):
            set surface_home = hit_surface.GetTransform()
            set surface_home_saved = true

    # Disabled invisible triggers can still intercept shots at later choices.
    park_surface():void =
        var parked:transform = surface_home
        set parked.Translation = surface_home.Translation + vector3{Z := -10000.0}
        if (hit_surface.TeleportTo[parked]) {}

    # Called only after the owning mission has validated its current stage.
    accept(input_agent:agent, consume:logic):void =
        if (state <> data_target_state.active):
            return
        position_hit_effects()
        hit_flash.Begin()
        set feedback_generation += 1
        hit_sound.Play(input_agent)
        if (explicit_answer_feedback?):
            label_board.SetText(label_text("CORRECT!\n{display_label}"))
            label_board.UpdateDisplay()
        CorrectHit.Signal(input_agent)
        if (consume?):
            set state = data_target_state.hit
            hit_surface.Disable()
            park_surface()
            ring_mesh.Hide()
            cone_mesh.Hide()
            selectable_ring.End()
            objective_cone.End()
            active_particles.End()
            spawn { finish_hit(input_agent, generation) }
        else:
            spawn { clear_flash(generation, feedback_generation) }

    reject(input_agent:agent):void =
        if (state = data_target_state.active):
            position_hit_effects()
            set wrong_until = GetSimulationElapsedTime() + 0.4
            ring_mesh.SetMaterial(wrong_ring_material)
            wrong_sparks.Begin()
            set feedback_generation += 1
            if (explicit_answer_feedback?):
                label_board.SetText(label_text("TRY AGAIN\n{display_label}"))
            else:
                label_board.SetText(wrong_label)
            label_board.UpdateDisplay()
            wrong_sound.Play(input_agent)
            WrongHit.Signal(input_agent)
            spawn { clear_flash(generation, feedback_generation) }

    clear_flash(expected_generation:int, expected_feedback:int)<suspends>:void =
        Sleep(answer_feedback_seconds)
        if (generation = expected_generation, feedback_generation = expected_feedback):
            hit_flash.End()
            wrong_sparks.End()
            ring_mesh.SetMaterial(neutral_ring_material)
            label_board.SetText(label_text(display_label))
            label_board.UpdateDisplay()

    finish_hit(input_agent:agent, expected_generation:int)<suspends>:void =
        Sleep(0.4)
        if (generation = expected_generation, state = data_target_state.hit):
            hit_flash.End()
            complete_burst.Begin()
            set state = data_target_state.complete
            Completed.Signal(input_agent)

    position_hit_effects():void =
        position := hit_surface.GetTransform().Translation
        for (effect : array{hit_flash, complete_burst, wrong_sparks}):
            var pose:transform = effect.GetTransform()
            set pose.Translation = position
            if (effect.TeleportTo[pose]) {}

    # Track the hit surface so a moving answer keeps its ring and particles.
    # A slow, small scale pulse draws attention without obscuring its label.
    pulse_cues(expected_generation:int)<suspends>:void =
        var pulse:float = 0.0
        var direction:float = 1.0
        var shake_direction:float = 1.0
        loop:
            if (generation <> expected_generation or state <> data_target_state.active):
                return
            position := hit_surface.GetTransform().Translation
            var pose:transform = ring_home
            set pose.Translation = position + vector3{X := -10.0}
            set pose.Scale = ring_home.Scale * (1.0 + pulse * 0.06)
            if (stationary_y_facing?):
                set pose.Translation = position + vector3{Y := -10.0}
                set pose.Scale = ring_home.Scale
            if (GetSimulationElapsedTime() < wrong_until):
                set pose.Translation = pose.Translation + vector3{Y := shake_direction * 8.0}
                set shake_direction = -shake_direction
            if (ring_mesh.TeleportTo[pose]) {}
            var label_pose:transform = label_board.GetTransform()
            set label_pose.Translation = position + vector3{X := -20.0, Z := 200.0}
            if (stationary_y_facing?):
                set label_pose.Translation = position + vector3{Y := -20.0, Z := stationary_label_offset_z}
            if (label_board.TeleportTo[label_pose]) {}
            var particle_pose:transform = active_particles.GetTransform()
            set particle_pose.Translation = position
            if (active_particles.TeleportTo[particle_pose]) {}
            set pulse += direction * 0.05
            if (pulse >= 1.0):
                set direction = -1.0
            else if (pulse <= 0.0):
                set direction = 1.0
            Sleep(0.05)
