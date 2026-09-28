# Spec 026 implementation and partial acceptance — 2026-09-27

The user approved the original layout and the surveyed floor-height correction. Current review digest: de84624b40bbb318185c7bea60753994e30310c9265eed68aa9c520db7f1d4a8. `python tools/map_workflow.py plan specs/026-prompt-lab-aim-refine-deliver/map.yaml --ready` passed after implementation with the informational 43m optional arena-to-reward walking review.

## Saved editor implementation

87 unique actor transforms were applied in serialized groups, read back, and saved. Board and all target hit anchors use approved positions. Reactor/scanner/storage floor machinery and reactor floor effects preserve surveyed Z while translating XY. Full transforms and incremental operation results are in resolved-delta.json and move-*.json. Pre-move saved external actor packages are checkpointed in pre-move-recovery.zip with their manifest.

Controller and target fields/bindings remained unchanged (post-move-bindings.json: all_unchanged true); 32 Verse source hashes matched the baseline. No gameplay source changes were made.

## Cooked solo observations

Launch used Play From Here near the firing area. Initial inventory contained one Pulse Rifle and DATA was 0. This initial launch does not establish normal hub spawn flow. Native LogValkyrie recorded fresh local validation completion at 15:44:57.067 and launch success at 15:45:09.037. A cooked client game ran successfully. A separate manual Project > Validate Project command is not claimed.

| Check | Observed evidence | Acceptance limitation |
|---|---|---|
| Walking entry | ramp-walk-result.png, no jump input used | Corner approach initially blocked; full prescribed hub-to-ramp route still needs confirmation |
| Intro explanation | hub-approach.png shows Knowledge explanation | Full 2s/7s timing not measured |
| Wrong RED | wrong-red-fire.png, wrong feedback, 0 DATA | Cue animation timing not measured |
| BLUE | blue-aim.png outer-left ring aim, blue-hit.png success +1 | Native hit coverage survey supports coverage; not all nine outer-third hits tested |
| LARGE | large-hit.png success; next stage visible | Label partially overlaps another assembly in this view |
| SMALL BLUE | small-blue-wrong-b.png wrong feedback, 2 DATA | Earlier small-blue-wrong.png captured a missed attempt, not rejection evidence |
| LARGE BLUE | large-blue-hit.png success; acquisition-view.png 3 DATA | Exact common firing coordinate was not read from client |
| Acquisition/delivery | acquire-hit-b.png shows 5 DATA and delivery feedback | A 1s burst acquired the core then accepted REACTOR along the same sightline; isolated 4 DATA freeze, early destination and SCANNER/STORAGE rejection checks remain open |
| Finale | finale-result.png shows 8 DATA and enabled rail | Badge ownership, complete HUD communication and rail boarding not independently verified |
| Round reset | round-restart.png shows normal hub spawn, one rifle, 0 DATA after StopGame/StartGame | Other shared state reset cases remain open |
| Walking return | west-return-a.png shows partial backward walk with 8 DATA retained | Full west ramp exit and re-entry not established |

The burst advancing both acquisition and destination is a runtime concern for deliberate WHERE learning. This is an observation, not yet a confirmed requirement failure: deliberate isolated hits and prescribed firing position need further testing. No corrective layout or gameplay mutation was made without design approval.

Client performance warning remains visible. Warning causes require review; successful launch does not prove warning-free project validation.

## Remaining acceptance

Follow-up evidence: walking-acceptance.md now proves normal spawn and walking entry, reverse exit to grass and re-entry without jumping. stationary-solo-acceptance.md proves isolated acquisition at4 DATA, early destination inactivity, SCANNER/STORAGE rejection, separate REACTOR recovery,8 DATA finale and completed-target reward protection from one stationary firing position. These supersede the corresponding earlier limitations in the table above; exact firing-point return coordinates, moving outer-third impact and complete lifecycle/feedback gates are still unproven.

V01–V03 remain unchecked. Required work includes normal hub-to-room flow, isolated acquisition/destination checks, all intended shot paths/outer-third coverage, full walking return, replay during delayed states, respawn and playspace departure, two real players for attribution/simultaneous/late-join policy, and first-time-player learning/readability/enjoyment feedback. Tester availability was requested through the conversation; no feedback or multiplayer outcome has been invented.

Desktop automation used existing Fortnite-scoped project helpers because the computer-use native pipe was unavailable. Foreground ownership was checked; key/button holds were bounded and released. Changes to helpers are local Saved cache work, not project gameplay source.

Final StopGame returned Completed. GetGameState returned CanStart. The UEFN editor was left open. This is an implementation checkpoint with partial acceptance, not a claim of complete spec acceptance.

## Replay/respawn follow-up

See replay-respawn-acceptance.md for the cooked solo follow-up: the actual replay control was accessible, replay after BLUE restored color choices and retained 1 DATA, and confirmed respawn returned to the hub with 1 DATA and one Pulse Rifle. These supersede the generic replay/respawn gaps above only for those observed cases. Delayed-state cancellation, badge retention, playspace departure, multiplayer and first-time feedback remain unverified. This follow-up also ended with StopGame Completed and game state CanStart.

Timed intro replay evidence is now recorded in intro-replay-cancellation.md and replay-intro-timeline.json. Replaying at ~3.2s prevented activation at the old 9s deadline; color choices activated after the restarted intro. Remaining delayed-state replay checks are rejection, moving core and finale. Exact transition timing and human/multiplayer gates remain open.

Further cooked evidence in rejection-moving-replay.md supersedes the rejection/moving reset gaps for the observed solo cases: immediate wrong-hit replay restored BLUE at0 DATA; replay from a visibly moving acquisition restored stable initial choices and retained3 DATA. Server-side rejection overlap timing, full motion/hit coverage, finale cancellation, badge guard, human feedback and multiplayer/departure remain open. This test ended with StopGame Completed and GetGameState CanStart.

Finale/badge follow-up: finale-badge-replay.md supersedes the solo finale cancellation and badge ownership gaps. Reset during delivery preserved5 DATA without the delayed bonus; recovery and repeated completion/replay produced13 then21 DATA. The personal journal after replay/repeated completion/respawn showed Prompt Lab ONLINE and1/8 modules. Multiplayer/departure, full timing/coverage, manual validation limitations and first-time feedback remain open. This test ended with StopGame Completed and GetGameState CanStart.

Moving coverage follow-up: moving-coverage-acceptance.md records fixed-camera handoff/sweep frames and a promptly fired outer-third aim accepted at4 DATA, followed by a stable frozen core. Before-shot radial distance was0.80246, capture-to-press gap10ms. This supersedes the earlier moving peripheral-aim tool-latency gap for the observed case; exact server collision coordinates and world-space extremes remain indirect. Other coverage/readability and external multiplayer/human gates remain open. StopGame Completed, GetGameState CanStart.
