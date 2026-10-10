# Movement verification implementation

2026-10-10. debug_station source only; baseline matched plan, reviewed manifest/artifact hashes exact. Delegated Producer review used; human-only readiness limitation retained honestly. Backup/diff/hash/native source evidence recorded. No native settings/asset mutations.

move_pix returns true only for valid marker, positive TeleportTo success and valid full3D readback Distance<=5cm. Teleport side effect is in positive success branch, never inverted failure context. False teleport fails even when already near destination. Pose retains marker_home rotation/scale.

Control-flow audit: demo initial placement and independent execute start confirm before actual tile assignment; every command including STOP computes candidate and confirms before updating. Post-move run_valid precedes display/credit. Any movement failure enters guarded recovery then caller returns, so no mismatch/mistake/progress/light/MATCH/phase path is reachable. Recovery clears actual observation, retains stage/commands/goal/mistakes/demo evidence, shows exact persistent HUD, waits1s, rechecks validity and uses existing quiet rearm. No automatic retry. await_quiet now rejects invalid attempt before touching last_hit/targets; existing loop validity and0.5s quiet retained.

before_verified starts false each demo and becomes true only after whole confirmed demo. Failed demo followed by correction keeps BEFORE --; successful correction cannot fabricate prior observation. actual_verified clears at attempt/failure and only confirms reached positions. Reset clears both. Canceled attempts return silently before recovery/presentation/rearm; existing reset owns cleanup.

All editable/stage/default declarations and normal endpoint success/mismatch/progress branches byte-identical. debug_progress and event_station hashes unchanged. Exposed controller settings/parent stage refs/targets/control refs and marker savedActor/full transform match Planner baseline after compile. Inner stage reads remain unsupported as documented; source/defaults and parent references preserved, not claimed live-measured. UTF-8/CRLF retained.

Native BuildAll returned [] (zero diagnostics); native ReadFile captured edited source. Project validation unavailable/unperformed. Final game Unconnected, editor open, no pending calls at release. No session/game/cook/push/playtest/fault injection.

Manual A1-A6 remain unchecked: normal lesson, start/intermediate/STOP failure and beyond-tolerance readback, truthful unknown demo evidence, genuine mismatch hints, cancellation during execution/recovery, persistent-failure retry/Return. Static review/compile do not establish physical failure behavior or learning/readability acceptance.
