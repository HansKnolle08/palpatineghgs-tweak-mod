local speed = require("cheats.speed")
local time = require("cheats.time")
local crafting = require("cheats.crafting")
local god = require("cheats.god")

function ensure_gui(player)
  if not player.gui.top.cheat_button then
    player.gui.top.add{
      type = "button",
      name = "cheat_button",
      caption = "CHEATS"
    }
  end
end

local function open_menu(player)

  if player.gui.screen.cheat_frame then
    player.gui.screen.cheat_frame.destroy()
  end

  local frame = player.gui.screen.add{
    type = "frame",
    name = "cheat_frame",
    caption = "Cheat Menu"
  }

  frame.location = {200, 200}

  local flow = frame.add{
    type = "flow",
    direction = "vertical"
  }

  flow.add{type="button", name="cheat_speed", caption="Speed Toggle"}
  flow.add{type="button", name="cheat_time", caption="Time Toggle"}
  flow.add{type="button", name="cheat_craft", caption="Free Craft"}
  flow.add{type="button", name="cheat_god", caption="God Mode"}
  flow.add{type="button", name="cheat_close", caption="Close"}
end

script.on_event(defines.events.on_gui_click, function(event)

  if not event.element or not event.element.valid then return end

  local player = game.players[event.player_index]
  local name = event.element.name

  if name == "cheat_button" then

    local frame = player.gui.screen.cheat_frame

    if frame then
      frame.destroy()
    else
      open_menu(player)
    end

    return
  end

  if name == "cheat_speed" then
    speed.toggle(player)

  elseif name == "cheat_time" then
    time.toggle(player)

  elseif name == "cheat_craft" then
    crafting.toggle(player)
  
  elseif name == "cheat_god" then
    god.toggle(player)
  end

  if name == "cheat_close" then
    local frame = player.gui.screen.cheat_frame
    if frame then
      frame.destroy()
    end
    return
  end
end)
