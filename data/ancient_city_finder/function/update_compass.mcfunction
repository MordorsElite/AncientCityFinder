# Updates the compass currently held by the player with the NBT data 
# necessary to point to the nearest ancient city

# Takes the following input {x:int, y:int, z:int, dimension:string}

$item modify entity @s weapon.mainhand {"function":"minecraft:set_components","components":{"minecraft:lodestone_tracker":{"target":{"dimension":"$(dimension)","pos":[$(x),0,$(z)]},"tracked":false}}}
