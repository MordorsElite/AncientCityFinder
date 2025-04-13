# Calculates the coordinates of the closest Ancient City
# Formulas used:
# x = offset_x + ((400 - (distance_03**2 - distance_01**2)) / 40)
# z = offset_z + ((400 - (distance_02**2 - distance_01**2)) / 40)

# To increase accuracy at the cost of higher chance of failure:
# Change the fixed point offsets in get_compass: 20 -> 100
# Change the formula values here: 400 -> 10000 and 40 -> 200 

# Remove previously used coords
scoreboard players set ancient_city datapack_ancient_city_finder_x 0
scoreboard players set ancient_city datapack_ancient_city_finder_z 0

# Open temporary scoreboard to store values for the function
scoreboard objectives add datapack_ancient_city_finder_temp dummy "Ancient City Temp"
scoreboard players set temp_x datapack_ancient_city_finder_temp 400
scoreboard players set temp_z datapack_ancient_city_finder_temp 400

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
scoreboard players operation temp_x datapack_ancient_city_finder_temp -= distance_03_sq datapack_ancient_city_finder_temp
scoreboard players operation temp_x datapack_ancient_city_finder_temp += distance_01_sq datapack_ancient_city_finder_temp
scoreboard players operation temp_x datapack_ancient_city_finder_temp /= number_040 datapack_ancient_city_finder
scoreboard players operation temp_x datapack_ancient_city_finder_temp += offset datapack_ancient_city_finder_x

scoreboard players operation temp_z datapack_ancient_city_finder_temp -= distance_02_sq datapack_ancient_city_finder_temp
scoreboard players operation temp_z datapack_ancient_city_finder_temp += distance_01_sq datapack_ancient_city_finder_temp
scoreboard players operation temp_z datapack_ancient_city_finder_temp /= number_040 datapack_ancient_city_finder
scoreboard players operation temp_z datapack_ancient_city_finder_temp += offset datapack_ancient_city_finder_z

# Save result in main scoreboards
scoreboard players operation ancient_city datapack_ancient_city_finder_x += temp_x datapack_ancient_city_finder_temp
scoreboard players operation ancient_city datapack_ancient_city_finder_z += temp_z datapack_ancient_city_finder_temp

# Remove temporary scoreboard
scoreboard objectives remove datapack_ancient_city_finder_temp