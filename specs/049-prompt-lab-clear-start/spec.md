# Prompt Lab: grounded entry repair, revision 3

Status: concrete start-only proposal for human review; not approved or implemented.

The owner reported intermittent starts and hidden shooting targets on `prompt_lab_navy_floor`. The Producer rejected a broad redo. Current QA reproduced the start fault twice: grounded stationary placement near Replay did not enroll; jumping started the optional journal/intro, then landing cleared both. Native generated overlap-mesh geometry confirms the entry volume begins190cm above the floor. This revision repairs that demonstrated start fault with one existing actor Z translation.

## Requirements

- FR-001: Grounded players within the existing enrollment footprint start the existing mission without jumping. Preserve repeatable approach, re-entry, Replay and respawn recovery.
- FR-002 (deferred): Investigate the owner's hidden-target feedback separately. QA completed the sequence and badge, observed visible rings but viewpoint-dependent overlap near Replay and measured decorative-to-hit offsets. No target geometry or cue change is authorized by this revision. User's wider visibility request remains unfinished.
- FR-003: Preserve nine target IDs, sequence `[0,3,5,5,6]`, 2s welcome/7s lesson, 2s moving-stage handoff, moving core, Pix delivery, safe wrong retry, existing DATA/replay reward policy, one-time Prompt badge and west walking return.
- FR-004: Change only entry actor Z2600→2360cm. Preserve XY, full rotation/scale, native6/12/3 dimensions, filters/permissions, all bindings and current volume-exit/reset semantics. No source changes, target moves, decoration retirement or Prompt Workshop changes.
- FR-005 (deferred): Collect first-time-player explanation of LARGE/WHERE and clarity/fun feedback; successful shots alone do not establish learning or enjoyment.

## Acceptance scenarios for this repair

- AC-01 / FR-001: Given a fresh solo round, when approaching grounded through the existing enrollment footprint, then the optional journal/intro starts once and the initial choices activate after the original9s. Record ten approach/re-entry/replay attempts and all failures, plus normal respawn recovery.
- AC-02 / FR-001,004: Given grounded enrollment, when standing, crouching, jumping and landing at the same XY, then enrollment persists without reset. Given actual departure from the unchanged horizontal footprint, then current participation removal/reset behavior remains.
- AC-03 / FR-003,004: Given active stages, when progressing through all five correct hits and deliberate wrong choices, then wrong choices preserve stage/DATA, the moving core and Pix finale work, fresh completion awards8 DATA and one guarded badge, Replay retains earned DATA, and walking west remains available.
- AC-04 / FR-004: Given saved editor state, when reading back the entry actor, then full transform equals the exact proposed delta and every listed native setting/binding remains unchanged. No other actor/source delta is present.

Deferred FR-002/005 acceptance: all active answers from ordinary nearby viewpoints standing/crouched, full moving sweep and center/outer-third shots; identify exact occluder/mismatch before proposing another repair, then collect real first-time-player words about clarity and learning. These are follow-up tasks, not proof supplied by this start repair.

Solo scope follows the existing owner waiver in026; no new multiplayer expansion gate.
