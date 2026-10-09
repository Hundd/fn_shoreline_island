# Paving compatibility review

Supervisor /root approved the following concrete fallback under the owner's existing delegated passive-art review authority and explicit request to fix validation. This is delegated review, not personal human approval of a new map digest.

Original: 592 Neo_Sidewalk_Str_1x1_NoCurb meshes, no collision. Local bounds X0..511.999939, Y-512..0, Z-6.418245..8.965888 cm. Typical scale .9765625,.9765625,.05 yields a 500 x 500 x .769207 cm visible slab. The paving actors are passive veneers over retained collision floors.

Native CP_NeoSidewalk_Full was inspected. It contains a generic asphalt root and native Neo_Sidewalk_Str_1x1 child. Root hiding worked, but its construction reasserted child yaw90/Z3 and QueryOnly/BlockAllDynamic after edits. This option was rejected for unstable collision preservation. Its pilot was restored to the original exact mesh, transform, bounds and NoCollision, then saved.

Approved fallback: /Engine/BasicShapes/Cube.Cube with existing /fn_shoreline_island/Campus/Materials/MI_CampusCream.MI_CampusCream. For each source world AABB, center the cube at (min+max)/2 and scale it to (max-min)/100; source tiles are axis aligned. Preserve label, identity, streaming settings and NoCollision. This preserves exact footprint and top height; it removes fine seams/beveled-edge details and keeps a pale warm-gray/cream surface. No routes, gates, mission devices or support collision change. No Fortnite assets are copied or exported.

A single cube/material pilot must pass authoritative validation before the remaining 591 are replaced.
