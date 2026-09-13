# Loop station sign viewing range — 2026-09-13

Requirement: PR-001. One-player Fortnite session `cab5b2a9c81f408aa43cff4975ae755` through the connected UEFN editor. Exact editor version was not recorded for this test.

## Saved change

Set native billboard `viewDistance` from 10000 to **4 tiles** on all 52 Loop station billboards: four objective boards, 24 control labels and 24 tile labels. Save/readback audit covers every target. Text, text size and border settings match the before snapshot. No Verse source or transforms were edited. The Hub route sign was excluded.

- [Before snapshot](sign-range-before-2026-09-13.json)
- [Intermediate 8-tile audit](sign-range-after-2026-09-13.json)
- [Final 4-tile audit](sign-range-four-tiles-2026-09-13.json)
- Loop station source SHA-256: `1A522ECA288EF096F8C61B1BD7AE16C3B439BA7C0AC2A2213D76CFF22357BF6E`.

## Solo observations

1. The intermediate 8-tile setting kept nearby text readable but retained far dock boards from the Hub. [8-tile Hub capture](captures/loop-range-hub-002.png).
2. After the full content push completed and the game restarted, the 4-tile setting kept the Hub route and nearest dock text visible while farther dock boards and labels disappeared. Physical dock props remained visible. **Pass for this viewpoint.** [4-tile Hub capture](captures/loop-range-four-hub-002.png).
3. On approach to Dock 1, its objective, control and tile labels were visible. Claim succeeded. **Pass.** [Approach](captures/loop-range-four-entry-002.png), [Run prompt after claim](captures/loop-range-four-run-prompt-002.png).
4. Run with Repeat 1 displayed Move / Robot tile 1 and wrong-count feedback: stopped at 1, goal 3, change the count and try again. Nearby control and destination labels remained visible. **Pass.** [Execution and feedback](captures/loop-range-four-run-002.png).
5. Walking along the floor toward Dock 2 brought its previously culled board and labels into view without restarting. **Pass for approach visibility.** [Dock 2](captures/loop-range-four-dock2-002.png).

## Limits and follow-up

Keep T-PRESENTATION-RANGE open: repeat out-of-range/back-in-range checks on the same dock, verify progress retention across that travel, and inspect Docks 3 and 4 nearby. The 8-tile traversal drifted off the south floor edge; it is not evidence of a clean route or successful floor re-entry. Effective client culling distance was not measured.

This is a presentation check, not complete Loop acceptance or project validation. Full solo regression, multiplayer, compact-board/landmark work, project validation and memory calculation remain pending. No Verse build was required by this actor-property-only change. Fortnite was closed after testing; process count read back as zero.
