fn_shoreline_island_debug_fixtures := class:
    choice_count(challenge:int)<computes>:int =
        if (challenge = 0):
            3
        else if (challenge = 1):
            4
        else:
            2

    repeat_count(choice:int)<computes>:int =
        if (choice = 3):
            1
        else:
            choice + 2

    move_delta(choice:int)<computes>:int =
        if (choice = 0):
            -1
        else if (choice = 1):
            0
        else:
            1

    goes_to_garden(choice:int, item:int)<computes>:logic =
        if (choice = 1, item = 0):
            true
        else if (choice = 0, item = 1):
            true
        else:
            false
