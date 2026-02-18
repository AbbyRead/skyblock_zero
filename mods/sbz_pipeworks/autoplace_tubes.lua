-- autorouting for pneumatic tubes


local function is_tube(nodename)
	return pipeworks.table_contains(pipeworks.tubenodes, nodename)
end

--a function for determining which side of the node we are on
local function nodeside(node, tubedir)
	if node.param2 < 0 or node.param2 > 23 then
		node.param2 = 0
	end

	local backdir = minetest.facedir_to_dir(node.param2)
	local back = vector.dot(backdir, tubedir)
	if back == 1 then
		return "back"
	elseif back == -1 then
		return "front"
	end

	local topdir = pipeworks.facedir_to_top_dir(node.param2)
	local top = vector.dot(topdir, tubedir)
	if top == 1 then
		return "top"
	elseif top == -1 then
		return "bottom"
	end

	local rightdir = pipeworks.facedir_to_right_dir(node.param2)
	local right = vector.dot(rightdir, tubedir)
	if right == 1 then
		return "right"
	elseif right == -1 then
		return "left"
	end

	-- Fallback with a warning for inapplicable values
	-- (e.g. one that produces a direction not aligned to any axis).
	core.log("warning", "[pipeworks] nodeside: unexpected tubedir, defaulting to left. " ..
		"node.param2=" .. tostring(node.param2) ..
		" tubedir=" .. minetest.pos_to_string(tubedir))
	return "left"
end

-- Convert camera yaw and pitch to the nearest facedir param2 value.

-- Degrees start at 0 facing North, increasing while turning counter-clockwise (if looking down from above):
--   0       = looking toward +Z (North)
--   π/2     = looking toward -X (West)
--   π       = looking toward -Z (South)
--   3π/2    = looking toward +X (East)
--
local function look_to_facedir(yaw, pitch)
    -- Vertical placement threshold (directionality favors yaw, but allows pitch)
    local limit = math.pi * 0.40   -- ≈ 72°

    -- Looking up means node faces down
    if pitch > limit then
        return 0
    elseif pitch < -limit then
        return 20
    end

	-- Round yaw to nearest 90° sector.
	-- Normalise to [0, 2π) first so the modulo is well-defined.
	yaw = yaw % (2 * math.pi)
	local sector = math.floor(yaw / (math.pi / 2) + 0.5) % 4

	-- Map sector index to facedir param2.
	-- Sector 0 (yaw ≈ 0):   looking toward +Z (North)  |  param2 as 2 would make node face North
	-- Sector 1 (yaw ≈ π/2): looking toward -X (West)   |  param2 as 1 would make node face West
	-- Sector 2 (yaw ≈ π):   looking toward -Z (South)  |  param2 as 0 would make node face South
	-- Sector 3 (yaw ≈ 3π/2):looking toward +X (East)   |  param2 as 3 would make node face East

	-- Use opposite angles instead so that it faces camera
	return ({ [0] = 0, 3, 2, 1 })[sector] -- node mirrors (not matches) camera angle when placed
end

local function yaw_to_4dir(yaw)
    yaw = yaw % (2 * math.pi)
    local sector = math.floor(yaw / (math.pi / 2) + 0.5) % 4

    -- Map yaw sectors to 4dir param2
    return ({ [0] = 0, 3, 2, 1 })[sector]
end

