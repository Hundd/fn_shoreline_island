using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

signal_player_progress := class:
    var challenge:int = 0
    var cursor:int = 0
    var selected_rule:int = 1
    var hint_level:int = 0
    var solved:logic = false
    var completed:[]logic = array{false, false, false}
    var badge_earned:logic = false
    var station_id:int = -1

fn_shoreline_island_signal_progress := class(creative_device):
    @editable
    badge_tracker:tracker_device = tracker_device{}
    @editable
    round_settings:round_settings_device = round_settings_device{}
    var states:[player]signal_player_progress = map{}
    var round_generation:int = 0

    badge_title<localizes>:message = "Signal Badge"
    badge_description<localizes>:message = "Route all three harbor challenges."

    OnBegin<override>()<suspends>:void =
        Hide()
        badge_tracker.SetTitleText(badge_title)
        badge_tracker.SetDescriptionText(badge_description)
        badge_tracker.SetTarget(1)
        round_settings.RoundBeginEvent.Subscribe(on_round)

    ensure_player(input_player:player):signal_player_progress =
        if (existing := states[input_player]):
            return existing
        state := signal_player_progress{}
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

    complete(input_player:player):void =
        state := ensure_player(input_player)
        set state.solved = true
        if (set state.completed[state.challenge] = true) {}
        if (state.completed[0]?, state.completed[1]?, state.completed[2]?, not state.badge_earned?):
            set state.badge_earned = true
            badge_tracker.SetValue(input_player, 1)
