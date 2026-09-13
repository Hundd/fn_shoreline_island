# Restored-work journal — focused solo evidence

Result: fresh rows, earned Garden contribution, page navigation and Close/reopen
PASS. This is partial AC-003 coverage, not feature or island completion.

## Revision and execution

- Journal SHA-256: `BDCC430F51A697612AEB59AC513AFA7DBED9E7C40803010ADBD0762F9E5B8401`.
- Unchanged Garden manager SHA-256:
  `EAF1804255FD94EEF61A0A9137754AC448BAA1FBA5AC419E335C5FC9578A8A1D`.
- One Fortnite client, session `41253d84b74d47ef94abfcabfbfdac59`.
- BuildAll returned no diagnostics on the final revision. Verse-only PushChanges
  completed. All captures linked below are after that final push, which restarted
  gameplay; Garden was earned afterward in one uninterrupted round.
- No actors or editable bindings were added or changed. The journal reads the
  existing Garden/Loop maps and six stable later-zone trackers. Source inspection
  finds no Assign, Reset, SetValue, Increment or reward calls in the journal.

## Observations

| Check | Actual evidence | Result |
| --- | --- | --- |
| Fresh Overview | [Eight ready states, Garden recommendation, complete Work/Close labels](captures/work-label-overview-002.png) | PASS |
| Fresh Work | [All eight rows say Not yet restored; Back and Close fit](captures/work-label-fresh-002.png) | PASS |
| Close from Work | [Panel gone, gameplay visible](captures/work-label-close-002.png); subsequent walking and Garden inputs work | PASS |
| Earn Garden normally | [Water](captures/work-water-002.png), [Plant](captures/work-plant-002.png), [Wait](captures/work-wait-002.png), [Harvest and badge feedback](captures/work-harvest-002.png) | PASS |
| Earned Overview | [Garden Earned, other seven ready, Loop recommended](captures/work-earned-overview-002.png) | PASS |
| Earned Work | [Garden supplies contribution; other seven remain unearned](captures/work-earned-page-002.png) | PASS |
| Back | [Overview retains Garden and Loop recommendation](captures/work-earned-back-002.png) | PASS |
| Close/reopen | [Closed](captures/work-earned-close-002.png), [reopened Overview](captures/work-earned-reopen-002.png), [reopened Work](captures/work-earned-reopened-page-002.png) retain the same states | PASS |
| Finish | [Work closed](captures/work-test-end-002.png); Fortnite process count 0 and MCP session Disconnected afterward | PASS |

The initial Restored work and Overview button labels clipped. My work also
clipped its last letter. The final labels are Work and Back, both fully visible.
The local input helper now waits 200 ms after positioning the mouse and checks
foreground ownership again before clicking; immediate clicks initially hit the
previous pointer position. The helper stays under Saved and is not a deliverable.

The first launch had missing world billboard text; signs appeared after the
Verse push. This does not resolve the existing fresh-load reliability issue.
HUD tracker text also overlapped the Game in Progress panel, and the active HUD
tracker was not Garden. The journal and Garden completion feedback establish the
earned Garden boolean, not a numeric audit of every tracker. No broad claim of
zero runtime diagnostics is made: GetClientLogEntries reported no client log.

## Remaining coverage

Earned Loop and six later-zone contribution rows, all-earned width, unavailable
bindings, numeric reward neutrality, repeated Bot ending neutrality, lifecycle,
two/four-player isolation and release gates remain unverified. Observation spots
and the Nursery remix are specified but not implemented. T-001 stays unchecked
until its full fresh/earned coverage is complete.
