local M = {}

local state = {}

function M.toggle(player)
  local idx = player.index
  state[idx] = not state[idx]

  if state[idx] then
    player.character_running_speed_modifier = 2
    player.print("Speed: true")
  else
    player.character_running_speed_modifier = 0
    player.print("Speed: false")
  end
end

return M