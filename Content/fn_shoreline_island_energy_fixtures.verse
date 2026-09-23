# Authored Variable Vault values, independent of each player's current energy.
fn_shoreline_island_energy_fixtures := class:
    start(challenge:int)<transacts>:int =
        if (challenge = 0 or challenge = 1):
            return 4
        return 0

    target(challenge:int)<transacts>:int =
        if (challenge = 0):
            return 7
        if (challenge = 1):
            return 10
        return 6
