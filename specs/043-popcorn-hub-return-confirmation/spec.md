# Feature 043 — confirm Popcorn Hub return

Proposed; no human approval yet. Owner reports the 042 walk-in return works and requests confirmation before teleporting. Retain the working portal, completion, geometry and rewards.

- R01: Entering the existing completed-mission portal opens one owner-only native modal instead of teleporting. Preserve 042 successful-finish/reward gate, 1 m step-clear arming and exact native capsule monitor.
- R02: Exact dialog: title `Return to Hub?`; body `Mission complete! Return to the hub now?`; button0 `Return to Hub`, button1 `Cancel`. No automatic phase display or timeout; Back maps to Cancel. Only valid Confirm runs the existing cleanup-first Hub return, with no new reward.
- R03: Cancel/Back/dismiss/timeout closes the dialog and leaves the completed player on the finish deck. No repeated dialog while standing inside; step outside the existing 1 m clearance then re-enter to reopen. Free finish movement, Replay and existing Return buttons remain.
- R04: Each modal uses immutable owner/generation/round/dialog-epoch callback scope. Reject stale/foreign/duplicate responses. Invalidate and cancel subscriptions before Hide/return. Replay/eitherReturn/reset/round/departure/removal closes UI and invalidates it; only current owned finished state can confirm.
- R05: One new native popup_dialog_device supporting the existing controller. No teleporter relocation/settings/capsule/geometry/audio/lesson/completion-copy changes; no custom widget or imported asset.
- R06: Implementation requires actual approval of current043manifest. Compile/readback/save afterward; no automatic tests/QA/ProjectValidate/cook/push/session. Owner manually verifies dialog behavior; leave editor open with game stopped at handoff.

Manual acceptance, unrun:

- A01 [R01,R02]: Given current owner has successfully completed/rewarded the mission and portal is armed, when they enter its exact capsule, then one dialog appears only for that owner and no teleport occurs until Return to Hub is chosen.
- A02 [R02,R04]: Given the current dialog, when owner confirms, then it hides, eligibility closes once, existing attempt/journal/HUD/halo/audio cleanup runs before the same Hub destination teleport, preserving earned progress and no duplicate reward.
- A03 [R03]: Given a dialog, when Cancel or Back/dismiss is used, then player stays finished; standing within portal produces no new dialog. Step outside1m and re-enter opens exactly one fresh dialog.
- A04 [R04]: Given pending dialog or queued callback, when Replay/Return/round/departure/removal occurs, then dialog hides and obsolete callback cannot teleport the old or next attempt. Foreign agent/button and duplicate confirm stay inert.
- A05 [R01,R03]: Given the player completes while inside the portal, when completion occurs, then existing step-clear guard still prevents forced UI/teleport; walking out and re-entering opens confirmation. Both Return buttons and Replay still work.
- A06 [R02,R04,R06]: Given Confirm/Cancel and native dismiss notifications, when either ordering occurs, then only actual valid Confirm returns; Cancel/dismiss never returns. Modal usability/visibility, hide, back navigation and per-owner behavior are owner manual checks, not claimed by native/source evidence.
