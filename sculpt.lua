local tm = "nc_stucco:"

local function resetsi(pos)
	return pos and not minetest.get_meta(pos):set_int("sculptindex", 0) and true
end

minetest.register_node(tm.."sculptier", {
	tiles = {"canvas3.png","canvas3.png","canvas3.png","canvas3.png","canvas3.png","canvas3.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, 0.125, -0.375, 0.375, 0.5, 0.375}, -- NodeBox1
			{-0.3125, 0.0625, -0.3125, 0.3125, 0.125, 0.3125}, -- NodeBox2
			{-0.25, -0, -0.25, 0.25, 0.0625, 0.25}, -- NodeBox3
			{-0.1875, -0.5, -0.1875, 0.1875, -0, 0.1875}, -- NodeBox4
			{-0.125, 0.4375, -0.4375, 0.125, 0.469125, -0.375}, -- NodeBox6
			{-0.125, 0.149966, -0.4375, 0.125, 0.1875, -0.375}, -- NodeBox7
			{0.125, 0.137308, -0.4375, 0.1575, 0.484615, -0.375}, -- NodeBox11
			{-0.161538, 0.137308, -0.4375, -0.125, 0.488654, -0.375}, -- NodeBox12
			{0.1875, -0.5, -0.1875, 0.3125, -0.4375, 0.1875}, -- NodeBox13
			{-0.3125, -0.5, -0.1875, -0.1875, -0.4375, 0.1875}, -- NodeBox14
			{-0.1875, -0.5, -0.3125, 0.1875, -0.4375, -0.1875}, -- NodeBox15
			{-0.1875, -0.5, 0.1875, 0.1875, -0.4375, 0.3125}, -- NodeBox16
			{-0.125, -0.5, 0.3125, 0.125, -0.4375, 0.375}, -- NodeBox17
			{-0.125, -0.5, -0.375, 0.125, -0.4375, -0.3125}, -- NodeBox18
			{-0.375, -0.5, -0.125, -0.3125, -0.4375, 0.125}, -- NodeBox19
			{0.3125, -0.5, -0.125, 0.375, -0.4375, 0.125}, -- NodeBox20
			{0.1875, -0.4375, -0.0625, 0.3125, -0.375, 0.0625}, -- NodeBox21
			{-0.3125, -0.4375, -0.0625, -0.1875, -0.375, 0.0625}, -- NodeBox22
			{-0.0625, -0.4375, -0.3125, 0.0625, -0.375, -0.1875}, -- NodeBox24
			{-0.0625, -0.4375, 0.125, 0.0625, -0.375, 0.25}, -- NodeBox25
		}
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_int("sculptindex", 0)
	end,
	on_punch = function(pos)
		local ppos, meta = {x = pos.x, y= pos.y, z = pos.z}, minetest.get_meta(pos)
		local node = minetest.get_node(pos)
		local fa = nodecore.facedirs[node.param2].f
		fa.n = nil
		local entpos = vector.add(ppos, vector.divide(fa, 2.52))
		entpos.y = entpos.y + 0.335


		local objs = minetest.get_objects_inside_radius(pos, 0.9)

		local function nameparse(obj)
			return obj and obj:get_entity_name() and string.find(obj:get_entity_name(), "stucco") and obj:remove() or false
		end
		for n = 1, #objs do
			nameparse(objs[n])	
		end

		local num = meta:get_int("sculptindex") + 1
		num = num > 0 and num <= #nc_stuccol.meshies.names and num or 1
		minetest.add_entity(entpos, tm..nc_stuccol.meshies.names[num],nil)
		meta:set_int("sculptindex", num)
		--minetest.chat_send_all("|||"..num.."|||")
		
	end
})

for n = 1, #nc_stuccol.meshies.names, 1 do
local def =
{
    hp_max = 1,
    physical = false,
    collide_with_objects = true,
    collisionbox = {0,0,0,0,0,0},
	visual = "mesh",
	mesh = nc_stuccol.meshies[n],
    visual_size = {x = 2, y = 2},
    textures = {"pseudo.png"},
	is_visible = true,
	--automatic_rotate = 0.5,
    glow = 0,

    static_save = false,

    on_activate= function(self, dtime)
	   local ent = self.object
	   local pos = ent:get_pos()
	   local paramii = minetest.get_node(pos).param2
	   --minetest.chat_send_all(minetest.get_node(pos).param2)
	   if(paramii == 0 or paramii == 2)then
	   ent:set_yaw(0)
	   else ent:set_yaw(4.716) end
	end,
	on_step = function(self)
		local pos = self.object:get_pos()
		local objs = minetest.get_objects_inside_radius(pos, 5)

		local function dependent_entity_disorder(objs)
		if objs then 
			local indice;
			for n = 1, #objs do
				if objs[n] and objs[n]:is_player() then
					indice = true
				else end
			end
			return indice
		else end
		return indice
	end
		return dependent_entity_disorder(objs) or resetsi(pos) and self.object:remove()
	end
}
	minetest.register_entity(tm..nc_stuccol.meshies.names[n],def)

end

-- Sculpting

nodecore.register_craft({
    label = "sculpt" ,
    action = "pummel",
    priority = 1,
    toolgroups = {scratchy = 2},
    nodes = {
        {
            match = {groups = {sculpt = true}},
        },
    },
	after = function(pos)
		local under = {x = pos.x, y = pos.y - 1, z = pos.z}
		if(minetest.get_node(under).name == nc_stuccol.bench)then
		local node = minetest.get_node(pos)
		local choice = minetest.get_meta(under):get_int("sculptindex")
		choice = choice ~= 0 and choice or 1
		minetest.remove_node(pos)
		local function concrete_type(node)
			local name = node and string.find(node.name, "blank_ply") and node.name
			
			return name and string.find(name, "terrain_stone") and 4 or string.find(name, "adobe") and 2 or string.find(name, "coalstone") and 3 or string.find(name, "sandstone") and 1 or nil
		end
		minetest.set_node(pos, {name = tm..nc_stuccol.boss.concrete_mats[concrete_type(node)].."_"..nc_stuccol.meshies.names[choice]})
	else end
    end
})