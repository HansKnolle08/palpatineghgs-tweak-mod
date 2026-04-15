local M = {}

local state = {}

function M.toggle(player)
  local id = player.index
  state[id] = not state[id]

  if not player.character then
    player.print("No character found")
    return
  end

  player.character.health = 9999
  player.character.destructible = not state[id]

  if state[id] then
    player.print("Godmode: true")
  else
    player.print("Godmode: false")
  end
end

return M