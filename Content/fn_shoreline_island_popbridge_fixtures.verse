using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

# Node IDs in the approved feature039 contract: starter, first, reuse, fork,
# left, right, finish = 0..6. Coordinates are world cm, top surface (not prop origin).
popbridge_node := class<concrete>:
    @editable
    id:int = 0
    @editable
    center:vector3 = vector3{}
    @editable
    size:vector3 = vector3{X := 400.0, Y := 400.0, Z := 40.0}
    @editable
    initially_built:logic = false
    @editable
    milestone:int = -1
    # Explicit route depth and final landing authority, derived from reviewed paths.
    @editable
    route_stage:int = -1
    @editable
    terminal:logic = false

popbridge_edge := class<concrete>:
    @editable
    source:int = 0
    @editable
    destination:int = 1
    @editable
    gap_cm:float = 50.0

popbridge_receiver := class<concrete>:
    @editable
    target_id:int = 0
    @editable
    from_landing:int = 0
    # -1: teaching prefix only; -2: finale, no deck.
    @editable
    creates:int = -1
    # 0..2 teaching instruction, 3 saved routine invocation.
    @editable
    instruction:int = 0

popbridge_attempt := class:
    var generation:int = 0
    var prefix:int = 0
    var saved:[]int = array{}
    var built:[int]logic = map{}
    var visited:[int]logic = map{}
    var consumed:[int]logic = map{}
    var checkpoint:int = 0
    var pending:int = -1
    var finished:logic = false

