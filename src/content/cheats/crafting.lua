local M = {}

function M.toggle(player)
  if not global then return end
  global.crafting_state = global.crafting_state or {}

  local idx = player.index
  global.crafting_state[idx] = not global.crafting_state[idx]

  local active = global.crafting_state[idx]

  player.cheat_mode = active

  player.print("Free Craft: " .. tostring(active))
end

return M