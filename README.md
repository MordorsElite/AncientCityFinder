# Ancient City Finder

### Overview 
---

A Minecraft 1.21 datapack that allows you to obtain a compass pointing to the nearest Ancient City.

To do so, find any Deep Dark biome with a Shrieker and cause it to spawn a Warden. 
Then simply hit the Warden with a compass and the compass should start pointing towards an Ancient City.

### Limitation
---

The compass will not lead exactly to the target coords of `/located structure ancient_city`, 
as I sacrificed a bit of precision in order to minimize the likelyhood of the datapack failing completely.
I use three points around the player and their distances to the ancient city to estimate the target coordinates.
While increasing the distance between these fixed points increases the precision, it makes it more likely
that one of the points no longer targets the same ancient city. This would throw off the calculations completely.

However in my tests the found ancient city is usually still within 20 blocks, so you should still easily be able to find it. 

If you want to live risky, you can increase the precision of the calculation by increasing the fixpoint_offset like this (default=20):
```
/scoreboard players set fixpoint_offset datapack_ancient_city_finder 100
```