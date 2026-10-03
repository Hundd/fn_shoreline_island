# Hangar gameplay: Teach Pix a Route

Status: proposed for planning; not design approval or implementation.
Date: 2026-10-03.
Source request: “lets add something new, some new gameplay, ask producer to suggest what it can be”, following the request for a minigame inside the owner's newly added hangar.

## Recommendation

Make the hangar a **robot training playground**. The player teaches a little cargo robot by walking a route, watches it copy the demonstration, then improves the route when the loading bay changes. The main actions are moving, demonstrating, watching and revising. Keep this an optional solo activity with no ninth badge or new prerequisite.

Proposed title: **Teach Pix a Route**. Opening cue: “Walk a safe route. Pix will copy you.” Aim for a short two-delivery activity, provisionally 2–3 minutes without a countdown. Duration and enjoyment must be measured, not presumed.

1. Start beside Pix's training robot and walk from its home pad to a loading pad. Large footprint markers show the recorded route immediately. Ordinary walking is enough; no jumps, sprint requirement, aim challenge or memorized code.
2. At the destination, choose **Try my route**. The robot copies the spatial route at its own gentle pace, visibly carrying a crate. The player watches alongside or from a safe viewing spot. It stops at unsafe sections instead of crashing; the affected footprint and an explanation identify the problem. Re-demonstrating replaces the failed route without losing a completed delivery.
3. For the second delivery, a clearly marked safety closure changes the bay after the first successful demonstration. **Try the old route** provides the discovery: Pix follows what was demonstrated and stops at the closure. The player walks a new route around it, sees new footprints replace old ones, and tests again. The satisfying change is their own path causing a different physical result, rather than selecting a labelled correct answer.
4. Success requires the robot and crate actually reaching the loading pad through permitted space. Light two delivery indicators and hold a short recap: “Pix copied your route. When the bay changed, you showed a new one.” Replay resets the exercise. No speed score or penalty for an indirect safe route.

The robot does not independently discover a detour. This is a recorded-demonstration simulation illustrating one way people can teach machines, not actual model training or a claim that all AI simply copies footsteps. The transferable lesson is **show an example, test what happens, improve the example when conditions change**.

## Why this opportunity

The current island already supplies substantial answer selection. [Pattern 028](../../specs/028-pattern-scanner-cargo-circuit/evidence/solo-user-playtest-2026-09-29.md) has owner-confirmed shooting play; [Classifier 029](../../specs/029-classifier-cargo-rescue/evidence/completion-2026-09-30.md) has accepted fixed-category gameplay; [Confidence 030](../../specs/030-confidence-reactor-rescue/evidence/solo-acceptance-status-2026-09-30.md) has owner-confirmed completion despite the older roadmap calling it unimplemented. [Error 031](../../specs/031-ai-error-lab-shoot-to-fix/evidence/real-rifle-acceptance-2026-10-02.md) records real-rifle repairs with remaining verification; [Tools 032](../../specs/032-ai-tool-lab-dock-rescue/spec.md) uses tool targets, with [recorded shot/acceptance gaps](../../specs/032-ai-tool-lab-dock-rescue/evidence/2026-10-02-verification.md). These gaps are not proof that replacement games are needed.

[Prompt Workshop 027](../../Content/fn_shoreline_island_prompt_workshop.verse) already composes instructions through buttons and moves Pix/cores. [Rescue 034](../../specs/034-ai-agent-rescue-run/evidence/qa-report.md) adds an escort and route interruption, but decisions still use answer banks; its final production gameplay acceptance remains incomplete. The proposed hangar distinction must therefore survive planning: **the player's demonstrated physical route is the input**, not another SCAN/DOCK answer or pre-authored escort. Do not reduce the new concept to three route-choice buttons.

[Progress 033](../../specs/033-progress-and-navigation/spec.md) remains a draft. [Launch Code 035](../../specs/035-hangar-launch-code/spec.md) remains unapproved; it is not existing gameplay to remove. This brief recommends a different direction without editing or approving that bundle. The [roadmap](../../plan.md) provides the ages 8–10, forgiving, non-combat Academy direction. This review used source and recorded evidence, not firsthand playtesting.

## Alternatives considered

