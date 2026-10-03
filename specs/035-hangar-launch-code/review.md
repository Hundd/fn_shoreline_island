# Blockout review — revision 1

Planning review only; not human approval or gameplay acceptance.

`python tools/map_workflow.py check specs/035-hangar-launch-code/map.yaml` passed on 2026-10-03: zero execution blockers, draft remains non-executable. Inspected generated preview.svg/preview.html source, marker positions, legend, stage table and implementation.yaml. Supervisor independently reran validate and queued preview.html in Codex. Browser file URL inspection was blocked by the browser security policy; no alternate serving/browser workaround was used. This Planner did not raster-render or visually inspect a browser screenshot; no visual screenshot verification is claimed.

## Requirement-linked findings

- R-01: Correct new prefab identified by live root/attached geometry, distinct from old A-frame hangar. Seven ground rays establish sampled Z=2314. Entry and three sight rays were clear. Gameplay avoids the detected toolbox and stairs. Shell, furnishing and existing missions are protected; no cleanup operation is authorized.
- R-01/05: 18 x 14 m play envelope, 3 m approach and approximately 8 m aim distance. The three pads have 5 m center spacing and 1.5 m faces. All codes play from one place; no backtracking or catwalk traversal. Entry-to-stance adds about 24 m. Full swept-width entry/exit and crouched/standing sightlines still need cooked proof.
- R-03/04: The 3/4/5-symbol progression produces twelve deliberate hits, with one beacon per entire code. The board's checked slots and cursor represent within-code progress. Wrong input preserves completed beacons and restarts only the current code. This makes instruction order visible without a memory test or penalties. Estimated 60–90 s is a design target, not a measured result.
- R-04/05: Board and center beacon share topdown XY at different heights (board center 4.2 m; beacon 2 m). Preview marker 11 overlays marker 6 in the small topdown map; the HTML legend/coordinates and plan list both. This is an intentional vertical arrangement, not two props at the same 3D position. A topdown v1 preview cannot establish vertical text clearance; implementation must verify board/beacons and target labels together from player eye height. Keep this clear in human review.
- R-02/07: Single-owner local session avoids mixed code inputs; spectator controls cannot reset another player's game. Open walk-out plus Cancel avoids trapping players. Reset during the one-second finale and second-player ownership must be tested explicitly.
- R-06/08: Shared target APIs support agent-attributed hits and explicit feedback. Existing pattern_line is not a generic code engine and must not be wired as if it were. New controller is an explicit part of the proposed implementation scope. The quiet-input design observes hits rather than physical trigger release, so the actual automatic blaster cadence is a mandatory anti-spam test.
- R-07/08: This optional game changes no Academy badges, rewards, progression or matchmaking. Shared blaster/round dependencies are reused; all local input/visual devices are new dedicated instances. Target assembly dependencies are included in scope and must be copied/configured with unique refs, not left as defaults or stolen from working activities.

## Review outcome

No unresolved design decision blocks presenting this proposal. Human approval is missing and must be actual approval of the concrete preview/plan. No approval.yaml exists. Native class/property discovery, full actor transforms, fit/readability, controller build, validation/cook and AC-01..10 are implementation/acceptance work, not claims of current runtime support. No gameplay task is checked off.

Final read-only session checks: GetGameState = Unconnected; GetSessionStatus = Disconnected. No game was running, no Stop call required. Editor left open; editor ownership returned to Supervisor with no in-flight calls. Only planning files were changed.
