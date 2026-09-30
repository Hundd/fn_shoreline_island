# Blockout review - revision 2 history, revision 3 placement, revision 4 correction

## Revision 4: player-requested rail controls and completed state

The player supplied `evidence/player-review-controls-and-finish-2026-09-30.png` from cooked solo play and said the wallward layout looks much better. The remaining requests were explicit: put the two floating controls on the rail and hide the circles after the game ends until restart. The existing first-bay rail is measured, as are the two existing switch meshes. The revised map moves only Replay/Return to local (103.8,13.5,1.36) and (106.6,13.5,1.36), with their lower mesh edges resting at the rail top; no target, board, route, new device or shared structural component changes. The controller will deactivate targets 0.85 seconds after final release, preserving the hit cue and result board, and its existing reset/activate path will restore them on Replay or a new run.

`python tools/map_workflow.py check specs/030-confidence-reactor-rescue/map.yaml` returned zero design execution blockers and generated review digest `f458b15cd8453e5f23215a4f541f89815c05dde471a5c506b56767e76bba9fa2`. Inspected the rendered `evidence/preview-review-r4.png` and `generated/implementation.yaml`: both controls remain within the first bay beside the target row, outside the firing position and 2.8 m apart. The preview is top-down and cannot show switch seating or completed-state visibility; cooked verification is required. This is a localized adjustment to the user's identified controls and final-state display, directly authorized by their screenshot message, not an unrequested new layout or mechanic.

The user request is recorded as the revision-4 approval evidence with the current digest. Run `plan --ready` before scene or Verse mutation. Verify switch mount height/interaction reach and finished/replayed visibility in a cooked solo session. The player's screenshot is positive evidence for improved wallward layout, but it does not prove those new corrections.

---

## Revision 3: yellow-strip firing layout, approved and placed

The player's new cooked screenshot (`evidence/player-review-layout-2026-09-30.png`) demonstrates that the B COOL label intersects the evidence-board text. Live read-only measurements put the current main board at world (-3000,-2300,2700) and the center label at (-3000,-2080,2610), only 2.2 m in front of it. The screenshot also shows a beige/yellow floor strip behind the player-facing row. Revision 3 moves that row deeper into the first-floor bay so the player can stand on the strip, with the evidence board raised behind the targets and doubled in size. The solo lesson, fixed target order, and badge behavior stay unchanged.

`python tools/map_workflow.py check specs/030-confidence-reactor-rescue/map.yaml` generated the [top-down preview](generated/preview.html) and [implementation plan](generated/implementation.yaml) with zero execution blockers and review digest `0d0f9e3e88768473c08571a9d8b3d7baa3144d09db27a325a8650b12a136fc56`. The actual generated SVG was rasterized to `evidence/preview-review-r3.png` and inspected: it shows the 3 m spaced row behind an 8 m shot line, board behind the row, core to the right, and both controls to the side. The full 112 m site makes the active bay small in the preview; the legend and map markers give exact positions. The preview is an overhead blockout and does not prove text legibility, collision, or the wall's visible material extent. A local browser was unavailable; SVG rasterization succeeded despite optional font-cache warnings.

| Requirements | Review finding and verification |
|---|---|
| S-01/02 | New firing point local (100,20,0) is approximately 11 m from the hub annotation and 8 m from the row. The route remains open and 3 m wide. The yellow-strip placement is supported by the user screenshot but needs a cooked player-eye check. |
| S-02/08 | Three 1.5 m target faces remain fixed at X=97/100/103, local Y=12. Complete target assemblies, not just ring props, must move together. Label-facing logic remains dynamic for either side of the circles. |
| S-08 | Board content center local (100,4,7.2), with proposed pivot Z=2960 cm and 2x scale, sits 8 m behind the row and roughly 40 cm above the label's projected top from an estimated standing eye. This is geometry-based clearance only; crouched and standing cooked views must confirm all lines. |
| S-07/08 | Core/support/finish FX, three lights, Replay and Return move toward the wall with their bindings. No extra targets, control, floor or enclosure is proposed. Confirm wall and floor collision before saving. |
| S-09 | AC-10 and other open solo scenarios remain unpassed until a cooked run records readable evidence, target hits, routes, effects and reset/badge behavior. |

The user approved the revision-3 preview with `go ahead`. `approval.yaml` now references this review digest, `plan --ready` passed, and the existing actors were moved and saved. See `evidence/revision-3-implementation-2026-09-30.md`. The cooked player-eye check remains open; the editor viewport is not gameplay acceptance.

Read-only live editor preflight is recorded in `evidence/revision-3-relocation-preflight.json`: 23 exact actor paths and current full transforms, with separate proposed transforms. It includes all 12 target-assembly actors, the board, core/support, three effects, three lights and both controls. The proposed transforms are review data, not applied editor state. Re-read identities and bindings before any serialized mutation.

