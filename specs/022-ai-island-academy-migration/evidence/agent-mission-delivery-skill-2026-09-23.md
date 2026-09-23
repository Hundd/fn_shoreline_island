# Agent Mission reusable delivery skill — source/editor evidence

Requirement: AC-031 / T-028. This records source-level implementation, not gameplay acceptance.

- `bot_player_progress` now stores a per-player `delivery_skill_complete` flag. Attempt reset and round state reset clear it. Agent Mission edits that invalidate the route clear it; release or claim at another of the four stations does not substitute shared state.
- Once the destination scan and Dock route are complete, the reused Next control offers `Run DeliverPackage skill` instead of Verify. The Apple/Car tests are optional practice, not a gate. The Help control explains the skill action. The existing Next Button and Billboard bindings remain unchanged.
- The skill calls the same delivery fixture used in the first-stage puzzle with a fixed, valid `Pickup / Repeat Move ×3 / Drop` plan. It shows the Medical prop and animates it alongside the same robot on the existing delivery path while the execution board names each action. A cancellation token prevents a released station or new round from continuing the sequence. The skill sets its attempt flag but does not call `complete_stage` or change the badge Tracker.
- Only after that animation completes does Next become `Verify delivery`. The final gate also checks `delivery_skill_complete` before calling the existing one-time `complete_stage` reward path. The Verify prompt names Animal Research Station.
- `ValkyrieToolset.VerseToolset.BuildAll` returned `{"returnValue":[]}` (zero diagnostics) after these source changes. The saved text inventory includes the new messages.

## Delivered-scene follow-up

A source audit found that `show_stage_props(2)` hid the Medical crate and
showed the optional Apple/Car parcel immediately after the skill, even while
the Verify prompt asked whether the Medical crate was at Animal Research
Station. The same refresh path ran on reclaim, making the confirmation scene
misleading. The stage-2 refresh now restores the Medical crate to its delivered
cell-3 pose, reveals the Animal Research Station marker, and hides the
optional parcel whenever `delivery_skill_complete` is true. Run's prompt
becomes `Delivery complete: press Verify`, and a late Run only repeats that
instruction instead of resetting the delivered visual. Replay, round reset,
and route-invalidating edits still clear the flag through their existing
paths. Verse `BuildAll` returned zero diagnostics after this change. The
label inventory includes the new prompt declaration. This is source/build
evidence, not an in-client visual confirmation.

## Four-station endpoint geometry follow-up

Live UEFN transform reads found the same layout at all four stations: each
Research Station marker is 720 cm down the robot's negative-X path and
80 cm behind its Y coordinate, while the Medical crate starts 100 cm ahead
of that Y coordinate. The old delivered pose moved the crate 300 cm ahead,
leaving it about 380 cm from the marker in Y despite reaching cell 3 in X.
The delivered pose now keeps the crate in its original lane, 100 cm ahead
of the robot. This puts it 180 cm from the marker in Y at every station and
keeps the existing robot movement and marker actors unchanged. The
post-skill/reclaim refresh uses that same `seed_pose` calculation. Verse
`BuildAll` returned zero diagnostics. The final sightline and drop appearance
still need an in-client check.

## Late-join animation guard

`PlayerAddedEvent` launches a delayed `refresh_after_join` at every Agent
Mission station. A source read showed that the old callback always called
`refresh_labels` and `show_board`; in stage 2 those calls hide the Medical
crate until the skill is complete. If a second player joined during an
owner's `DeliverPackage` animation, this could make the remaining frames
invisible. The callback now returns while `running` is true. Each execution
path already refreshes its own board when it finishes, and release/round
reset retain their existing cleanup. UEFN Verse `BuildAll` returned zero
diagnostics. A two-player join-during-skill check remains necessary before
AC-031 can be accepted.

No Play-in-Client, project validation, memory calculation, or multiplayer acceptance is claimed here; the owner asked to skip verification. In-client checks still need to confirm the animation remains visible, the skill/Verify control transition, wrong-route retry, replay reset, cancellation, and one-time badge behavior. Keep T-028 open until that evidence exists.
