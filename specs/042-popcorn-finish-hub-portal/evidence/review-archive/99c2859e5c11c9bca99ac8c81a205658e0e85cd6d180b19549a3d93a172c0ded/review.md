# Feature 042 review — ready for human review

Proposal: one native walk-in Hub rift on spare space of the existing finish deck. Primary review: [finish-deck preview](generated/portal-review.html), [to-scale PNG](generated/portal-review.png), [plan](plan.md). Full generated overview intentionally includes the distant existing Hub destination; its envelope is an annotation, never an instruction to build a corridor or floor. Implementation must use the explicit delta in plan.md, preserving all course actors.

## Findings

- R01/R06: Native deck bounds, final board/Return and destination transforms, V2 teleporter catalogue/settings and capsule dimensions are captured in evidence. Proposed portal pivot (-4900,-17320,2600) cm, rotation zero, scale one lies on the measured 4 × 8 m finish deck. Default horizontal overlap leaves 1.16 m to the nearest deck edge; no new collision/deck/board. Final ring is 5.2 m away; deck-centre approach is 2.4 m. The PNG was rendered and visually inspected: one portal, retained ring/board/button, legible guidance and clear measured/proposed distinction. Symbols represent interaction centres/overlap, not measured rendered-art bounds.
- R02–R04: Only successful final commit followed by the existing reward call makes the portal pending. Keep disabled if owner is within 1 m horizontally; the existing 0.1 s sync_card monitor rechecks owner/token/round/finished and arms only after stepping clear. A fresh walk-in closes gate synchronously and runs existing release-cleanup then Hub Teleport. No forced completion transfer, native group teleport, duplicate reward or extra thread. SDK/source support is evidence, not a runtime entry test.
- R05: Exact 136-character card retains approved lesson/recipe and changes only final action to “Walk into the glowing HUB portal, or use Return.” Existing Return controls and Replay remain; no learning or course redesign.
- R07: Native calls were read-only and editor ownership was released to Supervisor with no call in flight. Supervisor separately captured Unconnected state. No gameplay/source/asset mutation, approval record or testing occurred.

## Offline gate and advisories

map_workflow check succeeds with zero execution blockers; map_gate passes with zero violations and seven advisories (evidence/map-check.txt and map-gate.txt). The initial alias serialization error was corrected with no-alias YAML generation before these final successful captures.

Accepted advisories: 192.8 m segment/195.2 m route arithmetic includes an instantaneous portal connection; actual added walking is 2.4 m from finish centre, so no long physical corridor is intended. Ten course support inventory groups describe existing devices rather than ten new simultaneous controls. Single-target stages and absent knowledge_room are inherited working PopBridge teaching/reuse/finale; existing rejection/recovery and stage-specific 041 lessons remain unchanged. No unused-target violation is concealed: grouped branch active targets 4–6 preserve the real route inventory.

Manual owner acceptance A01–A06 remains unrun, including physical clearance/readability, EnterEvent with no native groups, native rift appearance while disabled, standing-inside completion, cleanup/replay/round/foreign entry and Hub arrival. If native disabled-rift visuals do not hide as intended, return that concrete presentation deviation to planning rather than claim a pass. Current supported enable/disable/input setup is sufficient to propose implementation; it does not establish rendered visibility or cooked quality.

## Approval boundary

Current manifest review digest: `99c2859e5c11c9bca99ac8c81a205658e0e85cd6d180b19549a3d93a172c0ded`. The gate's own review_digest is a separate map-input fingerprint; use generated/review-manifest.json for actual approval. No approval.yaml exists. Explicit human approval of this concrete new portal is the only remaining pre-implementation prerequisite. Approval hands the same scope to uefn-map-implementation, retaining the owner's manual-testing constraint. Prior 041 approval is untouched.
