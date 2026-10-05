# Concrete maintenance review - 2026-10-05

Planning only. No map or gameplay source mutation performed. Native inspection measured ring0/1/2 at world (-2580,-17400,2680), (-2580,-17280,2680), (-2580,-17160,2680), all scale(0.12,1.4,1.4). Adjacent centers are 120cm apart; 140cm rings overlap by20cm. Proposed outer movement of40cm changes that overlap to20cm clearance. All30 corresponding supports have exact full before/after transforms in scene-delta.json. The middle receiver stays in place.

R01: scale and target density are reasonable within the existing bay. No deck moves, different jumps, new interaction, route, gate, asset, or extra walking. The two outward targets remain reachable by rifle from the same starter. Native readback is not cooked readability or collision proof.

R02: source confirms production geometry_changed hides only mechanism index2. Deactivating the used target and hiding all three mechanisms after successful animation removes the entire machine without removing the popcorn landing needed for parkour. LOAD/HEAT completion derives from the existing prefix; other receivers use consumed state. No reward/state-machine redesign required. Teaching cues must respect used-machine visibility, and Replay must restore all parts.

R03: monitor currently calls recover inside the catch area whenever prefix>0, including finished attempts. The proposed finished guard resolves the owner's free-movement request without clearing ownership or created geometry. Existing Replay/Return and round/departure cancellation remain.

Offline bundle generation succeeded; gate passed with0 violations and0 blockers. Three inherited advisories accepted: single-target reuse/finale are deliberate skill invocation, with existing grounded/ownership/wrong-order feedback; separate knowledge_room is unnecessary because LOAD/HEAT/POP and the ribbon teach the skill physically. v1 course_routes success_target represents only its first receiver; the embedded existing runtime graph is authoritative for equal branches and finish landing. Added branch targets to the grouped active inventory to resolve inherited unused-marker gate findings, without changing runtime sequence.

Generated review-manifest digest: 60d77e01330e8a58a815c77c7ee1d22d7b728ea03f5acecf6a4ac9cc5873fc4d. No approval record exists for040. Historical039 approval is preserved.

No tests, project validation, cook or playtest run. Owner requested no testing at the end. Active match was stopped with StopGame=Completed and verified GetGameState=CanStart; editor remains open. Implementation/acceptance remain pending actual human approval and subsequent execution.
