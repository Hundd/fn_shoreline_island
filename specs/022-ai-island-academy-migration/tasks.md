# Tasks

- Status: In progress.

- [x] T-001 (FR-006, FR-007): Audit Verse owners, state boundaries, tracker
  ownership, journal dependencies, and existing player-facing terminology.
- [ ] T-002 (FR-001, FR-002, FR-003): Convert the Theme Shell in Verse and
  world-facing UEFN devices: title, hub, Pix story, routes, journal, and badge
  labels. The UEFN descriptor and all currently identified Verse presentation
  strings are migrated; `evidence/theme-shell-2026-09-22.md` records a clean
  Verse build and fresh running session. World-only signs, Pix AI Core
  centerpiece, in-client readability, and validation remain open. The safe
  placement and binding probe is recorded in
  `evidence/theme-shell-2026-09-22.md`; current MCP cannot assign a newly
  placed classic Billboard to the existing Verse device property. A
  decorative Pix Core actor and material are documented in
  `evidence/hub-core-visual-probe-2026-09-22.md` and cook cleanly; in-client
  placement/readability remains open. On 2026-09-23, its in-world `PIX AI
  CORE` title was added and verified in the editor viewport; personal module
  state remains journal-only. A separate backed Core module legend now lists
  all eight names beside the centerpiece and points players to the personal
  journal; editor viewport and saved-property read-back are recorded in
  `evidence/hub-core-visual-probe-2026-09-22.md`, while in-client behavior
  remains open. All seven identified
  stale Prompt Lab and Pattern Scanner world billboards were updated, saved,
  read back through UEFN, and cooked successfully; see
  `evidence/theme-shell-2026-09-22.md`. The same live UEFN audit updated 44
  AI Classifier, AI Error Lab, and AI Tool Lab signs, including all 24
  Classifier destinations; no stale labels remain in those audited sets.
  A component-level visual audit then migrated 13 legacy TextRender facade and
  branch titles across nine saved campus actors; see
  `evidence/world-text-render-migration-2026-09-23.md`. A subsequent all-level
  TextRender sweep found 14 components across 1,290 actors and zero legacy
  campus names. The root `plan.md` and `docs/PROJECT_DESCRIPTION.md` now
  describe the AI Island Academy direction and point to this feature as the
  active specification; the former coding-island roadmap is identified as
  historical design.
  A direct follow-up found and corrected the 23rd old bound Billboard default:
  the hub title. Its fixed Verse text now gives the Agent Mode unlock rule and
  points to the personal journal for changing status; the Verse build is
  clean. See `evidence/label-recheck-2026-09-23.md`.
  The journal's read-only personal `n/8 MODULES ONLINE` feedback is compiled
  and session-cooked in `evidence/theme-shell-2026-09-22.md`; its in-client
  readability remains open. Pix's spawn HUD no longer asserts a fixed offline
  count after a player's progress changes; the revised text built with zero
  diagnostics and is recorded in the same evidence file.
  The bound hub journal sign's saved default now matches its AI Core Journal
  Verse text; see `evidence/label-recheck-2026-09-23.md`. Its overview now
  gives restored-Core guidance at 8/8 instead of asking that player to
  restore offline modules; the read-only branch built cleanly and is recorded
  in `evidence/theme-shell-2026-09-22.md`. A later direct reconciliation of
  all thirteen bound hub signs found seven still mismatched in saved state;
  they were read, corrected to Verse, and saved in UEFN. The live audit
  supersedes the earlier seven-sign completion claim; see the label recheck.
  A complementary 1,296-actor class sweep found no stale saved text in any
  of the 34 HUD Message devices, the sole Teleporter, or Island Settings;
  see `evidence/label-recheck-2026-09-23.md`.
- [ ] T-003 (FR-004, FR-005, FR-006): Migrate Prompt Lab / Fix the Prompt;
  verify correct, wrong, retry, reward, replay, and two-player behavior.
  The Prompt Lab wrong-step explanation is tracked in
  `evidence/prompt-lab-wrong-step-feedback-2026-09-23.md`; runtime retry and
  multiplayer checks remain open.
  Fix the Prompt's four-slot planting variation is documented in the feature
  plan, and its remaining player-facing `repair station` wording was updated
  to the zone name. Verse `BuildAll` returned zero diagnostics; interactive
  paths remain open under the user's request to skip playtesting. A live read
  confirmed all four optional station introductions already match Verse; only
  their stale inventory rows needed correction.
