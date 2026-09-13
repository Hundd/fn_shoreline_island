# First Care station — 2026-09-12

UEFN project compatibility 42.10; one solo client. Three new Verse classes
compile with Build All returning `[]`. The station has 26 native/Verse devices
and three geometry actors. All 30 native station references passed readback;
progress is bound to the new shared Nursery progress device. Badge/round
references are wired; runtime reward acceptance remains pending.

SHA-256 revisions:

- fixtures: `1E6094AEF559DAF2DB27E4B8334A48F9345511F1480B92AE5652E9EA9C4F92F7`
- progress: `220E56694DC471A083720D1E087F680969F8BAB915EAEC9354E8CD41860C8676`
- station: `8EE284D333A59C6E39FFEA5CD97BF9BCF91F04F384E9E9622AE6324C8D4EC3FF`

## First launch and correction

Start Session completed and honored the Nursery location. Native devices added
asset-specific rotation offsets: buttons faced sideways and one-sided boards
faced away. This prevented readable interaction acceptance. The initial JSON
contains the actual offset transforms; property and binding matches did not
prove correct orientation. No gameplay acceptance is claimed for this run.

Closed Fortnite. Applied explicit actor transforms after placement to all 26
native/Verse devices and saved them. Readback matched every location, rotation
and scale within 0.001. The corrected layout needs a fresh live retest.

Later caller/repeat challenges, Next/unlocks, full rewards, journal, multiplayer,
lifecycle, project validation and memory remain incomplete.

## Corrected-layout solo Care test

The third fresh launch completed and honored location (-2820,-17900,2500).
The same Verse revisions above were used, with the explicit rotation correction.
Session identifier shown in captures: `ad63869aff4b4f508e7253ce1d3080b2`.

- Claim and runtime control labels worked. The objective and definition were
  readable from Run. At the eastern Claim position the minimap still partly
  obscures the program board; full presentation acceptance remains pending.
- Initial [Water, Plant, Harvest, Wait] ran Water and Plant, then stopped at
  Care step 3: Harvest. The board identified Planted and required Wait. The
  submitted definition remained intact; the player retained 100 health.
- Cycled step 3 to Wait and step 4 to Harvest. Each edit reset the demonstration
  to Empty. Run visibly expanded the single Care call, displayed the active
  internal step and planter state, and finished Harvested with the function
  explanation. The plant prop rose through the state changes.
- Both concept and worked-answer hints displayed readable text.
- Replay restored [Water, Plant, Harvest, Wait], Empty and Ready text. Hub return
  reached the academy hub. Completed-progress retention is not exposed by this
  first slice, so it is not established by these screenshots.

Thirteen runtime captures are saved under `captures/`, in addition to the initial
rotation failure. The floating plant and planter header partly overlap the lower
execution board area from some controls; improve those sightlines when extending
the row. No full T-010/AC-001 pass yet: Next and challenge-two unlock are absent.
The first Care execution prerequisite for implementing the later challenges has
passed. Rapid input, respawn, round reset, full reward behavior, multiplayer,
project validation and memory remain untested.

Second launch completed but spawned at the hub. A manual approach left the puzzle floors and did not reach Nursery, so neither route nor corrected-layout acceptance is claimed from that run. Navigation cues and reliable targeted test starts remain open. The run was ended for a fresh targeted test.

After the completed Care test, Fortnite process count was 0 and MCP reported Disconnected.
