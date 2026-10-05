using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

# Temporary approved test profile. All interaction/transition/recovery logic is
# inherited from the production reusable adapter; this only constructs records
# from explicitly bound native device arrays and observes real characters.
fn_shoreline_island_popbridge_harness := class(fn_shoreline_island_popbridge_controller):
    @editable
    test_origin:vector3 = vector3{X := -4200.0, Y := -17300.0, Z := 2520.0}
    @editable
    test_return:button_device = button_device{}
    @editable
    test_decks:[]creative_prop = array{creative_prop{}, creative_prop{}, creative_prop{}}
    @editable
    test_targets:[]fn_shoreline_island_data_target = array{}
    @editable
    test_mechanisms:[]creative_prop = array{creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}, creative_prop{}}
    @editable
    test_instruction_effects:[]vfx_creator_device = array{vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}}
    @editable
    test_puffs:[]vfx_creator_device = array{vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}}
    @editable
    test_flourishes:[]vfx_creator_device = array{vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}, vfx_creator_device{}}

    OnBegin<override>()<suspends>:void =
        if (test_decks.Length <> 3 or test_targets.Length <> 5 or test_mechanisms.Length <> 15 or test_instruction_effects.Length <> 15 or test_puffs.Length <> 5 or test_flourishes.Length <> 5):
            Print("POPBRIDGE_HARNESS invalid actual support counts")
            return
        for (id -> deck : test_decks):
            var initially:logic = false
            var milestone:int = -1
            var terminal:logic = false
            if (id = 0 or id = 2):
                set initially = true
            if (id = 1):
                set milestone = 0
            if (id = 2):
                set terminal = true
            set landings += array{popbridge_landing{node := popbridge_node{id := id, center := test_origin + vector3{X := id * 450.0}, initially_built := initially, milestone := milestone, route_stage := id, terminal := terminal}, deck := deck}}
        set edges = array{popbridge_edge{source := 0, destination := 1}, popbridge_edge{source := 1, destination := 2}}
        for (id -> target : test_targets):
            var from_landing:int = 0
            var creates:int = -1
            var instruction:int = id
            if (id = 2):
                set creates = 1
            if (id = 3):
                set from_landing = 1
                set creates = 2
            if (id = 4):
                set from_landing = 2
                set creates = -2
                set instruction = 3
            if (a := test_mechanisms[id * 3], b := test_mechanisms[id * 3 + 1], c := test_mechanisms[id * 3 + 2], ea := test_instruction_effects[id * 3], eb := test_instruction_effects[id * 3 + 1], ec := test_instruction_effects[id * 3 + 2], puff := test_puffs[id], flourish := test_flourishes[id]):
                set machines += array{popbridge_machine{receiver := popbridge_receiver{target_id := id, from_landing := from_landing, creates := creates, instruction := instruction}, target := target, mechanisms := array{a, b, c}, instructions := array{ea, eb, ec}, wrong_puff := puff, flourish := flourish}}
        set return_buttons = array{test_return}
        targets_started := await_target_startup()
        if (not targets_started?):
            return
        initialize()
        if (ready?):
            spawn { observe_characters() }
            # The existing island entry router can supersede Play From Here.
            # This only establishes the authorized diagnostic starting position.
            Sleep(2.0)
            for (input_player : GetPlayspace().GetPlayers()):
                if (character := input_player.GetFortCharacter[], character.IsActive[]):
                    # Measure the existing catch floor independently, then start.
                    if (character.TeleportTo[test_origin + vector3{X := -500.0, Z := -80.0}, MakeRotationFromYawPitchRollDegrees(90.0, 0.0, 0.0)]) {}
                    Sleep(2.0)
                    if (character.TeleportTo[test_origin + vector3{Z := 20.0}, MakeRotationFromYawPitchRollDegrees(90.0, 0.0, 0.0)]) {}

    observe_characters()<suspends>:void =
        loop:
            Sleep(0.5)
            for (input_player : GetPlayspace().GetPlayers()):
                if (character := input_player.GetFortCharacter[], character.IsActive[]):
                    pose := character.GetTransform().Translation
                    if (inside(pose, bay_min, bay_max)?):
                        var grounded:int = 0
                        if (character.IsOnGround[]):
                            set grounded = 1
                        debug("PROBE time={GetSimulationElapsedTime()} x={pose.X} y={pose.Y} z={pose.Z} ground={grounded} present={present_landing(input_player)} prefix={state.prefix} checkpoint={state.checkpoint} pending={state.pending}")



