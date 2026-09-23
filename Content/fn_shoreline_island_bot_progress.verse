using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

bot_player_progress := class:
    var stage:int = 0
    var seed_program:[]int = array{1, 0, 2}
    var medical_crate_choice:int = 0
    var dock_program:[]int = array{3, 1}
    var repeats:int = 2
    var initial_energy:int = 0
    var launch_connection:int = 0
    var scanner_command:int = 3
    var scanner_repeats:int = 1
    var scanner_reached:logic = false
    var destination_scanned:logic = false
    var transport_route:int = 0
    var route_rule:int = 0
    var cargo:int = 0
    var route_passed:[]logic = array{false, false}
    var delivery_skill_complete:logic = false
    var hint_level:int = 0
    var solved:logic = false
    var completed:[]logic = array{false, false, false}
    var badge_earned:logic = false
    var station_id:int = -1
    var last_frame:bot_execution_frame = bot_execution_frame{}
    var last_error:int = -1
    var last_route:int = -1

fn_shoreline_island_bot_progress := class(creative_device):
    @editable
    badge_tracker:tracker_device = tracker_device{}
    @editable
    round_settings:round_settings_device = round_settings_device{}
    var states:[player]bot_player_progress = map{}
    var round_generation:int = 0
    fixtures:fn_shoreline_island_bot_fixtures = fn_shoreline_island_bot_fixtures{}

    badge_title<localizes>:message = "AI Agent Badge"
    badge_description<localizes>:message = "Complete the academy restoration mission."

    OnBegin<override>()<suspends>:void =
        Hide()
        badge_tracker.SetTitleText(badge_title)
        badge_tracker.SetDescriptionText(badge_description)
        badge_tracker.SetTarget(1)
        round_settings.RoundBeginEvent.Subscribe(on_round)

    ensure_player(input_player:player):bot_player_progress =
        if (existing := states[input_player]):
            return existing
        state := bot_player_progress{}
        if (set states[input_player] = state):
            badge_tracker.Assign(input_player)
            badge_tracker.Reset(input_player)
            badge_tracker.SetValue(input_player, 0)
        return state

    on_round():void =
        set round_generation += 1
        set states = map{}
        for (input_player : GetPlayspace().GetPlayers()):
            ensure_player(input_player)

    reset_attempt(input_player:player):void =
        state := ensure_player(input_player)
        set state.seed_program = fixtures.seed_defaults()
        set state.medical_crate_choice = 0
        set state.dock_program = fixtures.dock_defaults()
        set state.repeats = 2
        set state.initial_energy = 0
        set state.launch_connection = 0
        set state.scanner_command = 3
        set state.scanner_repeats = 1
        set state.scanner_reached = false
        set state.destination_scanned = false
        set state.transport_route = 0
        set state.route_rule = 0
        set state.cargo = 0
        set state.route_passed = array{false, false}
        set state.delivery_skill_complete = false
        set state.hint_level = 0
        set state.solved = false
        set state.last_frame = bot_execution_frame{}
        set state.last_error = -1
        set state.last_route = -1

    complete_stage(input_player:player):void =
        state := ensure_player(input_player)
        set state.solved = true
        if (set state.completed[state.stage] = true) {}
        if (state.completed[0]?, state.completed[1]?, state.completed[2]?, not state.badge_earned?):
            set state.badge_earned = true
            badge_tracker.SetValue(input_player, 1)
