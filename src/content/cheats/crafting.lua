local M = {}

local state = {}

function M.toggle(player)
  local idx = player.index
  state[idx] = not state[idx]

  player.cheat_mode = state[idx]
  player.print("Free Craft: " .. tostring(state[idx]))
end

return M