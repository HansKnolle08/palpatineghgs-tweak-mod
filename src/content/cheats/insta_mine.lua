local M = {}

function M.toggle(player)
  global.insta_mine_state = global.insta_mine_state or {}

  local idx = player.index
  global.insta_mine_state[idx] = not global.insta_mine_state[idx]

  global.pending_apply = global.pending_apply or {}
  global.pending_apply[idx] = game.tick + 1

  player.print("Instant Mining: " .. tostring(global.insta_mine_state[idx]))
end

return M