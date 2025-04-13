# This function converts the compass held by the player 
# into a compasspointing towards the nearest Ancient City


# Calculate Coords

# Get distances to ancient city from fixed points
execute positioned ~ ~ ~ store result score distance_01 datapack_ancient_city_finder run locate structure minecraft:ancient_city
execute positioned ~ ~ ~20 store result score distance_02 datapack_ancient_city_finder run locate structure minecraft:ancient_city
execute positioned ~20 ~ ~ store result score distance_03 datapack_ancient_city_finder run locate structure minecraft:ancient_city

# Get offsets, ie. player position
execute store result score offset datapack_ancient_city_finder_x run data get entity @s Pos[0]
execute store result score offset datapack_ancient_city_finder_z run data get entity @s Pos[2]

# Check if found distances are likely to be valid
# I am to lazy to do this, just hope to god ;D

# Calculate the coordinates of the closest Ancient city
function ancient_city_finder:calculate_coord


# Give compass

scoreboard players set ancient_city datapack_ancient_city_finder_x 100
scoreboard players set ancient_city datapack_ancient_city_finder_y 100
scoreboard players set ancient_city datapack_ancient_city_finder_z 100

item replace entity @s weapon.mainhand with air

#summon ender_pearl 50 500 50 {Tags:['temp_pearl']}
#execute store result entity @e[type=ender_pearl,tag=temp_pearl,limit=1] Pos[0] double 1 run scoreboard players get ancient_city datapack_ancient_city_finder_x
#execute store result entity @e[type=ender_pearl,tag=temp_pearl,limit=1] Pos[1] double 1 run scoreboard players get ancient_city datapack_ancient_city_finder_y
#execute store result entity @e[type=ender_pearl,tag=temp_pearl,limit=1] Pos[2] double 1 run scoreboard players get ancient_city datapack_ancient_city_finder_z

#summon area_effect_cloud 50 100 50 {Duration:1,Radius:0f,Tags:['temp_cloud']}
#execute store result entity @e[type=area_effect_cloud,tag=temp_cloud,limit=1] pos[0] double 1 run scoreboard players get ancient_city datapack_ancient_city_finder_x
#execute store result entity @e[type=area_effect_cloud,tag=temp_cloud,limit=1] pos[1] double 1 run scoreboard players get ancient_city datapack_ancient_city_finder_y
#execute store result entity @e[type=area_effect_cloud,tag=temp_cloud,limit=1] pos[2] double 1 run scoreboard players get ancient_city datapack_ancient_city_finder_z
#execute at @e[type=area_effect_cloud,tag=temp_cloud] run setblock ~ ~ ~ minecraft:lodestone
#kill @e[type=area_effect_cloud,tag=temp_cloud]

# Create storage for coords
#data modify storage ancient_city_finder:target coords set value []

# Get coords from scoreboards
#execute store result storage ancient_city_finder:target x int 1 run scoreboard players get ancient_city datapack_ancient_city_finder_x
#execute store result storage ancient_city_finder:target y int 1 run scoreboard players get ancient_city datapack_ancient_city_finder_y
#execute store result storage ancient_city_finder:target z int 1 run scoreboard players get ancient_city datapack_ancient_city_finder_z

#data modify storage ancient_city_finder:target coords append from storage ancient_city_finder:target x
#data modify storage ancient_city_finder:target coords append from storage ancient_city_finder:target y
#data modify storage ancient_city_finder:target coords append from storage ancient_city_finder:target z

execute store result entity @e[type=item,tag=temp,limit=1] Item.components.lodestone_tracker.target.pos int 1 run scoreboard players get ancient_city datapack_ancient_city_finder_z

execute at @s run summon item ~ ~ ~ {PickupDelay:0s,Tags:['temp'],Item:{id:"minecraft:compass",Count:1b,components:{"minecraft:lodestone_tracker":{target:{pos:[I;50,100,50],dimension:"minecraft:overworld"}}}}}
#data modify entity @e[type=item,tag=temp,limit=1] Owner set from entity @s UUID
#execute store result entity @e[type=item,tag=temp,limit=1] Item.components.lodestone_tracker.target.Pos[0] int 1 run scoreboard players get ancient_city datapack_ancient_city_finder_x
#execute store result entity @e[type=item,tag=temp,limit=1] Item.components.lodestone_tracker.target.Pas[1] int 1 run scoreboard players get ancient_city datapack_ancient_city_finder_y
#execute store result entity @e[type=item,tag=temp,limit=1] Item.components.lodestone_tracker.target.Pos[2] int 1 run scoreboard players get ancient_city datapack_ancient_city_finder_z
tag @e[type=item,tag=temp] remove temp

kill @e[type=ender_pearl,tag=temp_pearl]

# Remove used temporary storage
#data remove storage ancient_city_finder:target x
#data remove storage ancient_city_finder:target y
#data remove storage ancient_city_finder:target z
#data remove storage ancient_city_finder:target coords

# Revoke advancement after it has been triggered so it can be triggered again
advancement revoke @a only ancient_city_finder:convert_compass_by_hitting_warden

# /data modify entity @e[tag=temp, limit=1] Item.components.lodestone_tracker.target.pos set from storage ancient_city_finder:target coords

# /summon item 100 103 100 {Tags:['temp_compass'], Item:{id:"minecraft:compass", Count:1b, components:{"minecraft:lodestone_tracker":{target:{pos:{"ancient_city_finder:target":coords}, dimension:"minecraft:overworld"}}}}}

# /execute at @s run summon item 100 101 100 {PickupDelay:0s,Tags:['temp'],Item:{id:"minecraft:compass",Count:1b,components:{"minecraft:lodestone_tracker":{target:{pos:[I;50,100,50],dimension:"minecraft:overworld", tracked:false}}}}}