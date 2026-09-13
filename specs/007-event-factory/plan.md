# Event Factory Implementation Plan

- Status: In progress; four stations implemented, core challenges and transfers passed solo
- Specification: [spec.md](spec.md)

## Approach

Use two distinct labeled event buttons and visible chute/lamp props on owned stations. Store explicit event-to-response mappings per player; log the last event visibly rather than relying on timing or sound. Keep the factory completable with audio muted and without simultaneous inputs.

## Delivery and verification

## Authored fixtures and implementation choices

- Challenge 1: Bell initially connects to Light lamp. Link Bell toggles between
  Light lamp and Open chute. Ring Bell to demonstrate the selected response;
  only Open chute solves the challenge. Lever and Show event explain their
  later use without affecting this challenge.
- Challenge 2: three authored demonstrations, in order: Bell → Light lamp,
  Lever → Open chute, Bell → Open chute. Show event repeats the current
  demonstration. Bell/Lever buttons select the event that caused the response.
  The recent-event board explicitly shows event and response; this is a lesson
  in tracing events, not a memory or sound test. A wrong answer repeats the same
  demonstration safely; a correct answer advances to the next. All three
  correct identifications solve the challenge. Mapping edits are inactive here.
- Challenge 3: initially reversed connections Bell → Light lamp and Lever →
  Open chute. Link Bell and Link Lever independently toggle their response.
  Require Bell → Open chute and Lever → Light lamp, with each event actually
  triggered successfully. Editing either mapping clears both current test flags.
  Each trigger runs only its bound response; no automatic second event occurs.

Use ten controls: Claim, Link Bell, Link Lever, Bell, Lever, Show event, Help,
Next, Replay and Hub. Each input is instantaneous and repeatable; no timing
test or simultaneous press is required. Show the connections, recent event,
response and final-test flags on text boards. A chute panel rises 250 units and
a parcel travels 480 units when Open chute responds. A labeled lamp rises 120
units and its status reads ON for Light lamp; chute and parcel stay at rest.
Reset visual response props before each trigger, with a brief labeled idle
state, so repeated events remain observable. Animate with cancellation tokens.

Store per-player mappings, demonstration index, test flags, completed flags and
badge in one shared progress device. Four stations own their props and controls.
Release on departure, respawn or disconnect; cancel suspended motion. Preserve
completed work and current authored challenge in the same round. New rounds
reset all personal state. Replay resets only the current attempt and its hints.
Award Event exactly once with tracker SetValue(1); journal later badge index 3.

First station center (-3200,-10200,2450), south of Debug Workshop. Its floor
spans X=-4600..-1800 and Y=-11600..-7800, top Z=2400, meeting Debug's south edge.
Place controls within the 1400-unit release radius. Start with this station,
run each response and all three identification demonstrations, then extend to
four stations with 2800-unit X spacing. Record actual native bindings, builds
and runtime results; do not infer acceptance from source inspection.

Four-station layout revision after the first solo test: move the goal board
200 units toward positive X so the minimap covers less text at Link Bell.
Move the chute and parcel 300 units toward positive X and 400 units north,
keeping their animation offsets unchanged, to put the raised chute within the
central viewing area. Move their labels with the response props. Apply the same
relative layout to all four stations and retest the full response sightline.

Implement this zone after the preceding zone's graybox and gameplay review.
Use the existing map, named routes, and one responsibility per Verse class.
Save before and after editor changes. Verify device references by readback.
Run every acceptance scenario in a launched session, including wrong inputs,
rapid presses, hints, repeat completion, departure during execution, respawn,
join-in-progress, and round restart. Recheck hub spawn and the existing garden.
Record actual multiplayer evidence separately from code inspection. Run project
validation and memory calculation; capture the visible zone and completion.
