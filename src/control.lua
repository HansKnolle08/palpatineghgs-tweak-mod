require("content.gui")

local function init_globals()
  global = global or {}

  global.speed_state = global.speed_state or {}
  global.god_state = global.god_state or {}
  global.crafting_state = global.crafting_state or {}
  global.time_state = global.time_state or {}
end

script.on_init(function()
  init_globals()

  for _, player in pairs(game.players) do
    ensure_gui(player)
  end
end)

script.on_configuration_changed(function()
  init_globals()
end)

script.on_event(defines.events.on_player_created, function(event)
  local player = game.players[event.player_index]
  ensure_gui(player)
end)