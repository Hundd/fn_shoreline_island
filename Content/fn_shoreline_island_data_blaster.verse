using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }

# The granter is configured Only if Not Owned and equips the single blaster.
# Spawn-pad events cover respawns; join covers late arrivals.
fn_shoreline_island_data_blaster := class(creative_device):
    @editable
    granter:item_granter_device = item_granter_device{}
    @editable
    spawn_pads:[]player_spawner_device = array{}

    OnBegin<override>()<suspends>:void =
        Hide()
        for (pad : spawn_pads):
            pad.SpawnedEvent.Subscribe(equip)
        GetPlayspace().PlayerAddedEvent().Subscribe(on_join)
        for (input_player : GetPlayspace().GetPlayers()):
            on_join(input_player)

    on_join(input_player:player):void =
        spawn { equip_when_ready(input_player) }

    equip_when_ready(input_player:player)<suspends>:void =
        # Wait for possession without blocking other players or editor work.
        loop:
            if (not input_player.IsActive[]):
                return
            if (character := input_player.GetFortCharacter[], character.IsActive[]):
                equip(input_player)
                return
            Sleep(0.1)

    equip(input_agent:agent):void =
        if (character := input_agent.GetFortCharacter[]):
            character.SetVulnerability(false)
        granter.GrantItem(input_agent)
