names = names.weapon_names
local require = function(string) return require("data/weapons/"..string) end
require("grenade_launcher/grenade_launcher")
require("stickybomb_launcher/stickybomb_launcher")
require("flamethrower/flamethrower")
require("flare_gun/flare_gun")
require("medi_gun/medi_gun")
require("syringe_gun/syringe_gun")
require("rocket_launcher/rocket_launcher")
require("sniper_rifle/sniper_rifle")
require("submachine_gun/submachine_gun")
require("scattergun/scattergun")
require("shotgun/shotgun")
require("minigun/minigun")
require("pistol/pistol")
require("revolver/revolver")