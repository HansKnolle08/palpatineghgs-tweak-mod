local M = {}

function M.toggle(player)
  global.god_state = global.god_state or {}

  local idx = player.index
  global.god_state[idx] = not global.god_state[idx]

  global.pending_apply = global.pending_apply or {}
  global.pending_apply[idx] = game.tick + 1 

  player.print("God Mode: " .. tostring(global.god_state[idx]))
end

return M