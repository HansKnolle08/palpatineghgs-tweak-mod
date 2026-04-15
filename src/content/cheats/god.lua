local M = {}

function M.toggle(player)
  if not global then return end
  global.god_state = global.god_state or {}

  local id = player.index
  global.god_state[id] = not global.god_state[id]

  local active = global.god_state[id]

  if not player.character then
    player.print("No character found")
    return
  end

  if active then
    player.character.destructible = false
    player.print("Godmode: true")
  else
    player.character.destructible = true
    player.print("Godmode: false")
  end
end

return M