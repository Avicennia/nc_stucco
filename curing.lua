local thismod = minetest.get_current_modname()



local function waterchk(pos)
  local verdict = false;
  local watersources = minetest.find_node_near(pos,2,"nc_terrain:water_source",false)
  if(watersources) then verdict = true else end
  return verdict
end


minetest.register_abm({
  label = "Powdered Stucco Moisturizing",
  nodenames = {"group:stucco_damp"},
  neighbors = {"nc_terrain:water_source"},
  interval = 2.5,
  chance = 1,
  action = function(pos)
  local noden = minetest.get_node(pos).name
    if(noden == thismod ..":stucco_".. nc_stuccol.curing.stages[5] .. "_slate") then
      minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[1] .. "_slate"})
    elseif(noden == thismod ..":stucco_".. nc_stuccol.curing.stages[5] .. "_clay") then
      minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[1] .. "_clay"})
    else return 
  end
end
})
minetest.register_abm({
  label = "Dry Stucco Dessication",
  nodenames = {"group:stucco_damp"},
  neighbors = {"air"},
  interval = 24,
  chance = 4,
  action = function(pos)
  local noden = minetest.get_node(pos).name
  if(waterchk(pos)==false)then
    if(noden == thismod ..":stucco_".. nc_stuccol.curing.stages[1] .. "_clay") then
      minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[2] .. "_clay"})
    elseif(noden == thismod ..":stucco_".. nc_stuccol.curing.stages[2] .. "_clay") then
       minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[3] .. "_clay"})
    elseif(noden == thismod ..":stucco_".. nc_stuccol.curing.stages[3] .. "_clay") then
      minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[4] .. "_clay"})
    elseif(noden == thismod ..":stucco_".. nc_stuccol.curing.stages[1] .. "_slate") then
      minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[2] .. "_slate"})
    elseif(noden == thismod ..":stucco_".. nc_stuccol.curing.stages[2] .. "_slate") then
     minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[3] .. "_slate"})
    elseif(noden == thismod ..":stucco_".. nc_stuccol.curing.stages[3] .. "_slate") then
      minetest.set_node(pos, {name = thismod ..":stucco_".. nc_stuccol.curing.stages[4] .. "_slate"})
    else return 
  end
else return end
end
})
minetest.register_abm({
  label = "Worked Clay Drying",
  nodenames = {"group:workable"},
  interval = 38,
  chance = 4,
  action = function(pos)
  local noden = minetest.get_node(pos).name
  minetest.set_node(pos,{name = noden.."_dry"})
  end
})
