local M = {}

M.cheats = {
  {
    id = "speed",
    label = "Speed",
    category = "Movement",
    state = "speed_state",
    toggle = require("content.cheats.speed").toggle
  },

  {
    id = "build_distance",
    label = "Build Distance",
    category = "Player",
    state = "build_distance_state",
    toggle = require("content.cheats.build_distance").toggle
  },

  {
    id = "god",
    label = "God Mode",
    category = "Player",
    state = "god_state",
    toggle = require("content.cheats.god").toggle
  },

  {
    id = "crafting",
    label = "Free Craft",
    category = "Player",
    state = "crafting_state",
    toggle = require("content.cheats.crafting").toggle
  },

  {
    id = "insta_mine",
    label = "Instant Mining",
    category = "Player",
    state = "insta_mine_state",
    toggle = require("content.cheats.insta_mine").toggle
  },

  {
    id = "time",
    label = "Time Toggle",
    category = "World",
    state = nil,
    toggle = require("content.cheats.time").toggle
  }
}

return M