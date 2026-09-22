using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

loop_player_progress := class:
    var challenge:int = 0
    var badge_earned:logic = false
    var station_id:int = -1

# Shared by four stations; completion is tracked per player for the current round.
fn_shoreline_island_loop_progress := class(creative_device):
    @editable
    badge_tracker:tracker_device = tracker_device{}
    @editable
    round_settings:round_settings_device = round_settings_device{}
    var states:[player]loop_player_progress = map{}
    var round_generation:int = 0

    badge_title<localizes>:message = "Pattern Badge"
    badge_description<localizes>:message = "Solve the three Pattern Scanner challenges."

    OnBegin<override>()<suspends>:void =
        Hide()
        badge_tracker.SetTitleText(badge_title)
        badge_tracker.SetDescriptionText(badge_description)
        badge_tracker.SetTarget(1)
        round_settings.RoundBeginEvent.Subscribe(on_round)

    ensure_player(input_player:player):loop_player_progress =
        if (existing := states[input_player]):
            return existing
        state := loop_player_progress{}
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

    complete(input_player:player, challenge_index:int):void =
        state := ensure_player(input_player)
        if (challenge_index = state.challenge, state.challenge < 2):
            set state.challenge += 1
        else if (challenge_index = 2, not state.badge_earned?):
            set state.badge_earned = true
            badge_tracker.SetValue(input_player, 1)
