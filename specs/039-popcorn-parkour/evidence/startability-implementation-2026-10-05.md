# Startability presentation repair — 2026-10-05

Scope: presentation-only repair of SQA01/SQA02 under the Planner's startability-design-review-2026-10-05.md and Supervisor handoff. No geometry, actor settings, receiver activation, ownership, progression, Replay, rewards or approved bundle edits.

Controller handle_shot retains its existing startup/round checks and unowned acquisition guard. The previously silent rejection now shows `Start at LOAD. Follow the ramp to the starting platform.` to that player for three seconds, then returns without state mutation. Existing owner feedback remains unchanged.

Production generator and generated source assign target7 display_label `FINISH` after shared target startup and before initialize/refresh. Existing final board begins with a blank line, then `START AT LOAD <-` and `Follow the ramp.`. The blank line avoids duplicating FINISH in the two previously overlapping title surfaces. This supersedes the initial pre-edit three-line copy with two FINISH titles; no font or pose change occurred.

Fresh native final board: location(-2200,-16730,2680), rotation(0,0,0), scale(1.7,1.7,1.7). Target7 label: location(-2200,-16800,2770), rotation(0,0,0), scale(1,1,1). South-facing readback preserves intended screen-left/west starter direction. Target7 device suffix1483578823, label1485383827; existing final board1373231806. All references unchanged.

Authoritative BuildAll: diagnostics[] after final copy and initialization-order correction. Initial generator newline escaping caused one string-literal compiler error; corrected before successful build. Explicit observed UEFN Session Operations → Validate Project completed at2026-10-05T03:02:22.216UTC: RunLocalValidation Complete and SignalSuccess. This is separate from cook.

Full PushChanges returned Completed; fresh game state Running. A bounded actual view attempt failed during sky.activate_window with `foreground window did not report a process id`; no gameplay input or screenshot/readability pass followed. Supported StopGame returned Completed; fresh GetGameState CanStart. Targeted map SaveAssets true and IsDirty false. No actor settings/poses were written, no diagnostic tag or camera option changed, no pending calls; UEFN remains open. Current cooked readability, real rejected-hit delivery/state preservation and normal ramp→LOAD regression await independent QA. No synthetic hit or successful gameplay claim is made. Full-feature remaining acceptance remains open.

Final SHA256: controller1D5F9E309F33DD4B26503A0B3EF6B811B76520FB99E2A4A1F59A989610AD6AD0; production0BDF5580355D84FF7E8A032F9CBBEA41598D416C8B65372A3E914A77830B6BDC; generator33734AAFB178B5A7AB120601D8C8C5354C627DEEC67D6DFE9ECDFBBCCAE67CB9. Native validation/cook log exported alongside this report.
