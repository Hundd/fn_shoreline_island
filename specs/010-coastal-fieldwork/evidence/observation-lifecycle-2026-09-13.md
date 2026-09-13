# Observation lifecycle — focused solo evidence

Source SHA256: `CB37DD3BA37FB4700BCA788271EBCFC2E4701C868F7DDAD6D71F7885C2627498`.
Session `4f351bfda1774638823ab995f828dfc4`, one Fortnite client.
BuildAll returned no diagnostics; StartSession completed.

The controller now allocates callback generations from a monotonically increasing
counter instead of a player state that is removed on departure. Round callbacks
remove widgets and clear transient player states without resetting that counter.
This prevents newly created states from reusing old callback generations within
the controller lifetime. No answer, fixture, actor binding or reward logic changed.

| Check | Result and evidence |
| --- | --- |
| Incorrect growth answer | Plant shows the explanation for Harvest and ordered steps: [answer](captures/observation-lifecycle-answer-002.png) |
| Respawn with answer open | Native Respawn removes the panel: [after spawn](captures/observation-lifecycle-respawn-024.png) |
| Input restored | Walked back through hub to growth: [route](captures/observation-lifecycle-return-route-002.png) |
| Reopen | Returns to the unanswered growth question: [reopened](captures/observation-lifecycle-reopened-002.png) |
| Correct answer | Harvest gives matching feedback and explanation: [correct](captures/observation-lifecycle-correct-002.png) |
| Again | Returns to the prediction: [Again](captures/observation-lifecycle-again-002.png) |
| Close | Removes the panel and restores the interaction prompt: [Close](captures/observation-lifecycle-close-002.png) |
| Restart with question open | [Before](captures/observation-lifecycle-before-restart-002.png); StopGame and StartGame both Completed; [new gameplay](captures/observation-lifecycle-new-round-002.png) has no old question |

Scope limits: growth uses the shared observation controller, but these results
do not independently prove Lantern/Cargo lifecycle behavior, departure while
other players remain, adversarial queued callback timing, automatic multi-round
transitions, post-restart reopening, earned-badge retention or multiplayer
isolation. T-005 remains open. Prior all-six-answer coverage is in the earlier
observation evidence; do not call this a full replay of that matrix.

Presentation finding: static hub/Garden signs were missing after this Verse
rebuild and first launch, including at respawn. The observation sign remained
visible. Static signs reappeared after gameplay restart. Compare the respawn
and new-gameplay captures. This reproduces the open sign issue after the two
previous phase-comparison launches did not reproduce it; it does not prove a
root cause or support the reverted phase change.

Fortnite was closed after testing; process count 0 and MCP Disconnected verified.
