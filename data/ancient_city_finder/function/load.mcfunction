# Removing any remains from the datapck being loaded before

# Scoreboards
scoreboard objectives remove datapack_ancient_city_finder
scoreboard objectives remove datapack_ancient_city_finder_x
scoreboard objectives remove datapack_ancient_city_finder_y
scoreboard objectives remove datapack_ancient_city_finder_z

# Advancement
advancement revoke @a only ancient_city_finder:convert_compass_by_hitting_warden

# Add required scoreboards
scoreboard objectives add datapack_ancient_city_finder dummy "Ancient City Finder"
scoreboard objectives add datapack_ancient_city_finder_x dummy "Ancient City X"
scoreboard objectives add datapack_ancient_city_finder_y dummy "Ancient City Y"
scoreboard objectives add datapack_ancient_city_finder_z dummy "Ancient City Z"

# Add required information
scoreboard players set fixed_point_01 datapack_ancient_city_finder_x 0
scoreboard players set fixed_point_01 datapack_ancient_city_finder_z 0

scoreboard players set fixed_point_02 datapack_ancient_city_finder_x 0
scoreboard players set fixed_point_02 datapack_ancient_city_finder_z 100

scoreboard players set fixed_point_03 datapack_ancient_city_finder_x 100
scoreboard players set fixed_point_03 datapack_ancient_city_finder_z 0

scoreboard players set ancient_city datapack_ancient_city_finder_x 0
scoreboard players set ancient_city datapack_ancient_city_finder_y -64
scoreboard players set ancient_city datapack_ancient_city_finder_z 0

scoreboard players set number_040 datapack_ancient_city_finder 40
scoreboard players set number_100 datapack_ancient_city_finder 100
scoreboard players set number_200 datapack_ancient_city_finder 200
