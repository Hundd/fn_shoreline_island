# Journal focus and Back navigation

2026-10-09. Producer brief: docs/producer/journal-controller-navigation.md. Existing overview and Work pages only.

R1: Opening either journal page focuses its existing Close button. Preserve button_regular style, all labels, positions, sizes and page content.
R2: Bind exactly one existing interactive button per page to supported UI Back. Overview: Close (choice0) closes to world. Work: existing Back page button (choice2) returns to overview. Visible Close always closes; visible Work/Back still changes page.
R3: Journal owns and releases its mapping and each OnClick subscription. Old callbacks/focus cannot affect a closed/replaced panel after close/reopen, page switch, travel handoff, spawn, round reset or departure. Preserve mutual exclusion and never remove a travel-owned mapping.
R4: Preserve053/054 HUD, progress/count/rewards, reporting, travel destinations/arbitration and all geometry. Only journal input lifecycle source changes.
R5: No gameplay/session/cook/push/testing. Source lifecycle review and native compile allowed; actual keyboard/gamepad traversal, Back behavior, focus appearance and dismissal-input leakage remain owner manual acceptance.

AC01 (static/native): Existing styled buttons inherit supported TriggeringInputAction; overview has only Close bound Back, Work only page Back bound Back. One OnClick subscription per visible control, with cancellation ownership; no second global Back listener.
AC02 (static): Close invalidates generation and cancels subscriptions before removing panel/mapping; ownership cleared synchronously. Deferred click and focus require matching player/panel generation and round, with current panel present.
AC03 (manual pending): Open with controller/keyboard, see Close focused; activate Work, Back once goes overview, Back again world. Mouse/visible Close work on both. Same dismissal does not trigger world action or immediately dismiss new overview.
AC04 (manual pending): Rapid reopen/page changes, journal-Pix alternation, spawn, round/departure cleanup do not reclaim stale focus, remove another modal's mapping or duplicate actions. Existing content and053/054 HUD unchanged.

Current user authorization delegates concrete agent/Producer review and explicitly prohibits gameplay testing. This is not a human approval record or a claim of runtime correctness.
