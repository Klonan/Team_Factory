local class = {}
class.name = "sniper"
local create = function(player)
  player.create_character(class.name)
  local character = player.character
  --character.insert("heavy-armor")
  character.insert("sniper-gun")
  character.insert("sniper-ammo")
end
return setmetatable(class, {__call = function(self, ...) create(...) end})