# Task-specific review and testing exception

Actual user instruction in the current chat: "please work by yourself, review implementation plan by yourself or ask a producer do not use game testings, it will be done manually".

This later instruction authorizes autonomous review and implementation within the current auxiliary-device task and assigns gameplay testing to the owner. It overrides the local requirement to wait for explicit human review of this revision. It does not constitute a human review of this artifact. Do not write approval.yaml asserting a human approved the concrete design.

Unmodified readiness tooling demands a human approval record and therefore exits 1. The reviewed manifest is e649f83591d28ce4c758e8747ba4b92ef5f31a970e8fbd12f6c9da62c0d3aa69. Offline check/gate pass with no blockers; recommendation is bounded native visibility/no-collision configuration and Outliner folder on one preserved actor. Implementation may proceed after the delegated Producer review is recorded, under this explicit per-task exception. Do not weaken global rules or tooling, modify unrelated gameplay, or generalize this exception to future tasks.

No Launch Session, StartGame, PushChanges, cooking or playtesting. Editor inspection, saving and non-game validation remain allowed. Keep manual acceptance pending and report it accurately.
