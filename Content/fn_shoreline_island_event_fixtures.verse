fn_shoreline_island_event_fixtures := class:
    # Requests: 0 Scan Object, 1 Announce Result.
    # Tools: 0 Scanner, 1 Speaker, 2 Light distractor.
    demonstration_event(index:int):int =
        if (index = 1):
            1
        else:
            0

    demonstration_response(index:int):int =
        if (index = 1):
            1
        else:
            0

    toggle_response(current:int):int =
        if (current = 0):
            1
        else if (current = 1):
            2
        else:
            0