local vts = { 0, 3, 1, 4, 2, 5 }
local tube_table = { [0] = 1, 2, 2, 4, 2, 4, 4, 5, 2, 3, 4, 6, 4, 6, 5, 7, 2, 4, 3, 6, 4, 5, 6, 7, 4, 6, 6, 8, 5, 7, 7, 9, 2, 4, 4, 5, 3, 6, 6, 7, 4, 6, 5, 7, 6, 8, 7, 9, 4, 5, 6, 7, 6, 7, 8, 9, 5, 7, 7, 9, 7, 9, 9, 10 }
local tube_table_facedirs = { [0] = 0, 0, 5, 0, 3, 4, 3, 0, 2, 0, 2, 0, 6, 4, 3, 0, 7, 12, 5, 12, 7, 4, 5, 5, 18, 20, 16, 0, 7, 4, 7, 0, 1, 8, 1, 1, 1, 13, 1, 1, 10, 8, 2, 2, 17, 4, 3, 6, 9, 9, 9, 9, 21, 13, 1, 1, 10, 10, 11, 2, 19, 4, 3, 0 }
local function tube_autoroute(pos)
	local active = { 0, 0, 0, 0, 0, 0 }
	local nctr = minetest.get_node(pos)
	if not is_tube(nctr.name) then return end

	local adjustments = {
		{ x = -1, y = 0,  z = 0 },
		{ x = 1,  y = 0,  z = 0 },
		{ x = 0,  y = -1, z = 0 },
		{ x = 0,  y = 1,  z = 0 },
		{ x = 0,  y = 0,  z = -1 },
		{ x = 0,  y = 0,  z = 1 }
	}
	-- xm = 1, xp = 2, ym = 3, yp = 4, zm = 5, zp = 6

	local adjlist = {} -- this will be used in item_transport

	for i, adj in ipairs(adjustments) do
		local position = vector.add(pos, adj)
		local node = minetest.get_node(position)

		local idef = minetest.registered_nodes[node.name]
		-- handle the tubes themselves
		if is_tube(node.name) then
			active[i] = 1
			table.insert(adjlist, adj)
			-- handle new style connectors
		elseif idef and idef.tube and idef.tube.connect_sides then
			if idef.tube.connect_sides[nodeside(node, vector.multiply(adj, -1))] then
				active[i] = 1
				table.insert(adjlist, adj)
			end
		end
	end

	minetest.get_meta(pos):set_string("adjlist", minetest.serialize(adjlist))

	-- all sides checked, now figure which tube to use.

	local nodedef = minetest.registered_nodes[nctr.name]
	local basename = nodedef.basename
	if nodedef.style == "old" then
		local nsurround = ""
		for _, n in ipairs(active) do
			nsurround = nsurround .. n
		end
		nctr.name = basename .. "_" .. nsurround
	elseif nodedef.style == "6d" then
		local s = 0
		for i, n in ipairs(active) do
			if n == 1 then
				s = s + 2 ^ vts[i]
			end
		end
		nctr.name = basename .. "_" .. tube_table[s]
		nctr.param2 = tube_table_facedirs[s]
	end
	minetest.swap_node(pos, nctr)
end

function pipeworks.scan_for_tube_objects(pos)
	for side = 1, 6 do
		tube_autoroute(vector.add(pos, pipeworks.directions.side_to_dir(side)))
	end
end

-- FIX: after_place previously saved original_param2, called scan_for_tube_objects
-- (which skipped autorouting pos itself), then restored original_param2 — but that
-- restoration was misguided because:
--   1. The placed node IS a tube and SHOULD be autorouted like any other tube.
--   2. Neighbours were updated while seeing whatever param2 the node happened to
--      have at placement time, which may not match the final autorouted state.

function pipeworks.after_place(pos, placer)
    if placer and placer.get_look_horizontal then
        local node = minetest.get_node(pos)
        local def = minetest.registered_nodes[node.name]

        local yaw = placer:get_look_horizontal()
        local pitch = placer.get_look_vertical and placer:get_look_vertical() or 0

        if def.paramtype2 == "4dir" then
            node.param2 = yaw_to_4dir(yaw)
        elseif def.paramtype2 == "facedir" then
            node.param2 = look_to_facedir(yaw, pitch)
        end

        minetest.swap_node(pos, node)
    end

    tube_autoroute(pos)
    pipeworks.scan_for_tube_objects(pos)
end

function pipeworks.after_dig(pos)
	pipeworks.scan_for_tube_objects(pos)
end

-- Screwdriver calls this function before rotating a node.
-- However, connections must be updated *after* the node is rotated
-- So, this function does the rotation itself and returns `true`.
-- (Note: screwdriver already checks for protected areas.)

-- This should only be used for tubes that don't autoconnect.
-- (For example, one-way tubes.)
-- Autoconnecting tubes will just revert back to their original state
-- when they are updated.
function pipeworks.on_rotate(pos, node, user, mode, new_param2)
	node.param2 = new_param2
	minetest.swap_node(pos, node)
	pipeworks.scan_for_tube_objects(pos)
	return true
end

if minetest.get_modpath("mesecons_mvps") then
	mesecon.register_on_mvps_move(function(moved_nodes)
		for _, n in ipairs(moved_nodes) do
			pipeworks.scan_for_tube_objects(n.pos)
			pipeworks.scan_for_tube_objects(n.oldpos)
		end
	end)
end