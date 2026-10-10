# Implementation plan

Edit only Content/fn_shoreline_island_pattern_line.verse. Source SHA256 D82D3F0428CB820B83F2436C2E22779C808C4724E4281BD6D8D7B31DCED9591E; preserved loop_progress SHA256 4A8DB1DDF0331BAA9B6D22A6A68329936306B467EC00308987FA89F9C8C54E3E. Recheck before editing. Live evidence records configured actor, original arrays, references, target IDs/settings and full hit/ring/label/board/button transforms. No property or transform writes are planned.

## Small local adapter

1. Add a Pattern-local immutable puzzle record with correct ID and five strings. Add exactly three authored alternate records from spec. Preserve original editable declarations/defaults and saved values. One failable selected-puzzle lookup reads the original six arrays when original is selected; alternate records otherwise. This is a new scoped adapter, not a claim that the current controller already supports variants. Native compile resolves Verse effects/syntax; no new engine APIs.
2. Add selection_owner:?player and alternate_set:logic. Generic reset_line continues cancellation/phase/active ownership clearing, but preserves these two retained selection values. Its welcome uses selected puzzle0 and existing heading; if lookup fails, show heading/instruction only, not a wrong-set example.
3. In begin_solo, after existing valid active character/in-course checks and before reset_line, assign a new owner and original selection only if retained owner differs/is absent. Same owner retains set. Then existing reset/start/ensure_player flow remains.
4. Existing on_replay phase3 and is_active_player guard toggles selection, then begins same owner. This synchronous toggle/reset sequence has no suspension. No toggle at success or reset. Repeated callback after first replay sees phase0 and fails existing guard.
5. on_round clears selection owner/flag then resets. on_departure clears retained selection only if departing player matches selection_owner, independently of active_player; retain original active-player reset behavior. If inactive matching owner leaves, refresh idle welcome to original so a stale example is not left. Do not reset another player's live run. on_return/generic monitor reset preserve retained set. No per-player map or persistent save.
6. Route show_prompt, on_hit correctness and all feedback/solved strings, clear_hint restoration via show_prompt, report_navigation and welcome through the same lookup. Keep completion text and fallback journal completion instruction unchanged. No lookup for phase3 active puzzle. Preserve invalid-configuration startup guard; original saved arrays remain authoritative. Alternate table is fixed, fully audited; add no arbitrary configurability.

## Ownership and cancellation audit

reset_line increments generation and hint_generation before clearing phase/active refs and deactivating; existing delayed hint/next_round checks remain intact. Every selection change reaches reset_line before a new run; disconnect clears matching retained owner even if monitor already removed active ownership. Other-player disconnect does not clear selected owner. Replacement owner discards previous selection by design. round order with loop_progress events remains existing: ensure_player and badge guard unchanged, no extra progress calls. Existing state.challenge=phase AND not badge_earned prevents replay awarding another badge.

## Map context and execution boundary

map.yaml reuses corridor and shooting_gallery, accepted028 envelopes and preserved physical flow; measured markers updated only in documentation. Linear stages depict original first run; alternate IDs/table are controller settings and spec, not six sequential puzzles. No zone/device reconcile means a mutation in this feature: generated intent is PRESERVE/inspect only. No historic028 actor removal or relocation is inherited. No new floors or objects at diagram anchors. Full behavior review is used; no text-only exception.

User said “please work by yourself, review implementation plan by yourself or ask a producer” and “do not use game testings, it will be done manually”; Supervisor relays heartbeat reaffirming autonomous repeated loop and no sessions/cook/push. Record Planner/Producer actual reviews and digest. Do not create fictitious human approval or change gate tooling. Standard --ready requires human approval and is expected to remain blocked; delegated task exception is documented in review.md. Implementation may proceed only after Supervisor accepts concrete Producer review under that instruction.

## Validation

Offline check/gate and review of generated preview; source diff audit plus native Verse BuildAll after implementation. Read back saved original settings/bindings and ensure no asset delta. No gameplay testing, session, cook or push. Manual A1–A7 remain pending; compile/static success is not gameplay or learning acceptance. If source baseline or saved arrays differ, reconcile before mutation; return material scope changes for Producer review.
