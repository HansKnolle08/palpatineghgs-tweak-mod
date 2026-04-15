data:extend({
  {
    type = "int-setting",
    name = "global-stack-size",
    setting_type = "startup",
    default_value = 100,
    minimum_value = 1,
    maximum_value = 10000
  },

  {
    type = "bool-setting",
    name = "enable-cheat-menu",
    setting_type = "runtime-per-user",
    default_value = true
  }
})