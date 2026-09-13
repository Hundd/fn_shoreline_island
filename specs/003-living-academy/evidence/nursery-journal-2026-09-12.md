# Nursery journal integration - 2026-09-12

Focused solo result: PASS for unearned/earned Nursery display, unchanged other
zone states, Garden-first recommendation, eight-zone panel fit, and Close/reopen.
This is partial T-009 acceptance; full-set Replay and later recommendation
branches remain pending.

## Revision and setup

- UEFN 42.10; one local Fortnite player, one continuous launched session.
- Session visible in captures: `63fd770ceedd43a884467429d7a96455`.
- Journal SHA-256: `D12C48ACADC407DDFD7E3DE32F0CFA495F0352E43DEBF4A829CD3C0A6C044519`.
- Nursery fixtures: `5E1C339A718829BCE7F6E0BB85D923A597BB123C0EC62B8BAE87638C9654A164`.
- Nursery progress: `220E56694DC471A083720D1E087F680969F8BAB915EAEC9354E8CD41860C8676`.
- Nursery station: `D829964322419BED8CA248FEB632F16711C67A618C3C45C810F009BEC7FB0316`.
- Verse BuildAll returned no diagnostics before launch. Saved journal readback
  matched all six tracker references, preserving the original five.
  See [binding audit](nursery-binding-2026-09-12.json).
- Nursery uses appended index 5; display/recommendation order puts it before
  Bot. Both share a row. Source inspection confirms journal reads do not assign,
  reset, or increment trackers.

## Expected and observed results

| Check | Expected | Actual / evidence | Result |
| --- | --- | --- | --- |
| Fresh panel | Eight zones ready; Garden first; complete text and Close | [Unearned](captures/journal-nursery-unearned-002.png); all text fits at 1920x1080 | PASS |
| Fresh Close/reopen | Closes and returns with same state | [Closed](captures/journal-nursery-close-002.png), [reopened](captures/journal-nursery-reopen-002.png) | PASS |
| First two Nursery challenges | Flags advance; badge stays 0/1 | [Care](captures/jn-care-success-019.png), [two-bed caller](captures/jn-row-success-029.png) show flags and 0/1 | PASS |
| Third challenge | Repeat 3 restores beds, reaches exit, awards once | [Success](captures/jn-repeat-success-044.png) shows all flags, harvested beds, robot at exit, Badge 1/1 and function explanation | PASS |
| Hub return | Same player returns and opens journal | [Hub](captures/jn-hub-return-002.png), followed by journal interaction | PASS |
| Earned panel | Nursery Earned (1/1); other seven ready; Garden first | [Earned journal](captures/journal-nursery-earned-002.png) matches exactly | PASS |
| Earned Close/reopen | Same eight states remain readable | [Closed](captures/journal-nursery-earned-close-002.png), [reopened](captures/journal-nursery-earned-reopen-002.png) | PASS |

The player walked from the hub to Nursery on connected floors before claiming.
Lighthouse controls and a Debug robot blocked the initial line; moving sideways
allowed passage. This establishes physical access, not signposted-navigation
acceptance.

## Limits and cleanup

Full-set Replay and journal retention after it were not exercised in this
session. Earlier earned badges and recommendation transitions through all
zones were not tested. Multiplayer, six current-revision Nursery hints,
rapid-input/lifecycle cases, project validation, memory calculation, and muted
audio acceptance remain pending. The gameplay overlay overlaps the Nursery
mission board at some controls; the robot can obscure a bed label. These remain
presentation issues, although the journal panel was fully readable.

Fortnite was closed after the test: process count zero and editor session
Disconnected. No task is checked off using these partial results alone.
