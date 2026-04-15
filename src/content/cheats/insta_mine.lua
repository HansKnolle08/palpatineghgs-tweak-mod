local M = {}

function M.toggle(player)
  if not global then return end
  global.insta_mine_state = global.insta_mine_state or {}

  local idx = player.index
  global.insta_mine_state[idx] = not global.insta_mine_state[idx]

  local active = global.insta_mine_state[idx]

  if not player.character then
    player.print("No character found")
    return
  end

  if active then
    player.character_mining_speed_modifier = 50

    player.print("Instant Mining: true")
  else
    player.character_mining_speed_modifier = 0

    player.print("Instant Mining: false")
  end
end

return M