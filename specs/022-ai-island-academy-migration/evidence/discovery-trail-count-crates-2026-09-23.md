# Discovery Trail count-the-crates evidence

Requirement: AC-047 / T-044. This is source/editor evidence, not runtime
acceptance.

- Before editing, the optional Check Pix board and question stated that there
  were four crates, and the answer buttons themselves said `No — there are 4`
  / `Yes — there are 5`. A live area search found no four-crate group by the
  field-note board. That made the choice a text lookup rather than a visual
  evidence check.
- Placed four decorative teal data cubes on the clear academy foundation
  next to the field-note station. Their centers are X = 450, 550, 650, 750;
  Y = 2500; Z = 2438. Each uses `/Engine/BasicShapes/Cube`, Academy teal,
  scale 0.75, `NoCollision`, overlap off, and actor damage off. All four were
  saved and read back independently. No Verse device reference was changed.
- The saved `field_note_growth_board` text now asks players to count the
  crates while retaining Pix's prediction of five. It was saved and read
  back in UEFN. The Verse question no longer states the true count, and its
  buttons now say only `No` and `Yes`; the explanation still reveals the
  observed four after the choice. `VerseToolset.BuildAll` returned zero
  diagnostics. The label inventory records the saved sign and changed
  source declarations.
- An initial viewport angle showed the row partly masked by a hub pillar.
  The cubes were moved closer to the field-note button, individually saved,
  and their new transforms read back. A subsequent approach-angle capture
  showed all four separate cubes beside the station, though two are shaded.
  Player approach and sightline still require a human in-client check.
- The follow-up question now says the crates are near this station rather
  than on the dock, matching their saved placement. Verse `BuildAll` returned
  zero diagnostics after that source-only wording change; the label inventory
  records the updated declaration.

The optional panel remains player-local and makes no badge or main-route
progression write. Project validation, memory calculation, and Play-in-Client
remain deferred at the owner's request. Count visibility, correct/wrong
feedback, retry, and two-player independence still need human playtesting
before T-044 can be checked off.
