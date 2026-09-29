# Blockout review - revision 2

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
