using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

nursery_player_progress := class:
    var challenge:int = 0
    var completed:[]logic = array{false, false, false}
    var badge_earned:logic = false
    var station_id:int = -1

fn_shoreline_island_nursery_progress := class(creative_device):
    @editable
    badge_tracker:tracker_device = tracker_device{}
    @editable
    round_settings:round_settings_device = round_settings_device{}
    var states:[player]nursery_player_progress = map{}
    var round_generation:int = 0

    badge_title<localizes>:message = "AI Skills Badge"
    badge_description<localizes>:message = "Restore three planter challenges with GrowPlant."

    OnBegin<override>()<suspends>:void =
        Hide()
        badge_tracker.SetTitleText(badge_title)
        badge_tracker.SetDescriptionText(badge_description)
        badge_tracker.SetTarget(1)
        round_settings.RoundBeginEvent.Subscribe(on_round)

    ensure_player(input_player:player):nursery_player_progress =
        if (existing := states[input_player]):
            return existing
        state := nursery_player_progress{}
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

    complete_challenge(input_player:player, challenge:int):void =
        state := ensure_player(input_player)
        if (set state.completed[challenge] = true) {}
        if (state.completed[0]?, state.completed[1]?, state.completed[2]?, not state.badge_earned?):
            set state.badge_earned = true
            badge_tracker.SetValue(input_player, 1)
