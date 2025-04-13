# Example item
give @s compass[custom_data={player_tracker:true}]

# advancement example:player_tracker
{
  "criteria": {
    "requirement": {
      "trigger": "minecraft:location",
      "conditions": {
        "player": [
          {
            "condition": "minecraft:entity_properties",
            "entity": "this",
            "predicate": {
              "slots": {
                "weapon.offhand": {
                  "items": "minecraft:compass",
                  "predicates": {
                    "minecraft:custom_data": "{player_tracker:true}"
                  }
                }
              }
            }
          }
        ]
      }
    }
  },
  "rewards": {
    "function": "example:player_tracker/update"
  }
}

# function example:player_tracker/update
advancement revoke @s only example:player_tracker

data modify storage example:data player set from entity @p[distance=0.1..]
execute store result storage example:macro lodestone.x int 1 run data get storage example:data player.Pos[0]
execute store result storage example:macro lodestone.z int 1 run data get storage example:data player.Pos[2]
data modify storage example:macro lodestone.dimension set from storage example:data player.Dimension
function example:lodestone_update with storage example:macro lodestone

# function example:lodestone_update
$item modify entity @s weapon.offhand {"function":"minecraft:set_components","components":{"minecraft:lodestone_tracker":{"target":{"dimension":"$(dimension)","pos":[$(x),0,$(z)]},"tracked":false}}}