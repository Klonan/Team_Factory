local require = function(string) return require("data/items/weapons/"..string) end

require("machine_gun/machine_gun")
require("machine_gun/submachine_gun")
require("shotgun/shotgun")
require("pistol/pistol")
require("pistol/revolver")
require("sniper_rifle/sniper_rifle")