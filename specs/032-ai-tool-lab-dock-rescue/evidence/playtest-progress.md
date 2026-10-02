# Cooked playtest progress — 2026-10-01

Current approved digest remains 4b4571c8575811f4cbd956d92ceed6e8aaa3af4778428a9a51b683b2be0a6fa2; plan --ready passed after implementation adjustments. These are incomplete observations, not acceptance passes.

- Fresh Play From Here at (-3200,-8700,2500), yaw -90: native session launch Completed and match Running. All three stable labelled rings, first request, unknown contents/crew waiting/dock dark and automatic Scanner hint appeared. Rifle was available. Entry activation timing has not been measured.
- Original request board clipped lower lines; AC-06/09 readability could not pass. Source now uses three concise lines; native textSize reduced from 14 to 10, response board to 8. Requires fresh gameplay review.
- Supplies label originally exposed the package type before reveal. Existing label now has an editable controller reference; reset hides it and scanning shows MEDICAL SUPPLIES x3. Added a thin, noncolliding movable scan beam within the crate assembly, sweeps 200 cm before panel opens; generation guard prevents late effects on a cancelled action. Native build returned empty diagnostics; assets saved and PushChanges Completed. These fulfill approved intent without changing the reviewed map layout/flow.
- Initial shot recordings produced no tool feedback. Some earlier clicks also changed aim because SetCursorPos operated in gameplay camera mode. Existing Saved/input-fortnite.ps1 now supports Fire without pointer repositioning and bounded 100..5000 ms hold with finally release. It still verifies the exact Fortnite foreground window. One burst visibly fired, aimed at floor; no acceptance credit follows from it. Aligned Speaker shots still need confirmation with the repaired input path.
- Damage surfaces read bCanBeDamaged=true, triggeredByDamage=true, bReceiveDamageWhenInvisible=true, visible in Game=false; Mesh collision QueryOnly blocks weapon/projectile channels. Entry and neighboring Error Lab mutator both read bAllowWeaponFire=true. These editor values do not prove a runtime hit.
- Scoped capture/input worked with desktop access after Computer Use native pipe failed. Later foreground checks prevented sending input; foreground process inspection identified LockApp. No input attempted after discovering the lock. Unlock requested for continued testing.
- Latest StopGame Completed; native GetGameState CanStart. UEFN remains open. Project Validate and AC-01..10 expected/actual completion remain pending; no gameplay tasks checked off.

Raw Fortnite-only frames and timestamp JSON are under Saved/032-*.png/json (local evidence; not committed caches). Relevant recordings include 032-aim-speaker-d, 032-speaker-wrong-final, 032-walk, and 032-speaker-burst. They show the pre-fix content. Do not reuse them as verification of the revised content.

## Locked desktop continuation audit

Previous turn made source/scene/playtest progress. Current read-only revalidation: Session.GetGameState returned CanStart; LockApp PID 16596 remains and foreground query returned no accessible foreground window. No UI input or new playtest launched.

EditorToolset.LogsToolset.GetLogEntries provides authoritative server Verse output despite Session.GetClientLogEntries lacking a client log. LogVerse records solo entry at 19:00:56 and, for the revised cooked content, 19:17:36; both step=0, contents unknown. No retry or verified-step output appears. Future gameplay evidence should pair scoped frames with this LogVerse feed. LogValkyrieSummary records successful content activation at 19:17:22 for the latest snapshot. This supports revised cook/entry initialization, not interaction acceptance or standalone Project Validate. Validation-filter output does not prove a full project validation pass. Raw tool results are in editor-runtime-log-audit.json.

All AC scenarios remain pending; desktop unlock is required for interaction tests and the project-validation UI. Existing unlock question remains pending; no repeat request or approval is needed.
# Latest continuation — 2026-10-02

Desktop access restored. Fresh lab entry and three target subscriptions observed; actual rifle fire confirmed. Target hit/feedback failure persists with aligned hidden and visible Speaker faces. Visibility restored and saved. Verse builds without diagnostics. Project Validate and AC-01..10 remain incomplete; see [2026-10-02-verification.md](2026-10-02-verification.md). Latest native shutdown state: Unconnected; UEFN left open.
