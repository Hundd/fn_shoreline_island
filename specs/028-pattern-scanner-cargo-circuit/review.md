# Blockout review — 2026-09-28

Reviewed as planner and blockout-reviewer roles; no parallel agents. Scope: feature 028 only. Status: ready for human design review, not implemented or approved.

## Evidence and checks

- `python tools/map_workflow.py check specs/028-pattern-scanner-cargo-circuit/map.yaml`: exit 0, execution blockers 0, explicit approval required. Final review digest: `27403d71c2af08a71ab4cef3c596abc95479850f3de6617ad4dc9b0701f7ecdb`.
- `python tools/map_workflow.py validate specs/028-pattern-scanner-cargo-circuit/map.yaml`: exit 0.
- Read generated implementation.yaml, preview.svg/HTML structure and stage/marker tables. Visually inspected evidence/blockout-review.png, an offline raster of the generated SVG's geometry and text. Browser connection was unavailable (browser list empty); this is not a browser screenshot. The raster draws dashed lines solid and omits arrowheads; authoritative review artifacts remain generated/preview.html and preview.svg.
- Corrected an arrival marker/heading overlap and regenerated the bundle. The arrival marker is local (4.5,5,0), just beyond the walkway; the inventory annotation is (5,8,1) and Start/lesson annotation is (6,11,2). These are diagram annotations, not spawn/granter actor instructions.

## Requirement-linked findings

| Requirements | Finding and disposition |
|---|---|
| FR-01/10 | Measured floor extent is 88 × 25 m. All zones and targets fit. 3 m route stays open with no progression-dependent door. Approximate 76 m full-run travel is accepted because each 20–24 m section contains an activity; return teleport avoids a forced walk back. Physical floor seams and the shared promenade still need cooked traversal. |
| FR-03/10 | Three moving targets have centers 5 m apart and matched 3 m sweeps. Even opposite endpoint positions leave 2 m center separation for 1.2 m surfaces. Proposed fire distances are comfortable; Freeze removes mandatory tracking skill. Actual surface orientation, muzzle trace and cue tracking need AC-02. |
| FR-04/10 | Six diagnosis targets at 2 m spacing allow 0.8 m between minimum 1.2 m surfaces. Replacement targets sit in front and MUST remain hidden and parked during diagnosis; otherwise they can block shots. Plan makes this phase change explicit. |
| FR-05 | Shuttle stop 2 remains a visible non-shootable demonstration stop. Active answer beacons are only 1/3/4, with 1 correct. Persistent direction/trail makes the rule recoverable without timing or memorization. Motion and path rendering are specified in plan.md because schema v1 does not draw animation. |
| FR-02..05 | Four meaningful decisions teach prediction, exception diagnosis, correction and testing. Wrong choices reveal the rule instead of damaging the player. Knowledge stays next to action; there is no separate reading detour. Fixed puzzles make initial play intuitive; replay variation is outside this revision. |
| FR-06..08 | Shared team enrollment deliberately replaces independent stations. Late entrants spectate until next run. This is a design choice for explicit review, not an inherited runtime capability. Enrollment, abandonment and cooperative reward tests remain mandatory. |
| FR-07/08 | One existing loop progress/tracker identity preserves journal/finale links. New adapter must call its ordered guard and avoid raw tracker writes. Wrong/replayed/duplicate shots cannot issue completion. Round cancellation and last-enrollee departure must cancel MoveTo before restoring transforms. |
| FR-09 | Six exact native mesh candidates are documented; catalog search is not cook qualification. Edge dressing, entry/dispatch silhouette, and minimum 75% Fortnite prop-instance target make the visual requirement testable. Asset eligibility/pivots and target-obscuring collision remain preflight/cooked checks. |
| FR-01/09 | Overlap search identified field-note actors, shared promenade and a shed assembly extending beyond the tile rectangle. Removal must use ownership/reference reconciliation, not prefix or spatial bulk deletion. Shared dependencies are preserved. |

## Limits and handoff

No unresolved design blocker was found by the offline check/review. No collision, weapon hit, visual-finish, multiplayer or learning-quality acceptance is claimed. The proposed configurable controller still needs implementation and verification; the existing data_target and synchronized MoveTo routines are its basis. Native assets require eligibility checks before use. Material substitutions affecting gameplay/layout require renewed review.

No approval.yaml has been created. Human approval must identify this concrete design, after which the real evidence and current digest can be recorded and readiness checked. Then follow $uefn-map-implementation.

Final native SessionToolset inspection returned game state `Unconnected` and session status `Disconnected`. No active playtest game required stopping. UEFN was left open. Only planning documents/artifacts were written; no scene, asset or Verse mutation occurred.

## Legend update

Added an embedded two-column numbered legend to the SVG and HTML map through the shared renderer. All 21 markers now have visible descriptions, with route and zone notation explained beside the map. Regenerated feature 028 only; other feature bundles were not rewritten. Offline check passed with zero blockers. Existing SVG/escaping and approval/artifact-integrity tests both passed. Updated raster visually inspected for wrapping and spacing. Game state rechecked: Unconnected.
