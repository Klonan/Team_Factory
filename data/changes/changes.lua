local require = function(str) return require("data/changes/"..str) end
require("remove_electricity")
require("bigger_miners")
require("transport_belts")
require("modules")
require("tutorials")
require("technologies")