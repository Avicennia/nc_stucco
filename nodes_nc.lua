--local dirs = {{x=1,y=0,z=0},{x=0,y=1,z=0},{x=-1,y=0,z=0},{x=0,y=-1,z=0},{x=0,y=0,z=1},{x=0,y=0,z=-1}}

--  --  --  --  --  --  MUD TILES --  --  --  --  --  --  
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
end

for _,v in pairs(nc_stuccol.curing.stages) do
minetest.register_node("nc_stucco:stucco_"..v.."_clay",{
  description = v.." Stucco",
  tiles = {"canvas1a.png^"..v..".png"},
  groups = { crumbly = 1, stucco_damp = 1},
})
end
minetest.register_node("nc_stucco:crushed_stucco_clay",{
description = "Crushed Stucco",
tiles = {"canvas1a.png^[mask:vermi.png"},
groups = { crumbly = 1},
on_punch = function(pos)
end
})
--  --  --  --  --  --  MUD TILES --  --  --  --  --  --  



for k,v in pairs(nc_stuccol.patterns)do
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
for _,v in pairs(nc_stuccol.curing.stages) do
  minetest.register_node("nc_stucco:stucco_"..v.."_granite",{
    description = v.." Stucco",
    tiles = {"canvas2.png^"..v..".png"},
    groups = {crumbly = 1,  stucco_damp = 1},
    })
  end
  minetest.register_node("nc_stucco:crushed_stucco_granite",{
    description = "Crushed Stucco",
    tiles = {"canvas2.png^[mask:vermi.png"},
    groups = { crumbly = 1},
    on_punch = function(pos)
    end
    })
