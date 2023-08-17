# Simple python script to generate food related stuff so i dont have to repeat myself

project_name = "victu"
foods = [
    "apple",
    "golden_apple",
    "enchanted_golden_apple",
    "melon_slice",
    "sweet_berries",
    "glow_berries",
    "chorus_fruit",
    "carrot",
    "golden_carrot",
    "potato",
    "baked_potato",
    "poisonous_potato",
    "beetroot",
    "dried_kelp",
    "beef",
    "cooked_beef",
    "porkchop",
    "cooked_porkchop",
    "mutton",
    "cooked_mutton",
    "chicken",
    "cooked_chicken",
    "rabbit",
    "cooked_rabbit",
    "cod",
    "cooked_cod",
    "salmon",
    "cooked_salmon",
    "tropical_fish",
    "pufferfish",
    "bread",
    "cookie",
    "cake",
    "pumpkin_pie",
    "rotten_flesh",
    "spider_eye",
    "mushroom_stew",
    "beetroot_soup",
    "rabbit_stew",
    "suspicious_stew",
    "milk_bucket",
    "honey_bottle",
]

for food in foods:
    if food != "cake":
        with open(f"./data/{project_name}/advancements/consume/{food}.json", "w") as f:
            f.write(
                f"""{{
        "criteria": {{
            "requirement": {{
                "trigger": "minecraft:consume_item",
                "conditions": {{
                    "item": {{
                        "items": [
                            "minecraft:{food}"
                        ]
                    }}
                }}
            }}
        }},
        "rewards": {{
            "function": "{project_name}:on_advancement/{food}"
        }}
    }}"""
            )

    with open(
        f"./data/{project_name}/functions/on_advancement/{food}.mcfunction", "w"
    ) as f:
        f.write(
            f"""# THIS FUNCTION IS AUTO-GENERATED. Please edit `gen.py` instead.
tellraw @s[tag=victu__debug] ["",{{"text":"[","bold":true,"color":"light_purple"}},{{"text":"Victu ","bold":true,"color":"yellow","hoverEvent":{{"action":"show_text","contents":[{{"text":"Remove your ","color":"white"}},{{"text":"victu__debug","bold":true,"color":"light_purple"}},{{"text":" tag to disable this message.","color":"white"}}]}}}},{{"text":"Debug","color":"light_purple","hoverEvent":{{"action":"show_text","contents":[{{"text":"Remove your ","color":"white"}},{{"text":"victu__debug","bold":true,"color":"light_purple"}},{{"text":" tag to disable this message.","color":"white"}}]}}}},{{"text":"] ","bold":true,"color":"light_purple"}},{{"text":"Ate ","color": "yellow"}},{{"text":"{food}","color":"light_purple"}}]
execute unless score @s {project_name}__{food}_nutrition_expiration_time matches 1.. run function {project_name}:increment_health
execute if score @s {project_name}__{food}_nutrition_expiration_time matches 1.. run tellraw @s[tag=victu__debug] ["",{{"text":"[","bold":true,"color":"light_purple"}},{{"text":"Victu ","bold":true,"color":"yellow","hoverEvent":{{"action":"show_text","contents":[{{"text":"Remove your ","color":"white"}},{{"text":"victu__debug","bold":true,"color":"light_purple"}},{{"text":" tag to disable this message.","color":"white"}}]}}}},{{"text":"Debug","color":"light_purple","hoverEvent":{{"action":"show_text","contents":[{{"text":"Remove your ","color":"white"}},{{"text":"victu__debug","bold":true,"color":"light_purple"}},{{"text":" tag to disable this message.","color":"white"}}]}}}},{{"text":"] ","bold":true,"color":"light_purple"}},{{"text":"Not incrementing hearts due to player already having ","color": "yellow"}},{{"text":"{food}","color":"light_purple"}}, {{"text":"'s benefits. (Please wait ","color":"yellow"}}, {{"nbt":"NutritionTime","storage":"victu:settings","color":"light_purple"}}, {{"text": " ticks and then try again)","color":"yellow"}}]

data modify storage {project_name}:temp FoodName set value "{food}"
execute store result storage victu:temp NutritionTime int 1.0 run data get storage victu:settings NutritionTime 1.0

function {project_name}:schedule_decrement with storage {project_name}:temp

advancement revoke @s only {project_name}:consume/{food}"""
        )

    with open(
        f"./data/{project_name}/functions/run_decrement/{food}.mcfunction", "w"
    ) as f:
        f.write(
            f"""# THIS FUNCTION IS AUTO-GENERATED. Please edit `gen.py` instead.
execute store result score $current {project_name}__{food}_nutrition_expiration_time run time query gametime

execute as @a if score @s {project_name}__{food}_nutrition_expiration_time = $current {project_name}__{food}_nutrition_expiration_time run tellraw @s[tag=victu__debug] ["",{{"text":"[","bold":true,"color":"light_purple"}},{{"text":"Victu ","bold":true,"color":"yellow","hoverEvent":{{"action":"show_text","contents":[{{"text":"Remove your ","color":"white"}},{{"text":"victu__debug","bold":true,"color":"light_purple"}},{{"text":" tag to disable this message.","color":"white"}}]}}}},{{"text":"Debug","color":"light_purple","hoverEvent":{{"action":"show_text","contents":[{{"text":"Remove your ","color":"white"}},{{"text":"victu__debug","bold":true,"color":"light_purple"}},{{"text":" tag to disable this message.","color":"white"}}]}}}},{{"text":"] ","bold":true,"color":"light_purple"}},{{"text":"Nutrition from ","color": "yellow"}},{{"text":"{food}","color":"light_purple"}},{{"text":" has ended","color": "yellow"}}]
execute as @a if score @s {project_name}__{food}_nutrition_expiration_time = $current {project_name}__{food}_nutrition_expiration_time run function {project_name}:decrement_health
execute as @a if score @s {project_name}__{food}_nutrition_expiration_time = $current {project_name}__{food}_nutrition_expiration_time run scoreboard players reset @s {project_name}__{food}_nutrition_expiration_time"""
        )

with open(f"./data/{project_name}/functions/load.mcfunction", "w") as f:
    f.write(
        f"""# THIS FUNCTION IS AUTO-GENERATED. Please edit `gen.py` instead.

# Settings
execute unless data storage {project_name}:settings NutritionTime run data modify storage {project_name}:settings NutritionTime set value 36000
execute unless data storage victu:settings StartingHealth run data modify storage victu:settings StartingHealth set value 6
# Transfer settings into `{project_name}:temp` which is used for calling macros
execute store result storage {project_name}:temp NutritionTime int 1.0 run data get storage {project_name}:settings NutritionTime 1.0

# Scoreboards
scoreboard objectives add temp dummy

"""
    )
    for food in foods:
        f.write(
            f"scoreboard objectives add {project_name}__{food}_nutrition_expiration_time dummy\n"
        )

with open(f"./data/{project_name}/functions/reset_me.mcfunction", "w") as f:
    f.write("# THIS FUNCTION IS AUTO-GENERATED. Please edit `gen.py` instead.\n\n")
    for food in foods:
        f.write(
            f"""
scoreboard players reset @s {project_name}__{food}_nutrition_expiration_time
schedule clear victu:run_decrement/{food}
advancement revoke @s only victu:consume/{food}
"""
        )

    f.write(
        f"""
execute store result storage victu:temp health int 1.0 run data get storage victu:settings StartingHealth 1.0
function victu:set_health with storage victu:temp
"""
    )
