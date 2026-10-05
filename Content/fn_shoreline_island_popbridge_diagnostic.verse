using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

fn_shoreline_island_popbridge_diagnostic := class(creative_device):
    OnBegin<override>()<suspends>:void =
        Hide()
        Print("POPBRIDGE_DIAG 039-A-20261004-r02 BEGIN fixture_sha256=223a293e0685799e2612be2d108f7f8991a8055c486df939983ce2a575fad433")
        nodes := array{
            popbridge_node{id := 0, center := vector3{X := -3500.000, Y := -18200.000, Z := 2520.000}, size := vector3{X := 600.000, Y := 400.000, Z := 40.000}, initially_built := true, milestone := -1, route_stage := 0, terminal := false},
            popbridge_node{id := 1, center := vector3{X := -3500.000, Y := -17750.000, Z := 2520.000}, size := vector3{X := 400.000, Y := 400.000, Z := 40.000}, initially_built := false, milestone := 0, route_stage := 1, terminal := false},
            popbridge_node{id := 2, center := vector3{X := -3500.000, Y := -17300.000, Z := 2520.000}, size := vector3{X := 400.000, Y := 400.000, Z := 40.000}, initially_built := false, milestone := 1, route_stage := 2, terminal := false},
            popbridge_node{id := 3, center := vector3{X := -3500.000, Y := -16850.000, Z := 2520.000}, size := vector3{X := 800.000, Y := 400.000, Z := 40.000}, initially_built := false, milestone := -1, route_stage := 3, terminal := false},
            popbridge_node{id := 4, center := vector3{X := -4200.000, Y := -16400.000, Z := 2520.000}, size := vector3{X := 400.000, Y := 400.000, Z := 40.000}, initially_built := false, milestone := -1, route_stage := 4, terminal := false},
            popbridge_node{id := 5, center := vector3{X := -2800.000, Y := -16400.000, Z := 2520.000}, size := vector3{X := 400.000, Y := 400.000, Z := 40.000}, initially_built := false, milestone := -1, route_stage := 4, terminal := false},
            popbridge_node{id := 6, center := vector3{X := -3500.000, Y := -15950.000, Z := 2520.000}, size := vector3{X := 1200.000, Y := 400.000, Z := 40.000}, initially_built := true, milestone := -1, route_stage := 5, terminal := true}}
        edges := array{
            popbridge_edge{source := 0, destination := 1, gap_cm := 50.000},
            popbridge_edge{source := 1, destination := 2, gap_cm := 50.000},
            popbridge_edge{source := 2, destination := 3, gap_cm := 50.000},
            popbridge_edge{source := 3, destination := 4, gap_cm := 111.800},
            popbridge_edge{source := 3, destination := 5, gap_cm := 111.800},
            popbridge_edge{source := 4, destination := 6, gap_cm := 50.000},
            popbridge_edge{source := 5, destination := 6, gap_cm := 50.000}}
        receivers := array{
            popbridge_receiver{target_id := 0, from_landing := 0, creates := -1, instruction := 0},
            popbridge_receiver{target_id := 1, from_landing := 0, creates := -1, instruction := 1},
            popbridge_receiver{target_id := 2, from_landing := 0, creates := 1, instruction := 2},
            popbridge_receiver{target_id := 3, from_landing := 1, creates := 2, instruction := 3},
            popbridge_receiver{target_id := 4, from_landing := 2, creates := 3, instruction := 3},
            popbridge_receiver{target_id := 5, from_landing := 3, creates := 4, instruction := 3},
            popbridge_receiver{target_id := 6, from_landing := 3, creates := 5, instruction := 3},
            popbridge_receiver{target_id := 7, from_landing := 6, creates := -2, instruction := 3}}
        checks := fn_shoreline_island_popbridge_fixtures{}
        check_code := checks.self_check(nodes, edges, receivers)
        Print("POPBRIDGE_DIAG 039-A-20261004-r02 END result={check_code}")