| Concept and actual action | Appeal and lesson | Tradeoff / decision |
| --- | --- | --- |
| **Teach Pix a Route** — walk a demonstration, test the copying robot, revise it | Uses the hangar floor as a toy; the player's movement visibly becomes machine behavior; teaches examples and checking results | Recommended. Moderate-to-high provisional effort: new recording/playback behavior, but bounded floor routes can avoid physics and autonomous navigation. Different input is essential because 034 already includes a blocked route. |
| **Cargo Crane** — move a crane hook over a crate, lift, steer and lower it onto a pad | Strong hangar fantasy and spatial handling; use a second viewpoint to check an initially misleading alignment | Defer. Potentially most tactile, but camera/input changes, held-object behavior, collision and controls for children need substantial feasibility work. Must not imply a crane or physics adapter already exists. |
| **Parcel Switchyard** — walk between track switches and physically reroute slowly moving parcels | More active than stationary answers; see how a routing rule affects the next parcel; pause and undo without penalties | Defer. Timing/moving-prop dependencies and potential confusion; category routing overlaps 029, and conveyors were intentionally removed from 028. Reintroducing them needs a stronger benefit than cosmetic novelty. |

## Boundaries and feasibility

Preserve the owner's hangar shell, floor, doors, shelving, toolbox, stairs and catwalk; keep ordinary entry/exit open. Use the ground floor, not compulsory catwalk traversal. Preserve existing loadout, badges, eight-module progression, Agent prerequisites and neighboring games. Exclude vehicles, flight, combat, punitive timers, physics grabbing, live AI services and global matchmaking changes.

[Recorded hangar measurements](../../specs/035-hangar-launch-code/evidence/planning-measurements.md) and [component inventory](../../specs/035-hangar-launch-code/evidence/live-inspection.json) establish candidate ground-floor space and sampled clear lines, not a proven movement playground. The previous narrow firing-fan traces do not establish two accessible robot routes or character/robot clearance.

Planner should first compare bounded recording through broad floor zones with sampled freeform movement. Prefer a few generous traversable zones and deterministic segment playback if they preserve the felt action of teaching by walking. Do not promise smooth arbitrary path recording, pathfinding, physics collision avoidance or real learning. Existing Workshop/Rescue movement and lifecycle code provide reference behavior, not a reusable route recorder. Reuse applicable corridor/checkpoint contracts; the [pattern library](../../design/patterns/README.md) does not establish a shipped demonstration adapter.

## Candidate success scenarios

- Given an uncoached first-time player, when they approach, then they can begin demonstrating with ordinary movement and understand their footprints as the example Pix will follow. Record confusion and enjoyment qualitatively.
- Given two different valid demonstrated routes, when each is tested, then Pix visibly follows the corresponding route and succeeds; an answer ID or hidden preferred path cannot substitute for the demonstration.
- Given the old route intersects the new closure, when replay reaches it, then Pix stops before the closure with the crate, highlights the relevant route section, and offers an immediate safe revision with the first delivery retained.
- Given a revised route around the closure, when tested, then Pix follows it, reaches the loading pad with the crate and lights the second indicator. A callback or text saying “done” without arrival cannot complete it.
- Given an indirect but safe route, then it still succeeds without a time penalty. Given departure, Replay, respawn or a new round, then recorded paths, robot/crate position and effects reset consistently without touching Academy badges.
- Given muted audio and normal walking, then recording, testing, the stop reason and success remain readable; exit is always accessible. After play, ask the player what they changed and why Pix needed a new demonstration.

## Planner unknowns

Measure the complete player and robot envelopes, two genuinely different walkable paths, approach and exit. Decide recording start/finish, duplicate/backtrack handling, bounded route length, accidental exits, retry controls, footprint readability and safe playback speed. Determine how permitted segments and actual arrival are verified; do not rely on decorative closure collision. Resolve whether a compact reusable recorder is feasible with supported devices/Verse and what concrete assets represent the robot and crate. Keep the closure out of the player's only exit. Inspect pattern reuse before extending it. Return feasibility compromises that remove demonstration as the core action to Producer rather than silently turning this into a route quiz.

Next step, if this direction is selected: Planner prepares the numbered design, measured preview and implementation plan for human review. This recommendation itself authorizes no scene changes.
