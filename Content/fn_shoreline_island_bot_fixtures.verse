# Capstone execution is authored here and rendered by the station from its trace.
# Commands: 0 Pickup, 1 Move, 2 Drop, 3 Light.
bot_command := class:
    instruction:int = -1
    slot:int = -1
    iteration:int = 0

bot_execution_frame := class:
    command:bot_command = bot_command{}
    position:int = 0
    energy:int = 0
    carrying:logic = false
    delivered:logic = false
    lights:int = 0

bot_execution_result := class:
    frames:[]bot_execution_frame = array{}
    # 0 success; nonzero values map to explicit station explanations.
    error:int = 0
    failed_command:bot_command = bot_command{}

fn_shoreline_island_bot_fixtures := class:
    destination:int = 3

    seed_defaults()<transacts>:[]int = array{1, 0, 2}

    dock_defaults()<transacts>:[]int = array{3, 1}

    cycle(current:int, maximum:int)<transacts>:int =
        if (current >= maximum):
            return 0
        return current + 1

    cycle_repeat(current:int)<transacts>:int =
        if (current >= 4):
            return 1
        return current + 1

    # Cargo: 0 leaf, 1 plain. Destination: 0 Garden, 1 Storage.
    # Rule: 0 all Garden, 1 all Storage, 2 correct condition, 3 reversed.
    route_destination(cargo:int, rule:int)<transacts>:int =
        if (rule = 0):
            return 0
        if (rule = 1):
            return 1
        if (rule = 2):
            return cargo
        if (cargo = 0):
            return 1
        return 0

    evaluate(stage:int, slots:[]int, repeats:int, initial_energy:int)<transacts>:bot_execution_result =
        var frames:[]bot_execution_frame = array{bot_execution_frame{energy := initial_energy}}
        if (repeats < 1 or repeats > 4):
            return bot_execution_result{frames := frames, error := 14}
        if (initial_energy < 0 or initial_energy > 6):
            return bot_execution_result{frames := frames, error := 15}
        var commands:[]bot_command = array{}
        if (stage = 0):
            if (slots.Length <> 3):
                return bot_execution_result{frames := frames, error := 13}
            for (slot -> instruction : slots):
                if (instruction < 0 or instruction > 2):
                    return bot_execution_result{frames := frames, error := 13}
                if (instruction = 1):
                    for (iteration := 1..repeats):
                        set commands += array{bot_command{instruction := instruction, slot := slot, iteration := iteration}}
                else:
                    set commands += array{bot_command{instruction := instruction, slot := slot}}
        else if (stage = 1):
            if (slots.Length <> 2):
                return bot_execution_result{frames := frames, error := 13}
            for (instruction : slots):
                if (instruction <> 1, instruction <> 3):
                    return bot_execution_result{frames := frames, error := 13}
            for (iteration := 1..repeats):
                for (slot -> instruction : slots):
                    set commands += array{bot_command{instruction := instruction, slot := slot, iteration := iteration}}
        else:
            return bot_execution_result{frames := frames, error := 13}

        var position:int = 0
        var energy:int = initial_energy
        var carrying:logic = false
        var delivered:logic = false
        var lights:int = 0
        for (command : commands):
            var error:int = 0
            if (command.instruction = 0):
                if (position <> 0):
                    set error = 1
                else if (carrying? or delivered?):
                    set error = 2
                else:
                    set carrying = true
            else if (command.instruction = 1):
                if (position >= destination):
                    set error = 3
                else:
                    set position += 1
            else if (command.instruction = 2):
                if (not carrying?):
                    set error = 4
                else if (position <> destination):
                    set error = 5
                else:
                    set carrying = false
                    set delivered = true
            else if (command.instruction = 3):
                if (position = 0):
                    set error = 6
                else if (position <= lights):
                    set error = 7
                else if (energy <= 0):
                    set error = 8
                else if (position <> lights + 1):
                    set error = 10
                else:
                    set energy -= 1
                    set lights += 1
            if (error <> 0):
                return bot_execution_result{frames := frames, error := error, failed_command := command}
            set frames += array{bot_execution_frame{command := command, position := position,
                energy := energy, carrying := carrying, delivered := delivered, lights := lights}}

        if (stage = 0, not delivered?):
            return bot_execution_result{frames := frames, error := 9}
        if (stage = 1):
            if (lights <> destination):
                return bot_execution_result{frames := frames, error := 10}
            if (energy <> 0):
                return bot_execution_result{frames := frames, error := 11}
        if (position <> destination):
            return bot_execution_result{frames := frames, error := 12}
        return bot_execution_result{frames := frames}
