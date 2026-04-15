require("content.gui")
require("content.cheats.speed")
require("content.cheats.time")
require("content.cheats.crafting")
require("content.cheats.god")

script.on_init(function()
  for _, player in pairs(game.players) do
    ensure_gui(player)
  end
end)

script.on_event(defines.events.on_player_created, function(event)
  local player = game.players[event.player_index]
  ensure_gui(player)
end)