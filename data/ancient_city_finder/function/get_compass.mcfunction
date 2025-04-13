# This function converts the compass held by the player 
# into a compasspointing towards the nearest Ancient City


# Calculate Coords

# Get distances to ancient city from fixed points

# Create in-world fixpoints to calculate distance from
summon minecraft:area_effect_cloud ~ ~ ~ {Duration:1,Radius:0f,Tags:['fixpoint_01']}
summon minecraft:area_effect_cloud ~ ~ ~ {Duration:1,Radius:0f,Tags:['fixpoint_02']}
summon minecraft:area_effect_cloud ~ ~ ~ {Duration:1,Radius:0f,Tags:['fixpoint_03']}

# Save to-be-changed fixpoint coordinates to scoreboard
execute store result score fixpoint_02 datapack_ancient_city_finder_z run data get entity @e[tag=fixpoint_02,limit=1] Pos[2]
execute store result score fixpoint_03 datapack_ancient_city_finder_x run data get entity @e[tag=fixpoint_02,limit=1] Pos[0]

# Offset coordinates on scoreboard by fixpoint_offset
scoreboard players operation fixpoint_02 datapack_ancient_city_finder_z += fixpoint_offset datapack_ancient_city_finder
scoreboard players operation fixpoint_03 datapack_ancient_city_finder_x += fixpoint_offset datapack_ancient_city_finder

# Apply updated offset fixpoint-cooridnates to in-world fixpoints
execute store result entity @e[type=area_effect_cloud,tag=fixpoint_02,limit=1] Pos[2] double 1 run scoreboard players get fixpoint_02 datapack_ancient_city_finder_z
execute store result entity @e[type=area_effect_cloud,tag=fixpoint_03,limit=1] Pos[0] double 1 run scoreboard players get fixpoint_03 datapack_ancient_city_finder_x

# Run locate command from fixpoint locations
execute positioned as @e[tag=fixpoint_01,limit=1] store result score distance_01 datapack_ancient_city_finder run locate structure minecraft:ancient_city
execute positioned as @e[tag=fixpoint_02,limit=1] store result score distance_02 datapack_ancient_city_finder run locate structure minecraft:ancient_city
execute positioned as @e[tag=fixpoint_03,limit=1] store result score distance_03 datapack_ancient_city_finder run locate structure minecraft:ancient_city

# Remove in-world fixpoints
kill @e[type=area_effect_cloud,tag=fixpoint_01]
kill @e[type=area_effect_cloud,tag=fixpoint_02]
kill @e[type=area_effect_cloud,tag=fixpoint_03]

# Get offsets, ie. player position
execute store result score offset datapack_ancient_city_finder_x run data get entity @s Pos[0]
execute store result score offset datapack_ancient_city_finder_z run data get entity @s Pos[2]

# Check if found distances are likely to be valid
# I am to lazy to do this, just hope to god ;D

# Calculate the coordinates of the closest Ancient city
function ancient_city_finder:calculate_coord



# Give compass

# Store target coords for lode-compass info
execute store result storage ancient_city_finder:target lodestone.x int 1 run scoreboard players get ancient_city datapack_ancient_city_finder_x
execute store result storage ancient_city_finder:target lodestone.z int 1 run scoreboard players get ancient_city datapack_ancient_city_finder_z

# Store target dimension for lode-compass info
data modify storage ancient_city_finder:data player set from entity @s
data modify storage ancient_city_finder:target lodestone.dimension set from storage ancient_city_finder:data player.Dimension

# Update players compass with the new target coords
execute as @s run function ancient_city_finder:update_compass with storage ancient_city_finder:target lodestone



# Clean up after executing function

# Revoke advancement after it has been triggered so it can be triggered again
advancement revoke @s only ancient_city_finder:convert_compass_by_hitting_warden

# Remove custom data
data remove storage ancient_city_finder:data player
data remove storage ancient_city_finder:target lodestone

# Remove scoreboard scores
scoreboard players reset offset datapack_ancient_city_finder_x
scoreboard players reset offset datapack_ancient_city_finder_z

scoreboard players reset distance_01 datapack_ancient_city_finder
scoreboard players reset distance_02 datapack_ancient_city_finder
scoreboard players reset distance_03 datapack_ancient_city_finder

scoreboard players reset fixpoint_02 datapack_ancient_city_finder_z
scoreboard players reset fixpoint_03 datapack_ancient_city_finder_x