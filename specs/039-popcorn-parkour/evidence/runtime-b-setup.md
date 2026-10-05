# Temporary B saved setup checkpoint

2026-10-04. Planner cleared uniform test-only +Y1200 translation in harness-placement-review.md. Production map contract and device bindings are unchanged.

Three deck tops are [-4200,-17300,2520], [-3750,-17300,2520], [-3300,-17300,2520], each400×400×40cm with50cm edge gaps. Native BuildingProp StaticMeshComponent0 uses /VerseEngineAssets/Cube.Cube, Movable. Bounds readback agrees; starter downtrace from2600 returns80cm, proving top2520. Existing catch surface measured2412, so actual rise108cm; catch bounds maxZ2480 will be checked with real character origin in cooked play.

68 exact test_039 actors were saved individually; runtime-actor-inventory.json enumerates them for later QA and cleanup. This count includes the A diagnostic runner and the unconfigured schema placeholder controller, which is not a functioning harness. The harness subclass constructs records and calls the same generic controller initialize/transition/recovery code.

78 required savedActor wrapper bindings were read back: decks, mechanism props, effect arrays, target surfaces/meshes/boards/cues, isolated progress tracker+round, ribbon, HUD, existing shared hub. Native target script references and shared blaster reference read back. Replay and independent return button were bound after the count. Every gun surface has native TriggeredByDamage=true, TriggeredByPlayer=false, bReceiveDamageWhenInvisible=true, with matching ToyOptionsComponent.playerOptionData persistent overrides. No trigger methods are used as gun evidence.

Setup deliberately shares three instruction VFX, one wrong puff and one flourish because only one guarded routine executes at a time. Each target has independent selectable/objective cues to avoid End interference. Shared target optional active/hit/completion/wrong cosmetic VFX and audio remain absent and untested; this setup makes no cosmetic acceptance claim. Existing source documents optional identity-transform effect references.

BuildAll after current source returned [] diagnostics. Fresh full cook/private Play From Here was dispatched from [-4200,-17300,2540], yaw90. Runtime READY/input/grounding results remain pending; successful saved binding alone does not prove gameplay.
