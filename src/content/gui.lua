local registry = require("content.cheats.registry")

local function get_state(cheat, player)
  if not cheat.state then return false end
  if not global or not global[cheat.state] then return false end
  return global[cheat.state][player.index] == true
end

function ensure_gui(player)
  local enabled = settings.get_player_settings(player)["enable-cheat-menu"].value

  local button = player.gui.top.cheat_button

  if enabled then
    if not button then
      player.gui.top.add{
        type = "button",
        name = "cheat_button",
        caption = "CHEATS"
      }
    end
  else
    if button then
      button.destroy()
    end

    local frame = player.gui.screen.cheat_frame
    if frame then
      frame.destroy()
    end
  end
end

function open_menu(player)

  if player.gui.screen.cheat_frame then
    player.gui.screen.cheat_frame.destroy()
  end

  local frame = player.gui.screen.add{
    type = "frame",
    name = "cheat_frame",
    caption = "Cheat Menu",
    direction = "vertical"
  }

  frame.location = {200, 200}

  local categories = {}

  -- group cheats by category
  for _, cheat in pairs(registry.cheats) do
    local cat = cheat.category or "Misc"

    if not categories[cat] then
      categories[cat] = {}
    end

    table.insert(categories[cat], cheat)
  end

  -- render categories
  for cat_name, cheats in pairs(categories) do

    local flow = frame.add{
      type = "flow",
      direction = "vertical"
    }

    flow.add{
      type = "label",
      caption = cat_name
    }

    for _, cheat in pairs(cheats) do
      local state = get_state(cheat, player)

      flow.add{
        type = "button",
        name = "cheat_" .. cheat.id,
        caption = cheat.label .. " [" .. (state and "ON" or "OFF") .. "]"
      }
    end
  end

  frame.add{type="button", name="cheat_close", caption="Close"}
end

script.on_event(defines.events.on_gui_click, function(event)

  if not event.element or not event.element.valid then return end

  local player = game.players[event.player_index]
  local name = event.element.name

  if name == "cheat_close" then
    local frame = player.gui.screen.cheat_frame
    if frame then frame.destroy() end
    return
  end

  for _, cheat in pairs(registry.cheats) do
    if name == "cheat_" .. cheat.id then
      cheat.toggle(player)
      open_menu(player)
      return
    end
  end
end)

return {
  ensure_gui = ensure_gui,
  open_menu = open_menu
}