local M = {}

function M.toggle(player)
  if not global then return end
  global.speed_state = global.speed_state or {}

  local idx = player.index
  global.speed_state[idx] = not global.speed_state[idx]

  local active = global.speed_state[idx]

  if not player.character then
    player.print("No character found")
    return
  end

  if active then
    player.character_running_speed_modifier = 2
    player.print("Speed: true")
  else
    player.character_running_speed_modifier = 0
    player.print("Speed: false")
  end
end

return M