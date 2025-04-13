# Calculates the coordinates of the closest Ancient City

# Formulas used:
# x = offset_x + ((temp_01 - (distance_03^2 - distance_01^2)) / temp_02)
# z = offset_z + ((temp_01 - (distance_02^2 - distance_01^2)) / temp_02)
# Temp values are dependent on fixpoint_offset: 
# temp_01 = fixpoint_offset^2
# temp_02 = fixpoint_offset*2

# Remove previously used coords
scoreboard players set ancient_city datapack_ancient_city_finder_x 0
scoreboard players set ancient_city datapack_ancient_city_finder_z 0

# Open temporary scoreboard to store values for the function
scoreboard objectives add datapack_ancient_city_finder_temp dummy "Ancient City Temp"

# Initialize temp values used for calculation with temp_01
scoreboard players set temp_01 datapack_ancient_city_finder_temp 0
scoreboard players operation temp_01 datapack_ancient_city_finder_temp += fixpoint_offset datapack_ancient_city_finder
scoreboard players operation temp_01 datapack_ancient_city_finder_temp *= fixpoint_offset datapack_ancient_city_finder

scoreboard players set temp_02 datapack_ancient_city_finder_temp 0
scoreboard players operation temp_02 datapack_ancient_city_finder_temp += fixpoint_offset datapack_ancient_city_finder
scoreboard players operation temp_02 datapack_ancient_city_finder_temp += fixpoint_offset datapack_ancient_city_finder

# Initialize current_? values with temp_01
scoreboard players set current_x datapack_ancient_city_finder_temp 0
scoreboard players operation current_x datapack_ancient_city_finder_temp += temp_01 datapack_ancient_city_finder_temp

scoreboard players set current_z datapack_ancient_city_finder_temp 0
scoreboard players operation current_z datapack_ancient_city_finder_temp += temp_01 datapack_ancient_city_finder_temp



# Calculate distances squared
scoreboard players set distance_01_sq datapack_ancient_city_finder_temp 0
scoreboard players set distance_02_sq datapack_ancient_city_finder_temp 0
scoreboard players set distance_03_sq datapack_ancient_city_finder_temp 0

scoreboard players operation distance_01_sq datapack_ancient_city_finder_temp += distance_01 datapack_ancient_city_finder
scoreboard players operation distance_02_sq datapack_ancient_city_finder_temp += distance_02 datapack_ancient_city_finder
scoreboard players operation distance_03_sq datapack_ancient_city_finder_temp += distance_03 datapack_ancient_city_finder

scoreboard players operation distance_01_sq datapack_ancient_city_finder_temp *= distance_01 datapack_ancient_city_finder
scoreboard players operation distance_02_sq datapack_ancient_city_finder_temp *= distance_02 datapack_ancient_city_finder
scoreboard players operation distance_03_sq datapack_ancient_city_finder_temp *= distance_03 datapack_ancient_city_finder

# Use formulas
# Executed as x = (((temp_01 - dist_01) + dist_03) / temp_02) + offset_x
scoreboard players operation current_x datapack_ancient_city_finder_temp -= distance_03_sq datapack_ancient_city_finder_temp
scoreboard players operation current_x datapack_ancient_city_finder_temp += distance_01_sq datapack_ancient_city_finder_temp
scoreboard players operation current_x datapack_ancient_city_finder_temp /= temp_02 datapack_ancient_city_finder_temp
scoreboard players operation current_x datapack_ancient_city_finder_temp += offset datapack_ancient_city_finder_x

scoreboard players operation current_z datapack_ancient_city_finder_temp -= distance_02_sq datapack_ancient_city_finder_temp
scoreboard players operation current_z datapack_ancient_city_finder_temp += distance_01_sq datapack_ancient_city_finder_temp
scoreboard players operation current_z datapack_ancient_city_finder_temp /= temp_02 datapack_ancient_city_finder_temp
scoreboard players operation current_z datapack_ancient_city_finder_temp += offset datapack_ancient_city_finder_z

# Save result in main scoreboards
scoreboard players operation ancient_city datapack_ancient_city_finder_x += current_x datapack_ancient_city_finder_temp
scoreboard players operation ancient_city datapack_ancient_city_finder_z += current_z datapack_ancient_city_finder_temp

# Remove temporary scoreboard
scoreboard objectives remove datapack_ancient_city_finder_temp