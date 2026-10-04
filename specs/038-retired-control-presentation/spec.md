# Retired control presentation cleanup

Date: 2026-10-04. Scope authorized by the human user: **“Yes, please do clean up”**, responding to the Supervisor's concrete recommendation to retire 55 disabled but visible controls across three duplicate Skills bays (42) and legacy Bot4 (13), preserve four Return controls and scenery. The user also directed **“Do not ask for a plan approved ... work by yourself”**, as conveyed by Supervisor. This record captures actual scoped action authorization; it does not claim the user saw or approved a subsequently generated preview. The documentation makes that already-authorized change reviewable, without asking again. Material scope expansion is excluded.

## Requirements

- R-01 Retire exactly the 55 audited disabled controls from the playable presentation using native visibleDuringGame=false. Keep actor identities, transforms, existing Verse references and bindings intact. No deletions or hidden parent groups.
- R-02 Retire the presentation/backplates of the 85 exact billboard fields whose text is already hidden by the four inactive controller branches: 21 in each duplicate Skills bay and22 in Bot4. Set native bHidden=true after re-resolving the owner field and checking identity. Preserve their objects and existing runtime HideText behavior.
- R-03 Preserve four Return buttons and their four Return labels, enabled and visible with original destinations. Preserve all scenery, floors, supports, shared resources, other mission actors and Academy rewards.
- R-04 Keep fresh audited solo_active=false for Skills station IDs1/2/3 and Bot4 station3. Existing source Disable/HideText branches remain unchanged. Leave primary Skills station0 and its15 working controls, Workshop controls, Rescue assets and hangar controls unchanged. Exclude the already-hidden20 Prompt/path controls and all primary Skills redesign.
- R-05 Read back every changed native field, verify exact counts/identities/transforms and reference integrity, save, validate/cook and inspect all four bays in a clean cooked game. No claim of runtime visual success from native flags alone. Verify all four Returns, normal primary Skills access and representative retained controls. Stop playtest before final handoff.

## Acceptance

| ID | Given / When / Then |
|---|---|
| AC-01 | Given clean cooked spawn, when each retired bay is approached, then none of its14/14/14/13 retired controls or retired text/backplates advertises the old interaction; existing walking paths remain passable with no invisible retired-device obstruction. No new route through former console spaces is required. |
| AC-02 | Given each bay, when its retained Return is used, then its label/interaction remain visible, teleport succeeds to the original destination and progress is preserved. |
| AC-03 | Given native post-edit readback, then exactly55 button refs have visibleDuringGame=false,85 exact retired billboard refs have bHidden=true, all8 protected Return actors retain visibility and unchanged transforms/refs. |
| AC-04 | Given round restart and reentry, then retired controllers remain inactive; dead controls do not reappear/re-enable, and no abandoned alternative can grant a badge. |
| AC-05 | Given primary Skills, current Workshop, Rescue and hangar interactions, when representative retained controls are exercised, then original behavior remains. Validation/cook reports no new missing-reference errors. Document any incomplete wider regression coverage. |
| AC-06 | Given final handoff, then saved state and validation/cook/playtest evidence are recorded and game is not Running; editor stays open. |
