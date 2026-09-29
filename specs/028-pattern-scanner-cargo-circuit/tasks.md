# Tasks

- [x] T01 (FR-01/02/07): inspect live dock dimensions, current Verse, progress dependencies, latest weapon evidence and Fortnite asset catalog. Evidence: editor-inventory.json and plan.md.
- [x] T02 (FR-01..10): generate/review offline bundle and record command results and findings in review.md. Check and validate passed; offline SVG raster visually inspected.
- [x] T03 (FR-01..10): human approval recorded in approval.yaml for the legend-inclusive digest; readiness passed. Planning checkpoint committed as 0bb9f25; implementation skill and goal started.
- [ ] T04 (FR-01/07/08): checkpoint; reconcile exact removal/reuse identities and shared references; validate scoped controller adaptation before retiring legacy stations.
- [ ] T05 (FR-02/03/04/05/08): implement configurable linear stages, enrollment, motion, attributed shooting, hints and generation cancellation; build Verse and record diagnostics.
- [ ] T06 (FR-01/09/10): qualify asset palette, build native depot and 15 target assemblies, verify all counts/transforms/properties and save.
- [ ] T07 (FR-06/07): bind shared progress, update copy, verify journal/prerequisite and badge guard.
- [ ] T08 (FR-01..05/08/10): validate/cook and record solo AC-01..04,06..10, including reset during each animation and visual captures.
- [ ] T09 (FR-06..08): run two/four-player AC-05..07 with late join, simultaneous fire, departure and round reset.
- [ ] T10 (FR-09/10): record visual asset tally, clear sightlines, muted-audio/symbol readability, and first-run timing/learning feedback.
- [ ] T11 (FR-10): stop active game and verify shutdown before final handoff. Planning shutdown is documented in review.md; implementation shutdown remains required.

Only offline planning tasks may close from offline evidence. No gameplay task closes from successful MCP calls alone.

Implementation progress: T05 source authored and compiled with no diagnostics; see evidence/controller-build.json. It is not runtime validated, so T05 remains unchecked. A disabled, unbound controller and two sample native props were placed. Sample WildEstate blueprint references failed UEFN validation (evidence/asset-qualification-failure.txt); replace both with eligible Fortnite equivalents before continuing. Legacy station actors remain intact. Awaiting dismissal of the validation dialog because editor MCP queries stalled and Computer Use's native pipe is unavailable.

2026-09-29: Removed both rejected sample actors through native SceneTools; both returned true. Saved assets and read back zero cargo_circuit_ actors. Their untracked external actor files are no longer present in git status. The disabled controller remains. Fresh Launch Session passed local validation and reached cooking; see subsequent validation evidence for final outcome. Eligible replacement selection and full scene implementation remain pending.
