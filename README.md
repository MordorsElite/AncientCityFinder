# Ancient City Finder

A Minecraft 1.21 datapack that allows you to obtain a compass pointing to the nearest Ancient City.

To do so, find any Deep Dark biome with a Shrieker and cause it to spawn a Warden. 
Then simply hit the Warden with a compass and the compass should start pointing towards an Ancient City.

The compass will not lead exactly to the target coords of "/located structure ancient_city", 
as I sacrificed a bit of precision in order to minimize the likelyhood of the datapack failing completely.
I use three points around the player to and their distances to the ancient city to estimate the coordinates.
While increasing the distance between these fixed points increases the precision, it makes it more likely
that one of the points no longer targets the same ancient city. This would throw off the calculations completely.

However in my tests the is usually within 20 blocks, so you should still easily be able to find it. 