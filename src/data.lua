local setting = settings.startup["global-stack-size"]
local stack_size = setting and setting.value or 100

local function has_flag(flags, flag)
  if not flags then return false end
  for _, f in pairs(flags) do
    if f == flag then return true end
  end
  return false
end

for _, type in pairs({"item", "ammo", "tool", "module"}) do
  for _, obj in pairs(data.raw[type] or {}) do
    if not has_flag(obj.flags, "not-stackable") then
      obj.stack_size = stack_size
    end
  end
end