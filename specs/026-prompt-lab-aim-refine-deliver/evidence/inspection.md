# Planning inspection - 2026-09-27

Read AGENTS.md, both AI_MAP instruction/workflow documents, MAP_SPEC, patterns README, project Map Planner/Blockout Reviewer skills and relevant Unreal MCP skill references. Read feature023 spec, feature024 spec/plan/tasks/acceptance and latest recovery/boarding evidence, feature025 map/migration/review, current prompt_blaster, data_target, data_blaster and data_energy source, and legacy handoff source.

## Measured / directly observed

- Native MCP lists official Session, Device, Actor/Scene/Object toolsets; AgentSkillToolset absent. Use project-local skills.
- GetGameState returned Unconnected during inspection; no session launched.
- Native ListDeviceProperties/GetDeviceProperties show configured=true and nine target references in order. Native-device references appear as Verse wrappers and need savedActor reconciliation, not guessed refPath rewriting.
- Fresh serialized get_actor_transform of nine hit surfaces, board, module, rail actor and entry volume match feature025 evidence exactly. Full transform results retained in read-only-inspection.json.
- Historical measured floor bounds x6000-12600,y-8500--2300,top z2410cm; west/north ramps in feature024 `prompt-entry-ramps-2026-09-27.md`. Only west inbound walk has cooked proof cited there.

## Source-supported behavior, not new runtime proof

- Existing fixed five-hit sequence with shared state; only target3 is an objective in existing evidence. `targets` is editable; stage rules, timers, motion offsets and hint strings are hardcoded.
- Existing data_target parks inactive surfaces100m below home, tracks labels/rings/particles during movement, attributes actual shooter and clears wrong feedback after0.4s. Reposition whole assemblies; do not remove these fixes.
- Existing manager grants one blaster on join/respawn through its configured granter; no new weapon source is needed.
- Replay resets room generation and effects but does not clear participant map or DATA. `PlayerRemovedEvent` drives last-participant reset; no `AgentExitsEvent` subscription. Feature025's shorthand 'last departure' must not be read as room-volume exit. Badge guard is separate from repeatable DATA rewards.
- Prior feature024 source/playtests show a working solo five-hit finale with8 DATA and several recovery fixes. The latest return boarding comparison still leaves attachment/hub arrival unproven. Two-player lifecycle and first-time-player feedback remain unaccepted.

## Design assumptions / unsupported additions

All relocated anchors,3m clear lanes, lowered-board readability and full assembly clearances are proposals. Top-down preview cannot prove mesh pivots, trigger footprints, sightlines, projectile collision, rail spline or accessibility in the cooked build. No imported/purchased assets are required. Reuse existing PromptLab colored materials, DataBlaster ring/grey materials, current props, board, audio and VFX; material/asset paths must be read back before any future writes.

Live generative AI, adaptive coaching, room-exit auto-reset, per-player puzzle state, arbitrary stage configuration, new carry/throw mechanics and new waves are not supported by this proposal. Adding any requires another reviewed design/code scope.

Only new feature026 planning files are authored. Gameplay source and editor content are left untouched; source-baseline.json supports final hash comparison. No save, build, push, actor mutation, source edit or approval write was issued.
