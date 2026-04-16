local gui = require("content.gui")
local registry = require("content.cheats.registry")

local function ensure_global()
  global = global or {}

  global.speed_state = global.speed_state or {}
  global.god_state = global.god_state or {}
  global.crafting_state = global.crafting_state or {}
  global.time_state = global.time_state or {}
  global.build_distance_state = global.build_distance_state or {}
  global.insta_mine_state = global.insta_mine_state or {}
  global.pending_apply = global.pending_apply or {}
end

local function apply_player_states(player)
  if not player or not player.valid then return end
  if not player.character then return end

  local idx = player.index

  player.cheat_mode = global.crafting_state[idx] == true

  player.character_running_speed_modifier =
    global.speed_state[idx] and 2 or 0

  player.character.destructible =
    not global.god_state[idx]

  if global.build_distance_state[idx] then
    player.character_build_distance_bonus = 100
    player.character_reach_distance_bonus = 100
    player.character_resource_reach_distance_bonus = 100
  else
    player.character_build_distance_bonus = 0
    player.character_reach_distance_bonus = 0
    player.character_resource_reach_distance_bonus = 0
  end

  player.character_mining_speed_modifier =
    global.insta_mine_state[idx] and 50 or 0
end

local function apply_all_players()
  for _, player in pairs(game.players) do
    apply_player_states(player)
  end
end

script.on_init(function()
  ensure_global()
  for _, player in pairs(game.players) do
    gui.ensure_gui(player)
  end
  apply_all_players()
end)

script.on_configuration_changed(function()
  ensure_global()
  for _, player in pairs(game.players) do
    gui.ensure_gui(player)
  end
  apply_all_players()
end)

script.on_event(defines.events.on_player_created, function(event)
  ensure_global()
  local player = game.players[event.player_index]
  gui.ensure_gui(player)
  apply_player_states(player)
end)

script.on_event(defines.events.on_player_respawned, function(event)
  ensure_global()
  local player = game.players[event.player_index]
  apply_player_states(player)
end)

script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
  ensure_global()

  if event.setting == "enable-cheat-menu" then
    local player = game.players[event.player_index]
    gui.ensure_gui(player)
  end
end)

script.on_event(defines.events.on_gui_click, function(event)

  if not event.element or not event.element.valid then return end

  local player = game.players[event.player_index]
  local name = event.element.name

  if name == "cheat_button" then
    local frame = player.gui.screen.cheat_frame
    if frame then
      frame.destroy()
    else
      gui.open_menu(player)
    end
    return
  end

  if name == "cheat_close" then
    local frame = player.gui.screen.cheat_frame
    if frame then frame.destroy() end
    return
  end

  for _, cheat in pairs(registry.cheats) do
    if name == "cheat_" .. cheat.id then
      cheat.toggle(player)
      gui.open_menu(player)
      return
    end
  end
end)

script.on_event(defines.events.on_tick, function()
  ensure_global()

  if not global.pending_apply then return end

  for player_index, target_tick in pairs(global.pending_apply) do
    if game.tick >= target_tick then
      local player = game.players[player_index]

      if player and player.valid then
        apply_player_states(player)
      end

      global.pending_apply[player_index] = nil
    end
  end
end)