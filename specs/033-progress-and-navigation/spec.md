# Feature 033: Progress and navigation

Status: Authorized autonomous implementation (see authorization.md) — requested specification, not implementation approval.
Date: 2026-10-02

Producer handoff (2026-10-03): [Progress and navigation brief](../../docs/producer/progress-and-navigation.md).
The brief prioritizes this draft; it does not approve implementation.

## Player outcome

At any point, players can tell how many modules they have restored, what to do
next, and where that activity starts. Build on the existing eight-module AI Core
progression, using a compact persistent HUD, numbered map locations with a named legend and consistent
guidance. The user's `3/5 games passed` example becomes `3/8 modules restored`
because the current completion model contains eight unique modules.

## Scope and module identity

| Marker | Module | Recommended destination | Completion source |
|---|---|---|---|
| 1 | Prompt | Prompt Workshop | Garden manager Prompt badge |
| 2 | Pattern | Pattern Scanner | Lagoon manager badge |
| 3 | Classifier | AI Classifier | Journal later tracker index 0 |
| 4 | Confidence | Confidence Core | Journal later tracker index 1 |
| 5 | Error | AI Error Lab | Journal later tracker index 2 |
| 6 | Tools | AI Tool Lab | Journal later tracker index 3 |
| 7 | Skills | AI Skills Lab | Journal later tracker index 5 |
| 8 | Agent | AI Agent Mission | Journal later tracker index 4 |

The first seven remain explorable under their existing access rules; the sequence
is a recommendation, not seven new hard gates. Agent requires all first seven.
The older Prompt arena remains an optional alternative for module 1; completing
both Prompt activities still contributes only one module. Discovery Trail and
other optional activities do not increase the denominator.

Out of scope: rebuilding games, moving rooms, deleting the older Prompt arena,
changing rewards or difficulty, cross-session persistence, matchmaking changes within 033 (037 owns the authorized solo settings),
and publishing. Local step reporting is included; changing mission steps is not.

## Requirements

- **FR-001 — Authoritative count.** Display `N/8 modules restored` using unique
  earned module badges for the current player and round. Never award progress
  from entering an area, showing a marker, opening the journal or replaying.
- **FR-002 — Persistent HUD.** Show a compact noninteractive progress panel within
  two seconds of spawn and update it within one second of confirmed completion.
  It must not capture movement/aim input or obscure aiming and mission feedback.
- **FR-003 — Next destination.** Outside an activity, show the first incomplete
  available module in the table order, showing its full name and matching map-marker
  number. While inside an activity, show its current action instead. Resume the
  recommendation on exit. An unavailable binding must not be treated as completed.
- **FR-004 — Map locations.** Show module entrance labels `1` through `8`
  on both minimap and overview map, plus a distinct `HUB` marker. Keep the
  full numbered destination name in the next-action HUD and all eight numbered
  names in the journal; the numbered hub Core labels provide a world legend.
  Numeric map labels must remain distinct at normal overview zoom, including
  nearby markers 3 and 4. Direct players to
  a walkable entrance, not a roof, target or room center. Pulse only the current
  recommended destination for that player; suppress its pulse while playing there.
- **FR-005 — State clarity.** Journal rows show Available, In progress, Completed,
  or Locked using text and symbols as well as color. Completion takes precedence
  over replay activity. Agent displays `Locked — restore all 7 other modules`.
  Base map icons identify locations; personal state is shown in the HUD/journal,
  avoiding an unverified requirement for per-player map icon recoloring.
- **FR-006 — Consistent start.** Spawn guidance, hub signs, journal and marker 1
  recommend Prompt Workshop. The older arena is explicitly an optional Prompt
  alternative earning the same module. Do not direct first-time players to two starts.
- **FR-007 — Completion handoff.** First completion shows the module name, new
  count, and next destination for four seconds without blocking input. Then only
  the compact HUD remains. Replay does not repeat a first-completion celebration.
- **FR-008 — Local progress.** Every required activity reports its actual current
  step and total, plus one short actionable instruction. Display `Step X/Y`
  separately from island completion. Use each controller's actual stages; do not
  assume every game has three steps or count introductory animation as a solved step.
