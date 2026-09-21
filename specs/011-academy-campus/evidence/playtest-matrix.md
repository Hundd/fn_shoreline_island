# Academy campus playtest matrix

Status: in progress. This file records required checks and observed evidence.
Record the UEFN version, session date, tester, screenshots or capture, and
observed result for each run. Do not check a task off from an editor viewport
alone. End the game and session after each run.

## Release gates

| Gate | Required observation | Result / evidence |
| --- | --- | --- |
| Verse build | Build Verse Code completes with no blocking diagnostics | Passed after the Garden and Loop sign edits: `BuildAll` returned `[]` at 11:50 UTC on 2026-09-21 |
| Project validation | Validate Project passes after all saved actors and assets are loaded | User reports that validation and memory "look like everything is ok." The 13:01 UTC session log confirms local editor/sentry validation completed and upload succeeded. A distinct Project > Validate Project result or report was not captured, so this specific command remains unverified. |
| Memory | UEFN memory calculation completes and reports within publish limit | Passed in UEFN log at 13:03 UTC on 2026-09-21: `Result: SUCCESS`, highest memory usage `8,542 / 100,000`. The report sampled one location, `(0, 0, 0)`; see `memory-2026-09-21.md`. |
| Fresh session | Current content cooks; session connects; match reaches Running | Passed after the south hub guide edit at 11:57 UTC. A user-launched session activated content at 12:12 UTC and reached Running at 12:13 UTC; the user later reported the route/control smoke check "looks fine." Another user-launched run activated content at 13:02 UTC for memory calculation. Detailed station results remain pending. |
| Shutdown | End Game and Stop Session leave Disconnected / Unconnected | Passed for the 12:12 UTC session. After the 13:03 UTC memory run, MCP found `CanStart` / `Connected`; `StopSession` returned and final state was `Disconnected` / `Unconnected`. |

The 12:12 UTC session was launched from the UEFN interface. Its editor log
shows the local validation stage and successful content activation. The MCP
session state reports Connected / Running, but `GetClientLogEntries` cannot
attach to this interface-launched client; it reports that no client log was
found. The local `FortniteGame.log` is updating and shows repeated
`CreateFortPhysicsObjectComponent failed` messages for BuildingProp actors,
also seen in earlier sessions. A filtered scan from 12:12 UTC counted 20 of
these messages and no Verse error or warning lines. No player traversal or puzzle action is
established from those log lines. Record in-client observations below before
claiming any route or gameplay pass. After the run, the user replied "looks
fine" to a request to walk from the hub to all eight rooms and report any
blocked path, unreadable sign, or unusable control. Record this as a
user-reported broad route and presentation smoke check with no issue reported;
the reply does not identify each station used, puzzle success/retry, or a
multiplayer result. The session was ended and verified Disconnected /
Unconnected before this reply was received.

The subsequent memory run completed at 13:03 UTC with `Result: SUCCESS` and
highest memory usage 8,542 of the 100,000 budget, sampled at one location.
The preceding upload logged completed local validation and successful content
activation. At 13:01 UTC the editor also logged a handled staging-monitor
ensure about a missing FlowId; the upload and memory result still completed.
Treat the ensure as an editor diagnostic to watch, not as a project asset
validator failure. The user answered that validation and memory looked okay;
there is no separate captured Project > Validate Project result in the log.

## Solo route and presentation

Start at a fresh spawn. Follow the main promenade and each branch at normal
walking speed, with no jump, mantle, or fly movement. At every junction,
confirm the branch meets the spine without a step or gap. Read each room name
from the path and check that a nearby shape or landmark supports the name.
Return to the hub after each room. Record any camera collision, occluded sign,
hidden control, blocked aisle, or confusing turn with its room and station.

| Room | Critical approach | Four stations reachable/readable | Exit and hub route | Result / evidence |
| --- | --- | --- | --- | --- |
| Signal Lighthouse | Beacon portal and segmented console pods | Pending | Pending | Pending |
| Variable Vault | East doorway and all four supported button rows | Pending | Pending | Pending |
| Debug Workshop | Garage gantry and tool racks | Pending | Pending | Pending |
| Event Factory | Tower sign, conveyor, and bell area | Pending | Pending | Pending |
| Build-a-Bot | Open east end and hangar aisle | Pending | Pending | Pending |
| Tidepool Nursery | Pod sign and conservatory entry | Pending | Pending | Pending |
| Path Garden | Split planter and greenhouse frame opening | Pending | Pending | Pending |
| Loop Lagoon | Narrow spur between rear pylons and controls | Pending | Pending | Pending |

