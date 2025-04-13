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

# Store target coords for lode-compass info
execute store result storage ancient_city_finder:target lodestone.x int 1 run scoreboard players get ancient_city datapack_ancient_city_finder_x
execute store result storage ancient_city_finder:target lodestone.y int 1 run scoreboard players get ancient_city datapack_ancient_city_finder_y
execute store result storage ancient_city_finder:target lodestone.z int 1 run scoreboard players get ancient_city datapack_ancient_city_finder_z

# Store target dimension for lode-compass info
data modify storage ancient_city_finder:data player set from entity @s
data modify storage ancient_city_finder:target lodestone.dimension set from storage ancient_city_finder:data player.Dimension

# Update players compass with the new target coords
execute as @s run function ancient_city_finder:update_compass with storage ancient_city_finder:target lodestone


# Clean up after executing function

# Revoke advancement after it has been triggered so it can be triggered again
advancement revoke @a only ancient_city_finder:convert_compass_by_hitting_warden

data remove storage ancient_city_finder:data player
data remove storage ancient_city_finder:target lodestone