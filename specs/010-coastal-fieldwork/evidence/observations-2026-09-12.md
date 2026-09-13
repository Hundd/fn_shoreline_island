# Field observation solo evidence

Date: 2026-09-12. Session: `42a1229a190e4487bf83d7131530dff0`.
Scope: FR-001/FR-002 and AC-001, focused solo prediction flows and walking access.
This does not complete feature 010 or island release validation.

## Revision and editor evidence

- `Content/fn_shoreline_island_field_observations.verse` SHA256:
  `3CF894608203E17E57130C570F69591E7D98765531EAB23C6F174941F9388914`.
- UEFN Verse Build All returned `[]` on the final source. Start Session and the
  subsequent Verse-only push both returned `Completed`; game state was `Running`.
- Seven new actors: one controller, three buttons, three signs. Six native actor
  transforms were saved and read back; eleven controller `savedActor` references
  matched their intended actors. Save all returned true. See the
  [placement and binding record](observations-placement-2026-09-12.json).
- Existing floors and neighboring actor bounds were inspected before placement.
  Garden uses the academy foundation, Lanterns the first Lagoon dock beside its
  connector, and Cargo the first Lighthouse floor. No existing actor was moved.
- An initial panel trial exposed a sizing bug: canvas slots defaulted to their
  contents, leaving a tiny background. Explicit `SizeToContent := false` on all
  slots fixed the layout. Only captures listed below count for the final source.

## Results

All three spots were reached by normal walking in one round after the final
Verse push, without earning a normal challenge badge. Signs were visible and
their text described the optional prediction. No audio cue was needed to choose
or read an explanation; a formal muted-audio route test remains pending.

| Spot | Wrong prediction | Again | Correct prediction | Close |
| --- | --- | --- | --- | --- |
| Growth | Plant; explanation identifies Harvest and ordered steps | Restores Harvest/Plant question | Harvest; matching feedback and full explanation | Returns gameplay input |
| Lanterns | 2; explanation identifies 1 and repeated pair | Restores 1/2 question | 1; matching feedback and full explanation | Returns gameplay input |
| Cargo | Storage; explanation identifies Leaf -> Garden rule | Restores Garden/Storage question | Garden; matching feedback and full explanation | Returns gameplay input |

The 900-by-440 background, question/explanation text, two answer buttons, Again,
and Close fit at the tested 1920-by-1080 resolution. The same explanation appears
for either answer, with the selected answer and appropriate feedback above it.

The [baseline journal](captures/observation-baseline-final.png) and
[journal after all predictions](captures/observation-after-journal.png) both show
all eight zones Ready to try and the same Garden recommendation. This verifies
fresh badge neutrality across the sequence. Source inspection also confirms the
controller has no tracker/progression binding or reward calls. Earned-badge
retention and all numeric tracker values were not separately tested here.

## Captures

- Growth: [approach](captures/observation-growth-final-approach.png),
  [question](captures/observation-growth-final-question.png),
  [wrong](captures/observation-growth-wrong.png),
  [Again](captures/observation-growth-again.png),
  [correct](captures/observation-growth-correct.png),
  [Close](captures/observation-growth-close.png).
- Lanterns: [walking route](captures/observation-lantern-route.png),
  [question](captures/observation-lantern-question.png),
  [wrong](captures/observation-lantern-wrong.png),
  [Again](captures/observation-lantern-again.png),
  [correct](captures/observation-lantern-correct.png),
  [Close](captures/observation-lantern-close.png).
- Cargo: [walking route](captures/observation-cargo-route.png),
  [question](captures/observation-cargo-question.png),
  [wrong](captures/observation-cargo-wrong.png),
  [Again](captures/observation-cargo-again.png),
  [correct](captures/observation-cargo-correct.png),
  [Close](captures/observation-cargo-close.png).
- [Test end after journal Close](captures/observation-test-end.png).

## Limits and cleanup

Respawn, departure, stale callbacks, round restart with a final-source panel open,
simultaneous players and earned-badge retention remain untested. The earlier
Verse push restarted the trial round, which is not lifecycle acceptance evidence.
The shared signs contain neutral fixture text, never another player's answer.
World presentation remains basic text boards/buttons; broad sightline polish and
fresh-load reliability across the island remain open. A successful launch is not
standalone full-project validation or a memory calculation.

Fortnite was closed after the test. Process count was 0 and MCP session status
was `Disconnected`.
