# AI Error Lab scanner and overshoot — 2026-09-23

Scope: AC-041/T-038, implementation-plan sections 36–37. This is source
and build evidence, not runtime acceptance.

Challenge 1's board and hints now identify the scanner at tile 3 as the
task destination. The single bracketed wrong Move command and its correction
remain unchanged. Challenge 2's saved AI-plan example now starts at Repeat
4, while the expected destination remains Station 3. `restart` selects the
existing fixture choice that evaluates to four eastward steps, so an
uncorrected run reaches tile 4; the existing edit cycle still includes the
single correct Repeat 3 choice. The result board names the scanner/Station 3
target and shows Pix's actual tile after each step. The marker mover, two
hint levels, safe retry, third classification puzzle, and reward guard were
not edited.

UEFN `VerseToolset.BuildAll` returned zero diagnostics. The label inventory
was updated for seven changed localized messages. No actor asset or device
reference changed. Project validation, memory calculation, and an in-client
wrong/correct/replay and two-player check remain deferred at the owner's
request. In particular, the tile-4 overshoot animation needs an in-client
visibility and clearance check.

## Live tile-3 endpoint follow-up

The editor has a saved tile-3 Billboard at the marker endpoint in each of
the four Error Lab stations. All four previously read `TILE 3`; they now read
`SCANNER` after individual UEFN text edits and actor saves. Their locations,
rotations, bindings, and text sizes were not changed. The label inventory's
four static-sign rows were updated. This makes the planned destination
physically named without adding a device or changing marker movement.
In-client sign readability and sightline remain unverified.
