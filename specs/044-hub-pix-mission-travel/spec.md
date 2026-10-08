# 044 — Pix hub mission travel
Status: Proposed for human review. Date: 2026-10-08. No implementation or approval.
Input: [Producer brief](../../docs/producer/hub-pix-mission-travel.md).

Players can choose any of the eight independent Academy missions from Pix beside the hub status display. Travel preserves each lesson's learning actions and current-round rewards.

## Requirements
- R01: Reuse the existing visible Pix helper beside the status screens; deliberate approach opens one invitation. Decline/Cancel cannot reopen until step-clear and new approach; Talk to Pix can explicitly reopen.
- R02: Invitation → eight-choice menu → named confirmation → confirmed safe entrance. Row selection never moves the player. Back returns to choices; Close returns world input.
- R03: Choices in canonical order: Prompt Workshop, Pattern Scanner, AI Classifier, Confidence Core, AI Error Lab, AI Tool Lab, Pix's Popcorn Parkour, AI Agent Mission. Show Ready / Completed / Unavailable as words. Status follows existing authoritative module availability and reward mapping, plus verified travel readiness.
- R04: All eight are playable independently, including Agent with zero earlier badges. Remove Agent eligibility prerequisites in active rescue and preserved legacy claim, journal status/recommendation and unlock guidance. Preserve Agent puzzle/delivery verification and badge guards.
- R05: Travel never starts/replays/solves a lesson or awards progress. Landing outside automatic entry trigger (or away from Agent claim point) leaves the existing walk-in start deliberate. Completed missions remain revisitable; entering then follows their existing attempt/replay lifecycle.
- R06: Confirm revalidates player, character, round, immutable dialog generation, destination identity and ready state; closes/invalidate UI before moving once. Missing destination reports Unavailable; no origin/default teleport.
- R07: Journal and travel modals cannot capture input together. Respawn, round reset, departure, leaving the hub and stale events close travel and restore input. Existing controller owner cleanup must complete before eligible hub travel.
- R08: Keep eight badge identities, once-per-player-per-round reward protection and legitimate 8/8 count. Early Agent completion reports only its own badge and real total; final Core restoration occurs when the last actual missing module completes, irrespective of order.
- R09: Preserve screens, walk routes, mission geometry, Return controls, optional lessons and solo matchmaking. UI readable and fully keyboard/controller navigable.

## Acceptance scenarios
- AC01 (R01): Given hub arrival, when walking normal transit routes, then no forced invitation; when entering Pix approach, one invitation opens; decline and remain, no reopen; leave 2m and reenter, invitation returns.
- AC02 (R02,R03,R09): Given invitation accepted, when choices open, all eight statuses and Cancel appear together; keyboard/controller can reach each; Back on confirmation returns to list, Close returns movement without travel.
- AC03 (R04,R05): Given fresh zero-badge round, when choosing each mission, confirmation identifies it and a single confirm lands safely; no reward/start on landing; walking into its normal start makes the real lesson playable. Agent accepts its own puzzle without prerequisites.
- AC04 (R05,R08): Given an earned badge, visit again and play/retry/return; earned total remains and no duplicate module award occurs.
- AC05 (R06,R07): Given selected destination, when reset/respawn/departure/unavailable binding or stale response occurs, no obsolete/default teleport; UI cleans up. Rapid Confirm twice moves once.
- AC06 (R07): Given journal open, approach does not overlap UI; explicit Talk closes journal before invitation. Given travel open, Journal closes travel first. Leaving approach with menu open cancels.
- AC07 (R08): Given Agent is completed first, Core reads1/8 and remaining missions playable; completion of any seventh missing lesson later produces8/8 guidance/restoration once.
- AC08 (R05,R09): Given each of eight arrivals, verify visible instruction, normal start, wrong action, reset/replay, legitimate completion and Return. Preserve all existing solo constraints; no multiplayer expansion.

Current evidence is planning source inspection and bounded editor rays, not cooked acceptance. Respect the owner's existing manual gameplay-testing constraint recorded in043; implementation compile/save/readback is followed by owner acceptance, without automatic cook/push/session.
