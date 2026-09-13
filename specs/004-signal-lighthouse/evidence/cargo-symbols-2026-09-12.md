# Cargo symbol implementation and verification

- Date: 2026-09-12. Map `/fn_shoreline_island/fn_shoreline_island`.
- Station SHA256: `22574A227894E2DE2578F1263AD471AEC9962CDEC4C0C1C26618E9E9D550280A`.
- Fixtures SHA256: `5E0FCD213A0FC876BB794D57A5175F8B25EB299A1DEA533D560C32F86BC6127D`.
- First solo font experiment failed: the leaf ornament displayed as a missing
  character; increasing cargo text from 12 to 24 clipped it. Removed those
  glyphs and restored 12-point text before proceeding.
  [Failed font attempt](cargo-font-failure-2026-09-12.png).
- Created original leaf and gear artwork using geometric paths. Reproducible
  source: `Resources/Cargo/generate-symbols.ps1`; import PNGs in the same folder.
- Imported two 512x512 textures through UEFN TextureTools and created two opaque
  unlit materials under `/fn_shoreline_island/Academy/Cargo`. Both compiled.
  Readback verified each texture sample points to its matching texture and its
  RGB output feeds Emissive Color. Saved all four assets successfully.
- Station Verse selects the current cargo's material on the existing boat:
  leaf artwork for LEAF, gear artwork for GEAR, unmarked teal for PLAIN.
  Both manual and rule execution use that same helper; release restores PLAIN.
  Written cargo names, queues and rules remain available.
- Added `Content/Academy/cargo_access.verse` to expose the Cargo submodule to
  station code. Generated asset digests remain unedited.
- BuildAll returned no diagnostics after the complete material integration.

## Solo runtime results

Fresh full Launch Session, one player, round
`2e005f0b49674e4592ad376005ffcf10`, using the source revisions above.

| Expected behavior | Actual result and evidence | Result |
| --- | --- | --- |
| LEAF remains identifiable during delivery | Ivory leaf visible on the moving boat; [delivery](material-leaf-delivered-004.png) | PASS |
| PLAIN has no symbol after LEAF | Teal boat and written PLAIN label; [next cargo](material-leaf-delivered-013.png), [queue-one completion](material-plain-complete-013.png) | PASS |
| GEAR remains identifiable during delivery | Gear visible while travelling to Workshop; [delivery](material-gear-delivered-004.png) | PASS |
| Queue two switches GEAR, PLAIN, LEAF correctly | [PLAIN](material-gear-delivered-013.png), [LEAF restored](material-ch2-plain-013.png), [completion](material-ch2-complete-013.png) | PASS |
| Rule A routes all four final boats and awards Signal | [GEAR at Workshop](material-final-run-022.png), [fourth boat and award](material-final-run-041.png) | PASS |
| Replay restores the initial final fixture | Rule B, boat one of four, unmarked PLAIN; [reset](material-replay-reset-002.png) | PASS |
| Hub return preserves the earned badge | [Hub return](material-hub-return-004.png), then journal shows Earned (1/1); [journal evidence](../../003-living-academy/evidence/journal-signal-2026-09-12.md) | PASS |

Journal close/reopen also retained exactly 1/1. This verifies retention through
Replay and Hub in this round; it does not establish repeat-completion, respawn,
new-round, simultaneous-player, or persistence behavior. Health remained 100.
Written cargo names remained available alongside the original material symbols.
The earlier failed font experiment is superseded by these material results.

Remaining observations: the hub journal is approachable from its unlabeled back;
the Garden controller console is visible. These presentation findings remain
open. No claim of standalone project validation, memory acceptance, or multiplayer
acceptance is made by this focused solo run.

Fortnite was closed after the test. Process count was zero and UEFN SessionTools
reported `Disconnected`.
