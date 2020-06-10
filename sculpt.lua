local tm = "nc_stucco:"

minetest.register_node(tm.."sculptier", {
	tiles = {"table.png","table2.png","table2.png","table2.png","table2.png","table2.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.0625, -0.5, 0.5, 0.4375, 0.5}, -- NodeBox1
			{0.375, -0.5, 0.375, 0.5, 0.0625, 0.5}, -- NodeBox2
			{0.375, -0.5, -0.5, 0.5, 0.0625, -0.375}, -- NodeBox3
			{-0.5, -0.5, -0.5, -0.375, 0.0625, -0.375}, -- NodeBox4
			{-0.5, -0.5, 0.375, -0.375, 0.0625, 0.5}, -- NodeBox5
			{0.25, -0.5, -0.5, 0.375, -0.4375, -0.375}, -- NodeBox6
			{0.375, -0.5, -0.375, 0.5, -0.4375, -0.25}, -- NodeBox7
			{0.375, -0.5, 0.25, 0.5, -0.4375, 0.375}, -- NodeBox8
			{0.25, -0.5, 0.375, 0.375, -0.4375, 0.5}, -- NodeBox9
			{-0.375, -0.5, 0.375, -0.25, -0.4375, 0.5}, -- NodeBox10
			{-0.5, -0.5, 0.25, -0.375, -0.4375, 0.375}, -- NodeBox11
			{-0.5, -0.5, -0.375, -0.375, -0.4375, -0.25}, -- NodeBox12
			{-0.375, -0.5, -0.5, -0.25, -0.4375, -0.375}, -- NodeBox13
			{-0.375, 0.4375, -0.375, 0.375, 0.5, -0.3125}, -- NodeBox14
			{-0.375, 0.4375, 0.3125, 0.375, 0.5, 0.375}, -- NodeBox15
			{0.3125, 0.4375, -0.3125, 0.375, 0.5, 0.3125}, -- NodeBox16
			{-0.375, 0.4375, -0.3125, -0.3125, 0.5, 0.3125}, -- NodeBox17
		}
	},
	on_punch = function(pos)
	minetest.add_entity(pos, tm.."stylusent",nil)
	end
})

local roller2 =
{
    hp_max = 1,
    physical = false,
    collide_with_objects = true,
    collisionbox = {0, 0,0,0,0,0},
    visual = "wielditem",
    visual_size = {x = 0.1, y = 0.1},
    textures = {tm.."pillar_end"},
    is_visible = true,
    glow = 0,

    static_save = false,

    on_activate= function(self, dtime)
	   local ent = self.object
	   local pos = ent:get_pos()
	   ent:set_pos({x = pos.x + 0.5, y = pos.y + 0.25, z = pos.z})
	end}
	minetest.register_entity(tm.."stylusent",roller2)