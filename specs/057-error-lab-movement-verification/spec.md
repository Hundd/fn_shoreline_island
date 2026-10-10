# 057 — Confirm Error Lab movement before credit

Producer input: docs/producer/error-lab-movement-verification.md. Preserve accepted031 lesson and scene. Source shows movement failure is currently ignored; no player-observed failure is claimed.

## Requirements

- R1 Confirm every scored/demonstrated start placement and instruction destination, including STOP at the same tile: marker valid, TeleportTo succeeds, full3D destination Distance <=5cm. A false teleport result is failure even if already near destination. Only a confirmed placement updates actual_tile; no credit until the entire rerun is confirmed.
- R2 Failed active demonstration/correction aborts immediately, no MATCH, recap, phase/light/progress award or learner mistake increment. Show `Pix couldn't move. Try your correction again.` Retain authored stage/goal and use existing1s result pause and quiet-fire rearm. No automatic rerun, new buttons or fault injection; Return stays available.
- R3 No fabricated observations: BEFORE is available only after the complete faulty demonstration confirms every placement; show BEFORE -- otherwise. NOW is available only for a confirmed current position; show NOW -- after a failed/unknown position. A failed demonstration must not resurrect its computed endpoint on the next correction.
- R4 Cancellation is silent: preserve owner/character/in-bay/generation/phase guards before/after waits, movement and recovery. Do not write stale board/HUD or reactivate targets for canceled runs. Quiet rearm requires the same valid attempt owner and0.5s since last shot.
- R5 Preserve three programs, slots/answers, editable values/references, geometry, targets/labels, successful0.5s instruction cadence, initial0.5s demonstration pause,1s results, correction feedback, genuine wrong-endpoint hint escalation, Replay and one-time badge. Only Error controller source changes; no shared class or Tool Lab changes.

## Authored stages preserved

| Phase | Start | Goal | Commands (LEFT0, STOP1, RIGHT2) | Edited slot | Correct ID |
|---|---|---|---|---|---|
| 0 | 0 | 3 | [2,0,2] | 1 | 2 |
| 1 | 2 | 1 | [2] | 0 | 0 |
| 2 | 1 | 2 | [2,2] | 1 | 1 |

Table is source/default and031 contract evidence. Current parent stage references were measured; friendly inner Verse fields could not be read with supported ObjectTools (evidence/live-baseline.json). No stage mutation is needed or permitted.

## Acceptance scenarios — manual runtime checks pending

- A1 Given every placement confirms, when all three correct programs execute, then normal timing, verified endpoints3/1/2, lights, phase progression and single badge remain (R1,R5).
- A2 Given start/intermediate/STOP teleport false or readback beyond5cm, when an active correction executes, then return before success and wrong-endpoint logic; no mistake/credit/phase change; NOW --, recovery copy and same-stage quiet retry (R1,R2,R3).
- A3 Given failed automatic demo, when next correction starts, then BEFORE -- remains until a genuinely completed demo from a later stage/replay; no MISMATCH presented as observed faulty-plan evidence (R2,R3).
- A4 Given a completely confirmed wrong endpoint, when correction completes, then existing mismatch/mistake/hint behavior remains, with truthful observed BEFORE if available (R1,R3,R5).
- A5 Given reset, Return, disconnect, respawn, round change or out-of-bay during execution/recovery, when old work resumes, then it exits silently; no stale message or rearm (R4).
- A6 Given persistent movement failure, when learner chooses again after quiet rearm, then authored start is freshly confirmed, safe no-credit failure repeats without automatic retry; Return remains usable (R2,R4).

No game/session/cook/push, gameplay input or production fault injection is authorized. Native compile and static review do not pass these runtime scenarios.
