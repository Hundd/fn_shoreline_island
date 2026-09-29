# Blockout review — revision 1

Disposition: ready for explicit human design review; not approved or implemented. Existing footprint and Pulse Rifle were confirmed by the user; that clarification was not design approval.

## Requirement-linked findings

| Finding | Requirements | Resolution / verification obligation |
|---|---|---|
| User's five-tile naming differs from four floor actors; last floor has zero width. | FR-01,09 | Use confirmed existing 112 x 35 m footprint with five activity beats. Preserve debug-labeled support under final bay, fill only the measured 48 cm seam. Cooked collision remains mandatory. |
| Initial result-board anchors were 18 m from the firing aisle. | FR-03,07 | Moved all four result boards beside firing positions at Y=29, with HUD copies; regenerated preview. Keep labels at controls and no long-distance reading. |
| Route is roughly 97 m, with four action bays. | FR-01,04 | Accept as an escort through the existing site: 20–28 m between stops, core transfers while walking, waits for players, no return trek. Validate first-run 3–5 minute pacing; shorten within bays if dull without changing footprint/mechanics. |
| Choice sets and sightlines. | FR-02,07 | 12 distinct target IDs; only 3/3/2/1/1/2 active per decision. HOLD/SEND do not coexist with the front probe choices, so inactive hitboxes must park. Low machinery rail needs two clear firing gaps. Minimum target diameter 1.2 m; shots usually 6–10 m. |
| Educational confidence could become score arithmetic. | FR-03 | No per-clue percentage gain. Use one labeled authored 90% prediction, contradiction, qualitative revision, fresh retest. Copied report/popularity do not count as independent measurements. |
| Existing controller is not configurable for this game. | FR-02..04,06,08 | Explicitly scope new configured confidence controller after approval; reuse proven data_target/data_blaster and synchronized MoveTo building blocks. No claim that YAML implements it. |
| Moving control may exclude some players. | FR-04,07 | Only valve moves, 4 m each way over 4 s; Pause freezes the matching hitbox. No required jumps, riding, speed timer, damage or penalties. Help and Repeat Result provided. |
| Multiplayer/persistent completion races. | FR-06,08 | Explicit 5 s enrollment, agent and bay checks, continuous membership, generation cancellation, final atomic section commit and existing badge guard. Solo plus two/four-player verification required. |
| Native catalog candidates may be restricted. | FR-05,09 | Qualification required before place/cook; old disallowed-cat evidence informed this rule. Substitutions stay within authored role/envelope and must still meet 75% native prop count. |
| Aggregate shell bounds overlap neighboring missions. | FR-09 | Reconcile energy shell/identity components, not whole-site wildcard deletion. Preserve support, promenade, shared progress, journal/finale and global equipment. |

## Preview inspection

The actual generated SVG was rasterized locally with the existing Sharp library and viewed as evidence/preview-review.png. The browser plugin returned no available browser, so no browser-layout claim is made. The SVG and HTML source show all five zones, the right-to-left route, twelve distinct target markers, separate arrival/equipment/return markers and a readable numbered legend. Result boards were relocated after review. Zone envelopes do not describe walls, collision or dressing; read plan.md and asset-palette.md with the preview. The intended machinery strip is Y=9..17; player aisle is Y=24.5..27.5, so neither walking nor return passes through motion.

## Checks and limits

`python tools/map_workflow.py check specs/030-confidence-reactor-rescue/map.yaml` passed with zero execution blockers. The generated plan remains draft/non-executable pending explicit approval. No approval.yaml exists. Pattern reuse and implementation intent were reviewed against current source; actual native properties, full prop pivots/scales, floor collision, bullet alignment, visual readability, performance, fun and cooperative fairness require the recorded implementation preflight/playtests. These are mandatory acceptance checks, not already-passed evidence.

No unresolved design decision remains after the user's site/equipment clarification. Approval is still required by the invoked planning skill. Authoritative Verse build, validation/cook and runtime acceptance have not been run because this task has only authored planning files.