- [ ] T-004 (FR-004, FR-005, FR-006): Migrate Pattern Scanner and AI
  Classifier, one zone at a time, with per-zone evidence. Pattern Scanner
  Replay-all stage persistence is tracked in
  `evidence/pattern-scanner-replay-stage-2026-09-23.md`; its leave/reclaim
  and multiplayer checks remain open. The other claimed stations' stage
  ownership was checked in `evidence/replay-stage-source-audit-2026-09-23.md`.
  AI Classifier presentation is migrated
  and cooked in
  `evidence/classifier-error-lab-presentation-2026-09-22.md`; its item-prop
  moving-item art is integrated and cooked; runtime interaction, readability,
  and multiplayer evidence remain open.
  Pattern Scanner's first board now shows `Repeat [Move]`, the lantern setup
  shows `[Move + Light]`, and its first prompt asks for a prediction. Four
  Run Button defaults match the new Verse text and were saved in UEFN; Verse
  built with zero diagnostics. Four Classifier incoming-item board defaults
  now match their runtime Verse text and were read back and saved in UEFN.
  Four introductory Classifier boards now also match their numbered Verse
  `available_text`, with a separate post-save readback of all four.
  Four Pattern Scanner introductory board defaults now also match their
  numbered Verse station text, and its generic claim-first HUD prompt names
  the zone; the actor text was read back and saved, and Verse built cleanly.
  See `evidence/label-recheck-2026-09-23.md`.
- [ ] T-005 (FR-004, FR-005, FR-006): Migrate Confidence Core, AI Error Lab,
  AI Tool Lab, and AI Skills Lab one zone at a time with per-zone evidence.
  AI Error Lab presentation is migrated and cooked in
  `evidence/classifier-error-lab-presentation-2026-09-22.md`. AI Tool Lab
  and AI Skills Lab presentation is migrated and has a clean Verse build in
  `evidence/applied-ai-labs-presentation-2026-09-22.md`. A terminology audit
  and fresh-session cook are recorded in
  `evidence/player-facing-terminology-audit-2026-09-22.md`; runtime and
  multiplayer evidence remain open. On 2026-09-23, the two remaining
  integer-facing Confidence Core help strings were aligned to its visible
  `+10% / -10%` controls; the build completed with zero diagnostics.
  Its remaining player-facing `Add 2` wording now describes repeated +20%
  clue updates; the eight Count/Start Button defaults agree with Verse and
  were saved in UEFN. The revised source built with zero diagnostics; see
  `evidence/label-recheck-2026-09-23.md`.
  Four saved Confidence Core value boards now show the same unclaimed AI
  confidence text as Verse rather than the old Energy target; see the same
  label evidence. Its four introductory boards now also match the numbered
  `available_text` source. The four AI Error Lab introductions now share one
  numbered mistake-check instruction with Verse; all eight changed boards
  were saved and read back, and Verse built with zero diagnostics. See
  `evidence/label-recheck-2026-09-23.md`.
  AI Tool Lab now presents its two preserved inputs as Supply and Beacon
  requests; 24 signs and 16 Button defaults were saved and read back in UEFN,
  and the revised Verse built with zero diagnostics. See
  `evidence/applied-ai-labs-presentation-2026-09-22.md`.
  Its four introductory boards and runtime unclaimed text now share the same
  numbered `Choose a tool for each request` instruction, with actor save and
  post-save readback plus a clean Verse build; see
  `evidence/label-recheck-2026-09-23.md`.
  AI Skills Lab's eight player-facing caller messages and sixteen saved
  run/plan-slot signs now use the skill-plan vocabulary; the Verse build was
  clean and the signs were read back and saved in UEFN. The fixed Tool Lab
  demonstration message now names its request and tool choices. See the same
  evidence. A complete bound Skills Lab sign audit then corrected twenty-eight
  Care-step and plan-slot defaults; all fifty-six bound signs now match their
  saved inventory values and Verse text in a live read. See
  `evidence/label-recheck-2026-09-23.md`. The four unclaimed Skills Lab
  entry boards now also match their numbered Verse text after individual
  actor saves and a separate post-save readback. In-client behavior remains
  open.
