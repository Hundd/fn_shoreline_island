# Blockout review - 2026-09-27

Reviewer: assistant using project-local Blockout Reviewer skill. Advice only; no human approval. Recommendation: suitable for discussion, blocked for scene execution until listed surveys and explicit review are complete.

Reviewed `map.yaml`, spec acceptance scenarios, generated HTML/SVG and complete implementation-plan operation list. `check` and reviewer `validate` both exit0. Browser plugin setup returned no available browser; rendered the local HTML with an isolated headless Chrome profile and inspected `evidence/preview-browser.png`. Fixed the initial diagram's overlapping knowledge/arena labels, regenerated, then inspected the final render. This is an offline blockout screenshot, not Unreal evidence.

| Requirement | Finding | Disposition / required evidence |
|---|---|---|
| FR-001 | Nine stable target IDs and five success IDs match fixed source. Shared managers each appear once; no duplicate grant/controller. | Preserve order and native bindings; wrappers need savedActor reconciliation before writes. |
| FR-002 | Existing66x62m platform is much larger than the interactive cluster. Approach after entry center is15.8m; targets can be addressed from one common firing area. | Do not add walls or require a walking tour of the platform. Proposed3m lane needs collision/entry-volume survey. |
| FR-002/008 | Tool flags43m arena-to-reward path. It reaches only the reward envelope and does not prove door/module/rail access. | Accepted diagram limitation for this draft, only because finale/badge are automatic and walking there is optional. No physical gate on floor paths. Reverse west walking return must be tested. |
| FR-003 | Board proposed height falls from11.9m to4m; it is lateral to the targets. Persistent board complements timed HUD. Existing screenshot `solo-short-board-2026-09-27.png` shows why board angle/elevation warrants review. | Reuse exact current messages; check full text from normal player eye height, UI scale and moving camera. No LLM or adaptive hints claimed. |
| FR-004 | Horizontal target distances from(24,46):6-23.41m. Color and destination centers are6m apart; blue-size centers8m. Proposed hit anchor2.2m retains current generous surfaces. | Point spacing is not collision proof. Measure actual trigger/mesh extents, label offsets, pulsed rings, target-floor clearance and outer-third coverage. |
| FR-004/005 | RED moved to(30,40) so its active surface is not directly in front of SMALL BLUE at(38,43) from the common firing point. GREEN/BLUE retire before later choices. | Check all three phase3 rays in cooked game; preserve no-collision core fixes and inactive surface parking. Do not shrink surfaces simply to fit. |
| FR-005 | Active target counts are3,1,3,1,3. No more than three simultaneous choices. LARGE BLUE sweeps5m in Y, centered at(38,51). | Entire visual/ring/label footprint and frozen-core-to-destination shot paths need verification; point marker only shows home. |
| FR-003/005/006 | Learning loop links WHAT -> WHICH ONE -> WHERE to real shots and visible delivery. Wrong shots retain progress, completion stays automatic. | Accepted tradeoff: fixed hints reveal what to choose, and LARGE is the only active modifier. This teaches matching/refinement, not free-form prompt composition. Test first-time understanding and enjoyment. |
| FR-007 | Source resets on replay/round/last enrolled player leaving playspace, not on walking outside the zone. Replay preserves enrollment and DATA. | Explicitly documented, preserve for this layout. Per-player progress, volume-exit reset or late-join hint resync require separately reviewed code work. |
| FR-006/008 | Module remains about46m from the firing point; target6/reactor assembly moves but distant door/module/rail stay fixed. Prior rail screenshot and notes do not establish boarding. | Check delivery/effects from the firing area and HUD completion. Resolve reactor/cable offset survey. Keep rail optional; do not advertise it as proven. |
| FR-009 | Draft geometry/reference checks pass. No scene/code/approval changes. | Offline evidence completes planning work only. Gameplay tasks remain unchecked. |

## Execution blockers

- `design_review`: human decisions on concrete layout, scripted hints, optional rail and retained lifecycle policy.
- `assembly_survey`: full native actor identities, transforms, footprints, collision, effects and shot-path clearance; reconcile target6 with reactor/cable effects.
- `approach_and_replay`: entry-volume extent, current replay access, board clearance,3m lane and reverse west return.

These are not removed by successful YAML validation. Survey results that materially change the layout require regenerated review artifacts and renewed approval. Post-implementation tests remain AC-01 through AC-09; they are not falsely marked as pre-implementation evidence.

## Final offline results

- Generated plan is `draft_requires_explicit_human_approval`, `executable:false`,3 blockers; ordered inspect/reconcile/bind/verify intents reviewed.
- Current review digest: `6f89a309cd1812dbc6f4c88332ccd7f7654aa755ba8b21b95b09032aed2f153e`.
- 32 baseline files (top-level Verse plus playable map) hash-identical. No Unreal mutation calls issued.
- Final session readback: Disconnected; game Unconnected. No running playtest to stop; UEFN left open.
- No `approval.yaml`; no `--ready` attempted because this is an explicitly unapproved planning phase.
