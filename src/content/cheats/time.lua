local M = {}

function M.toggle(player)
  local surface = player.surface
  local current = surface.daytime

  local target

  if math.abs(current - 0.5) < math.abs(current - 0.0) then
    target = 0.0
  else
    target = 0.5
  end

  surface.daytime = target

  player.print("Time set to: " .. (target == 0.5 and "Night" or "Day"))
end

return M