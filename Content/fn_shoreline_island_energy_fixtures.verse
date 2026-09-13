# Authored Variable Vault values, independent of each player's current energy.
fn_shoreline_island_energy_fixtures := class:
    start(challenge:int)<transacts>:int =
        if (challenge = 1):
            return 2
        return 0

    target(challenge:int)<transacts>:int =
        if (challenge = 0):
            return 3
        if (challenge = 1):
            return 5
        return 6
