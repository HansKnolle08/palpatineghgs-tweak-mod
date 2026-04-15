local M = {}

function M.toggle(player)
  if not global then return end
  global.build_distance_state = global.build_distance_state or {}

  local idx = player.index
  global.build_distance_state[idx] = not global.build_distance_state[idx]

  local active = global.build_distance_state[idx]

  if not player.character then
    player.print("No character found")
    return
  end

  if active then

    player.character_build_distance_bonus = 100
    player.character_reach_distance_bonus = 100
    player.character_resource_reach_distance_bonus = 100

    player.print("Build Distance: true")
  else
    player.character_build_distance_bonus = 0
    player.character_reach_distance_bonus = 0
    player.character_resource_reach_distance_bonus = 0

    player.print("Build Distance: false")
  end
end

return M