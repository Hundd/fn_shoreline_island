# Temporary fixture removal checklist

Current source: Content/fn_shoreline_island_bot_station.verse. Line numbers are approximate and will move with edits.

1. Remove `spawn { rescue_acceptance_fixture() }` near line1156.
2. Remove complete `rescue_acceptance_fixture` body between its TEMPORARY marker and `rescue_valid_configuration` (about1159–1195). It teleports to Dispatch, seeds prerequisite backing states, positions the player at Route/Check after real outcome, and emits phase logs.
3. Remove TEMPORARY AC11 block after wrong-choice log (about1534–1537): seed.TeleportTo[seed_home] when expected4/index8.
4. Remove TEMPORARY AC11 restore block after physical verification REJECT (about1625–1629): seed.TeleportTo[rescue_drop].
5. Remove any subsequent one-shot lifecycle hooks/fixtures if added. Search all Content/*.verse for RESCUE FIXTURE, TEMPORARY, rescue_acceptance_fixture and earlier RESCUE DAMAGE SMOKE. Do not restore the old full source backup: it lacks the movement repair and readability fixes.
6. Preserve positive checked framewise TeleportTo branches, bounded failure diagnostics, owner-only quiet timer, font14 mainboards/font18 rescue-only targets, immutable seed physical checks, and shared badge guard.
7. BuildAll, save all, fresh cook without fixtures, observe natural spawn/lock, verify no seeded/teleported behavior. Capture final validation logs and stop session/read back non-running state before completion.
