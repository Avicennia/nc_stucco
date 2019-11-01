local dirs = {{x=1,y=0,z=0},{x=0,y=1,z=0},{x=-1,y=0,z=0},{x=0,y=-1,z=0},{x=0,y=0,z=1},{x=0,y=0,z=-1}}

--  --  --  --  --  --  MUD TILES --  --  --  --  --  --  
for k,v in pairs(nc_stuccol.patterns)do
  minetest.register_node("nc_stucco:stucco_"..v.."_clay",{
    description = "Stucco with "..v.." Pattern",
    tiles = {"canvas1a.png^"..v..".png"},
    groups = {workable = 1, crumbly = 1},
})
end
for _,v in pairs(nc_stuccol.curing.stages) do
minetest.register_node("nc_stucco:stucco"..v,{
  description = v.." Stucco",
  tiles = {"canvas1a.png^"..v..".png"},
  groups = {workable = 1, crumbly = 1},
  on_construct = function(pos)
  local noden = minetest.get_node(pos).name
  if(noden == "nc_stucco:stuccopowdered")then
    local timer =minetest.get_node_timer(pos)
    local index = math.random(0.3,1)
    timer:start(10*index)
  end
  end,
  on_timer = function(pos)
  local ind = false
  for _,v in pairs(dirs)do
    local query = minetest.get_node(vector.add(v,pos)).name
    if(query == "nc_terrain:water_source")then
      ind = true
    else end
    end
    if(ind == true)then
      minetest.set_node(pos, {name = "nc_stucco:stucco"..nc_stuccol.curing.stages[1]})
    else return end
      end
  })
end

minetest.register_node("nc_stucco:crushed_stucco",{
description = "Crushed Stucco",
tiles = {"canvas1a.png^[mask:vermi.png"},
groups = {workable = 1, crumbly = 1},
on_punch = function(pos)
end
})
--  --  --  --  --  --  MUD TILES --  --  --  --  --  --  
