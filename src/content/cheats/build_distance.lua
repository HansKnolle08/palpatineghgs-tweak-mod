local M = {}

function M.toggle(player)
  global.build_distance_state = global.build_distance_state or {}

  local idx = player.index
  global.build_distance_state[idx] = not global.build_distance_state[idx]

  global.pending_apply = global.pending_apply or {}
  global.pending_apply[idx] = game.tick + 1

  player.print("Build Distance: " .. tostring(global.build_distance_state[idx]))
end

return M