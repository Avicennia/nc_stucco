--
--

-- Wet and Dry versions of patterned nodes.
for k,v in pairs(nc_stuccol.patterns)do
  minetest.register_node("nc_stucco:stucco_"..v.."_clay",{
    description = "Wet Stucco with "..v.." Pattern",
    tiles = {"canvas1a.png^"..v..".png"},
    groups = {workable = 1, crumbly = 2, stucco_damp = 1},
    on_punch = function(pos,node, puncher, itemstack)
      if(puncher:get_wielded_item():get_name() == "nc_stucco:stylusW")then
      if(nc_stuccol.patterns[k+1])then
      minetest.set_node(pos, {name = "nc_stucco:stucco_".. nc_stuccol.patterns[k+1]  .."_clay"})
      elseif(nc_stuccol.patterns[k+1] == nil)then
        minetest.set_node(pos, {name = "nc_stucco:stucco_".. nc_stuccol.patterns[1]  .."_clay"})
      else end
    else end
    end,
    on_rightclick = function(pos,node, clicker, itemstack)
      if(clicker:get_wielded_item():get_name() == "nc_stucco:stylusW")then
      if(nc_stuccol.patterns[k-1])then
      minetest.set_node(pos, {name = "nc_stucco:stucco_".. nc_stuccol.patterns[k-1]  .."_clay"})
      elseif(nc_stuccol.patterns[k-1] == nil)then
        minetest.set_node(pos, {name = "nc_stucco:stucco_".. nc_stuccol.patterns[29]  .."_clay"})
      else end
    else end
    end
})
  minetest.register_node("nc_stucco:stucco_"..v.."_clay_dry",{
    description = "Dry Stucco with "..v.." Pattern",
    tiles = {"canvas1b.png^"..v..".png"},
    groups = {crumbly = 2, cracky = 2, stucco_clay_dry = 1},
})
minetest.register_node("nc_stucco:stucco_"..v.."_granite",{
  description = "Wet Stucco with "..v.." Pattern",
  tiles = {"canvas2.png^"..v..".png^"..v..".png"},
  groups = {workable = 1, crumbly = 2},
})
minetest.register_node("nc_stucco:stucco_"..v.."_granite_dry",{
  description = "Dry Stucco with "..v.." Pattern",
  tiles = {"canvas2.png^"..v..".png"},
  groups = {crumbly = 2, cracky = 2},
})
end
-- Curing Stage Nodes.
for _,v in pairs(nc_stuccol.curing.stages) do
minetest.register_node("nc_stucco:stucco_"..v.."_clay",{
  description = v.." Stucco",
  tiles = {"canvas1a.png^"..v..".png"},
  groups = {crumbly = 2, stucco_damp = 1},
})
minetest.register_node("nc_stucco:stucco_"..v.."_granite",{
  description = v.." Stucco",
  tiles = {"canvas2.png^"..v..".png"},
  groups = {crumbly = 2,  stucco_damp = 1},
  })
end
-- Crushed Nodes.
minetest.register_node("nc_stucco:crushed_stucco_clay",{
description = "Crushed Stucco",
tiles = {"canvas1a.png^[mask:vermi.png"},
groups = { crumbly = 1},
on_punch = function(pos)
end
})

minetest.register_node("nc_stucco:crushed_stucco_granite",{
  description = "Crushed Stucco",
  tiles = {"canvas2.png^[mask:vermi.png"},
  groups = { crumbly = 1},
  on_punch = function(pos)
  end
  })
-- Post Nodes.
for n=1, #nc_stuccol.posts, 1 do
minetest.register_node("nc_stucco:post_"..n.."_granite",{
description = "Granite Stucco Post",
tiles = {"canvas2.png^postbordythin.png"},
groups = { crumbly = 3, cracky = 3},
drawtype = "nodebox",
drawtype = "nodebox",
paramtype = "light",
node_box = {
  type = "connected",
  fixed = {
    {-0.125, -0.5, -0.125, 0.125, 0.5, 0.125}
  },
  connect_front = {{-0.125, -0.5, -0.5, 0.125, 0.0625, -0.125}},
  connect_back = {{-0.125, -0.5, 0.125, 0.125, 0.0625, 0.5}},
  connect_left = {{-0.5, -0.5, -0.125, -0.125, 0.0625, 0.125}},
  connect_right = {{0.125, -0.5, -0.125, 0.5, 0.0625, 0.125}}
},
connects_to = {"group:crumbly"},
connect_sides = { "top", "bottom", "front", "left", "back", "right" }
})
minetest.register_node("nc_stucco:post_"..n.."_clay",{
  description = "Clay Stucco Post",
  tiles = {"canvas1a.png^postbordythin.png"},
  groups = { crumbly = 1, cracky = 2},
  drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "connected",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125}
    },
    connect_front = {{-0.125, -0.5, -0.5, 0.125, 0.0625, -0.125}},
    connect_back = {{-0.125, -0.5, 0.125, 0.125, 0.0625, 0.5}},
    connect_left = {{-0.5, -0.5, -0.125, -0.125, 0.0625, 0.125}},
    connect_right = {{0.125, -0.5, -0.125, 0.5, 0.0625, 0.125}}
  },
  connects_to = {"group:crumbly"},
  connect_sides = { "top", "bottom", "front", "left", "back", "right" }
  })
end