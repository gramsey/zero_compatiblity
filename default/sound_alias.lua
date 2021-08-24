default.shim.sound_alias = {
	["default_break_glass"] = "glass_break",
	["default_chest_close"] = "chest_close",
	["default_chest_open"] = "chest_open",
	["default_cool_lava"] = "fire_extinguish_flame",
	["default_dig_choppy"] = "wood_dig",
	["default_dig_cracky"] = "stone_dig",
	["default_dig_crumbly"] = "dirt_dig",
	["default_dig_dig_immediate"] = "wood_dig",
	["default_dig_metal"] = "metal_dig",
	["default_dig_oddly_breakable_by_hand"] = "tools_dig_oddly_breakable_by_hand",
	["default_dig_snappy"] = "tools_dig_snappy",
	["default_dirt_footstep"] = "dirt_footstep",
	["default_dug_metal"] = "metal_dug",
	["default_dug_node"] = "wood_dug",
	["default_furnace_active"] = "furnace_active",
	["default_glass_footstep"] = "glass_footstep",
	["default_grass_footstep"] = "dirt_grass_footstep",
	["default_gravel_dig"] = "gravel_dig",
	["default_gravel_dug"] = "gravel_dug",
	["default_gravel_footstep"] = "gravel_footstep",
	["default_hard_footstep"] = "stone_footstep",
	["default_ice_dig"] = "snow_ice_dig",
	["default_ice_dug"] = "snow_ice_dug",
	["default_ice_footstep"] = "snow_footstep",
	["default_item_smoke"] = "fire_extinguish_flame",
	["default_metal_footstep"] = "metal_footstep",
	["default_place_node"] = "wood_place",
	["default_place_node_hard"] = "stone_place",
	["default_place_node_metal"] = "metal_place_node",
	["default_sand_footstep"] = "sand_footstep",
	["default_snow_footstep"] = "snow_footstep",
	["default_tool_breaks"] = "tools_breaks",
	["default_water_footstep"] = "water_footstep",
	["default_wood_footstep"] = "wood_footstep",
}

function default.node_sound_defaults() return wood.sounds end
function default.node_sound_wood_defaults() return wood.sounds end
function default.node_sound_glass_defaults() return glass.sounds end
function default.node_sound_stone_defaults() return stone.sounds end
function default.node_sound_dirt_defaults() return dirt.sounds end
function default.node_sound_sand_defaults() return sand.sounds end
function default.node_sound_gravel_defaults() return gravel.sounds end
function default.node_sound_leaves_defaults() return grass.sounds end
function default.node_sound_glass_defaults() return glass.sounds end
function default.node_sound_ice_defaults() return glass.sounds end
function default.node_sound_metal_defaults() return metal.sounds end
function default.node_sound_water_defaults() return water.sounds end
function default.node_sound_snow_defaults() return snow.sounds end
