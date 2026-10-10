# Grounded entry repair plan, revision 3

Status: concrete start-only proposal; explicit human approval is pending. The old row redesign is withdrawn and archived. No map or Verse changes have been made.

## Demonstrated fault and smallest correction

QA twice reproduced stationary jump-only entry near Replay: optional journal/intro appeared while airborne and cleared on landing. Native generated overlap mesh `VolumeDevice_Box` has localZ0..384, component relativeLocation0 and relativeScale `[6,12,3]`. With actorZ2600, actual lowerZ2600/upperZ3752 is190cm above floor top2410. This corroborates the cooked enrollment failure; generic editor actor bounds are not used as volume proof.

Lower only the existing entry actor by240cm, placing its lower bound50cm below the floor. Proposed upper bound3512cm remains11.02m above the floor. This preserves the existing footprint and vertical size and adds ground overlap without a lifecycle refactor.

| Field | Before | Proposed |
|---|---|---|
| World location cm | `[7500,-5200,2600]` | `[7500,-5200,2360]` |
| Rotation pitch/yaw/roll | `[0,0,0]` | `[0,0,0]` |
| Scale XYZ | `[1,1,1]` | `[1,1,1]` |
| Width/depth/height tiles | `[6,12,3]` | `[6,12,3]` |

Actor: `/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.Device_MutatorVolume_V2_C_UAID_E89C2592D1B5860503_1590440721` (`prompt_blaster_entry_zone`). Exact full transform and unchanged settings are recorded in `evidence/proposed-entry-delta.json`. Preserve gameplay-only, any-team/class and weapon-fire permission. Preserve all Verse, subscriptions, bindings and current `on_exit -> on_leave` last-participant reset behavior.

## Existing scene and scope limits

Origin `[6000,-8500,2410]`cm; localXYZ meters. Floor66x62m, replay `[16,34,0.9]`m and all nine measured target anchors remain unchanged. Diagram zones are inherited conceptual envelopes, not new walls or native volume boundaries. The entry marker annotates grounded arrival; actual proposed volume bottom is0.5m below the diagram's floor origin. Reward remains automatic without walking to the distant finale; west return is always available and rail optional.

No source changes, intro retiming, readiness framework, full-floor volume, target-row move or decoration retirement. The original scene supports completion: current QA completed the sequence and badge. Visibility remains a separate follow-up because visible rings can overlap from near Replay and decorative core bounds remain offset from actual hit anchors. These findings justify further viewpoint-specific diagnosis, not an invented target rearrangement.

## Implementation after approval

1. Record the actual human approval against the new manifest and pass `map_workflow.py plan map.yaml --ready`.
2. Discover native schema, checkpoint and re-read current full transform/settings. Stop on mismatched preconditions or ambiguous mutation; do not relocate another actor.
3. Apply the single full-transform operation, read back transform and all preserved settings/bindings, save affected actor. Verse source remains unchanged.
4. Validate/cook and independently run AC-01..04, including ten trials, crouch/jump/landing, departure, respawn, full sequence/wrong retry/rewards/Replay/return. Post-fix grounded tests are required; the proposal is not acceptance proof.
5. Stop game/session and verify nonrunning; leave editor open. Record deviations and failures, and return any material new design to review.

Initial desktop-capture failure was recovered during current diagnosis; it is historical, not a present blocker. Detailed runtime/component/shutdown evidence belongs to `evidence/diagnostic-qa.md`.
