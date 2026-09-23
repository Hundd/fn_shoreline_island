# Pix hub helper — editor evidence (2026-09-23)

- Added and saved `pix_hub_helper_figure` through UEFN at `(200, 1900, 2400)` beside the academy spawn approach. Its saved World Partition actor is `Content/__ExternalActors__/fn_shoreline_island/C/IZ/HJNLKLOPYTPUTAMJ3LCQ9S.uasset`.
- The figure has 12 primitive components: sand body; teal head and arms; navy eyes, smile, legs, and antenna stem; gold antenna light; and a cyan Pix Core chest accent. Existing project materials were reused. All 12 components were read back with `NoCollision`.
- An editor viewport from `(-500, 1700, 2550)`, facing toward the first route, shows the figure fully visible to the right of the promenade, without covering the nearby Prompt Lab sign or Core. This is an editor placement observation, not an in-game player-camera result.
- No Verse, device, tracker, reward, or progress binding was added. Per the owner's request, project validation and playtesting were skipped; in-client readability and movement clearance remain unverified.
- Added and saved a cyan `pix_name_label` TextRender component reading `PIX` above the figure. A second editor viewport from the same approach shows the name legible above its antenna and clear of the route signs. Saved-property readback returned `PIX`, size 40, relative Z 245, and yaw 195. The static label is included in the label inventory.
