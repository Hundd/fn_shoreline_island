# Agent Mission verification gate — 2026-09-23

Before this change, the final stage called `finish` and the shared progress
device's `complete_stage` immediately after Apple and Car each reached their
correct category. That awarded the AI Agent Badge without a deliberate
player verification action. The station now leaves both passed flags intact,
shows `Apple > Food and Car > Vehicle`, and temporarily turns its existing
Next Button/label into `Verify both item routes`. Pressing it is the only
new path to `finish` after both tests. The existing generation, round, owner,
and running guards are checked again before badge completion. Edits, replay,
release, and stage reset restore the normal Next prompt; returning to a
station with both tests passed restores the Verify prompt. No new device,
tracker, badge ID, or independent progression state was added.

The first Verse build reported code 3514 because `verify` is a reserved
identifier. The helper parameter was renamed; the subsequent UEFN MCP
`BuildAll` returned zero diagnostics. Live UEFN readback found four Agent
Mission station actors with station IDs 0-3, all pointing to the same placed
progress device. For each station, the `next_button` and `label_next`
wrappers resolved to non-null, distinct saved Button and Billboard actors.
The existing saved defaults still describe the normal Next action; the
temporary Verify wording is set by Verse only when both routes are ready.

This implements AC-027 in source and editor bindings, but not its runtime
acceptance. Under the owner's instruction to skip Play-in-Client, the Verify
prompt, button timing, badge-once behavior, release/reclaim, round reset,
and two-player isolation have not been exercised. T-024 remains unchecked.

The broader delivery story in plan sections 57-63 is also still open as
AC-028/T-025. Current source stages are seed-to-planter, dock-lamp sequence,
and Apple/Car sorting; source inspection and live actor-label searches did
not establish the plan's Medical crate selection, destination scanner,
blocked-Bridge/open-Dock choice, or reusable delivery skill. A label search
alone cannot rule out unlabeled generic meshes, but those interactions are
absent from the current Verse flow. The new verification gate should not be
mistaken for completion of that six-action capstone.
