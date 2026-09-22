# Authored cargo queues and rules; IDs match the feature plan.
fn_shoreline_island_signal_fixtures := class:
    queue(challenge:int)<transacts>:[]int =
        if (challenge = 0):
            return array{0, 2}
        if (challenge = 1):
            return array{1, 2, 0}
        return array{2, 0, 1, 0}

    cargo_name(cargo:int)<transacts>:string =
        if (cargo = 0):
            return "APPLE"
        if (cargo = 1):
            return "PUPPY"
        return "CAR"

    destination_name(destination:int)<transacts>:string =
        if (destination = 0):
            return "Food"
        if (destination = 1):
            return "Animal"
        return "Vehicle"

    route(rule:int, cargo:int)<transacts>:int =
        if (rule = 1):
            if (cargo = 0):
                return 2
            if (cargo = 2):
                return 0
        if (rule = 2, cargo = 1):
            return 0
        return cargo

    rule_name(rule:int)<transacts>:string =
        if (rule = 1):
            return "B"
        if (rule = 2):
            return "C"
        return "A"

    queue_text(challenge:int)<transacts>:string =
        if (challenge = 0):
            return "{cargo_name(0)} > {cargo_name(2)}"
        if (challenge = 1):
            return "{cargo_name(1)} > {cargo_name(2)} > {cargo_name(0)}"
        return "{cargo_name(2)} > {cargo_name(0)} > {cargo_name(1)} > {cargo_name(0)}"
