
default = { shim = {}} 

local mod_path = minetest.get_modpath("default")
dofile(mod_path.."/node_alias.lua")
dofile(mod_path.."/sound_alias.lua")
dofile(mod_path.."/sound_play.lua")
dofile(mod_path.."/texture_alias.lua")
dofile(mod_path.."/gui.lua")
dofile(mod_path.."/player.lua")
dofile(mod_path.."/misc.lua")
dofile(mod_path.."/wrap_builtin.lua")
