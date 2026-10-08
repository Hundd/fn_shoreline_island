# Pix mission travel — Producer brief

Status: Proposed for planning; no design approval or implementation.
Date: 2026-10-08
Source request: The owner wants quick access to any of the eight independent missions from the hub, through a friendly guide who opens a modal, offers mission choices and teleports only after confirmation.

## Player opportunity and evidence

The hub already presents eight mission statuses. Add a companion who turns that overview into an actionable destination choice, reducing repeated walking while preserving exploration. This is owner feedback and a usability hypothesis, not a measured playtest result.

- [Roadmap](../../plan.md): AI Island Academy is a playful, non-combat learning adventure for ages 8–10. Pix is already its friendly AI assistant; reuse Pix rather than inventing a second guide.
- [Feature 033](../../specs/033-progress-and-navigation/spec.md) and [Feature 037](../../specs/037-single-player-academy/spec.md): eight canonical badge identities, numbered destinations, hub Core status, current-round rewards and solo play already exist. Navigation recommends an order; it does not impose prerequisite locks on the first seven.
- [Journal source](../../Content/fn_shoreline_island_academy_journal.verse): per-player module status, earned counts, input-capturing journal widgets, generation guards and cleanup already exist. Its `first_seven_online` and `module_status` still lock Agent Mission until seven badges. The owner's requested independence of all eight therefore needs an explicit planned change to that gate, rather than a teleport bypass which leaves the mission unplayable.
- [Feature 043](../../specs/043-popcorn-hub-return-confirmation/spec.md) and [its plan](../../specs/043-popcorn-hub-return-confirmation/plan.md): an unapproved proposal for native owner-only confirmation, cancel/re-entry behavior and cleanup-first teleport. This is a useful design reference, not proof that confirmation is implemented or tested.
- [Feature 043 Supervisor evidence](../../specs/043-popcorn-hub-return-confirmation/evidence/supervisor.md): bounded native popup discovery found the two-button confirmation avenue locally. Owner confirmation of the preceding walk-in portal is narrow evidence only.

Affected zones: hub guide and approach area; safe arrival/start areas of the eight primary missions; shared mission status/UI; Agent eligibility and finale guidance if independence changes its current prerequisites.

## Recommended experience

1. Approach visible Pix beside the hub status screens. Pix waves or displays a brief greeting. Entering the deliberate guide interaction area opens one invitation: **“Ready for an adventure?”** / **“Choose a mission and I’ll take you there.”** Buttons: **“Choose a mission”** and **“Not now.”** A short approach animation or sound is optional; text must work without audio.
2. Accept to see all eight numbered mission choices together, with a clear status beside each. Keep numbering consistent with the hub and map: Prompt Workshop, Pattern Scanner, AI Classifier, Confidence Core, AI Error Lab, AI Tool Lab, Pix’s Popcorn Parkour, AI Agent Mission. Show **Ready**, **Completed**, or **Unavailable** with words and symbols. Completed lessons remain selectable for replay; unavailable destinations explain why and cannot confirm travel. Independence means no ordering prerequisite in the intended proposal, including Agent.
3. Select a mission to show its name, one short activity description and confirmation: **“Go to Pattern Scanner?”** Buttons: **“Go”** and **“Back.”** For completed missions, use **“Visit again”**, with **“Your earned badge stays.”** Back returns to the list; Close/Cancel leaves the player at Pix. Do not transport on row selection.
4. Confirm to close the modal and move to that mission’s safe entrance, facing its introduction/start controls. Arrival does not solve a step, earn credit or silently replay/reset a completed attempt. Starting or replaying follows that mission’s existing explicit interaction. Existing Return to Hub routes remain available.

Keep the owner's invitation → choice → confirmation sequence in the initial scope. The first invitation makes the guide feel like a companion; avoid extra dialogue branches. A two-column list with eight readable rows/cards is a candidate presentation for Planner review, not approved pixel geometry. Default selection should be empty so rapid input cannot accidentally choose a mission. Controller focus, Back behavior and readable text must be explicit.

Only one guide modal may be open. Declining, cancelling or returning to the hub must not trigger repeated forced invitations while standing beside Pix. Re-arm after leaving and deliberately approaching again; provide an explicit **“Talk to Pix”** interaction to reopen while nearby if supported. Measure the approach area away from the normal hub transit/spawn path. Do not rely on an arbitrary cooldown as the only protection.

Pix should be curious, upbeat and brief: “Pick a lesson. I’ll meet you there!” A friendly robot or holographic companion fits the existing AI identity. Use an available character/animated prop first. A full conversational NPC, roaming AI, voiced dialogue and new imported character production are deferred; the guide only needs a visible presence, greeting and clear interaction.

## Priority, scope and preservation

