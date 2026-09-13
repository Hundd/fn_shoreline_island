# Journal lifecycle — focused solo evidence

Journal source SHA256:
`645DA93E6DFEFE3785EC5378A744E95F7B9E389806CD86B49C3CB93D6DEEF5F6`.
One Fortnite client, session `1b3643bb90734a2fa0908cc7623ead23`.
BuildAll returned no diagnostics after correcting a multiline loop syntax error.
StartSession completed; GetGameState returned Running.

The journal subscribes to the already-bound Garden manager's four hub spawners
and round-settings device, plus playspace departure. No editor bindings or actors
were changed. Each rendered panel has a unique generation shared by its button
callbacks. Replaced/closed panel callbacks cannot act on a newer panel. Departure
removes transient entries; round restart clears panels and generation mappings.
The global generation counter is not reset, preventing reuse within a device
lifetime. No progress assignment or reward function was added.

| Check | Observed result | Evidence |
| --- | --- | --- |
| Open and Work | Fresh eight rows, complete labels and background | [Work](captures/journal-lifecycle-work-002.png) |
| Respawn with Work open | Used native Fortnite Respawn confirmation | [confirmation](captures/journal-lifecycle-respawn-dialog-002.png) |
| Respawn cleanup | Work panel absent after spawn | [respawn](captures/journal-lifecycle-respawn-024.png) |
| Input returned | Player walks toward journal after spawn | [movement](captures/journal-lifecycle-move-002.png) |
| Reopen after respawn | Overview opens, all eight ready and Garden recommended | [reopened](captures/journal-lifecycle-reopened-002.png) |
| Restart while Overview open | StopGame and StartGame both Completed; new gameplay has no journal panel | [new round](captures/journal-lifecycle-new-round-004.png) |
| New-round navigation | Work and Back operate with fresh progress | [Work](captures/journal-lifecycle-round-work-002.png), [Back](captures/journal-lifecycle-round-back-002.png) |
| Close | Journal panel removed and interaction prompt available | [closed](captures/journal-lifecycle-close-002.png) |

Scope limits: this covers solo respawn and gameplay stop/start, not an automatic
multi-round transition or two/four-player isolation. Departure while other clients
remain, adversarial stale-click timing, earned-state retention, and full release
checks remain pending. T-005 stays open.

World signs were missing on the first launch and appeared after the gameplay
restart. This reproduces the existing fresh-load presentation issue; journal
canvas text was readable throughout. The revised Nursery remix mission text
was included in this build but was not reached in this journal-focused test.

Fortnite was closed after testing: process count 0, MCP session Disconnected.
