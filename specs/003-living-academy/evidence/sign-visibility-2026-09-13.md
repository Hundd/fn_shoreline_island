# Fresh-launch sign visibility investigation

Result: intermittent issue not reproduced in these two launches; phase-only
remedy unsupported and reverted. This does not close presentation acceptance.

Earlier evidence in the journal lifecycle test showed static hub signs missing
on first launch and visible after gameplay restart. This investigation compared
the journal sign's enabled phase while leaving nearby signs unchanged.

Actor: `Device_Billboard_V2_C_UAID_E89C2592D1B5F10003_1313695498`,
label `academy_journal_sign`, in the playable level's PersistentLevel.
Readback before trial: non-spatially loaded, phase Always, viewDistance 10000,
displayMode One Sided, nonempty journal text, no visible/hidden event binding.
The editor's font-loading flag was true and loadedFont null on both affected
static signs and the working growth observation sign. Those editor values do
not distinguish the runtime failure and are not proof of its cause.

| Trial | Session | Result |
| --- | --- | --- |
| Only journal sign changed to Gameplay Only | `623599c5be8048d68113a4bede2bf8a9` | Journal and unchanged hub/Garden signs visible on first gameplay launch: [capture](sign-phase-fresh-2026-09-13.png) |
| Journal sign restored to Always | `2f5307ee54af4529b7a24de56e005f46` | Journal and hub/Garden signs also visible on first gameplay launch: [capture](sign-baseline-fresh-2026-09-13.png) |

Each StartSession completed and GetGameState returned Running. Neither
comparison used a Verse push or gameplay restart before its capture. Fortnite
was closed between sessions; process count 0 and Disconnected were verified
before launching the baseline. No Verse source changed in these comparisons.
Journal revision remains `645DA93E6DFEFE3785EC5378A744E95F7B9E389806CD86B49C3CB93D6DEEF5F6`.

The phase trial was restored and saved through UEFN. Final readback is Always
with the original text. Do not propagate Gameplay Only as a visibility fix.
Next reproduction should include the first launch following a Verse rebuild,
compare the same camera position and sign faces, and distinguish server/device
initialization from client display behavior. Existing readability, overlap,
route and multiplayer requirements remain open.

After the baseline test, Fortnite process count was 0 and MCP reported
Disconnected. No client was left running.

Follow-up: the next observation-source rebuild reproduced missing static hub
signs on first launch and respawn, followed by visible signs after gameplay
restart. See [observation lifecycle evidence](../../010-coastal-fieldwork/evidence/observation-lifecycle-2026-09-13.md).
The original Always phase remained in place. Investigate initialization/display
after a rebuild; the phase trial remains unsupported.