Verse runtime placement was also inspected. Each `data_target` captures its ring and hit-surface homes from the placed actors, then positions the ring and label from the hit surface on each active pulse. Confidence's `stationary_positive_y` logic puts the label 20 cm toward the player's side, rotating it when the player walks behind the row. Hit effects teleport to the struck surface. Thus the proposed move must include each placed hit surface and ring; moving only the visible circles or labels would be undone in play. The current controller's bay bounds already include the wallward layout, so this revision does not require a new Verse behavior or bounds edit. The label's runtime Z offset is -12 cm from the hit surface, which gives at least as much planned board clearance as the conservative editor-label geometry above; cooked verification is still required.

---

Disposition: documentation draft ready for human design review, not approved or implemented. Previous revision-1 review is archived. User requested updated docs; no gameplay changes were made.

## Inspection and findings

Reviewed previous spec/plan/map/palette, historical editor inventory, current station/progress source and the 028 solo implementation/user playtest report. Historical measurements are not fresh live observations. Reuse corridor/shooting_gallery contracts and the existing shooting/solo primitives; no new pattern or generic configurable engine is claimed.

| Requirements | Finding | Revision-2 resolution / verification |
|---|---|---|
| S-01/07 | Revision 1 had about 97 m travel, 12 targets, 20 buttons and moving machinery. | One 9 m approach; CHECK/COOL/RELEASE in fixed positions, two ordinary buttons and one static core. |
| S-03 | Old percentage arithmetic and a scripted cool animation could teach false certainty. | Independent HOT evidence contradicts one authored confident claim; cooling invalidates readings; fresh CHECK is mandatory before release. No automatic confidence gain. |
| S-03/04 | Repeating a measurement is legitimate even when it does not progress the lesson. | CHECK confirms current readings without extra milestone; feedback explains the next useful action without calling measurement inherently wrong. |
| S-06 | Four actions but existing manager has three sections. | Milestones map to contradiction, fresh verification, release. Cooling alone receives no evidence milestone; final guarded complete(player) commit preserves identity. |
| S-01/08 | Last energy floor has zero width and neighboring debug floor supplies support. | Preserve real support; reconfirm/bridge only 48 cm seam. First-floor gameplay avoids the seam, but shared traversal still needs collision checks. |
| S-02/08 | This bay faces +Y, opposite 028. | Inspect ring/label front axis; adapt scoped forward offset rather than blindly reusing stationary_y_facing=-Y behavior. |
| S-04/05 | Delayed feedback and held automatic fire can leak into the next decision. | Synchronous scoring lock, generation cancellation, quiet-hit observation and persistent result until release; cooked edge-case testing remains required. |
| S-05/06 | Team enrollment and button banks obscure first action. | Single-player auto-ready, automatic hints, nearby Replay/Return. No team, spectator or global matchmaking edits. |
| S-07/08 | Native prop percentage encourages unnecessary objects and catalog entries may be restricted. | Functional palette only; exact eligible variants/bounds/collision are preflight gates. Bounded equivalent substitution cannot change lesson or category. |
| S-08/09 | Offline diagrams cannot prove readable icons, collision or fun. | Cooked forward screenshots, real rifle face-edge shots and a first-time solo learner's explanation/enjoyment are required. Keep untested cases visible. |

## Generated preview review

Ran `map_workflow.py check` for this revision: valid draft, zero design execution blockers, explicit approval still required. Inspected generated implementation entries: two zones, one always-open 3 m route, three target assemblies, two ordinary controls, correct ordered target IDs and retained progress identity. Full 112 m site envelope remains to protect support space; the sparse left side of the diagram is intentionally unused floor, not a missing gameplay area or deletion instruction.

Rasterized the actual generated SVG using the existing Sharp installation and visually inspected `evidence/preview-review-r2.png`. The diagram shows the 9 m approach, fixed row, adjacent display and controls outside the approach strip. Board and reward annotations initially shared XY; moved the reward annotation to the first progress light so both remain visible. Heights are not drawn; the board/label/readings need eye-level cooked review. PNG is an offline blockout, not an editor or gameplay screenshot. Optional font-cache write warnings did not prevent rendering; no HTML browser rendering is claimed.

## Approval and limits

No unresolved design choice is delegated to editor automation. Preflight must reconfirm live ownership, supports, qualified assets, full transforms and binding counts. A missing same-role eligible asset, unsafe layout or changed learning sequence returns to planning. The existing station still needs the scoped refactor in plan.md; zero draft blockers is not evidence that runtime behavior already exists.

No approval.yaml is authored. No Verse build, UEFN validation/cook or gameplay acceptance is claimed for this revision. Review `generated/preview.html`, `generated/implementation.yaml`, spec.md and plan.md together. Implementation is a separate step after explicit approval; this documentation-only request ends at the prepared review bundle.
