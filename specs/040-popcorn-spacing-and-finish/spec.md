# 040 - Popcorn spacing and finish corrections

Status: proposed concrete maintenance; awaiting human review. Source mission and historical acceptance evidence remain in feature 039.

The owner requests separation of pop039_ring_0/1/2, disappearance of the entire machine after a successful hit, and free jumping after completion, without end-of-task testing.

| ID | Requirement | Given / When / Then |
|---|---|---|
| R01 | Separate the first three teaching receivers. | Given the current overlapping 1.4m-wide rings, when assemblies 0 and 2 move 40cm outward along Y, then adjacent centers are 1.6m apart with 20cm clear gaps, and assembly 1 remains fixed. All corresponding trigger, label, cue and mechanism offsets are retained. |
| R02 | Hide the full successful machine. | Given a valid successful hit, when the existing teaching animation or reuse sequence finishes, then its ring, cone, label, cues and all three mechanisms disappear. Wrong hits leave the machine visible; created landing platforms and popcorn stay. Replay restores machines. |
| R03 | Allow free movement after completion. | Given a completed mission, when the player jumps or drops onto the catch floor, then the mission does not teleport them back to their checkpoint. During an unfinished attempt recovery still works. Replay starts a fresh attempt with recovery enabled; badge retention and Return remain unchanged. |
| R04 | Honor no-testing request. | Given these changes, when implementation ends, then do not run tests, project validation, cooking or a gameplay session. Compile changed Verse for application, save changes, read back editor transforms, and stop any active game. Do not claim gameplay acceptance. |

Only the two outer teaching assemblies move; no change to jump/deck geometry, bay shell, learning sequence, shot attribution, rewards or other missions.
