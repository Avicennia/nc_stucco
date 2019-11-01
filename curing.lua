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
  label = "Dry Stucco Dessication",
  nodenames = {thismod .. ":stuccosodden",thismod .. ":stuccomoist",thismod .. ":stuccodamp"},
  interval = 12.5,
  chance = 0.5,
  action = function(pos)
  local noden = minetest.get_node(pos).name
  if (waterchk(pos) == false) then
    if(noden == thismod ..":stucco".. nc_stuccol.curing.stages[1]) then
      minetest.set_node(pos, {name = thismod ..":stucco".. nc_stuccol.curing.stages[2]})
    elseif(noden == thismod ..":stucco".. nc_stuccol.curing.stages[2]) then
       minetest.set_node(pos, {name = thismod ..":stucco".. nc_stuccol.curing.stages[3]})
    else minetest.set_node(pos, {name = thismod ..":stucco".. nc_stuccol.curing.stages[4]})

    end
  elseif(waterchk(pos)== true)then return
  end
end
})
minetest.register_abm({
label = "Finishing clay",
nodenames = {thismod .. ":stuccodamp"},
interval = 10.5,
chance = 0.6,
action = function(pos)
local noden = minetest.get_node(pos).name
if(noden == thismod ..":stuccodamp")then
  minetest.set_node(pos,{name = thismod ..":stuccoDry"})
end

end
})
minetest.register_abm({
  label = "Worked Clay Drying",
  nodenames = {"group:workable"},
  interval = 8.5,
  chance = 0.5,
  action = function(pos)
  local noden = minetest.get_node(pos).name
  minetest.set_node(pos,{name = noden.."_dry"})
  end
})