- [ ] T-006 (FR-001, FR-003, FR-004, FR-006): Migrate AI Agent Mission, AI
  Core feedback, final celebration, and optional Discovery Trail presentation.
  The journal READY display and mission claim gate now share one read-only
  check of the seven specific prerequisite modules, rather than an aggregate
  count that could include Agent Mode; Verse built cleanly. See
  `evidence/agent-mission-prerequisite-gate-2026-09-23.md`. Runtime unlock and
  replay acceptance remain open.
  Agent Mission and Discovery Trail presentation has a clean Verse build in
  `evidence/agent-mission-trail-presentation-2026-09-22.md` and cooked in a
  fresh session. The AC-009 round/spawn/departure finale UI cancellation and
  stale-round start guard built without diagnostics; see
  `evidence/agent-finale-ui-cancellation-2026-09-23.md`. Its runtime reset
  check remains open. The four Agent Mission stations use the journal's read-only
  8/8 count to select the full-Core finale. Runtime and multiplayer evidence,
  in-client branch checks, and the environmental final celebration check
  remain open. A saved shared hub Core pulse now responds to all eight
  first-time badge tracker completions but has not been seen in-client. The
  guarded personal UI restoration celebration is compiled and
  session-cooked in `evidence/agent-mission-trail-presentation-2026-09-22.md`.
  A player-local cyan VFX Creator is now directly bound to the one-time Agent
  Badge tracker completion event without changing Verse or reward state; its
  settings and binding were read back and saved. Runtime visibility, cooking,
  and multiplayer behavior remain untested; see
  `evidence/agent-finale-vfx-binding-2026-09-23.md`.
  On 2026-09-23, all eight Agent Mission saved destination defaults were
  aligned to its bound Verse `Food` / `Vehicle` text and saved in UEFN; see
  `evidence/label-recheck-2026-09-23.md`. The three preserved stages now have
  a shared Research Station restoration goal, with a clean Verse build and
  four aligned saved mission boards; see
  `evidence/agent-mission-trail-presentation-2026-09-22.md`.
  Three Discovery Trail field-note boards and their Button defaults now agree
  with the AI prompts; the shared retry hint and category explanation were
  clarified, with a clean Verse build. The optional flow still needs a
  playtest. Its correct crate-count answer now shows Pix's mistake explanation
  before an explicit Next field note button opens the Human Decision question;
  the existing Again and Close choices remain. Verse built with zero
  diagnostics; see `evidence/discovery-trail-flow-2026-09-23.md`.
  Agent Mission route feedback now uses tool, item, and agent-plan
  terms, with a clean Verse build; see the same evidence file. Twelve saved
  Agent Mission control defaults now match their runtime Verse labels and
  were read back and saved through UEFN. A full four-station label
  reconciliation then corrected fifty-two more saved defaults and read back
  all eighty bound labels with zero mismatches; see
  `evidence/label-recheck-2026-09-23.md`. The four unclaimed Agent Mission
  entry boards now also match numbered Verse text after individual saves and
  a separate post-save readback. Its generic station-conflict HUD
  prompt now names AI Agent Mission; Verse built cleanly.
- [ ] T-007 (FR-001-FR-007): Validate project, memory, solo end-to-end and
  multiplayer progression; record any unsupported editor checks explicitly.
  On 2026-09-23, the project owner confirmed successful manual UEFN project
  validation, memory calculation, and project push without errors. The current
  MCP registry still exposes no equivalent validation or memory command. Solo
  end-to-end and two-player progression evidence remains required before this
  task can be checked off. The plan-wide acceptance matrix and remaining
  runtime decisions are in `evidence/migration-readiness-2026-09-23.md`.
- [ ] T-008 (FR-003, FR-006; AC-011): Verify the seven personal module
  restoration cues. The separate non-looping VFX Creator and seven tracker
  bindings are saved and read back in UEFN; see
  `evidence/module-restoration-vfx-binding-2026-09-23.md`. In-client
  visibility, replay suppression, and two-player behavior remain open under
  the owner's request to skip playtesting.
- [ ] T-009 (FR-001, FR-007; AC-012): Verify saved badge Tracker text.
  All eight saved titles and descriptions now match Verse, and a separate
  UEFN readback confirms sixteen fields; see
  `evidence/label-recheck-2026-09-23.md`. In-client badge UI remains to be
  checked when playtesting resumes.
