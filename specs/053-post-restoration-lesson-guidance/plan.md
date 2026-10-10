# Minimal action-priority change

Only file: Content/fn_shoreline_island_academy_journal.verse.
Baseline SHA256: 1487BB2ED08A70459265E86D38266FCA9DDEDEA2F73B4398BBAE0A78635FF004.

In navigation_refresh, move the existing two-line `else if (completed_modules(input_player) >= 8)` / `state.action.SetText(navigation_done)` branch from before the existing fresh-activity branch to immediately after it. Preserve the activity branch and its `set pulse = -1` verbatim. Do not introduce helpers, duplicate checks, cache new values, alter conditions or reformat unrelated code.

Final action priority:
1. `now < state.handoff_until`: state.handoff.
2. `state.module_index >= 0, now - state.reported_at < 0.75, name := module_names()[state.module_index]`: existing navigation_step and pulse=-1.
3. completed_modules>=8: navigation_done.
4. Existing name lookup for pulse and module availability: navigation_next or unavailable_text.
5. Existing unavailable fallback.

Source dependencies inspected: report_activity rejects older tokens only for the same source, then stores source/module/token/step/total/instruction and current simulation time. clear_activity sets module/source/token=-1 and reported_at=-10.0. Do not change either. Existing validity means successful module_names lookup plus nonnegative index and age<0.75; it does NOT additionally require module_available, a positive total, source validity, future-time rejection or a new token check. Preserve these exact semantics.

Completion transitions use initialized snapshot false->true and set handoff_until=now+4.0; final completion selects navigation_done as handoff. Count text is written independently before action selection. next_module and its earlier fresh-report pulse suppression remain untouched. The activity branch's pulse=-1 remains where it is; at8/8 next_module already returns-1 under normal complete state. Preserve even unusual invalid-index pulse behavior rather than mixing in an unrelated cleanup.

| State | Expected action after change |
|---|---|
| Any count, now<handoff_until, any report | Existing handoff |
|8/8, now=handoff_until, valid fresh report | navigation_step |
|8/8, expired handoff, valid report age0.749s | navigation_step |
|8/8, expired handoff, report age0.75s or greater | navigation_done |
|8/8, cleared/default module index-1 | navigation_done |
|8/8, nonnegative out-of-range module index | navigation_done |
|<8, expired handoff, valid fresh report | Existing navigation_step |
|<8, no valid fresh report | Existing next-module/unavailable behavior |

Source verification: compare narrow diff and baseline hash; confirm only branch order changes, constants4.0/0.75, count formatting, report functions and pulse/marker code are unchanged. Native BuildAll after implementation captures actual diagnostics. No new implementation-mirroring test suite is needed for this bounded reorder; use case review and compile. Project validation only through supported editor mechanism if available; otherwise accurately pending. No session/game/cook/push. Owner manual AC05 remains open.

Rollback: restore the two-line done branch to its original position before activity, preserving unrelated work.

Geometry exception: the edit selects which existing HUD message is displayed; it alters no map layout, mission mechanics, reporting lifecycle, targets, travel, rewards or timing. Use the repository small-code-fix exception; do not generate a new map.yaml or claim a spatial readiness digest. Existing reviewed map/spec artifacts remain untouched. Numbered spec and delegated Producer review record the player-visible intent.
