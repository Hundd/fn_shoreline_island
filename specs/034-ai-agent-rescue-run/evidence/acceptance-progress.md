# Cooked acceptance in progress

This is not final acceptance. Current source includes clearly marked TEMPORARY acceptance fixtures, which must be removed before final build/cook. Do not check T06/T07 yet.

Observed native Fortnite playtests, using the normal shared Pulse Rifle:

- Normal unmodified spawn at Academy hub: normal-spawn.png.
- Without prerequisites: rescue rings absent; missing Prompt Workshop guidance; shooting the Medical crate did not progress. Corrected three-line locked board now fits: locked-readable.png.
- Actual Food and Tools shots rejected phase0, no credit. Medical advances to skill selection and visibly raises the immutable Medical crate.
- Actual Light and Announce shots rejected phase1, no credit.
- Delivery initially failed safely due to negated transacting TeleportTo. Repaired positive success branches; recooked and observed actual Pix/crate movement to closed gate. See movement-repair.md and gate-closed-carry.png.
- Actual corridor autorun crossed Route radius and advanced phase2 at 12:12:33 UTC, then overshot before stopping. Endpoint log: Pix(-6600,-14700,2460), Medical(-6600,-14600,2510). This proves physical traversal/arrival for that leg; it does not prove a controlled whole-run walkthrough.
- Subsequent fixture run positions the player at each beat only after genuine physical arrival/drop. This is separate from natural walking. All answers remain actual rifle input.
- Actual Announce and Force Through shots rejected phase2, no credit. Scan moves scanner and changes evidence from unknown to Dock Open, advancing phase3. route-unknown.png, wrong-announce-route.png, wrong-force.png, scan-open.png.
- Mainboards now use font14; rescue target labels use font18. Two-line choices and three-line CORRECT/TRY AGAIN fit at the observed standing firing point. Full crouch/muted/finish readability remains pending.

Current unresolved tests: remaining four wrong choices, Dock/drop, physical AC11 rejection and badge retry, reset/cancellation and controls, individual seven prerequisite guards, preserved legacy floor4 interlock, round reset, replay duplicate reward, sustained held fire, finish traversal, final validation/cook and fixture removal. Multiplayer has not been exercised; existing island max players is one.

Performance Warning is visible in game. Exact editor warning classification remains pending; do not claim warning-free validation.
