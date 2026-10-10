# Review: grounded entry repair, revision 3

Status: ready for human review; not approved or implemented. Earlier row redesign remains withdrawn and archived.

## Evidence and exact scope

QA twice reproduced jump-only enrollment and reset on landing. Native generated `VolumeDevice_Box` overlap geometry localZ0..384 with relativeLocation0 and relativeScale6/12/3 confirms the present world volume lower2600/upper3752 versus floor top2410. This is a demonstrated raised enrollment volume, not an inference from generic editor bounds. Current QA also completed grounded Replay and the five-hit sequence/badge in one run, preserving the case for repairing the existing mission.

The entire proposed scene delta is one existing actor locationZ:2600→2360cm, lowering the bottom240cm to50cm beneath the floor. Native dimensions, XY, rotation, scale, filters, weapon permission, source, bindings and exit/reset behavior remain unchanged. There are no target moves, source edits or decoration retirements. See `evidence/proposed-entry-delta.json` and plan.md.

Post-fix grounded enrollment is acceptance to prove after implementation, not something this planning review claims already works. An unexpected readback or necessary material change returns to review.

## Offline validation and visual review

`map_workflow.py check` passed generation/schema, with **zero execution blockers**. `map_gate.py gate` passed with **zero violations, zero blockers and three advisories**. Approval remains absent; passing the draft does not authorize mutation. Current manifest review_digest: `bacc213826fadff58e69677e0176359ff23bfd7870addbf81ccb152a8088647e`. The gate's map-only digest is different and must not be substituted for approval.

Inspected `generated/implementation.yaml` and the rendered `evidence/preview-review.png`. The preview retains the compact target layout and existing Replay marker; only the entry annotation identifies the2.4m lowering. Z is tabulated because the view is top-down. Zone envelopes are inherited conceptual annotations, not walls/native volume footprint. The generated generic reconciliation inventory is constrained by the single exact approved operation; it is not permission to move every marker or apply stale026 proposals. Existing target/device settings explicitly preserve their positions.

### Accepted existing-layout advisories

- WALK_SEGMENT_LONG: inherited arena-to-finale path is43m. Reward is automatic where the player stands; this line is optional physical travel, not a required reward walk. West return remains ungated.
- FLOW_NO_WRONG_CHOICE, detail/acquire: each intentionally has a single active target in the fixed lesson. Preserve both. Wrong-choice retry remains in color, matching-core and destination stages; no filler targets.

## Visibility and education follow-up

Current QA sees all initial rings and completed the mission, but observed visible ring/core separation, small high labels and strong projected overlap between RED and SMALL BLUE near Replay. The large-blue ring remained reachable. These are ambiguous presentation findings, not proof of a hidden blocking actor. Supported camera drags also fire, limiting per-shot attribution in parts of the run; direct BLUE ring selection clearly advanced. Full standing/crouched sightlines, full motion sweep, alternate active-stage positions and outer-third shots remain incomplete.

No specific visibility change is part of this approval. FR-002/D01 and FR-005/D02 remain explicit unfinished follow-up work: diagnose ordinary shooting viewpoints and exact cue/hit correspondence, then prepare a separate evidence-backed repair and collect real learning/fun feedback. The start-only revision does not claim to solve the owner's whole request.

Solo scope follows the existing waiver; generated boilerplate multiplayer checks do not add a new gate. Independent post-fix AC-01..04 validation/cook and solo tests are required. Current QA stopped game/session and confirmed Unconnected/Disconnected with UEFN open. No gameplay or approval mutations were performed during planning.
