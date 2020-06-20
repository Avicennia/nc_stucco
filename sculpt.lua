local tm = "nc_stucco:"


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
		meta:set_int("sculptindex", 1)
	end,
	on_punch = function(pos)
		local ppos, meta = {x = pos.x, y= pos.y, z = pos.z}, minetest.get_meta(pos)
		local node = minetest.get_node(pos)
		local fa = nodecore.facedirs[node.param2].f
		fa.n = nil
		local entpos = vector.add(ppos, vector.divide(fa, 2.52))
		entpos.y = entpos.y + 0.335


		local objs = minetest.get_objects_inside_radius(pos, 0.9)
		for n = 1, #objs do
		objs[1]:remove()
		end

		local num = meta:get_int("sculptindex") or 1
		num = num > 0 and num < #nc_stuccol.meshies and num or 1
		minetest.add_entity(entpos, tm..nc_stuccol.meshies.names[num],nil)
		num = num > 0 and num < #nc_stuccol.meshies and num + 1 or 1
		meta:set_int("sculptindex", num)
		
		
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
	   ent:set_yaw(190)
	end}
	minetest.register_entity(tm..nc_stuccol.meshies.names[n],def)
end