local M = {}

function M.toggle(player)
  local surface = player.surface

  if surface.daytime < 0.5 then
    surface.daytime = 0.5
  else
    surface.daytime = 0
  end

  surface.freeze_daytime = true
  player.print("Time toggled")
end

return M