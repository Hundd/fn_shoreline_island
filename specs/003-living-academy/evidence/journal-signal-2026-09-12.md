# Signal journal integration

- Date: 2026-09-12; one player, fresh Launch Session.
- Journal SHA256: `A88B0AEB1DA49C3C2A9F17910D4F27C8A0A8B3C5FC9894FDA40A047B22DA2A23`.
- Bound `academy_journal.later_badge_trackers[0]` to the existing Signal progress
  device's native tracker wrapper. Readback verified its `savedActor` is
  `Device_Tracker_V2_C_UAID_E89C2592D1B5F50003_1585984295` in the current map.
  Journal actor saved, then the binding was checked again after compilation.
- BuildAll returned no diagnostics. StartSession completed.
- PASS: the journal opens with Signal **Ready to try**; Energy, Debug, Event and
  Bot remain unavailable. Garden/Loop remain ready; recommendation is Path Garden.
  Full restoration text and Close control fit the panel.
- Capture: [fresh Signal journal](journal-signal-fresh-2026-09-12.png).
- Later earned badges now display their actual tracker count as `Earned (1/1)`.
  That branch still needs a completed-player and Replay runtime test; no exact
  badge-retention claim follows from the fresh-player check.
- This was a short journal test; Fortnite was closed afterward. UEFN reported
  Disconnected before subsequent harbor duplication.
- Observation: the top-left native tracker showed a generic 0/10 entry and the
  Garden console was visible at initial spawn. Journal interaction worked. No
  matching Verse/runtime error was found in the filtered editor log tail; MCP
  client-log lookup reported no client log. These observations do not establish
  a cause or a fix for the prior fresh-launch presentation reliability finding.

## Earned-player follow-up

On 2026-09-12, one player completed all three Signal queues in fresh round
`2e005f0b49674e4592ad376005ffcf10`, then used Replay and returned to the hub.
Journal source and tracker binding remained the revision recorded above.
Station/material revisions and queue captures are recorded in the
[cargo-symbol test](../../004-signal-lighthouse/evidence/cargo-symbols-2026-09-12.md).

- PASS: opening the journal displayed Signal **Earned (1/1)** after Replay and
  Hub return: [earned state](journal-signal-earned-2026-09-12.png).
- PASS: Close removed the panel; reopening displayed the same **Earned (1/1)**:
  [reopened state](journal-signal-reopen-2026-09-12.png).
- PASS: Garden and Loop remained ready, the recommendation remained Path Garden,
  and the four unimplemented later zones remained unavailable. All text fit.
- This closes the previously pending earned-player/Replay observation for
  Signal only. Repeat completion, respawn, round reset and multiplayer remain
  unverified here. The Garden console remained visible and the journal control
  could be approached from its unlabeled back.

FR-001 remains open until all final zones and multiplayer states are integrated.
