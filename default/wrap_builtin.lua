local tex_alias = default.shim.texture_alias
local node_alias = minetest.registered_aliases

--- TEXTURES
local function get_tex_alias(s)
	if s:find("^", 1, true) and s:find("default_", 1, true) then
		for k, v in pairs(tex_alias) do
			s = s:gsub(k, v)
		end
		return s
	end
	
	return tex_alias[s]
end


local function apply_tex_alias(t)
	if not t then return nil end

	if type(t) == "string" then
		return get_tex_alias(t) or t
	end

	local out = {}
	for i, v in pairs(t) do
		if type(v) == "string" then
			table.insert(out, get_tex_alias(v) or v)
		elseif type(v) == "table" then
			local new_tile = {}
			for k, w in pairs(v) do
				new_tile[k] = w
			end

			local img_field = nil
			if v.name then img_field = "name" end
			if v.image then img_field = "image" end

			if img_field then 
				new_tile[img_field] = get_tex_alias(v[img_field]) or v[img_field]
			end
			table.insert(out, new_tile)
		end
	end
	return out
end

--- NODES

local function apply_node_alias(t)
	if not t then return nil end

	if type(t) == "string" then
		return node_alias[t] or t
	end

	local out = {}
	for i, v in pairs(t) do
		if type(v) == "string" then
			table.insert(out, node_alias[v] or v)
		else
			table.insert(out, v)
		end
	end
	return out
end

--- Definition table filter
function def_alias(def) 
	def.tiles = apply_tex_alias(def.tiles)
	def.overlay_tiles = apply_tex_alias(def.overlay_tiles)
	def.special_tiles = apply_tex_alias(def.special_tiles)
	def.inventory_image = apply_tex_alias(def.inventory_image)
	def.inventory_overlay = apply_tex_alias(def.inventory_overlay)
	def.wield_image = apply_tex_alias(def.wield_image)
	def.wield_overlay = apply_tex_alias(def.wield_overlay)
	def.blood_texture = apply_tex_alias(def.blood_texture)
	def.textures = apply_tex_alias(def.textures)

	def.follow = apply_node_alias(def.follow)
	def.nodenames = apply_node_alias(def.nodenames)
	if def.follow then
		minetest.debug("register follow".. dump(def.follow))
	end
	return def
end


local mt_register_node = minetest.register_node
function minetest.register_node(name, def) 
	mt_register_node(name, def_alias(def))
end

local mt_register_tool = minetest.register_tool
function minetest.register_tool(name, def) 
	mt_register_tool(name, def_alias(def))
end

local mt_register_craftitem = minetest.register_craftitem
function minetest.register_craftitem(name, def) 
	mt_register_craftitem(name, def_alias(def))
end

local mt_register_entity = minetest.register_entity
function minetest.register_entity(name, def) 
	minetest.debug("registering".. name)
	minetest.debug("default:apple".. dump(minetest.registered_aliases["default:apple"]))
	mt_register_entity(name, def_alias(def))
end

local mt_register_lbm = minetest.register_lbm
function minetest.register_lbm(def) 
	mt_register_lbm(def_alias(def))
end

