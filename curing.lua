local thismod = minetest.get_current_modname()



local function waterchk(pos)
  local pdn = {x=pos.x-1,y=pos.y-1,z=pos.z-1}
  local pup = {x=pos.x+1,y=pos.y+1,z=pos.z+1}
  local params = {iswater = false}
  local mem = minetest.find_nodes_in_area(pup,pdn,"nc_terrain:water_source")
  if(mem[1])then params.iswater = true
else end
  return params.iswater
end


minetest.register_abm({
  label = "Dry Clay-Stucco Dessication",
  nodenames = {thismod .. ":stucco_sodden_clay",thismod .. ":stucco_moist_clay",thismod .. ":stucco_damp_clay",},
  interval = 7.5,
  chance = 0.2,
  action = function(pos)
  local noden = minetest.get_node(pos).name
  if (waterchk(pos) == false) then
    if(noden == thismod ..":stucco_".. nc_stuccol.curing.stages[1] .. "_clay") then
      minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[2] .. "_clay"})
    elseif(noden == thismod ..":stucco_".. nc_stuccol.curing.stages[2] .. "_clay") then
       minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[3] .. "_clay"})
    else minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[4] .. "_clay"})

    end
  elseif(waterchk(pos)== true)then return
  end
end
})
minetest.register_abm({
  label = "Dry Granite-Stucco Dessication",
  nodenames = {thismod .. ":stucco_sodden_granite",thismod .. ":stucco_moist_granite",thismod .. ":stucco_damp_granite",},
  interval = 14.5,
  chance = 0.2,
  action = function(pos)
  local noden = minetest.get_node(pos).name
  if (waterchk(pos) == false) then
    if(noden == thismod ..":stucco_".. nc_stuccol.curing.stages[1] .. "_granite") then
      minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[2] .. "_granite"})
    elseif(noden == thismod ..":stucco_".. nc_stuccol.curing.stages[2] .. "_granite") then
       minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[3] .. "_granite"})
    else minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[4] .. "_granite"})

    end
  elseif(waterchk(pos)== true)then return
  end
end
})

minetest.register_abm({
  label = "Worked Clay Drying",
  nodenames = {"group:workable"},
  interval = 20.5,
  chance = 0.5,
  action = function(pos)
  local noden = minetest.get_node(pos).name
  minetest.set_node(pos,{name = noden.."_dry"})
  end
})
