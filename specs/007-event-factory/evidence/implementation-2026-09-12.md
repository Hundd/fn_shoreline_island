# First Event Factory implementation and solo playtest

- Date: 2026-09-12; one player; map `Content/fn_shoreline_island.umap`.
- Revision: first station with 35 saved actors south of Debug Workshop.
  Three Verse classes provide authored fixtures, personal progress and station
  interaction. Ten controls, three response props, three dynamic boards,
  labels, floor, route, feedback and tracker are placed through UEFN.
- [Saved actor and binding audit](implementation-2026-09-12.json): 35 transforms
  and configured properties; 22 station native references; two progress native
  references; station ID 0 and custom progress reference. Chute/parcel/lamp
  are Movable BuildingProps; the floor is Static. The journal's fourth later
  tracker is Event, preserving Signal, Energy and Debug.
- BuildAll returned no diagnostics before launch. StartSession completed and
  GetGameState returned Running. No source or actor changes followed this build.
- Session round: `3984398ce1974941841e82038470d8c3`.

## Tested source hashes

SHA256 of `Content/fn_shoreline_island_event_*.verse`:

- Fixtures: `AE16D697A512480EE5749A925A6015A98025DB79AA9A9E3F90A458FBA93776A9`.
- Progress: `6A96E89D44464F9626973DB3B46753BFF3F662A8EFAE2B796130CAD4856CC0FB`.
- Station: `9881845BCA375C300AE37476C5733C1A0C8D3958AAA88A33DE4739CB55D1781C`.

## Expected and actual results

| Scenario | Expected | Actual / evidence |
| --- | --- | --- |
| Claim | Show first goal and editable mappings | PASS: [claimed Bell prompt and goal](event-bell-prompt-002.png); labels also appeared [before claim](event-control-approach-002.png). |
| AC-001, wrong connection | Bell linked to lamp moves lamp only and permits correction | PASS: [raised lamp, chute closed, parcel waiting, safe retry](event-ch1-wrong-011.png). |
| AC-001, correct connection | Bell opens chute and releases parcel | PASS: [completed response and parcel](event-ch1-correct-011.png), then [raised chute and displaced parcel from Next](event-next-align-002.png). |
| AC-002, example 1 | Bell/lamp; wrong Lever repeats, correct Bell advances | PASS: [demonstration](event-ch2-demo1-011.png), [wrong-answer replay in motion](event-ch2-wrong1-002.png), [same example retained](event-ch2-wrong1-011.png), [correct answer advances to example 2](event-ch2-correct1-011.png). |
| AC-002, example 2 | Lever/chute; wrong Bell repeats, correct Lever advances | PASS: [wrong-answer replay](event-ch2-wrong2-002.png), [same example retained](event-ch2-lever2-prompt-002.png), [correct answer advances to example 3](event-ch2-correct2-011.png). |
| AC-002, example 3 | Bell/chute; wrong Lever repeats, correct Bell completes | PASS: [wrong-answer replay](event-ch2-wrong3-002.png), [same example retained](event-ch2-wrong3-011.png), [challenge complete](event-ch2-complete-002.png). |
| AC-003, reversed mappings | Each input runs its wrong bound response; neither grants a test pass | PASS: [Bell/lamp](event-ch3-wrongbell-011.png) and [Lever/chute](event-ch3-wronglever-011.png), both final-test flags remain not tested. |
| AC-003, corrected Bell | Chute/parcel respond, lamp stays OFF; only Bell test passes | PASS: [Bell PASS and Lever not tested](event-ch3-bell-pass-011.png). |
| AC-003, corrected Lever | Reset response props, raise lamp only, retain Bell test and complete Lever test | PASS: [lamp in motion with chute closed and parcel waiting](event-ch3-badge-002.png), then [both PASS and Event Badge recap](event-ch3-badge-011.png). |
| AC-004, Replay and return | Attempt resets; earned badge survives without duplication | PASS for this sequence: [Replay reset](event-replay-reset-002.png), [Hub return](event-hub-return-002.png), [Event Earned (1/1)](event-journal-count-002.png), [journal closed](event-journal-close-002.png), [reopened at 1/1](event-journal-reopen-002.png). Repeat completion is still untested. |

Health remained 100 through the wrong and corrected inputs. No timing or
simultaneous input was needed. The six hints are implemented but were not
pressed in this run, so FR-004's complete task remains open despite AC-004's
recorded sequence. Show event's explicit replay button also remains untested;
wrong-answer automatic replay was exercised for every demonstration.

## Findings and remaining work

- First station gameplay passed the three core challenge scenarios solo.
  Extend to three additional owned stations only after this recorded checkpoint.
- Presentation remains graybox: the lamp is a labeled sphere with motion and
  ON/OFF text, not a finished lamp asset. At left-side controls the minimap can
  cover part of the goal board. The raised chute can extend above the camera's
  view from Bell; the Next view confirms its raised position. Reposition the
  boards/props and retest readability before claiming full presentation acceptance.
- The requested StartSession location was not used: the client spawned at the
  hub. Navigation briefly left the floor and required a jump back onto its edge.
  This run is not evidence of a clean, jump-free hub-to-Event route; the earlier
  live commentary claiming that route passed was premature.
- Labels appeared on this fresh launch, but one successful load does not resolve
  the island's previously observed intermittent billboard issue.
- Pending: remaining stations and walking joins, all six hints, explicit Show
  event, rapid presses, edit-after-partial-test invalidation, repeat completion,
  departure/respawn/round restart, station transfer and multiplayer, complete
  muted-audio presentation, project validation and memory calculation.
- No project-validation or memory result is claimed. Material assignment
  advisories were acknowledged during placement; these are not validation passes.
- Fortnite closed after testing: client process count 0 and UEFN session
  Disconnected were verified. The feature remains In progress, not Validated.