fn_shoreline_island_popbridge_fixtures := class:
    find_node(nodes:[]popbridge_node, id:int)<transacts>:?popbridge_node =
        for (node : nodes):
            if (node.id = id):
                return option{node}
        return false

    find_receiver(receivers:[]popbridge_receiver, id:int)<transacts>:?popbridge_receiver =
        for (receiver : receivers):
            if (receiver.target_id = id):
                return option{receiver}
        return false

    has_edge(edges:[]popbridge_edge, source:int, destination:int)<transacts>:logic =
        for (edge_index -> edge : edges):
            if (edge.source = source, edge.destination = destination):
                return true
        return false

    # Fail closed. This adapter supports one three-instruction skill and a DAG
    # whose stages advance by edges. Equal branch receivers use the same source.
    validate(nodes:[]popbridge_node, edges:[]popbridge_edge, receivers:[]popbridge_receiver)<transacts>:logic =
        if (nodes.Length < 2 or receivers.Length < 4):
            return false
        var ids:[int]logic = map{}
        var terminal_count:int = 0
        for (node : nodes):
            if (ids[node.id]?):
                return false
            if (node.id < 0 or node.size.X < 400.0 or node.size.Y < 400.0 or node.size.Z <= 0.0):
                return false
            if (node.milestone < -1 or node.milestone > 1):
                return false
            if (node.route_stage < 0):
                return false
            if (node.terminal?):
                set terminal_count += 1
                if (node.id = 0 or not node.initially_built?):
                    return false
            if (set ids[node.id] = true) {}
        if (terminal_count <> 1):
            return false
        if (starter := find_node(nodes, 0)?):
            if (not starter.initially_built? or starter.route_stage <> 0):
                return false
        else:
            return false
        var reachable:[int]logic = map{0 => true}
        # IDs are topological. Repeated passes avoid depending on array order.
        for (pass := 0..nodes.Length):
            for (edge_index -> edge : edges):
                if (reachable[edge.source]?, set reachable[edge.destination] = true) {}
        for (edge_index -> edge : edges):
            if (not ids[edge.source]? or not ids[edge.destination]? or edge.source >= edge.destination or edge.gap_cm <= 0.0 or edge.gap_cm > 120.0):
                return false
            if (source := find_node(nodes, edge.source)?, destination := find_node(nodes, edge.destination)?):
                if (source.terminal? or destination.route_stage <> source.route_stage + 1):
                    return false
                dx := Max(0.0, Abs(source.center.X - destination.center.X) - (source.size.X + destination.size.X) * 0.5)
                dy := Max(0.0, Abs(source.center.Y - destination.center.Y) - (source.size.Y + destination.size.Y) * 0.5)
                if (Abs(Sqrt(dx * dx + dy * dy) - edge.gap_cm) > 1.0 or Abs(source.center.Z - destination.center.Z) > 1.0):
                    return false
            for (other_index -> other : edges):
                if (other.source = edge.source):
                    if (other.destination = edge.destination, other_index <> edge_index):
                        return false
                    if (Abs(other.gap_cm - edge.gap_cm) > 1.0):
                        return false
        for (node : nodes):
            if (not reachable[node.id]?):
                return false
        var targets:[int]logic = map{}
        var teaching:[]int = array{0, 0, 0}
        var finales:int = 0
        for (receiver : receivers):
            if (targets[receiver.target_id]? or receiver.target_id < 0 or not ids[receiver.from_landing]?):
                return false
            if (set targets[receiver.target_id] = true) {}
            if (receiver.instruction < 0 or receiver.instruction > 3):
                return false
            if (receiver.instruction < 3):
                if (receiver.from_landing <> 0):
                    return false
                if (count := teaching[receiver.instruction], set teaching[receiver.instruction] = count + 1) {}
                if (receiver.instruction < 2, receiver.creates <> -1):
                    return false
            if (receiver.creates >= 0):
                if (not has_edge(edges, receiver.from_landing, receiver.creates)?):
                    return false
            else if (receiver.creates = -2, receiver.instruction = 3):
                if (terminal_node := find_node(nodes, receiver.from_landing)?):
                    if (not terminal_node.terminal?):
                        return false
                else:
                    return false
                set finales += 1
            else if (receiver.creates <> -1 or receiver.instruction >= 2):
                return false
        if (teaching[0] <> 1 or teaching[1] <> 1 or teaching[2] <> 1 or finales <> 1):
            return false
        for (node : nodes):
            if (not node.initially_built?):
                var producers:int = 0
                for (receiver : receivers):
                    if (receiver.creates = node.id):
                        set producers += 1
                if (producers <> 1):
                    return false
        return true

    reset(state:popbridge_attempt, nodes:[]popbridge_node):void =
        set state.generation += 1
        set state.prefix = 0
        set state.saved = array{}
        set state.built = map{}
        set state.visited = map{}
        set state.consumed = map{}
        set state.checkpoint = 0
        set state.pending = -1
        set state.finished = false
        for (node : nodes):
            if (set state.built[node.id] = node.initially_built) {}
        if (set state.visited[0] = true) {}

    # 0 ignored, 1 accepted teaching, 2 execute routine, 3 wrong order,
    # 4 consumed. Attribution and actual present grounded landing are mandatory.
    shot(state:popbridge_attempt, receiver:popbridge_receiver, owner_matches:logic, token:int, present:int)<transacts>:int =
        if (not owner_matches? or token <> state.generation or state.pending >= 0 or present <> receiver.from_landing):
            return 0
        if (not state.visited[receiver.from_landing]?):
            return 0
        if (state.consumed[receiver.target_id]?):
            return 4
        if (receiver.instruction < 3):
            if (state.prefix >= 3 or receiver.instruction <> state.prefix):
                return 3
            set state.prefix += 1
            if (state.prefix = 3):
                set state.saved = array{0, 1, 2}
                set state.pending = receiver.target_id
                return 2
            return 1
        if (state.saved <> array{0, 1, 2}):
            return 0
        set state.pending = receiver.target_id
        return 2

    complete(state:popbridge_attempt, receiver:popbridge_receiver, token:int)<transacts>:logic =
        if (token <> state.generation or state.pending <> receiver.target_id):
            return false
        if (set state.consumed[receiver.target_id] = true) {}
        if (receiver.creates >= 0):
            if (set state.built[receiver.creates] = true) {}
        else if (receiver.creates = -2):
            set state.finished = true
        set state.pending = -1
        return true

    land(state:popbridge_attempt, edges:[]popbridge_edge, id:int, grounded:logic, token:int)<transacts>:logic =
        if (not grounded? or token <> state.generation or not state.built[id]?):
            return false
        if (id = state.checkpoint):
            return true
        if (not has_edge(edges, state.checkpoint, id)?):
            return false
        if (set state.visited[id] = true) {}
        set state.checkpoint = id
        return true

    # Compiler-checked executable checks for a future approved harness. This is
    # deliberately not called by an unplaced device or claimed as runtime evidence.
    # Return 0 on success; positive codes identify the failed transition.
    self_check(nodes:[]popbridge_node, edges:[]popbridge_edge, receivers:[]popbridge_receiver):int =
        if (not validate(nodes, edges, receivers)?):
            return 1
        var shortcut_receivers:[]popbridge_receiver = array{}
        for (receiver : receivers):
            if (receiver.creates = -2):
                set shortcut_receivers += array{popbridge_receiver{target_id := receiver.target_id, from_landing := 0, creates := -2, instruction := 3}}
            else:
                set shortcut_receivers += array{receiver}
        if (validate(nodes, edges, shortcut_receivers)?):
            return 19
        if (first_edge := edges[0]):
            if (validate(nodes, edges + array{first_edge}, receivers)?):
                return 20
        var invalid_nodes:[]popbridge_node = array{}
        for (node : nodes):
            if (node.terminal?):
                set invalid_nodes += array{popbridge_node{id := node.id, center := node.center, size := node.size, initially_built := node.initially_built, milestone := node.milestone, route_stage := 0, terminal := true}}
            else:
                set invalid_nodes += array{node}
        if (validate(invalid_nodes, edges, receivers)?):
            return 21
        for (route_target : array{5, 6}):
            attempt := popbridge_attempt{}
            reset(attempt, nodes)
            token := attempt.generation
            if (load := find_receiver(receivers, 0)?, heat := find_receiver(receivers, 1)?, pop := find_receiver(receivers, 2)?):
                early_heat := shot(attempt, heat, true, token, 0)
                if (early_heat <> 3 or attempt.prefix <> 0):
                    return 2
                foreign_load := shot(attempt, load, false, token, 0)
                stale_load := shot(attempt, load, true, token - 1, 0)
                if (foreign_load <> 0 or stale_load <> 0):
                    return 3
                accepted_load := shot(attempt, load, true, token, 0)
                early_pop := shot(attempt, pop, true, token, 0)
                if (accepted_load <> 1 or early_pop <> 3 or attempt.prefix <> 1):
                    return 4
                accepted_heat := shot(attempt, heat, true, token, 0)
                accepted_pop := shot(attempt, pop, true, token, 0)
                if (accepted_heat <> 1 or accepted_pop <> 2):
                    return 5
                pending_pop := shot(attempt, pop, true, token, 0)
                premature_land := land(attempt, edges, 1, true, token)
                if (pending_pop <> 0 or premature_land?):
                    return 6
                pop_committed := complete(attempt, pop, token)
                airborne_land := land(attempt, edges, 1, false, token)
                if (not pop_committed? or airborne_land?):
                    return 7
                first_land := land(attempt, edges, 1, true, token)
                if (not first_land?):
                    return 8
                for (receiver_id : array{3, 4, route_target}):
                    if (receiver := find_receiver(receivers, receiver_id)?):
                        floor_shot := shot(attempt, receiver, true, token, -1)
                        receiver_shot := shot(attempt, receiver, true, token, receiver.from_landing)
                        if (floor_shot <> 0 or receiver_shot <> 2):
                            return 9
                        receiver_committed := complete(attempt, receiver, token)
                        if (not receiver_committed?):
                            return 10
                        consumed_shot := shot(attempt, receiver, true, token, receiver.from_landing)
                        if (consumed_shot <> 4):
                            return 11
                        receiver_land := land(attempt, edges, receiver.creates, true, token)
                        if (not receiver_land?):
                            return 12
                    else:
                        return 13
                if (finale := find_receiver(receivers, 7)?):
                    premature_finale := shot(attempt, finale, true, token, 6)
                    finish_land := land(attempt, edges, 6, true, token)
                    if (premature_finale <> 0 or not finish_land?):
                        return 14
                    finale_shot := shot(attempt, finale, true, token, 6)
                    finale_committed := complete(attempt, finale, token)
                    if (finale_shot <> 2 or not finale_committed? or not attempt.finished?):
                        return 15
                    reset(attempt, nodes)
                    stale_complete := complete(attempt, finale, token)
                    if (stale_complete? or attempt.saved.Length <> 0 or attempt.finished? or attempt.built[1]?):
                        return 16
                else:
                    return 17
            else:
                return 18
        return 0


