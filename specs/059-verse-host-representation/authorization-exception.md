# Scoped delegation and readiness

Current task instruction: "The user has delegated plan approvals to agents; record actual agent review without fabricating human revision approval or weakening global approval rules." It also directs: "The user will test gameplay manually: do not launch games, sessions, cook, push, or playtest."

This is the task-specific delegation supplied by the Supervisor, consistent with spec050's recorded original owner instruction: "please work by yourself, review implementation plan by yourself or ask a producer do not use game testings, it will be done manually". It authorizes real agent review of this task's bundle, not a fabricated human review. No approval.yaml is created. Unmodified plan --ready will fail because it requires a human approval record. Record this failure; do not edit global rules/tools. Supervisor may use this explicit scoped instruction only after independent agent review is recorded against the current digest. Technical pilot and persistence gates still apply.

