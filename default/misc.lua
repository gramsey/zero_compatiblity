default.LIGHT_MAX = minetest.LIGHT_MAX

function default.can_interact_with_node(player, pos)
	local name = player:get_player_name()
	local protected = minetest.is_protected(pos, name) 
	local locked = lock and lock.is_locked(pos, player)

	return not (protected or locked)
end
