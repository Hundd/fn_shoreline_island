# AI Tool Lab: Pix's Dock Rescue — revision 1

Requested: replace the previous AI Tool Lab game with a fun, educational, intuitive single-player activity. This feature supersedes Tool Lab gameplay in feature 007 and feature 022 AC-036; it does not alter the other labs or the interrupted Error Lab work in feature 031.

## Requirements

- R-01: One compact solo activity begins within 0.5 seconds of entering the bay. No Claim, connection cycling, test buttons, demonstration quiz, or manual Next.
- R-02: Stable targets A SCANNER, B SPEAKER, C LIGHT are the only lesson inputs. Shoot once using the existing Data Blaster; no enemies, damage penalty, timer, inventory puzzle, or mandatory jumping. All choices stay available during decisions.
- R-03: Three ordered requests teach task/tool/result matching. Each correct action must produce and verify its authored result before progress advances; a selected ID alone is insufficient.
- R-04: Every wrong action produces a safe, truthful tool result and explains why it cannot satisfy the current request. Retry preserves earned steps and known crate contents. Never invent contents or allow Speaker to announce unscanned contents.
- R-05: Sole-player state; no claim queues, team roles, or multiplayer objectives. More than one active player pauses input with a clear message. Set the island player limit to 1 through UEFN settings as part of this explicitly requested single-player design; preserve other matchmaking settings.
- R-06: Short persistent request/result board, automatic hint after 8 seconds idle, words and symbols alongside color, readable at the firing position with audio muted. Introduce: "Help Pix ready the dock. Shoot the tool that fits the request."
- R-07: Three verified steps award the existing Tool Master Badge exactly once per manager round. Finish recap: "Scanner finds information. Speaker shares it. Light brightens a place." Targets hide after finish; Replay and Return remain available.
- R-08: Replay/reentry restart all three tasks and restore props while keeping earned badge. Leave, Return, death/respawn, disconnect, extra player, and round reset cancel outstanding actions. Round reset clears badge through the existing manager lifecycle.
- R-09: Remove the four old Tool Lab games, their obsolete controls, labels, and duplicate display props after exact binding audit/checkpoint. Reuse one controller and the shared progress/tracker/journal/round/audio/loadout/hub references. Preserve floors, structural shell, rails, safe walking routes, and neighboring labs.

## Three requests

| Step | Request | Correct tool | Verified visible result |
|---|---|---|---|
| 1 | What's inside the mystery crate? | A SCANNER | Scan sweeps crate, panel opens, three labelled MEDICAL SUPPLIES packages appear; result says "Found: medical supplies." |
| 2 | Tell the dock crew what we found. | B SPEAKER | Speaker pulses, caption "Crew notified: medical supplies" and a crew-ready checkmark appears; optional sound accompanies it. |
| 3 | Brighten the dock so the crew can collect it. | C LIGHT | Dock lamp changes OFF to ON, visibly lights the delivery pad, Pix moves onto the pad and holds a ready pose. No AI navigation or moving boat. |

All outputs are authored simulations, not a live AI service. Scanning reveals authored information; speaking requires that observation. Light is useful for lighting and cannot reveal crate contents.

Wrong-action matrix: step 1 Speaker says "Contents unknown—scan first", Light lights the pad but leaves crate unknown; step 2 Scanner repeats known contents, Light lights the pad but does not notify crew; step 3 Scanner repeats contents, Speaker repeats the announcement but leaves pad dark. Preview-only light changes revert to OFF before a new choice until step 3 succeeds. Each wrong result includes the still-unmet request. No step credit is given.

## Acceptance scenarios

- AC-01 (R-01/02/06): Given a fresh solo entry, when the player walks in, then step 1 and all three labelled targets appear within 0.5 seconds, with the rifle available and no extra start interaction.
- AC-02 (R-03/04): Given step 1, when Scanner is shot, then the reveal completes, known contents become medical supplies and exactly one progress step is credited. Before scanning, Speaker cannot disclose the contents.
- AC-03 (R-03/04): Given scanned supplies, when Speaker is shot, then the visible announcement and crew-ready state precede exactly one step credit; the crate stays scanned.
- AC-04 (R-03/07): Given step 3, when Light is shot, then dock lighting, ON caption and Pix's pad pose precede the final credit and one Tool Master Badge. Targets disappear after finish feedback.
- AC-05 (R-04/06): Given each decision, when either incorrect tool is shot, then all six wrong cases show the truthful output and actionable mismatch, no credit, no game over, and a retry after at most 2 seconds.
- AC-06 (R-02/03/08): Given rapid fire during action/transition, when repeated hits arrive, then input locks prevent duplicate steps or skipping. Unlock only after 0.5 seconds of quiet input, so held fire cannot answer the next request.
- AC-07 (R-07/08): Given completion, when Replay and completion repeat, then fixtures reset, all three tasks are playable and tracker remains 1/1. Return works during every phase.
- AC-08 (R-05/08): Given action in progress, when leave/respawn/disconnect/round reset or a second player occurs, then generation cancellation prevents late credit/effects; single-player reentry starts clean and round reset clears badge.
- AC-09 (R-02/06/09): Given standing/crouched play and muted audio, when all tasks are played, then labels, crate reveal, announcement, and lamp state are readable, targets have unobstructed matching hit faces, approach and Return need no jump, and old game signals are absent.
- AC-10 (R-03/09): Given bound scene and built Verse, when UEFN validation and a fresh cooked solo session run, then no unresolved validation errors remain and AC-01..09 have expected/actual evidence. Editor success alone is not acceptance.