All eight rows received one collective user report of "looks fine" after
the 12:12 UTC session. No room-specific fault was reported. Keep the detailed
four-station, return-route, and control-action cells pending until individually
observed or described; do not convert the brief report into eight complete
station passes.

At Path Garden, read the new two-line plaque on the south arch post from the
promenade and walk the center and both sides of the greenhouse entrance.
At Loop Lagoon, read the smaller round sign from the junction, pass its post
without camera or capsule contact, and use Station 1 Claim. Editor views and
chest-height traces passed for both signs; player checks remain pending.

Returning north from Tidepool Nursery and Build-a-Bot, read the new
`ACADEMY HUB` sign on the grass east of the promenade. Walk the path center
and near edge past it without turning into the post. Its editor view and
three chest-height path traces passed; check in-client legibility and
clearance.

Near the hub at Y 0, the existing `byte_island_game_manager` occupies the
eastmost strip of the promenade. Editor traces were clear through X -150 and
hit at X -125. Walk past it on the main route without jumping; note whether
the player camera or capsule touches the device, especially while turning
toward Path Garden or Signal Lighthouse.

Editor line traces at chest height found a collision along the south edge of
the Signal branch at its Station 0 claim button and another along the south
edge of the Vault branch near its shell/station dressing. Walk both edges and
the branch centerlines in the client; record whether the player can pass at
normal speed without jumping. Both branches were subsequently moved and
narrowed, then saved and cooked. The new editor edge/center traces were clear;
the player walk test still applies to the revised geometry. See
`route-audit-2026-09-21.md` for coordinates.

Variable Vault now has four warm roof-mounted fixtures, one above each bay.
Check all four from normal camera height in the client for shade clearance,
readable boards and prompts, and useful illumination. The editor showed the
fixtures attached to the roof and a fresh session cooked, but this is not a
measured lighting or memory result.

Event Factory now has a second navy/gold nameplate on the north face of its
east tower, visible in a normal-pitch editor approach view and included in a
successful fresh cook. From the client, check that its text can be read from
the branch and that the tower-side route remains unobstructed.

Debug Workshop's original overhead plaque was lowered to world Z 2950,
retaining 440 cm of floor clearance. Build-a-Bot received a separate grounded
navy/cyan side sign north of its branch, 100 cm beyond the visual path edge.
Both names were visible from a normal-pitch editor view and cooked in a fresh
connected session. Check their text, camera clearance, and route collision in
the client.

Variable Vault now has a small two-line wall plaque at eye height on the
north side of its east doorway. Tidepool Nursery's existing pod sign was
moved 1200 cm north to straddle the branch and lowered to a readable editor
height; center and two offset chest-height lines through its opening were
clear. Both saved edits cooked in a fresh connected session. Check label
legibility, pod clearance, and routes with the player capsule in the client.

## Puzzle and station behavior

- Variable Vault station 1 through 4: read each board, press every intended
  control, complete a normal success, retry, Replay, and Hub return. Verify
  button prompts and ready/state feedback remain visible beside the navy and
  gold support rails. Record one result per station.
- Signal Lighthouse station 1 through 4: press each intended button and
  confirm the segmented decorative pods do not absorb interaction or hide
  state feedback. The original device meshes must remain visible.
- For the other six rooms, complete at least one normal puzzle path and one
  retry at each game, then check Replay and Hub where available. Inspect all
  four stations for reachable controls and readable boards.
- Compare buttons from two different games at walking height for AC-009.
  Record whether a distinct button treatment is actually present and whether
  both devices still show prompt/state and trigger their original action.
  Signal Station 0 Claim now has a gold beacon crest and stem behind the
  original device. Its editor view and fresh cook passed; specifically check
  that this pilot does not hide the Claim prompt, ready/state display, or
  interaction when approached from the south before repeating it.

## Shared state and multiplayer

With two players in one fresh session, use separate stations in the same
room. Confirm each player's controls, feedback, success, retry, Replay, and
Hub action affect only the intended station unless the game's design says
otherwise. Repeat in at least Variable Vault and Signal Lighthouse because
their new supports sit closest to button rows. Record player count, station
numbers, and each observed state transition.

## Evidence rule

Fill the result cells with observed outcomes and capture paths. A completed
session cook does not establish route collision or puzzle behavior. A local
validation pass does not establish memory or multiplayer readiness.