- [ ] T-010 (FR-006, FR-007; AC-013): Verify AI Classifier badge completion
  at a saved target of 1. The pre-existing saved target of 10 was aligned
  with Verse's target of 1 through UEFN; readback confirms the setting and
  unchanged Individual sharing and VFX binding. In-client first award and
  replay checks remain open; see `evidence/label-recheck-2026-09-23.md`.
- [ ] T-011 (FR-003, FR-006; AC-014): Verify the personal module-restoration
  sound. A short Creative Sound Cue, player-local Audio Player, and seven
  tracker bindings are saved and read back; see
  `evidence/module-restoration-audio-binding-2026-09-23.md`. Audible quality,
  replay suppression, and two-player scope remain untested under the owner's
  request to skip playtesting.
- [ ] T-012 (FR-003, FR-006; AC-015): Verify the distinct personal Agent Mode
  completion sound. The separate Audio Player and its one Agent Badge tracker
  binding are saved and read back; see
  `evidence/agent-finale-audio-binding-2026-09-23.md`. Audible quality,
  first-award/replay behavior, and two-player scope remain open under the
  owner's request to skip playtesting.
- [ ] T-013 (FR-003, FR-006; AC-016): Verify the cosmetic hub Core pulse.
  The centered VFX Creator, one-shot settings, and eight tracker bindings
  are saved and read back in UEFN; see
  `evidence/hub-core-pulse-binding-2026-09-23.md`. In-client visibility,
  repeat triggering, and simultaneous multiplayer behavior remain open
  under the owner's request to skip playtesting.
- [ ] T-014 (FR-001, FR-003; AC-017): Verify Pix's decorative hub figure.
  The 12-part, non-colliding figure is placed and saved near the spawn route;
  its saved `PIX` name label and editor view show it clear of nearby signs. See
  `evidence/pix-hub-helper-2026-09-23.md`. In-client readability and
  navigation remain open under the owner's request to skip playtesting.
- [ ] T-015 (FR-003, FR-004, FR-007; AC-018): Verify Pattern Scanner robot
  visuals. All four existing moving robot props have saved, attached eyes,
  mouth, and antenna parts; the twenty new components read back with no
  collision and one academy material each. See
  `evidence/pattern-scanner-robot-visuals-2026-09-23.md`. In-client motion,
  readability, and collision remain open under the owner's request to skip
  playtesting.
- [ ] T-016 (FR-003, FR-004, FR-007; AC-019): Verify AI Skills Lab and AI
  Agent Mission robot visuals. Their eight existing station robot actors now
  have saved, attached faces and antennas; all forty new components read
  back with no collision and an academy material. See
  `evidence/skills-agent-robot-visuals-2026-09-23.md`. In-client visibility,
  movement, and collision remain open under the owner's request to skip
  playtesting.
- [ ] T-017 (FR-004, FR-005, FR-006; AC-020): Verify AI Error Lab's
  classification result status. The board now displays the existing status
  argument using concise ready/running/match/mismatch text; UEFN Verse
  `BuildAll` returned zero diagnostics. See
  `evidence/error-lab-classification-status-2026-09-23.md`. The live
  correct, wrong, retry, and multiplayer paths remain untested under the
  owner's request to skip playtesting.
- [ ] T-018 (FR-004, FR-007; AC-021): Verify Pattern Scanner's educational
  explanation. The hint now describes this plan's repeated Move, and the
  badge HUD connects the player's prediction to AI pattern use without
  implying the prop learned during play. UEFN Verse `BuildAll` returned zero
  diagnostics; see `evidence/pattern-scanner-explanation-2026-09-23.md`.
  In-client text fit and play flow remain open under the owner's request to
  skip playtesting.
- [ ] T-019 (FR-002, FR-003, FR-007; AC-022): Verify the visible Agent
  Mission unlock rule. Verse and all four saved unclaimed mission boards now
  state that seven modules must be online before Claim while retaining Pix's
  Research Station goal and the three mission stages; each board
  was saved and read back in UEFN, and Verse `BuildAll` returned zero
  diagnostics. See `evidence/agent-mission-unlock-board-2026-09-23.md`.
  In-client visibility and the per-player gate remain untested under the
  owner's request to skip playtesting.
