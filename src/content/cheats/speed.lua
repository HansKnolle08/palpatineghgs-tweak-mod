local M = {}

function M.toggle(player)
  global.speed_state = global.speed_state or {}

  local idx = player.index
  global.speed_state[idx] = not global.speed_state[idx]

  global.pending_apply = global.pending_apply or {}
  global.pending_apply[idx] = game.tick + 1

  player.print("Speed: " .. tostring(global.speed_state[idx]))
end

return M