# Coastal fieldwork

Status: In development. Source: milestone F of ../island-extension-plan.md.

## Requirements

- FR-001: Three optional observation spots on existing walking paths present
  growth, repeating lanterns, and labeled cargo routing. Each offers a prediction
  and a short explanation for either answer. They never gate travel or badges.
- FR-002: Exact observation fixtures: Water, Plant, Wait asks Harvest or Plant
  next (Harvest); lanterns 1, 2, 1, 2 ask 1 or 2 next (1); a Leaf crate with
  Leaf -> Garden / Plain -> Storage signs asks Garden or Storage (Garden).
  Explanation text must explain order, a repeating pair, and the cargo rule,
  respectively. Essential information must remain available without color/audio.
- FR-003: After normal Nursery completion, offer an optional authored remix:
  two empty beds, Care definition initially Plant, Water, Wait, Harvest, caller
  initially Care, Care, Care. Correct definition Water, Plant, Wait, Harvest and
  caller Care, Move, Care restore both beds. Show an optional goal of three
  caller instructions instead of nine expanded instructions. No timer, penalty,
  extra badge, or change to normal completed challenges. Replay restores this
  authored fixture; leaving always remains possible.
- FR-004: The existing personal journal offers a Restored work page explaining
  each earned zone's contribution to the academy. Unearned work says not yet
  restored; missing tracker bindings say unavailable. Opening either page never
  assigns, resets or awards progress. Overview retains the existing recommendation.
- FR-005: The only academy ending remains the existing Bot capstone. The journal
  may describe its completion, but adds no second celebration or reward.
- NFR-001: All answers, panels, remix programs and completion reads are personal.
  Close always returns input to gameplay. Respawn/departure cancels open panels
  and active remix execution; new rounds reset transient state. Shared observation
  scenery never implies another player's completion.
- NFR-002: Required evidence includes Verse build, focused solo wrong/correct,
  Replay and return checks, two/four-player isolation, route readability with
  audio muted, project validation and memory calculation. Do not mark validated
  from compilation or solo evidence alone.

## Acceptance scenarios

- AC-001 (FR-001, FR-002): Given each spot, when either prediction is selected,
  then the matching explanation identifies the correct next action and why;
  the player can retry or leave without changing badges or recommendations.
- AC-002 (FR-003): Given a completed Nursery, when the remix starts, then its
  authored defaults appear. Default Run fails safely; the specified solution
  restores both beds. Replay resets the fixture and normal Nursery stays 1/1.
- AC-003 (FR-004): Given no earned work, when Restored work opens, then all eight
  contributions are unearned. After earning a zone badge, that row describes
  its contribution while other rows and badge values stay unchanged. Overview
  and Close work from both pages and all text fits the panel.
- AC-004 (FR-005): Given Bot completion, when the journal page opens repeatedly,
  then it describes the completed mission without another reward or ending.
- AC-005 (NFR-001): Given different progress on two players, when one opens,
  answers, respawns or leaves, then the other's UI and progress remain unchanged.
  Repeat access with four players and verify round restart.
- AC-006 (NFR-002): Given the final revision, when release checks run, then
  recorded diagnostics, memory and runtime evidence cover all requirements.
