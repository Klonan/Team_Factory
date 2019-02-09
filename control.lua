SU = function(v)
  return v  -- * settings.startup["game-speed"].value
end

SD = function(v)
  return v -- / settings.startup["game-speed"].value
end


handler = require("script/event_handler")
names = require("shared")
util = require("script/script_util")

--error(serpent.block(defines.events))

local libs = {
  debug = require "script/debug",
  unit_deployment = require("script/unit_deployment"),
  unit_control = require "script/unit_control",
  command_center = require("script/command_center"),
  killcam = require("script/killcam"),
  pvp_interface = require("script/pvp_interface"),
  auto_request = require("script/auto_request"),
  construction_done = require("script/construction_drone"),
  freeplay_interface = require("script/freeplay_interface"),
  --logistic_beacon = require("script/logistic_beacon"),
  --teleporters = require "script/teleporters",
  --setup = require("script/setup"),
  --classes = require "script/classes/classes",
  --stickybomb_launcher = require "script/stickybomb_launcher",
  --setup_time = require("script/setup_time"),
  --ammo_pack = require("script/ammo_pack"),
  --damage_indicator = require("script/damage_indicator"),
  --trade_chests = require("script/trade_chests")
}


remote.add_interface("tf", {get = function(func) func(libs) end})
remote.add_interface("debug", {dump = function() log(serpent.block(global)) end})

libs.debug.libs = libs

local on_event = function(event)
  --local tick = game.tick
  --log(tick.. " | Control on_event triggered")
  for name, lib in pairs (libs) do
    if lib.on_event then
      --log(tick.. " | Running on_Event for lib "..name)
      lib.on_event(event)
    end
  end
end

local register_all_events = function()
  --hack(?)
  local last_event = script.generate_event_name()
  --log("LAST: "..last_event)
  local all_events = {}
  for k = 0, last_event do
    all_events[k] = k
  end
  script.on_event(all_events, on_event)

  local hotkeys = names.hotkeys
  for k, name in pairs (hotkeys) do
    script.on_event(name, function(event) event.name = name on_event(event) end)
  end

end

local on_init = function()
  --game.speed = settings.startup["game-speed"].value
  for name, lib in pairs (libs) do
    if lib.on_init then
      lib.on_init()
    end
  end
  register_all_events()
end

local on_load = function()
  for name, lib in pairs (libs) do
    if lib.on_load then
      lib.on_load()
    end
  end
  register_all_events()
end

local on_configuration_changed = function(data)
  for name, lib in pairs (libs) do
    if lib.on_configuration_changed then
      lib.on_configuration_changed(data)
    end
  end
end

script.on_init(on_init)

script.on_load(on_load)

script.on_configuration_changed(on_configuration_changed)
