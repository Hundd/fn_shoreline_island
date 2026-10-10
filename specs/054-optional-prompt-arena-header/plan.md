# Minimal active-name override

Only file: Content/fn_shoreline_island_academy_journal.verse.
Baseline SHA256: 8C90FC814F7973BA6DADF5CD1A72CFFD6B8D6A66B81D682AA588C92D0EF39C3F.

Add one journal-local constant near navigation messages:

```verse
    optional_prompt_arena_name<localizes>:message = "Optional Prompt Arena"
```

Inside the existing fresh-valid branch of navigation_refresh, preserve its complete guard and substitute only the active header argument:

```verse
                    else if (state.module_index >= 0, now - state.reported_at < 0.75, name := module_names()[state.module_index]):
                        var activity_name:message = name
                        if (state.source = 8, state.module_index = 0):
                            set activity_name = optional_prompt_arena_name
                        state.action.SetText(navigation_step(activity_name, state.step, state.total, state.instruction))
                        set pulse = -1
```

No helper or new persistent state is needed. Keep branch order and all surrounding count/pulse/marker code verbatim. Do not globally rename garden_name or module_names, alter report signatures/IDs, or special-case source8 before validity checks.

Source identity evidence: current prompt_blaster navigation_monitor reports `(input_player,8,0,step,5,...,generation)` at line417; prompt_workshop reports `(input_player,0,0,step,6,...,generation)` at433. Other sources1..7 report their existing module indices. Current journal053 active branch resolves name from module_names after nonnegative/freshness checks. Same-source older-token rejection and report cleanup remain untouched.

| Case, after handoff expiry unless stated | Expected name/selection |
|---|---|
|source8,module0,fresh valid|Optional Prompt Arena|
|source0,module0,fresh valid|1 Prompt Workshop|
|source8,module1..7,fresh valid|Existing canonical module name|
|any other source,module0,fresh valid|1 Prompt Workshop|
|any source,other valid module,fresh|Existing canonical module name|
|source8,module0,age exactly0.75s or greater|Existing stale fallback; no override|
|source8,module-1 or out-of-range|Existing invalid fallback; no override|
|any report while now<handoff_until|Existing handoff; no override|
|8/8,fresh arena report,expired handoff|Optional Prompt Arena with count8/8|
|8/8,no qualifying report|Existing navigation_done|

Verification: review narrow journal diff and exact identity guard/validity/fallbacks; compare other sources untouched. Run native BuildAll and record diagnostics. No implementation-mirroring tests or editor inventory needed. Project validation through a supported editor mechanism only if available, otherwise pending. Manual AC04 is not inferred from compile.

Rollback: remove only added constant/local conditional and restore navigation_step(name,...) argument; preserve053 reorder and unrelated changes.

Geometry exception: only existing HUD activity-name presentation changes. No layout, mission mechanics, availability, timing, state or reward mutation; apply repository small-source-fix exception, with no new map.yaml, geometry generation or readiness digest. Preserve all prior feature review/approval artifacts. Concrete copy/pair receives Producer review before implementation under current delegated authorization.
