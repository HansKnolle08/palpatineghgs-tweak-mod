local M = {}

function M.toggle(player)
  global.crafting_state = global.crafting_state or {}

  local idx = player.index
  global.crafting_state[idx] = not global.crafting_state[idx]

  global.pending_apply = global.pending_apply or {}
  global.pending_apply[idx] = game.tick + 1

  player.print("Free Craft: " .. tostring(global.crafting_state[idx]))
end

return M