require("content.gui")

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
  local idx = player.index

  if global.crafting_state and global.crafting_state[idx] then
    player.cheat_mode = true
  else
    player.cheat_mode = false
  end

  if not player.character then return end

  player.character_running_speed_modifier =
    (global.speed_state and global.speed_state[idx]) and 2 or 0

  player.character.destructible =
    not (global.god_state and global.god_state[idx])

  if global.build_distance_state and global.build_distance_state[idx] then
    player.character_build_distance_bonus = 100
    player.character_reach_distance_bonus = 100
    player.character_resource_reach_distance_bonus = 100
  else
    player.character_build_distance_bonus = 0
    player.character_reach_distance_bonus = 0
    player.character_resource_reach_distance_bonus = 0
  end

  player.character_mining_speed_modifier =
    (global.insta_mine_state and global.insta_mine_state[idx]) and 50 or 0
end

script.on_init(function()
  ensure_global()

  for _, player in pairs(game.players) do
    ensure_gui(player)
    apply_player_states(player)
  end
end)

script.on_configuration_changed(function()
  ensure_global()

  for _, player in pairs(game.players) do
    ensure_gui(player)
    apply_player_states(player)
  end
end)

script.on_event(defines.events.on_player_created, function(event)
  ensure_global()
  local player = game.players[event.player_index]
  ensure_gui(player)
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
    ensure_gui(player)
  end
end)

script.on_event(defines.events.on_tick, function(event)
  ensure_global()

  if next(global.pending_apply) == nil then return end

  for player_index, target_tick in pairs(global.pending_apply) do
    if event.tick >= target_tick then
      local player = game.players[player_index]

      if player and player.valid then
        apply_player_states(player)
      end

      global.pending_apply[player_index] = nil
    end
  end
end)