- [ ] T-020 (FR-003, FR-006, FR-008; AC-023): Implement and verify a brief
  zone-to-Core data/energy connection for all eight first-time module awards.
  A first-award, player-local animated UI route is now wired to all eight
  existing badge trackers and the saved Core pulse remains its endpoint.
  Stale-round start and cleanup guards are tracked in
  `evidence/core-data-route-reset-2026-09-23.md`.
  The route's read-only per-player Core count is tracked in
  `evidence/core-data-route-count-2026-09-23.md`.
  In-client visibility and whether a physical beam is still needed remain
  open; see `evidence/core-data-route-2026-09-23.md`.
- [ ] T-021 (FR-004, FR-006, FR-009; AC-024): Implement and verify short,
  player-local concept sounds at the six actual learning actions. All six
  Verse hooks built with zero diagnostics; six Audio Players and 24 station
  references are saved and read back. In-client sound quality, trigger timing,
  and two-player isolation remain untested; see
  `evidence/six-action-audio-binding-2026-09-23.md`.
- [ ] T-022 (FR-004, FR-005; AC-025): Align Confidence Core challenge 2's
  authored start/target with the 40%-to-100% plan and explain manual versus
  repeated-clue target misses. Preserve the existing 0-10 mechanic, retry,
  door, per-player state, and reward guard. The source edit built with zero
  Verse diagnostics; see `evidence/confidence-challenge-target-2026-09-23.md`.
  Leave runtime acceptance open while playtesting is skipped.
- [ ] T-023 (FR-004, FR-005; AC-026): Add an item-specific explanation to
  AI Classifier's wrong-route feedback while preserving its queues, rules,
  retry, and badge guard. Verse built with zero diagnostics; see
  `evidence/classifier-wrong-route-explanation-2026-09-23.md`. Keep in-client
  text and retry checks open while playtesting is skipped.
- [ ] T-024 (FR-004, FR-005, FR-006; AC-027): Require a deliberate player
  verification of the Medical crate's Animal Research Station destination
  after `DeliverPackage` and before the existing badge completion. Reuse the Next control and restore its normal prompt on
  edit, replay, release, and round reset. Verse built with zero diagnostics
  after a reserved-word fix, and all four Next Button/label bindings resolved
  in live UEFN; see `evidence/agent-mission-verification-gate-2026-09-23.md`.
  Leave runtime flow and multiplayer acceptance open while playtesting is
  skipped.
- [ ] T-025 (FR-002, FR-003, FR-004, FR-005, FR-006, FR-010; AC-028): Build
  the plan's complete six-action medical-crate Research Station delivery
  capstone. Source and saved actor work now cover crate choice, Move x2,
  scanner, Bridge/Dock decision, delivery skill, and Verify within the
  retained three-stage training structure. Preserve the existing one-time
  Agent Badge and per-player guards; playtest correct, wrong, replay, solo,
  and two-player paths before accepting the capstone.
- [ ] T-026 (FR-004, FR-005, FR-006, FR-010; AC-029): Add a destination scan
  and explicit Bridge/Dock choice to the current Agent Mission final stage,
  using its existing controls and per-player attempt state. Present the
  former Launch/Dispatch connection as Scanner/destination marker in all
  player-facing text while retaining its device binding. Preserve the
  conditional item rule, Verify gate, and one-time badge. Make the Run
  prompt track the blocked/open route choice. Verse built with
  zero diagnostics; all four reused control sets resolved in live UEFN. See
  `evidence/agent-mission-scanner-route-2026-09-23.md` and
  `evidence/agent-mission-scanner-tool-wording-2026-09-23.md` for the later
  Scanner/marker wording and saved Run defaults. Defer runtime
  acceptance while playtesting is skipped.
- [ ] T-027 (FR-003, FR-004, FR-005, FR-006, FR-010; AC-030): Add the
  Food/Medical/Mechanical choice to Agent Mission's first stage and gate its
  existing delivery sequence on Medical. Convert the four bound moving seed
  props into labeled, non-colliding Medical crates, add visible Food and
  Mechanical alternatives, and align the four saved
  station labels/defaults through UEFN. Build Verse and read back all actor
  changes; defer gameplay and multiplayer acceptance while playtesting is
  skipped. The Verse build and editor work/readbacks are recorded in
  `evidence/medical-crate-choice-2026-09-23.md`; keep this task open until
  the deferred runtime checks can establish acceptance.
