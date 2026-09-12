# Signal Lighthouse Implementation Plan

- Status: Approved
- Specification: [spec.md](spec.md)

## Approach

Build a coastal lighthouse landmark, three labeled destination docks, and an owned preview station with a movable boat and cargo sign. Separate cargo classification from presentation. Use authored queues and rule choices, agent-targeted feedback, and cancellation-safe execution. Define exact queues and distractor mappings before coding; retain them in this plan.

## Delivery and verification

Implement this zone after the preceding zone's graybox and gameplay review.
Use the existing map, named routes, and one responsibility per Verse class.
Save before and after editor changes. Verify device references by readback.
Run every acceptance scenario in a launched session, including wrong inputs,
rapid presses, hints, repeat completion, departure during execution, respawn,
join-in-progress, and round restart. Recheck hub spawn and the existing garden.
Record actual multiplayer evidence separately from code inspection. Run project
validation and memory calculation; capture the visible zone and completion.
