local alias = {}

local function get_alias(s)
	if s:find("^", 1, true) and s:find("default_", 1, true) then
		for k, v in pairs(alias) do
			s = s:gsub(k, v)
		end
		return s
	end
	
	return alias[s]
end


local function apply_alias(t)
	if not t then return nil end

	if type(t) == "string" then
		return get_alias(t) or t
	end

	local out = {}
	for i, v in pairs(t) do
		if type(v) == "string" then
			table.insert(out, get_alias(v) or v)
		elseif type(v) == "table" then
			local new_tile = {}
			for k, w in pairs(v) do
				new_tile[k] = w
			end

			local img_field = nil
			if v.name then img_field = "name" end
			if v.image then img_field = "image" end

			if img_field then 
				new_tile[img_field] = get_alias(v[img_field]) or v[img_field]
			end
			table.insert(out, new_tile)
		end
	end
	return out
end

function def_alias(def) 
	def.tiles = apply_alias(def.tiles)
	def.overlay_tiles = apply_alias(def.overlay_tiles)
	def.special_tiles = apply_alias(def.special_tiles)
	def.inventory_image = apply_alias(def.inventory_image)
	def.inventory_overlay = apply_alias(def.inventory_overlay)
	def.wield_image = apply_alias(def.wield_image)
	def.wield_overlay = apply_alias(def.wield_overlay)
	def.blood_texture = apply_alias(def.blood_texture)
	def.textures = apply_alias(def.textures)
	return def
end

local mt_register_node = minetest.register_node
local mt_register_tool = minetest.register_tool
local mt_register_craftitem = minetest.register_craftitem
local mt_register_entity = minetest.register_entity

function minetest.register_node(name, def) 
	mt_register_node(name, def_alias(def))
end

function minetest.register_tool(name, def) 
	mt_register_tool(name, def_alias(def))
end

function minetest.register_craftitem(name, def) 
	mt_register_craftitem(name, def_alias(def))
end

function minetest.register_entity(name, def) 
	mt_register_entity(name, def_alias(def))
end

