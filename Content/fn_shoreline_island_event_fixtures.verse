fn_shoreline_island_event_fixtures := class:
    # Events: 0 Bell, 1 Lever. Responses: 0 Open chute, 1 Light lamp.
    demonstration_event(index:int):int =
        if (index = 1):
            1
        else:
            0

    demonstration_response(index:int):int =
        if (index = 0):
            1
        else:
            0

    toggle_response(current:int):int =
        if (current = 0):
            1
        else:
            0
