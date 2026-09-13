# Nursery three-challenge solo acceptance

2026-09-12; UEFN project compatibility 42.10; one solo client.
Session `597dd6f4db3747a89fb74efd4a50d3bd`. Source SHA-256:

- fixtures: `5E1C339A718829BCE7F6E0BB85D923A597BB123C0EC62B8BAE87638C9654A164`
- progress: `220E56694DC471A083720D1E087F680969F8BAB915EAEC9354E8CD41860C8676`
- station: `D829964322419BED8CA248FEB632F16711C67A618C3C45C810F009BEC7FB0316`

Build All returned `[]` before launch. The 44-actor construction and 45 native
bindings are recorded in `caller-repeat-2026-09-12.json`; the final 11 sightline
transforms are in `sightline-fix-2026-09-12.json`. All saved values matched readback.

The first expanded launch exposed Planter 1 outside the Run view. After the
sightline fix, the second launch spawned at the hub despite the requested
Nursery position. A western approach reached the platform edge without reaching
Nursery; no route acceptance is claimed. Fortnite was closed before the third
launch, which honored the requested Nursery position and supplied these results.

| Scenario | Expected and observed result | Capture in captures/ |
|---|---|---|
| AC-001 initial error | Harvest stopped at Care step 3 while Planted; message named Wait as required next step | nursery-tight-wrong-011.png |
| AC-001 correct Care | Water, Plant, Wait, Harvest restored the planter; Done 1 yes and Next unlocked | nursery-tight-correct-023.png |
| AC-001 Next | Challenge 2 opened with default definition and Care, Care, Care caller | nursery-tight-ch2-002.png |
| AC-002 wrong caller | Correct Care then second Care stopped at caller 2 on harvested bed 1; editing remained available | nursery-row2-wrong-023.png |
| AC-002 correct caller | Care, Move, Care reset the demonstration, moved the robot to bed 2 and restored both; Done 2 yes, badge 0/1 | nursery-row2-correct-009.png; nursery-row2-correct-029.png |
| AC-003 count 1 | Bed 1 harvested, robot at empty bed 2, unfinished-bed message, no award | nursery-repeat-one-019.png |
| AC-003 count 2 | Two harvested beds, robot at empty bed 3, unfinished-bed message, no award | nursery-repeat-two-029.png |
| AC-003 count 4 | Three harvested beds and robot at Exit; extra Care rejected at repeat 4 with no-planter-at-Exit message; Done 3 no, badge 0/1 | nursery-repeat-four-044.png |
| AC-003 count 3 | All beds harvested, robot at Exit, all three Done flags yes, badge 1/1 and function explanation | nursery-repeat-three-044.png |
| Repeat successful Run | Demo reset and completed again; retained message and actual mission-board badge count 1/1 | nursery-repeat-retained-044.png |
| Hub return | Return button brought the player to the academy hub | nursery-tight-hub-002.png |

Adjacent alignment captures record the submitted programs/counts. All count
failures preserved the submitted program. Next reset the definition on entry
to each challenge. These results support T-010, T-011 and T-012 only.

Warnings and limits: the robot occludes its current floor label; tracker HUD can
overlap the mission board. Robot, planters and Exit are visible from Run, but
presentation is not final. No muted-audio setting was verified. Six-hint and
full-set Replay acceptance, rapid controls, lifecycle, multiplayer, journal
integration, project validation and memory remain pending. A repeated Run is
not evidence for replaying the whole set. No runtime-log cleanliness claim.

After Hub return, Fortnite was closed. Process count was 0 and MCP session status
was Disconnected. No test client remains running.
