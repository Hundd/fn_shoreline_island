# Care commands: Water 0, Plant 1, Wait 2, Harvest 3.
# Planter states: Empty 0, Watered 1, Planted 2, Ready 3, Harvested 4.
nursery_execution_frame := class:
    definition_slot:int = -1
    command:int = -1
    planter_state:int = 0
    caller_slot:int = -1
    iteration:int = 0
    position:int = 0
    planter_states:[]int = array{0, 0, 0}

nursery_call := class:
    instruction:int = 0
    slot:int = 0
    iteration:int = 0

nursery_execution_result := class:
    frames:[]nursery_execution_frame = array{}
    # 0 success, 1 transition, 2 definition, 3 unfinished beds, 4 off row,
    # 5 Care on exit, 6 exit not reached, 7 caller/count bounds.
    error:int = 0
    failed_frame:nursery_execution_frame = nursery_execution_frame{}

fn_shoreline_island_nursery_fixtures := class:
    definition_defaults()<transacts>:[]int = array{0, 1, 3, 2}

    cycle_command(current:int)<transacts>:int =
        if (current >= 3):
            return 0
        return current + 1

    evaluate_care(definition:[]int)<transacts>:nursery_execution_result =
        return evaluate(0, definition, array{}, 1)

    evaluate(challenge:int, definition:[]int, caller:[]int, repeats:int)<transacts>:nursery_execution_result =
        var frames:[]nursery_execution_frame = array{nursery_execution_frame{}}
        if (definition.Length <> 4):
            return nursery_execution_result{frames := frames, error := 2}
        for (command : definition):
            if (command < 0 or command > 3):
                return nursery_execution_result{frames := frames, error := 2}
        var calls:[]nursery_call = array{}
        var bed_count:int = 1
        var last_tile:int = 0
        if (challenge = 0):
            set calls = array{nursery_call{}}
        else if (challenge = 1):
            set bed_count = 2
            set last_tile = 1
            if (caller.Length <> 3):
                return nursery_execution_result{frames := frames, error := 7}
            for (slot -> instruction : caller):
                if (instruction < 0 or instruction > 1):
                    return nursery_execution_result{frames := frames, error := 7}
                set calls += array{nursery_call{instruction := instruction, slot := slot}}
        else if (challenge = 2):
            set bed_count = 3
            set last_tile = 3
            if (repeats < 1 or repeats > 4):
                return nursery_execution_result{frames := frames, error := 7}
            for (iteration := 1..repeats):
                set calls += array{nursery_call{slot := 0, iteration := iteration},
                    nursery_call{instruction := 1, slot := 1, iteration := iteration}}
        else:
            return nursery_execution_result{frames := frames, error := 7}

        var position:int = 0
        var states:[]int = array{0, 0, 0}
        for (call : calls):
            if (call.instruction = 1):
                before := nursery_execution_frame{command := 4, caller_slot := call.slot,
                    iteration := call.iteration, position := position, planter_states := states}
                if (position >= last_tile):
                    return nursery_execution_result{frames := frames, error := 4, failed_frame := before}
                set position += 1
                set frames += array{nursery_execution_frame{command := 4, caller_slot := call.slot,
                    iteration := call.iteration, position := position, planter_states := states}}
            else:
                if (position >= bed_count):
                    return nursery_execution_result{frames := frames, error := 5,
                        failed_frame := nursery_execution_frame{caller_slot := call.slot,
                            iteration := call.iteration, position := position, planter_states := states}}
                for (slot -> command : definition):
                    if (current := states[position]):
                        before := nursery_execution_frame{definition_slot := slot, command := command,
                            caller_slot := call.slot, iteration := call.iteration, position := position,
                            planter_state := current, planter_states := states}
                        if (command <> current):
                            return nursery_execution_result{frames := frames, error := 1, failed_frame := before}
                        if (set states[position] = current + 1) {}
                        set frames += array{nursery_execution_frame{definition_slot := slot,
                            command := command, caller_slot := call.slot, iteration := call.iteration,
                            position := position, planter_state := current + 1, planter_states := states}}
        for (bed := 0..bed_count - 1):
            if (states[bed] <> 4):
                return nursery_execution_result{frames := frames, error := 3}
        if (challenge = 2, position <> 3):
            return nursery_execution_result{frames := frames, error := 6}
        return nursery_execution_result{frames := frames}