alias["default_acacia_bush_sapling.png"] = "acacia_bush_sapling.png"
alias["default_acacia_bush_stem.png"] = "acacia_bush_stem.png"
alias["default_acacia_leaves.png"] = "acacia_leaves.png"
alias["default_acacia_leaves_simple.png"] = "acacia_leaves_simple.png"
alias["default_acacia_sapling.png"] = "acacia_sapling.png"
alias["default_acacia_tree.png"] = "acacia_tree.png"
alias["default_acacia_tree_top.png"] = "acacia_tree_top.png"
alias["default_acacia_wood.png"] = "acacia_wood.png"
alias["default_apple.png"] = "apple.png"
alias["default_aspen_leaves.png"] = "aspen_leaves.png"
alias["default_aspen_sapling.png"] = "aspen_sapling.png"
alias["default_aspen_tree.png"] = "aspen_tree.png"
alias["default_aspen_tree_top.png"] = "aspen_tree_top.png"
alias["default_aspen_wood.png"] = "aspen_wood.png"
alias["default_blueberries.png"] = "blueberry.png"
alias["default_blueberry_bush_leaves.png"] = "blueberry_bush_leaves.png"
alias["default_blueberry_bush_sapling.png"] = "blueberry_bush_sapling.png"
alias["default_blueberry_overlay.png"] = "blueberry_overlay.png"
alias["default_book.png"] = "paper_book.png"
alias["default_book_written.png"] = "paper_book_written.png"
alias["default_bookshelf.png"] = "paper_bookshelf.png"
alias["default_bookshelf_slot.png"] = "paper_bookshelf_slot.png"
alias["default_brick.png"] = "clay_brick_block.png"
alias["default_bronze_block.png"] = "bronze_block.png"
alias["default_bronze_ingot.png"] = "bronze_ingot.png"
alias["default_bush_sapling.png"] = "apple_bush_sapling.png"
alias["default_bush_stem.png"] = "apple_bush_stem.png"
alias["default_cactus_side.png"] = "cactus_side.png"
alias["default_cactus_top.png"] = "cactus_top.png"
alias["default_chest_front.png"] = "chest_front.png"
alias["default_chest_inside.png"] = "chest_inside.png"
alias["default_chest_lock.png"] = "chest_lock.png"
alias["default_chest_side.png"] = "chest_side.png"
alias["default_chest_top.png"] = "chest_top.png"
alias["default_clay.png"] = "clay.png"
alias["default_clay_brick.png"] = "clay_brick.png"
alias["default_clay_lump.png"] = "clay_lump.png"
alias["default_coal_block.png"] = "coal_block.png"
alias["default_coal_lump.png"] = "coal_lump.png"
alias["default_cobble.png"] = "stone_cobble.png"
alias["default_coniferous_litter.png"] = "dirt_dry_litter.png"
alias["default_coniferous_litter_side.png"] = "dirt_dry_litter_side.png"
alias["default_copper_block.png"] = "copper_block.png"
alias["default_copper_ingot.png"] = "copper_ingot.png"
alias["default_copper_lump.png"] = "copper_lump.png"
alias["default_coral_brown.png"] = "coral_brown.png"
alias["default_coral_cyan.png"] = "coral_cyan.png"
alias["default_coral_green.png"] = "coral_green.png"
alias["default_coral_orange.png"] = "coral_orange.png"
alias["default_coral_pink.png"] = "coral_pink.png"
alias["default_coral_skeleton.png"] = "coral_skeleton.png"
alias["default_desert_cobble.png"] = "sand_desert_cobble.png"
alias["default_desert_sand.png"] = "sand_desert.png"
alias["default_desert_sandstone.png"] = "sand_desert_sandstone.png"
alias["default_desert_sandstone_block.png"] = "sand_desert_sandstone_block.png"
alias["default_desert_sandstone_brick.png"] = "sand_desert_sandstone_brick.png"
alias["default_desert_stone.png"] = "sand_desert_stone.png"
alias["default_desert_stone_block.png"] = "sand_desert_stone_block.png"
alias["default_desert_stone_brick.png"] = "sand_desert_stone_brick.png"
alias["default_diamond.png"] = "diamond.png"
alias["default_diamond_block.png"] = "diamond_block.png"
alias["default_dirt.png"] = "dirt.png"
alias["default_dry_dirt.png"] = "dirt_dry.png"
alias["default_dry_grass.png"] = "dirt_grass_dry.png"
alias["default_dry_grass_1.png"] = "grass_dry_1.png"
alias["default_dry_grass_2.png"] = "grass_dry_2.png"
alias["default_dry_grass_3.png"] = "grass_dry_3.png"
alias["default_dry_grass_4.png"] = "grass_dry_4.png"
alias["default_dry_grass_5.png"] = "grass_dry_5.png"
alias["default_dry_grass_side.png"] = "dirt_grass_dry_side.png"
alias["default_dry_shrub.png"] = "shrub_dry.png"
alias["default_emergent_jungle_sapling.png"] = "jungle_emergent_sapling.png"
alias["default_fence_acacia_wood.png"] = "acacia_fence.png"
alias["default_fence_aspen_wood.png"] = "aspen_fence.png"
alias["default_fence_junglewood.png"] = "jungle_fence.png"
alias["default_fence_overlay.png"] = "fence_overlay.png"
alias["default_fence_pine_wood.png"] = "pine_fence.png"
alias["default_fence_rail_acacia_wood.png"] = "acacia_fence_rail.png"
alias["default_fence_rail_aspen_wood.png"] = "aspen_fence_rail.png"
alias["default_fence_rail_junglewood.png"] = "jungle_fence_rail.png"
alias["default_fence_rail_overlay.png"] = "fence_rail_overlay.png"
alias["default_fence_rail_pine_wood.png"] = "pine_fence_rail.png"
alias["default_fence_rail_wood.png"] = "apple_fence_rail.png"
alias["default_fence_wood.png"] = "apple_fence.png"
alias["default_fern_1.png"] = "grass_fern_1.png"
alias["default_fern_2.png"] = "grass_fern_2.png"
alias["default_fern_3.png"] = "grass_fern_3.png"
alias["default_flint.png"] = "fire_flint.png"
alias["default_furnace_bottom.png"] = "furnace_bottom.png"
alias["default_furnace_fire_bg.png"] = "furnace_fire_bg.png"
alias["default_furnace_fire_fg.png"] = "furnace_fire_fg.png"
alias["default_furnace_front.png"] = "furnace_front.png"
alias["default_furnace_front_active.png"] = "furnace_front_active.png"
alias["default_furnace_side.png"] = "furnace_side.png"
alias["default_furnace_top.png"] = "furnace_top.png"
alias["default_glass.png"] = "glass.png"
alias["default_glass_detail.png"] = "glass_detail.png"
alias["default_gold_block.png"] = "gold_block.png"
alias["default_gold_ingot.png"] = "gold_ingot.png"
alias["default_gold_lump.png"] = "gold_lump.png"
alias["default_grass.png"] = "dirt_grass.png"
alias["default_grass_1.png"] = "grass_1.png"
alias["default_grass_2.png"] = "grass_2.png"
alias["default_grass_3.png"] = "grass_3.png"
alias["default_grass_4.png"] = "grass_4.png"
alias["default_grass_5.png"] = "grass_5.png"
alias["default_grass_side.png"] = "dirt_grass_side.png"
alias["default_gravel.png"] = "gravel.png"
alias["default_ice.png"] = "snow_ice.png"
alias["default_iron_lump.png"] = "iron_lump.png"
alias["default_item_smoke.png"] = "lava_item_smoke.png"
alias["default_junglegrass.png"] = "jungle_grass.png"
alias["default_jungleleaves.png"] = "jungle_leaves.png"
alias["default_jungleleaves_simple.png"] = "jungle_leaves_simple.png"
alias["default_junglesapling.png"] = "jungle_sapling.png"
alias["default_jungletree.png"] = "jungle_tree.png"
alias["default_jungletree_top.png"] = "jungle_tree_top.png"
alias["default_junglewood.png"] = "jungle_wood.png"
alias["default_kelp.png"] = "kelp.png"
alias["default_key.png"] = "lock_key.png"
alias["default_key_skeleton.png"] = "lock_blank_key.png"
alias["default_ladder_steel.png"] = "iron_ladder.png"
alias["default_ladder_wood.png"] = "wood_ladder.png"
alias["default_large_cactus_seedling.png"] = "cactus_large_seedling.png"
alias["default_lava.png"] = "lava.png"
alias["default_lava_flowing_animated.png"] = "lava_flowing_animated.png"
alias["default_lava_source_animated.png"] = "lava_source_animated.png"
alias["default_leaves.png"] = "apple_leaves.png"
alias["default_leaves_simple.png"] = "apple_leaves_simple.png"
alias["default_marram_grass_1.png"] = "grass_marram_1.png"
alias["default_marram_grass_2.png"] = "grass_marram_2.png"
alias["default_marram_grass_3.png"] = "grass_marram_3.png"
alias["default_mese_block.png"] = "mese_block.png"
alias["default_mese_crystal.png"] = "mese_crystal.png"
alias["default_mese_crystal_fragment.png"] = "mese_crystal_fragment.png"
alias["default_mese_post_light_side.png"] = "mese_post_light_side.png"
alias["default_mese_post_light_side_dark.png"] = "mese_post_light_side_dark.png"
alias["default_meselamp.png"] = "mese_lamp.png"
alias["default_mineral_coal.png"] = "coal_mineral.png"
alias["default_mineral_copper.png"] = "copper_mineral.png"
alias["default_mineral_diamond.png"] = "diamond_mineral.png"
alias["default_mineral_gold.png"] = "gold_mineral.png"
alias["default_mineral_iron.png"] = "iron_mineral.png"
alias["default_mineral_mese.png"] = "mese_mineral.png"
alias["default_mineral_tin.png"] = "tin_mineral.png"
alias["default_moss.png"] = "snow_moss.png"
alias["default_moss_side.png"] = "snow_moss_side.png"
alias["default_mossycobble.png"] = "stone_mossycobble.png"
alias["default_obsidian.png"] = "glass_obsidian.png"
alias["default_obsidian_block.png"] = "glass_obsidian_block.png"
alias["default_obsidian_brick.png"] = "glass_obsidian_brick.png"
alias["default_obsidian_glass.png"] = "glass_obsidian_glass.png"
alias["default_obsidian_glass_detail.png"] = "glass_obsidian_glass_detail.png"
alias["default_obsidian_shard.png"] = "glass_obsidian_shard.png"
alias["default_paper.png"] = "paper.png"
alias["default_papyrus.png"] = "papyrus.png"
alias["default_permafrost.png"] = "snow_permafrost.png"
alias["default_pine_bush_sapling.png"] = "pine_bush_sapling.png"
alias["default_pine_bush_stem.png"] = "pine_bush_stem.png"
alias["default_pine_needles.png"] = "pine_needles.png"
alias["default_pine_sapling.png"] = "pine_sapling.png"
alias["default_pine_tree.png"] = "pine_tree.png"
alias["default_pine_tree_top.png"] = "pine_tree_top.png"
alias["default_pine_wood.png"] = "pine_wood.png"
alias["default_rainforest_litter.png"] = "dirt_litter.png"
alias["default_rainforest_litter_side.png"] = "dirt_litter_side.png"
alias["default_river_water.png"] = "water_river.png"
alias["default_river_water_flowing_animated.png"] = "water_river_flowing_animated.png"
alias["default_river_water_source_animated.png"] = "water_river_source_animated.png"
alias["default_sand.png"] = "sand.png"
alias["default_sandstone.png"] = "sand_sandstone.png"
alias["default_sandstone_block.png"] = "sand_sandstone_block.png"
alias["default_sandstone_brick.png"] = "sand_sandstone_brick.png"
alias["default_sapling.png"] = "apple_sapling.png"
alias["default_sign_steel.png"] = "iron_sign.png"
alias["default_sign_wall_steel.png"] = "iron_sign_wall.png"
alias["default_sign_wall_wood.png"] = "wood_sign_wall.png"
alias["default_sign_wood.png"] = "wood_sign.png"
alias["default_silver_sand.png"] = "sand_silver.png"
alias["default_silver_sandstone.png"] = "sand_silver_sandstone.png"
alias["default_silver_sandstone_block.png"] = "sand_silver_sandstone_block.png"
alias["default_silver_sandstone_brick.png"] = "sand_silver_sandstone_brick.png"
alias["default_snow.png"] = "snow.png"
alias["default_snow_side.png"] = "dirt_snow_side.png"
alias["default_snowball.png"] = "snow_ball.png"
alias["default_steel_block.png"] = "iron_block.png"
alias["default_steel_ingot.png"] = "iron_ingot.png"
alias["default_stick.png"] = "wood_stick.png"
alias["default_stone.png"] = "stone.png"
alias["default_stone_block.png"] = "stone_block.png"
alias["default_stone_brick.png"] = "stone_brick.png"
alias["default_stones.png"] = "stone_stones.png"
alias["default_stones_side.png"] = "stone_stones_side.png"
alias["default_tin_block.png"] = "tin_block.png"
alias["default_tin_ingot.png"] = "tin_ingot.png"
alias["default_tin_lump.png"] = "tin_lump.png"
alias["default_tool_bronzeaxe.png"] = "bronze_axe.png"
alias["default_tool_bronzepick.png"] = "bronze_pick.png"
alias["default_tool_bronzeshovel.png"] = "bronze_shovel.png"
alias["default_tool_bronzesword.png"] = "bronze_sword.png"
alias["default_tool_diamondaxe.png"] = "diamond_axe.png"
alias["default_tool_diamondpick.png"] = "diamond_pick.png"
alias["default_tool_diamondshovel.png"] = "diamond_shovel.png"
alias["default_tool_diamondsword.png"] = "diamond_sword.png"
alias["default_tool_meseaxe.png"] = "mese_axe.png"
alias["default_tool_mesepick.png"] = "mese_pick.png"
alias["default_tool_meseshovel.png"] = "mese_shovel.png"
alias["default_tool_mesesword.png"] = "mese_sword.png"
alias["default_tool_steelaxe.png"] = "iron_axe.png"
alias["default_tool_steelpick.png"] = "iron_pick.png"
alias["default_tool_steelshovel.png"] = "iron_shovel.png"
alias["default_tool_steelsword.png"] = "iron_sword.png"
alias["default_tool_stoneaxe.png"] = "stone_axe.png"
alias["default_tool_stonepick.png"] = "stone_pick.png"
alias["default_tool_stoneshovel.png"] = "stone_shovel.png"
alias["default_tool_stonesword.png"] = "stone_sword.png"
alias["default_tool_woodaxe.png"] = "wood_axe.png"
alias["default_tool_woodpick.png"] = "wood_pick.png"
alias["default_tool_woodshovel.png"] = "wood_shovel.png"
alias["default_tool_woodsword.png"] = "wood_sword.png"
alias["default_torch_animated.png"] = "torch_animated.png"
alias["default_torch_on_ceiling_animated.png"] = "torch_on_ceiling_animated.png"
alias["default_torch_on_floor.png"] = "torch_on_floor.png"
alias["default_torch_on_floor_animated.png"] = "torch_on_floor_animated.png"
alias["default_tree.png"] = "apple_tree.png"
alias["default_tree_top.png"] = "apple_tree_end.png"
alias["default_water.png"] = "water.png"
alias["default_water_flowing_animated.png"] = "water_flowing_animated.png"
alias["default_water_source_animated.png"] = "water_source_animated.png"
alias["default_wood.png"] = "apple_wood.png"