Recommend this as the next focused hub convenience feature. It benefits every mission visit and replay, adds a playful guide to an existing status display and avoids another compulsory lesson. Effort is provisionally moderate; Agent independence and controller lifecycle integration may increase it.

Preserve the eight badge identities, one reward per module per player per round, existing puzzle actions and safe retries. Earned progress survives travel/replay/respawn within the round; do not promise cross-session saving. The older Prompt arena remains optional and shares the same Prompt badge; travel option 1 targets the primary Workshop. Optional Discovery Trail/hangar are excluded from this eight-choice list. Existing hub screens, walking routes and Return access stay useful.

Include all eight missions as freely selectable in the proposal because the owner explicitly requests independent missions. Current Agent prerequisites are a scope change to resolve in the numbered specification. Do not silently retain its lock, unlock rewards by teleport, seed missing badges or claim that visiting Agent completes the island. Planner must reconcile early Agent play with its real mechanics, badge award conditions and the 8/8 finale. Preserve legitimate eight-badge completion even if recommended ordering changes.

Exclude mission geometry redesign, new rewards, publishing, matchmaking changes, free text/chat and an always-accessible travel shortcut during active puzzles. Resolve destination entry behavior individually rather than assuming a generic teleport can start all controllers.

## Implementation avenues for Planner

Prefer a small shared guide/travel adapter using editable destination references and the existing authoritative module status queries. Keep the guide presentation separate from rewards. Investigate a native popup for the invitation and confirmation, plus either a native eight-choice response panel or a custom per-player Verse list for mission selection. Existing journal widgets make custom presentation a plausible reusable avenue; they do not currently implement travel.

Official Epic documentation currently lists popup response templates with 1–12 buttons, so do not assume a six-choice cap: [Popup Dialog device](https://dev.epicgames.com/documentation/fortnite/using-popup-dialog-devices-in-fortnite-creative). A custom list may better support status text and selection details: [Creating and removing per-player widgets](https://dev.epicgames.com/documentation/fortnite/creating-and-removing-widgets-in-unreal-editor-for-fortnite). These are avenues, not installed-editor capability claims. Check the local SDK/live schema, native layout, dynamic row state, text limits, controller focus and dismissal behavior before choosing.

Reuse existing safe entry/teleporter anchors where verified. Confirmation must revalidate the selected destination and current player/round/dialog generation. Close and invalidate UI before movement; use owning-controller exit cleanup where needed. Respawn, round reset, departure, cancellation and repeat confirmation must cancel stale choices and restore input. Coordinate with the journal and completion modals so input-capturing UI does not overlap. Exact assets, placement, bindings, teleport routing and reusable lifecycle interfaces belong to planning.

## Observable success and candidate acceptance

- Given a fresh hub arrival, when the player approaches Pix, then one invitation opens; declining leaves movement available and does not repeatedly reopen while they remain nearby.
- Given an accepted invitation, when the mission list opens, then all eight canonical numbered choices and accurate current statuses are readable with keyboard and controller input.
- Given any eligible mission, including an early Agent choice under the approved independence design, when its row is selected, then confirmation names that mission; only Confirm moves the player to its safe playable entrance.
- Given a selected mission, when Back/Cancel/dismiss is used, then no teleport or progress change occurs and the appropriate list/world input returns.
- Given an earned module, when visited/replayed, then earned status and total remain unchanged until a genuinely new module completes; travel never awards or duplicates a badge.
- Given an unavailable/missing destination or stale response after reset/respawn, when Confirm is attempted, then no unsafe or obsolete teleport occurs and useful feedback remains.
- Given each of the eight arrivals, when the player starts, retries, finishes and returns, then the actual mission flow remains playable and no prior controller/UI effects leak. Record cooked evidence separately from successful editor calls.
- Given early Agent completion with other badges missing, when progress refreshes, then the finale does not falsely claim 8/8; remaining modules stay playable in any order.

## Unknowns and next handoff

Planner must inspect current safe entrances, active mission controllers, actual Agent dependencies, asset availability and per-mission start/replay behavior. Source currently names module 7 “AI Skills Lab” while the roadmap identifies Pix’s Popcorn Parkour; reconcile visible travel copy to the current activity without changing its badge identity. Establish whether native selection UI can show eight status-bearing options readably; inspect custom UI/controller focus if it cannot. Determine deliberate approach placement and re-entry behavior from measured hub geometry.

Create the next numbered feature specification/map/review bundle from this brief, resolve feasibility gaps and present a concrete preview plus implementation plan for actual human approval. This Producer proposal is upstream of that gate. No gameplay/source/editor assets were changed and no new playtest was launched for this brief. Supervisor/root separately checked the editor game state as `CanStart`, with no running game, for handoff hygiene.