- [ ] T-028 (FR-004, FR-005, FR-006, FR-010; AC-031): Add an explicit
  `DeliverPackage` skill action after the final-stage scan and Dock choice.
  Retain the two item routes as optional practice. Reuse the existing valid delivery fixture and
  bound Medical prop for a visible action trace; require skill completion
  before Verify, clear it on invalidating edits/replay/round, and preserve the
  one-time reward gate. Build Verse and record editor/source evidence; defer
  gameplay and multiplayer acceptance while playtesting is skipped. Source
  changes and a zero-diagnostic Verse build are recorded in
  `evidence/agent-mission-delivery-skill-2026-09-23.md`; runtime acceptance
  remains open. Keep the delivered Medical crate and Animal Research Station
  marker visible through Verify and after reclaim; block a late optional Run
  from replacing that scene. Prevent a late-join refresh from hiding the
  Medical crate during the skill animation (AC-031).
- [ ] T-029 (FR-003, FR-004, FR-005, FR-006, FR-010; AC-032): Require a
  visible Move x2 navigation to the scanner/transport point before the final
  stage's scan can run. Reuse existing controls and robot reference, place
  four saved non-colliding scanner markers through UEFN, and preserve route,
  retry, replay, and one-time reward guards. Build Verse and read back the
  changed actor/default text; defer gameplay acceptance while playtesting is
  skipped. Source/editor work and a zero-diagnostic Verse build are recorded
  in `evidence/agent-mission-scanner-navigation-2026-09-23.md`; leave runtime
  acceptance open. Keep the initial board, status, and first Help from giving
  away the Move x2 answer before an attempt.
- [ ] T-030 (FR-004, FR-005, FR-006, FR-010; AC-033): Remove Apple/Car
  test-pass flags from the final skill and Verify gates. Offer the skill as
  soon as the scanner result is seen and Dock is chosen; retain Bridge's
  safe retry and optional classification practice. Update prompts, build
  Verse, and record source/editor evidence in
  `evidence/agent-mission-dock-delivery-gate-2026-09-23.md`. A later source
  guard keeps optional rule/cargo edits from clearing a completed delivery
  while Verify is pending; see
  `evidence/agent-mission-post-skill-controls-2026-09-23.md`. Runtime
  acceptance remains open while playtesting is skipped.
- [ ] T-031 (FR-002, FR-004, FR-005, FR-006; AC-034): Align the optional
  Discovery Trail Pattern and Classification notes to the plan's exact
  examples and choices, including a third Banana category button. Update
  their saved signs through UEFN, build Verse, and record readbacks in
  `evidence/discovery-trail-plan-examples-2026-09-23.md`. Keep
  runtime and two-player acceptance open while playtesting is skipped.
- [ ] T-032 (FR-002, FR-003, FR-004, FR-005, FR-006; AC-035): Add a fourth
  independent Human Decision field-note sign and Button through UEFN. Bind
  them to the existing player-local panel controller, preserve the Check Pix
  link, build Verse, save/read back the actors and references, and record
  evidence in `evidence/discovery-trail-human-station-2026-09-23.md`.
  Leave runtime visibility, accessibility, and two-player checks
  open while playtesting is skipped.
- [ ] T-033 (FR-004, FR-005, FR-006; AC-036): Convert AI Tool Lab's
  Supply/Beacon outputs into Scan Object/Announce Result with Scanner,
  Speaker, and Light choices. Preserve the physical scanner reveal and lamp
  distractor, cause/effect demo, final two-input test, per-player state, and
  one-time reward. Build Verse, align saved device text through UEFN, and
  record source/editor evidence in
  `evidence/tool-lab-scanner-speaker-2026-09-23.md`. Leave runtime and multiplayer acceptance
  open while playtesting is skipped.
- [ ] T-034 (FR-004, FR-005, FR-006, FR-007; AC-037): Rename the AI Skills
  Lab's player-facing Care skill to GrowPlant in Verse and saved UEFN actor
  defaults. Preserve the permitted four actions and all puzzle, device, and
  reward state. Build Verse, save and read back every changed actor, update
  the label inventory, and record evidence. Leave runtime acceptance open
  while playtesting is skipped.
