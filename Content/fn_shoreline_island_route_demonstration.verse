using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /Verse.org/Assets }
using { /UnrealEngine.com/Temporary/SpatialMath }

# Bounded demonstration copying. No navigation, route IDs or Academy rewards.
fn_shoreline_island_route_demonstration := class(creative_device):
    @editable
    configured:logic = false
    @editable
    robot:creative_prop = creative_prop{}
    @editable
    crate:creative_prop = creative_prop{}
    @editable
    footprints:[]creative_prop = array{creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}}
    @editable
    closure:[]creative_prop = array{creative_prop{}, creative_prop{}, creative_prop{}}
    @editable
    outlines:[]creative_prop = array{creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}}
    @editable
    home_button:button_device = button_device{}
    @editable
    test_button:button_device = button_device{}
    @editable
    cancel_button:button_device = button_device{}
    @editable
    labels:[]billboard_device = array{billboard_device{}, billboard_device{}, billboard_device{}}
    @editable
    teaching_board:billboard_device = billboard_device{}
    @editable
    feedback:hud_message_device = hud_message_device{}
    @editable
    delivery_lights:[]customizable_light_device = array{customizable_light_device{}, customizable_light_device{}}
    @editable
    round_settings:round_settings_device = round_settings_device{}
    @editable
    footprint_mesh:?mesh = option{HangarRoute.route_footprints_asset}
    @editable
    cursor_mesh:?mesh = option{HangarRoute.route_cursor_asset}
    @editable
    invalid_mesh:?mesh = option{HangarRoute.route_invalid_asset}

    # phase: 0 idle/retry-first, 1 recording, 2 ready, 3 playback,
    # 4 closure/old-test, 5 blocked/retry-revision, 6 complete, 7 new-delivery hold.
    var phase:int = 0
    var generation:int = 0
    var owner:?player = false
    var owner_character:?fort_character = false
    var points:[]vector3 = array{}
    var first_points:[]vector3 = array{}
    var delivered_one:logic = false
    var old_tested:logic = false
    var route_valid:logic = false
    var travel:float = 0.0
    var previous:vector3 = vector3{}
    var previous_step:vector3 = vector3{}
    var sample_time:float = 0.0
    var robot_home:transform = transform{}
    var crate_home:transform = transform{}
    var expected_robot:transform = transform{}
    var expected_crate:transform = transform{}
    var cursor:int = -1

    dim_outline:Academy.mi_academy_navy = Academy.mi_academy_navy{}
    bright_outline:Academy.mi_academy_gold = Academy.mi_academy_gold{}

    text<localizes>(value:string):message = "{value}"

    flat(p:vector3)<transacts>:vector3 = vector3{X := p.X, Y := p.Y, Z := 2314.0}
    home()<transacts>:vector3 = vector3{X := 6650.0, Y := -13600.0, Z := 2314.0}
    load()<transacts>:vector3 = vector3{X := 7950.0, Y := -13600.0, Z := 2314.0}

    OnBegin<override>()<suspends>:void =
        Hide()
        if (not configured?):
            return
        if (footprints.Length <> 128 or closure.Length <> 3 or outlines.Length <> 8 or labels.Length <> 3 or delivery_lights.Length <> 2):
            Print("HANGAR ROUTE: incomplete configuration")
            return
        set robot_home = robot.GetTransform()
        set crate_home = crate.GetTransform()
        set expected_robot = robot_home
        set expected_crate = crate_home
        for (control : array{home_button, test_button, cancel_button}):
            control.SetInteractionTime(0.0)
            control.SetMaxTriggerCount(0)
            control.Enable()
        home_button.InteractedWithEvent.Subscribe(on_home)
        test_button.InteractedWithEvent.Subscribe(on_test)
        cancel_button.InteractedWithEvent.Subscribe(on_cancel)
        round_settings.RoundBeginEvent.Subscribe(on_round)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_departure)
        reset_all()
        monitor()

    in_activity(input_agent:agent)<transacts><decides>:void =
        c := input_agent.GetFortCharacter[]
        c.IsActive[]
        p := c.GetTransform().Translation
        p.X >= 5400.0
        p.X <= 8200.0
        p.Y >= -14400.0
        p.Y <= -12800.0
        p.Z >= 2314.0
        p.Z <= 2900.0

    is_owner(input_agent:agent)<transacts><decides>:void =
        p := owner?
        p = input_agent
        original := owner_character?
        current := p.GetFortCharacter[]
        current = original
        in_activity[p]

    run_valid(token:int)<transacts><decides>:void =
        token = generation
        p := owner?
        is_owner[p]

    inside(p:vector3, revision:logic)<transacts><decides>:void =
        p.X >= 6475.0
        p.X <= 8125.0
        if (revision?):
            p.Y >= -14325.0
            p.Y <= -12875.0
        else:
            p.Y >= -13825.0
            p.Y <= -13375.0

    # Closed slab intersection; 2 means no intersection. Includes grazing.
    closure_entry(a:vector3, b:vector3)<transacts>:float =
        var enter:float = 0.0
        var leave:float = 1.0
        for (axis : array{0, 1}):
            var start:float = a.X
            var delta:float = b.X - a.X
            var low:float = 7075.0
            var high:float = 7525.0
            if (axis = 1):
                set start = a.Y
                set delta = b.Y - a.Y
                set low = -13975.0
                set high = -13225.0
            if (Abs(delta) < 0.000001):
                if (start < low or start > high):
                    return 2.0
            else:
                t1 := (low - start) / delta
                t2 := (high - start) / delta
                set enter = Max(enter, Min(t1, t2))
                set leave = Min(leave, Max(t1, t2))
                if (enter > leave):
                    return 2.0
        if (leave < 0.0 or enter > 1.0):
            return 2.0
        return Max(0.0, enter)

    safe(a:vector3, b:vector3, revision:logic)<transacts><decides>:void =
        inside[a, revision]
        inside[b, revision]
        if (revision?):
            closure_entry(a, b) > 1.0

    status(value:string):void =
        teaching_board.SetText(text(value))
        teaching_board.ShowText()
        teaching_board.UpdateDisplay()
        if (p := owner?):
            feedback.Show(p, text(value), ?DisplayTime := 8.0)
        Print("HANGAR ROUTE: {value}")

    control_text(home_text:string, test_text:string):void =
        home_button.SetInteractionText(text(home_text))
        test_button.SetInteractionText(text(test_text))
        cancel_button.SetInteractionText(text("CANCEL"))
        for (index -> label : labels):
            var value:string = "CANCEL"
            if (index = 0):
                set value = "HOME\n{home_text}"
            if (index = 1):
                set value = "LOAD\n{test_text}"
            label.SetText(text(value))
            label.ShowText()
            label.UpdateDisplay()

    clear_marks():void =
        for (mark : footprints):
            mark.Hide()
        set cursor = -1

    set_mark(index:int, kind:int):void =
        if (mark := footprints[index], p := points[index]):
            var pose:transform = transform{}
            set pose.Translation = p + vector3{Z := 3.0}
            if (next := points[index + 1]):
                d := next - p
                set pose.Rotation = MakeRotationFromYawPitchRollDegrees(ArcTan(d.Y, d.X) * 180.0 / PiFloat, 0.0, 0.0)
            else if (prior_point := points[index - 1]):
                d := p - prior_point
                set pose.Rotation = MakeRotationFromYawPitchRollDegrees(ArcTan(d.Y, d.X) * 180.0 / PiFloat, 0.0, 0.0)
            if (m := footprint_mesh?):
                mark.SetMesh(m)
            if (kind = 1, m := cursor_mesh?):
                mark.SetMesh(m)
                set pose.Translation.Z += 2.0
            if (kind = 2, m := invalid_mesh?):
                mark.SetMesh(m)
                set pose.Translation.Z += 2.0
            if (mark.TeleportTo[pose]):
                mark.Show()

    highlight(index:int, kind:int):void =
        if (cursor >= 0):
            set_mark(cursor, 0)
        set cursor = index
        set_mark(index, kind)

    flash_invalid(index:int, token:int)<suspends>:void =
        if (mark := footprints[index]):
            for (flash := 1..3):
                Sleep(0.2)
                if (not run_valid[token]):
                    return
                mark.Hide()
                Sleep(0.2)
                if (not run_valid[token]):
                    return
                mark.Show()

    restore_props():logic =
        if (robot.TeleportTo[robot_home], crate.TeleportTo[crate_home]):
            set expected_robot = robot_home
            set expected_crate = crate_home
            if (Distance(robot.GetTransform().Translation, robot_home.Translation) <= 5.0,
                Distance(crate.GetTransform().Translation, crate_home.Translation) <= 5.0):
                return true
        Print("HANGAR ROUTE: home reset failed")
        return false

    reset_all():void =
        # Synchronous motion cannot resume after this generation invalidation.
        set generation += 1
        if (p := owner?):
            feedback.Hide(p)
        set owner = false
        set owner_character = false
        set phase = 0
        set points = array{}
        set first_points = array{}
        set delivered_one = false
        set old_tested = false
        set route_valid = false
        set travel = 0.0
        clear_marks()
        for (prop : closure):
            prop.Hide()
        for (index -> prop : outlines):
            if (index < 4):
                prop.SetMaterial(dim_outline)
                prop.Show()
            else:
                prop.Show()
        for (light : delivery_lights):
            light.TurnOff()
        reset_ok := restore_props()
        if (not reset_ok?):
            status("Pix needs a reset. Please try again.")
        else:
            status("TEACH PIX A ROUTE\nStand on HOME. SHOW A ROUTE.\nWalk to LOAD. Your footprints teach Pix.\nStay in the bright practice strip.")
        control_text("SHOW A ROUTE", "TRY MY ROUTE")

    on_round():void = reset_all()
    on_departure(p:player):void =
        if (current := owner?, current = p):
            reset_all()
    on_cancel(a:agent):void =
        if (is_owner[a]):
            reset_all()

    on_home(a:agent):void =
        if (p := player[a], in_activity[p], c := p.GetFortCharacter[], c.IsOnGround[], Distance(flat(c.GetTransform().Translation), home()) <= 100.0):
            if (current := owner?, current <> p):
                feedback.Show(p, text("Pix is copying another player's example."), ?DisplayTime := 3.0)
                return
            if (phase = 3 or phase = 7 or phase = 6):
                return
            if (delivered_one?, not old_tested?):
                status("TRY OLD ROUTE first. See what changed.")
                return
            if (not owner?):
                set owner = option{p}
                set owner_character = option{c}
            if (not is_owner[p]):
                return
            set generation += 1
            set phase = 1
            set route_valid = false
            set travel = 0.0
            set previous_step = vector3{}
            set points = array{}
            clear_marks()
            reset_ok := restore_props()
            if (not reset_ok?):
                reject("Pix reset failed. SHOW AGAIN.")
                return
            set previous = flat(c.GetTransform().Translation)
            set travel = Distance(home(), previous)
            set sample_time = GetSimulationElapsedTime()
            if (not safe[home(), previous, delivered_one?]):
                reject("Stand inside HOME. SHOW AGAIN.")
                return
            added := append_point(home())
            if (not added?):
                return
            if (Distance(home(), previous) > 1.0):
                connected := append_point(previous)
                if (not connected?):
                    return
            if (delivered_one?):
                status("Walk around either side to LOAD.\nPix won't cross the striped safety area.")
            else:
                status("Walk to LOAD. Your footprints teach Pix.\nStay in the bright practice strip.")
            control_text("SHOW AGAIN", "RECORDING...")

    append_point(p:vector3):logic =
        if (points.Length >= 128):
            reject("Route full. Show a shorter example.")
            return false
        if (prior_point := points[points.Length - 1]):
            if (Distance(prior_point, p) < 0.01):
                return true
            if (not safe[prior_point, p, delivered_one?]):
                reject("That shortcut crosses unsafe space. SHOW AGAIN.")
                return false
        set points += array{p}
        set_mark(points.Length - 1, 0)
        if (points.Length >= 2):
            set_mark(points.Length - 2, 0)
        Print("HANGAR ROUTE POINT {points.Length - 1}: {p.X},{p.Y}")
        return true

    reject(reason:string):void =
        set generation += 1
        set route_valid = false
        if (delivered_one?):
            set phase = 5
        else:
            set phase = 0
        highlight(points.Length - 1, 2)
        spawn { flash_invalid(points.Length - 1, generation) }
        control_text("SHOW AGAIN", "SHOW AGAIN FIRST")
        status(reason)

    observe():void =
        if (p := owner?, c := p.GetFortCharacter[]):
            now := GetSimulationElapsedTime()
            current := flat(c.GetTransform().Translation)
            if (not c.IsOnGround[]):
                reject("Keep your feet on the floor. SHOW AGAIN.")
                return
            if (now - sample_time > 0.3):
                reject("Recording paused too long. SHOW AGAIN.")
                return
            step := current - previous
            distance := Distance(current, previous)
            if (distance > 150.0):
                reject("Movement jumped too far. SHOW AGAIN.")
                return
            if (not inside[current, delivered_one?]):
                reject("Stay inside the bright route area. SHOW AGAIN.")
                return
            if (not safe[previous, current, delivered_one?]):
                reject("Pix won't cross the striped safety area. SHOW AGAIN.")
                return
            set travel += distance
            if (travel > 6000.0):
                reject("Route full. Show a shorter example.")
                return
            if (prior_point := points[points.Length - 1]):
                var retain:logic = false
                if (Distance(prior_point, current) >= 50.0):
                    set retain = true
                if (distance >= 10.0, previous_step.Length() >= 10.0):
                    cosine := DotProduct(step, previous_step) / (step.Length() * previous_step.Length())
                    if (cosine <= 0.93969262):
                        # Retain observed corner BEFORE the changed heading.
                        before := append_point(previous)
                        if (not before?):
                            return
                        set retain = true
                if (retain?):
                    added := append_point(current)
                    if (not added?):
                        return
            if (distance >= 1.0):
                set previous_step = step
            set previous = current
            set sample_time = now
            if (Distance(current, load()) <= 100.0):
                set travel += Distance(current, load())
                if (travel > 6000.0):
                    reject("Route full. Show a shorter example.")
                    return
                added := append_point(current)
                if (not added?):
                    return
                connected := append_point(load())
                if (not connected?):
                    return
                set route_valid = true
                set phase = 2
                if (not delivered_one?):
                    set first_points = points
                control_text("SHOW AGAIN", "TRY MY ROUTE")
                status("Example saved: {points.Length} footprints.\nPress TRY MY ROUTE beside LOAD.")

    monitor()<suspends>:void =
        loop:
            if (p := owner?):
                if (not is_owner[p]):
                    reset_all()
                else if (phase = 1):
                    observe()
            Sleep(0.1)

    on_test(a:agent):void =
        if (not is_owner[a]):
            return
        if (phase = 6):
            reset_all()
            return
        if (phase = 4):
            set points = first_points
            set route_valid = true
            set phase = 3
            spawn { playback(generation, true) }
        else if (phase = 2, route_valid?):
            set phase = 3
            spawn { playback(generation, false) }

    props_match()<transacts><decides>:void =
        robot.IsValid[]
        crate.IsValid[]
        Distance(robot.GetTransform().Translation, expected_robot.Translation) <= 5.0
        Distance(crate.GetTransform().Translation, expected_crate.Translation) <= 5.0

    move_pair(p:vector3, yaw:float, token:int):logic =
        if (not run_valid[token] or not props_match[]):
            return false
        var pose:transform = robot_home
        set pose.Translation = p + vector3{Z := robot_home.Translation.Z - 2314.0}
        # Original Pix visual faces -Y, hence +90 degrees about Z.
        set pose.Rotation = MakeRotationFromYawPitchRollDegrees(yaw + 90.0, 0.0, 0.0)
        var cargo:transform = crate_home
        set cargo.Translation = p + vector3{Z := crate_home.Translation.Z - 2314.0}
        set cargo.Rotation = pose.Rotation
        if (robot.TeleportTo[pose], crate.TeleportTo[cargo]):
            set expected_robot = pose
            set expected_crate = cargo
            if (props_match[]):
                return true
        return false

    travel_segment(a:vector3, b:vector3, yaw:float, token:int)<suspends>:logic =
        length := Distance(a, b)
        var travelled:float = 0.0
        loop:
            if (not run_valid[token]):
                return false
            set travelled = Min(length, travelled + 10.0)
            var p:vector3 = b
            if (length > 0.0):
                set p = a + (b - a) * (travelled / length)
            moved := move_pair(p, yaw, token)
            if (not moved?):
                return false
            if (travelled >= length):
                return true
            Sleep(0.05)

    turn_at(p:vector3, from:float, destination:float, token:int)<suspends>:logic =
        var delta:float = destination - from
        loop:
            if (delta <= 180.0):
                break
            set delta -= 360.0
        loop:
            if (delta >= -180.0):
                break
            set delta += 360.0
        for (frame := 1..4):
            moved := move_pair(p, from + delta * frame * 0.25, token)
            if (not moved?):
                return false
            Sleep(0.05)
        return true

    playback(token:int, old:logic)<suspends>:void =
        if (not run_valid[token]):
            return
        reset_ok := restore_props()
        if (not reset_ok?):
            reject("Pix reset failed. SHOW AGAIN.")
            return
        control_text("PIX IS COPYING", "PIX IS COPYING")
        status("Watch Pix carry the crate along your footprints.")
        var yaw:float = -90.0
        for (index := 1..points.Length - 1):
            if (not run_valid[token]):
                return
            if (a := points[index - 1], b := points[index]):
                d := b - a
                next_yaw := ArcTan(d.Y, d.X) * 180.0 / PiFloat
                turned := turn_at(a, yaw, next_yaw, token)
                if (not turned?):
                    if (run_valid[token]):
                        reject("Pix or crate moved unexpectedly. SHOW AGAIN.")
                    return
                set yaw = next_yaw
                highlight(index, 1)
                if (not safe[a, b, delivered_one?]):
                    entry := closure_entry(a, b)
                    var stop:vector3 = a
                    length := Distance(a, b)
                    if (entry <= 1.0, length > 0.0):
                        stop_fraction := Max(0.0, entry - 10.0 / length)
                        set stop = a + d * stop_fraction
                    stopped := travel_segment(a, stop, yaw, token)
                    if (not run_valid[token]):
                        return
                    if (not stopped?):
                        reject("Pix or crate moved unexpectedly. SHOW AGAIN.")
                        return
                    highlight(index, 2)
                    spawn { flash_invalid(index, token) }
                    set phase = 5
                    set route_valid = false
                    if (old?):
                        set old_tested = true
                    control_text("SHOW NEW ROUTE", "SHOW NEW ROUTE FIRST")
                    status("The bay changed. Pix stopped safely.\nShow Pix a new route around either side.\nPix won't cross the striped safety area.")
                    return
                moved := travel_segment(a, b, yaw, token)
                if (not moved?):
                    if (run_valid[token]):
                        reject("Pix or crate moved unexpectedly. SHOW AGAIN.")
                    return
        if (not run_valid[token]):
            return
        if (old?):
            reject("Old route did not stop as expected. SHOW AGAIN.")
            return
        # Full polyline checked, immutable dedicated props, actual readback.
        if (not route_valid? or not props_match[] or Distance(flat(robot.GetTransform().Translation), load()) > 5.0):
            reject("Crate did not arrive safely. SHOW AGAIN.")
            return
        var deposit:transform = crate_home
        set deposit.Translation = load() + vector3{Z := 23.0}
        if (crate.TeleportTo[deposit]):
            set expected_crate = deposit
        else:
            reject("Crate deposit failed. SHOW AGAIN.")
            return
        if (not props_match[] or Distance(crate.GetTransform().Translation, deposit.Translation) > 5.0):
            reject("Crate deposit was not verified. SHOW AGAIN.")
            return
        if (not delivered_one?):
            set delivered_one = true
            if (light := delivery_lights[0]):
                light.TurnOn()
            set phase = 7
            status("DELIVERY 1\nNew delivery! The bay is changing.")
            Sleep(1.0)
            if (not run_valid[token]):
                return
            reset_new := restore_props()
            if (not reset_new?):
                reject("Pix reset failed. CANCEL and try again.")
                return
            for (prop : closure):
                prop.Show()
            for (index -> prop : outlines):
                if (index < 4):
                    prop.SetMaterial(bright_outline)
                    prop.Show()
                else:
                    prop.Hide()
            set phase = 4
            control_text("TEST OLD ROUTE FIRST", "TRY OLD ROUTE")
            status("The striped safety area is closed to Pix.\nPress TRY OLD ROUTE. See what changed.")
        else:
            if (not old_tested?):
                reject("Test the old example first.")
                return
            if (light := delivery_lights[1]):
                light.TurnOn()
            set phase = 6
            control_text("2 DELIVERIES", "REPLAY")
            status("2 DELIVERIES!\nYou showed a route. You tested it. You improved it.\nThis robot copies your example.\nPeople can teach AI in other ways too.\nREPLAY or walk out.")





