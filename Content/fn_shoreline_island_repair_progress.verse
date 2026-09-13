using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

repair_player_state := class:
    var program:[]int = array{0, 1, 3, 2}
    var completed:logic = false
    var hint_level:int = 0
    var station_id:int = -1

# Optional practice never changes the Garden badge or its sequence.
fn_shoreline_island_repair_progress := class(creative_device):
    @editable
    round_settings:round_settings_device = round_settings_device{}
    var states:[player]repair_player_state = map{}
    var round_generation:int = 0

    OnBegin<override>()<suspends>:void =
        Hide()
        round_settings.RoundBeginEvent.Subscribe(on_round)

    ensure_player(input_player:player):repair_player_state =
        if (existing := states[input_player]):
            return existing
        state := repair_player_state{}
        if (set states[input_player] = state) {}
        return state

    on_round():void =
        set round_generation += 1
        set states = map{}
