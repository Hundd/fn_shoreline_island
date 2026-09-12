# Build-a-Bot Implementation Plan

- Status: Approved
- Specification: [spec.md](spec.md)

## Approach

Implement only after the individual concept zones have passed their gameplay checks. Use a focused capstone device with authored command slots, per-player stage state, and owned preview props. Define concrete starting states, command choices, and success predicates for each mission stage before coding. Celebrate personal completion with targeted messaging and a station animation, avoiding a global progression change.

## Delivery and verification

Implement this zone after the preceding zone's graybox and gameplay review.
Use the existing map, named routes, and one responsibility per Verse class.
Save before and after editor changes. Verify device references by readback.
Run every acceptance scenario in a launched session, including wrong inputs,
rapid presses, hints, repeat completion, departure during execution, respawn,
join-in-progress, and round restart. Recheck hub spawn and the existing garden.
Record actual multiplayer evidence separately from code inspection. Run project
validation and memory calculation; capture the visible zone and completion.
