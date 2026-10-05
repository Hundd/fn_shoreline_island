# Independent final-caption QA checkpoint — 2026-10-04

Original gpt-6.1-sol QA worker; approved map digest 809dcd27d05f7e0711635d560f2615ab543ffb18195ea0e5008e386395d8087a. Controller checkpoint C40A9FB460EC5F90C025428C28C0F13F3CFCAEB187F8D7542E255C08EFE9A0E7. No source, gameplay, actor or approval fixes made by QA.

## Caption retest and input blocker

Fresh supported StartSession completed with temporary observer tag 039-production-QA-final. Authorized editor camera/Spawn At Viewport Camera setup placed the actual character at starter (-4800,-17280,2597); this is test setup, not normal arrival or route evidence. Actual keyboard AutoRun moved to (-4736.617226,-17280,2597), grounded/present0/prefix0/checkpoint0, independently recorded in production-qa-final-actual.log.

**PQA04 prefix-zero overlap is repaired in the observed render:** NEXT and LOAD occupy separate vertical lines, rather than extending into adjacent HEAT. production-qa-final-prefix0.jpg preserves the view. The initial Prompt Badge HUD overlaps part of the high caption in this particular setup view, so this capture is not an exhaustive first-use readability pass. HEAT and POP remain horizontally distinct. Prefix-one NEXT/HEAT and prefix-two NEXT/POP actual retest were not reached.

Supported computer-use mouse control failed in this fresh run: clicks relocated a visible arrow cursor but did not turn the actual camera or fire the rifle. Keyboard menus and AutoRun worked, distinguishing a mouse-control limitation from frozen gameplay. Bounded activation/Escape, previously successful map pointer reset, and reversible Alt+Enter window-mode calibration did not restore mouse capture. Original observed client capture was1920x1080; after Alt+Enter it was1600x900 and repeated bounded toggle did not restore the original size. No raw mouse automation, synthetic shot events, helper Verse, or player-pose injection was used. This is an input capability blocker, not a reproducible PopBridge gameplay defect.

The following requested scenarios were **not run** in this checkpoint because real rifle acquisition/aim was unavailable: additional per-gap/crouch recovery, exact successor rim landing, fresh left completion, physical Replay then a second full completion in the same award lifetime, and owned finish Return with Core retention. Prior independent actual routes, physical Replay, recovery, immediate repeat-award denial and unclaimed physical Return remain prior evidence in the other QA reports. They are not relabeled as fresh or sufficient for the missing integration cycle. Fresh island/player-cap and journal/Agent authority readback were not completed in this bounded shutdown; feature037 baseline remains reference evidence only.

## Validation and shutdown

After stopping and restoring setup, QA invoked the observed Session dropdown → Operations → Validate Project. Actual17:51:44.037 UTC log reports FlowStep_RunLocalValidation(): Complete, Channel State Completed Successfully and FlowStep_SignalSuccess(). Export production-qa-final-validation.log; compilation/cook remains separate from physical acceptance.

StopGame returned Completed; fresh GetGameState returned CanStart. Native debug_tag restored empty and read back empty. Original editor camera restored. Spawn At Viewport Camera restored unchecked, captured in production-qa-final-restored.jpg. Final targeted map save returned true and is_dirty false. UEFN left open. Fortnite client left open stopped with the display-size limitation above. No pending calls; editor ownership explicitly released to Supervisor. No full R01–R10 acceptance claim.
