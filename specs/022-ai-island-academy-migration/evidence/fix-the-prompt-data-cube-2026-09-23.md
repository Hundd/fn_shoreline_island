# Fix the Prompt data-cube order — editor evidence

Requirement: AC-043 / T-040. Implementation evidence, not runtime acceptance.

- The existing four-slot optional puzzle now presents Find Cube, Pick Up Cube,
  Walk to Scanner, Scan Cube. The starting program remains `{0, 1, 3, 2}`;
  swapping slots 3 and 4 corrects it. Help names the answer, the objective
  names the blue data cube and scanner, and the existing success/no-extra-badge
  behavior is unchanged. No device references or reward state were changed.
- All 16 unbound stage Billboards across the four Fix the Prompt stations were
  changed through UEFN to `1 FIND CUBE`, `2 PICK UP CUBE`,
  `3 WALK TO SCANNER`, and `4 SCAN CUBE`. Each actor was saved and read back.
  The label inventory was updated to match the editor readbacks.
- The 16 existing stage props were confirmed to use the cube mesh; their
  material overrides were changed from Academy teal to the existing Academy
  navy used for the Medical data cube. Each actor was saved and read back.
  The four Verse prop references and transforms were retained.
- `VerseToolset.BuildAll` returned zero diagnostics.

The two-level Help text was later refined to match the plan's progressive
hint examples: first ask what Pix must do before scanning, then explicitly
name the Walk/Scan inversion and slots 3/4. The changed source declarations
were updated in the label inventory, and `BuildAll` again returned zero
diagnostics. No actor default changed in this hint pass.

Project validation, memory calculation, and Play-in-Client/gameplay and
multiplayer checks remain deferred at the user's request. In-client stage
visibility, wrong-order retry, corrected-run completion, and no extra badge
still need a human playtest before T-040 can be checked off.
