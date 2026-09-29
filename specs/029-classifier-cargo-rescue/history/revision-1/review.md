# Blockout review — revision 1

Result: concrete draft for human review; no human approval recorded. No map, asset or Verse mutation performed. Offline check succeeds with zero execution blockers. This means structural readiness for design review, not gameplay acceptance.

## Findings

- FR-01: Four live floor bounds align exactly, giving a 112×33 m surface at world Z=2400 cm. Shared campus roots have aggregate bounds overlapping other missions; removal is component/ownership based, never an AABB or wildcard delete. Field-note cargo access remains at the eastern edge.
- FR-03,09: First visit runs right-to-left in the preview (tile 0 to tile 3). The 3 m aisle stays physically open. Useful travel is 89 m to the SHIP firing spot and approximately 93 m to recap; decision stops are spaced 22–28 m apart. This is an accepted walking tradeoff for using all four existing tiles. Return controls avoid a mandatory return walk. Verify pace against the proposed 4–6 minute duration in playtest.
- FR-04..06: Nine explicit stages reuse thirteen target assemblies. Three choices are visible during classification; CHECK has three prediction cards followed by three correction targets, never both hit-active. Stage membership and success IDs match the plan. The confidence lesson is demonstrated by a concrete wrong prediction and repair. Held-out furniture/vehicle/food examples distinguish testing from memorizing original objects. Explanations say this is a scripted model demonstration.
- FR-07,09: Stable hit faces avoid requiring tracking skill while objects and gates animate. Approximate maximum horizontal aim distance is 12.8 m; minimum required target face 1.5 m. Cue rings alone are not a collision guarantee. Motion remains behind the interaction area; retain rail openings for clear firing rays. Controls moved outside the 3 m aisle during review. No timed penalty, forced jump or moving player platform is required.
- FR-08,11: Enrollment, spectator policy, synchronous phase lock, quiet-hit rearm, generation cancellation, empty-team reset and badge guards are specified. They require a new scoped controller; none is asserted to exist merely because the YAML validates. Test disconnect, respawn, held automatic fire, simultaneous correct shots and replay during motion.
- FR-10: Native prop roles and discovered candidates are documented. Candidate availability is weaker evidence than Creative eligibility. Implementation must qualify each selected prop before scene placement; equivalent variants preserve category, size and teaching role. An unavailable eligible equivalent is a stop condition. Held-out banana is the weakest catalog candidate and may require an equivalent food variant with updated fixture wording.
- FR-11: Existing blaster runtime evidence supports reuse; classifier feature 022 evidence did not accept its gameplay. New work needs fresh build, validation, cook and solo/multiplayer evidence. All gameplay tasks remain unchecked.

## Preview inspection and limitations

Read generated HTML/SVG and implementation YAML, checked the 26 marker entries, five zone envelopes, scale, four directional paths, ten stages including enrollment and thirteen target IDs. Preview contains explicit DRAFT wording and provenance. It is a schematic map, not a beauty render; moving prop paths, decorations and detailed mesh collisions are specified in plan.md/asset-palette.md rather than drawn as existing objects.

Browser rendering was attempted through the browser skill, but the runtime reported “No browser is available” and discovery returned an empty list. Therefore no browser screenshot or visual-render QA is claimed. The linked HTML/SVG remains available for human inspection. Small overlapping arrival/weapon annotations describe the same arrival area, not duplicate physical devices.

## Remaining review decisions and acceptance gates

Human approval is outstanding for the one-team design, Furniture category substitution, static shooting controls with moving machinery, and removal of the old classifier presentation. No unresolved design choice is delegated to MCP. Exact native prop eligibility, owned facade reconciliation, target collision/readability, motion cancellation, multiplayer fairness and enjoyment are implementation verification gates, with bounded substitution rules in the plan.

Live GetGameState returned Unconnected at planning inspection and final shutdown verification. No active playtest required stopping; UEFN remains open.