- **FR-009 — Finale.** When the first seven are complete, mark Agent available,
  show `Agent Mission unlocked`, and navigate to marker 8. At 8/8 show
  `Pix restored!` and `Replay a game or explore`; clear the required-objective pulse.
- **FR-010 — Lifecycle.** Retain earned modules through respawn and local replay
  within a round. New rounds reset count and recommendations with their owning
  managers. Cancel stale UI/pulse callbacks on round change or player departure.
  Retain internal attribution and cancellation guards. This solo rollout supersedes multiplayer acceptance with feature037 admission and lifecycle coverage.

## Acceptance scenarios

| ID | Requirements | Given / When / Then |
|---|---|---|
| AC-01 | FR-001,002,003,006 | Given a fresh round, when a player spawns, then within 2 s the HUD shows 0/8 and Prompt Workshop / marker 1, agreeing with signs and journal. |
| AC-02 | FR-001,007 | Given 2 distinct modules earned, when a third completes, then within 1 s all progress displays show 3/8 and a 4 s handoff names the next destination. |
| AC-03 | FR-001,006,007 | Given Prompt is earned, when the player replays Workshop or completes the older Prompt arena, then the count stays unchanged and no first-completion celebration repeats. |
| AC-04 | FR-003,004 | Given an incomplete module destination, when the player matches its full numbered HUD/journal name to the distinct numeric label on either map at normal zoom and follows its pulse, then the matching numbered entrance is reachable without guessing or mandatory jumping; on entry the pulse stops. Test all eight modules; verify all eight journal names and numbered Core labels agree with marker IDs; separately verify HUB is visible and reachable as a location marker, without requiring an objective pulse. |
| AC-05 | FR-003,005,008 | Given an available activity, when entered, advanced, retried and exited, then the journal and HUD show accurate state/step/action, and the recommendation resumes on exit. Verify each controller's actual total. |
| AC-06 | FR-005,009 | Given six prerequisite badges, when Agent is inspected, then it is locked; when the seventh is earned, then it unlocks and marker 8 becomes the destination. |
| AC-07 | FR-009 | Given seven modules, when Agent completes, then the count is 8/8, the finale message appears, and no required-objective pulse remains. |
| AC-08 | FR-010 | Given partial earned progress, when the player respawns or replays, then earned progress remains; when the round restarts, then count, active step, journal and pulse reset without stale messages. |
| AC-09 | FR-002,004,010 | Superseded for authorized solo rollout by 037 SA-01 admission / SA-04 lifecycle. Preserve historical two-player evidence; do not mark multiplayer tested. |
| AC-10 | FR-002,005,007,008 | Given normal and compact display sizes and keyboard/controller input, when aiming, moving, reading feedback and opening/closing the journal, then UI is readable, nonoverlapping and returns input correctly. |
| AC-11 | FR-001,003 | Given a missing completion binding in a controlled test, when guidance refreshes, then it neither awards the missing module nor claims 8/8; diagnostics identify the binding and guidance avoids a false completion. |
| AC-12 | FR-003,010 | Given modules completed out of recommended order, when guidance refreshes, then it selects the first remaining eligible module; round reset during a handoff cancels the old message and pulse. |

## Evidence baseline

Current source: `Content/fn_shoreline_island_academy_journal.verse` contains
`completed_modules`, `recommendation`, `first_seven_online`, transient transfer UI
and round/departure cleanup. `fn_shoreline_island_hub_signs.verse` directs players
to the older arena while journal guidance names Workshop. Both Prompt controllers
call `award_prompt_badge`. These are source findings, not new gameplay acceptance.

## Autonomous-work authorization

The latest user instruction authorizes implementing uncommitted single-player and walkthrough updates without another plan-approval question. See authorization.md. Walkthrough means this feature's persistent progress, map navigation and actual local-stage guidance; no new scripted tour. Feature037 owns admission, solo copy and worldCore. Live survey resolves concrete entrance markers; build/cook and full gameplay remain separate evidence.