- [ ] T-035 (FR-003, FR-004, FR-006, FR-007; AC-038): Update Pix's two
  Agent Mission completion messages to recap all seven lessons and the
  human-check reminder. Build Verse and record source evidence. Leave HUD
  readability and one-time trigger checks open while playtesting is skipped.
- [ ] T-036 (FR-001, FR-003, FR-004; AC-039): Put the plan's simple AI-agent
  definition on all four mission entry boards, retaining the unlock and
  stage guide. Build Verse, save/read back board defaults, update the label
  inventory, and record evidence. Leave in-client readability open.
- [ ] T-037 (FR-002, FR-004, FR-005, FR-006; AC-040): Add the optional
  Dolphin/Fish mistake question after Classifier completion using the
  existing Help control. Give No/Mammal explanation and safe Yes retry,
  preserve the three required challenges and one-time badge, build Verse,
  and record source evidence. Leave UI and two-player checks open while
  playtesting is skipped.
- [ ] T-038 (FR-004, FR-005, FR-006; AC-041): Align Error Lab challenges 1
  and 2 with the plan's scanner target and uncorrected Repeat-4 overshoot.
  Preserve the existing fixture, marker, hints, safe retry, and badge guard;
  relabel the four saved tile-3 endpoint signs, build Verse, and record
  source/editor evidence. Leave in-client marker visibility and
  wrong/correct/replay checks open while playtesting is skipped.
- [ ] T-039 (FR-004, FR-005, FR-006; AC-042): Add the planned color-pattern
  prediction before Pattern Scanner's first robot task. Use Count/Run to
  select and check Blue/Yellow/Green, give safe retry and explanation, keep
  the existing robot stage and badge guards, build Verse, and record source
  evidence. Leave in-client clarity and multiplayer checks open.
- [ ] T-040 (FR-004, FR-005, FR-006; AC-043): Align optional Fix the Prompt
  with the blue data-cube scanner scenario while retaining its four-slot
  swap, prop/device bindings, per-player state, and no-extra-badge rule.
  Build Verse; save and read back all 16 stage labels in UEFN; update the
  label inventory and record evidence. Leave in-client retry, visuals, and
  multiplayer acceptance open while playtesting is skipped.
- [ ] T-041 (FR-004, FR-005, FR-006; AC-044): Make Confidence Core challenge 1
  show Pix's CAT prediction at 40% and three named clues leading to a
  70%-or-higher threshold,
  while preserving its controls, later fixtures, state, and badge. Build
  Verse and record source evidence. Leave visual comprehension, wrong-value
  retry, replay, and multiplayer acceptance open while playtesting is skipped.
- [ ] T-042 (FR-004, FR-005, FR-006; AC-045): Align AI Classifier challenge 1
  with the APPLE-only example and allow Food, Animal, and Vehicle through
  the established route-check path. Preserve later queues, rule evaluation,
  per-player state, and badge. Build Verse and record source evidence; defer
  route animation, wrong-choice retry, and multiplayer acceptance.
- [ ] T-043 (FR-003, FR-004, FR-005, FR-006; AC-046): Add a non-colliding
  cat mystery object behind each Confidence Core preview door, bind it to
  its station, and show it only during the solved first challenge. Save and
  read back all four props and bindings, build Verse, and record evidence.
  The original CatStatue mesh failed UEFN validation; the owner's autofix
  removed the mesh. A project-owned low-poly cat mesh now replaces it on all
  four saved actors and passes a fresh validation/session cook; see
  `evidence/confidence-cat-validation-fix-2026-09-23.md`.
  Leave actual sightlines, door reveal, and multiplayer behavior for the
  deferred human playtest.
- [ ] T-044 (FR-002, FR-003, FR-004, FR-005, FR-006; AC-047): Place four
  non-colliding data crates beside the optional Check Pix sign, remove the
  answer from its pre-choice sign/question, and preserve its safe retry and
  no-badge behavior. Build Verse, save/read back all new props and the sign,
  update the label inventory, and record evidence. Leave player sightlines
  and two-player UI checks for the deferred playtest.
- [ ] T-045 (FR-005, FR-006; AC-048): Confirm the Island Settings Time Limit
  control is unchecked and its override flag false; do not enable its dormant
  five-minute default. Audit level classes and Verse for combat or Timer
  devices. Leave the solo/multiplayer no-timeout acceptance check open while
  the owner defers playtesting.
