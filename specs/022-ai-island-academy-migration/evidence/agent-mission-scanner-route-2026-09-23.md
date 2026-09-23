# Agent Mission destination scan and route choice — 2026-09-23

The final Agent Mission stage now stores two attempt-local, per-player values
in the existing progress object: whether the destination marker was scanned
and the selected Bridge/Dock route. With Launch connected to Dispatch, the
first Run action scans and reports `Bridge: BLOCKED | Dock: OPEN`; it does not
move the parcel or mark an item passed. The existing starting-energy control
is repurposed only in this stage to choose Bridge or Dock. It cannot select a
route before the scan. Testing on Bridge stops safely with an explanation;
Dock permits the existing Apple/Car conditional classification tests. The
Run Button and its label say `Scan destination marker` before the scan and
`Test selected item route` afterward.

Connection edits clear scan, route, and passed-item state. Route or rule edits
clear passed-item state. Replay resets scan and route in the existing attempt
reset; round reset replaces player states. The verification gate remains after
both correct item tests, so neither scan nor route selection awards a badge.
The normal button/label wording is restored outside this stage and on station
release. A delayed label refresh after player join also restores a pending
Verify prompt if the owner had passed both tests.

UEFN MCP `VerseToolset.BuildAll` returned zero diagnostics after the final
source edit. Live UEFN reads found all four Agent Mission stations' reused
energy/route Button, label Billboard, Run Button, and connection Button
wrappers resolving to saved actors. This was a Verse-only change; no actor
property or asset was edited, and no actor save was required.

AC-029/T-026 remain open for Play-in-Client checks of prompt fit, scanner
result visibility, blocked/open route behavior, edit/replay/reclaim/round
reset, Verify timing, badge-once behavior, and multiplayer independence.
The owner has asked to skip that verification. This step does not implement
the Medical-crate selection or reusable delivery skill required by the full
capstone AC-028/T-025.
