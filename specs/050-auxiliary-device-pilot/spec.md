# Auxiliary device pilot

2026-10-09. Scope: one existing Skills/Popcorn progress host, not all Agency computers.

R1: The nursery progress host shall be configured invisible in game and noncolliding from its saved native settings. Existing OnBegin Hide remains. This makes auxiliary intent explicit; current cooked collision is unknown and no measured player obstruction is claimed.

R2: Preserve actor/script identity, all references, enabled state, full transform, components and mission behavior. No replacement actor, class, mesh asset, Verse changes or underground relocation.

R3: Organize the host under editor folder `Infrastructure/Skills` while retaining its existing recognizable label. No player-facing decorative substitute is needed for background logic.

R4: Do not launch, cook, push, start or play a game. Gameplay acceptance is manual at the user's request. Verify editor readback/save and available non-game validation only.

Acceptance: Given saved pilot state, when inspected, visibleInGame is false and bNoCollision is true, original script/enabled state/identity/transform and all five incoming progress bindings remain. Given the Outliner, the original label appears in Infrastructure/Skills. Given a manually launched round, the owner verifies no irrelevant computer or collision, Skills completion, once-only badge, replay, Return and fresh-round reset. The latter remains pending, never inferred from editor success.

Authorization: the user said, "please work by yourself, review implementation plan by yourself or ask a producer do not use game testings, it will be done manually". This delegates plan review and waives automated gameplay testing for this task. It is not human approval of an unseen concrete revision. See review.md and authorization-exception.md.
