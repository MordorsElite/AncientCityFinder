# Removing any remains from the datapck being loaded before

# Scoreboards
scoreboard objectives remove datapack_ancient_city_finder
scoreboard objectives remove datapack_ancient_city_finder_x
scoreboard objectives remove datapack_ancient_city_finder_z

# Advancement
advancement revoke @a only ancient_city_finder:convert_compass_by_hitting_warden

# Add required scoreboards
scoreboard objectives add datapack_ancient_city_finder dummy "Ancient City Finder"
scoreboard objectives add datapack_ancient_city_finder_x dummy "Ancient City X"
scoreboard objectives add datapack_ancient_city_finder_z dummy "Ancient City Z"

# Add required information
# fixpoint_offset: Default=20. Higher values provide better accuracy
# But at the cost of a higher chance of the datapack failing
scoreboard players set fixpoint_offset datapack_ancient_city_finder 20

scoreboard players set ancient_city datapack_ancient_city_finder_x 0
scoreboard players set ancient_city datapack_ancient_city_finder_z 0