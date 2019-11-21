--
--

-- Wet and Dry versions of patterned nodes.
for k,v in pairs(nc_stuccol.patterns)do
  minetest.register_node("nc_stucco:stucco_"..v.."_clay",{
    description = "Wet Stucco with "..v.." Pattern",
    tiles = {"canvas1a.png^"..v..".png"},
    groups = {workable = 1, crumbly = 1, stucco_damp = 1},
})
  minetest.register_node("nc_stucco:stucco_"..v.."_clay_dry",{
    description = "Dry Stucco with "..v.." Pattern",
    tiles = {"canvas1b.png^"..v..".png"},
    groups = {crumbly = 2, cracky = 1},
})
minetest.register_node("nc_stucco:stucco_"..v.."_granite",{
  description = "Wet Stucco with "..v.." Pattern",
  tiles = {"canvas2.png^"..v..".png^"..v..".png"},
  groups = {workable = 1, crumbly = 1},
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
  groups = { crumbly = 1, stucco_damp = 1},
})
minetest.register_node("nc_stucco:stucco_"..v.."_granite",{
  description = v.." Stucco",
  tiles = {"canvas2.png^"..v..".png"},
  groups = {crumbly = 1,  stucco_damp = 1},
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
tiles = {"canvas2.png"},
groups = { crumbly = 3},
drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125}
		}
	}
})
minetest.register_node("nc_stucco:post_"..n.."_clay",{
  description = "Clay Stucco Post",
  tiles = {"canvas1a.png"},
  groups = { crumbly = 1},
  drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125}
		}
	}
  })
end