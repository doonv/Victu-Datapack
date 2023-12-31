# THIS FUNCTION IS AUTO-GENERATED. Please edit `gen.py` instead.
# Settings
execute unless data storage victu:settings NutritionTime run data modify storage victu:settings NutritionTime set value 36000
execute unless data storage victu:settings StartingHealth run data modify storage victu:settings StartingHealth set value 6
# Transfer settings into `victu:temp` which is used for calling macros
execute store result storage victu:temp NutritionTime int 1.0 run data get storage victu:settings NutritionTime 1.0

# Scoreboards
scoreboard objectives add temp dummy

scoreboard objectives add victu__apple_nutrition_expiration_time dummy
scoreboard objectives add victu__golden_apple_nutrition_expiration_time dummy
scoreboard objectives add victu__enchanted_golden_apple_nutrition_expiration_time dummy
scoreboard objectives add victu__melon_slice_nutrition_expiration_time dummy
scoreboard objectives add victu__sweet_berries_nutrition_expiration_time dummy
scoreboard objectives add victu__glow_berries_nutrition_expiration_time dummy
scoreboard objectives add victu__chorus_fruit_nutrition_expiration_time dummy
scoreboard objectives add victu__carrot_nutrition_expiration_time dummy
scoreboard objectives add victu__golden_carrot_nutrition_expiration_time dummy
scoreboard objectives add victu__potato_nutrition_expiration_time dummy
scoreboard objectives add victu__baked_potato_nutrition_expiration_time dummy
scoreboard objectives add victu__poisonous_potato_nutrition_expiration_time dummy
scoreboard objectives add victu__beetroot_nutrition_expiration_time dummy
scoreboard objectives add victu__dried_kelp_nutrition_expiration_time dummy
scoreboard objectives add victu__beef_nutrition_expiration_time dummy
scoreboard objectives add victu__cooked_beef_nutrition_expiration_time dummy
scoreboard objectives add victu__porkchop_nutrition_expiration_time dummy
scoreboard objectives add victu__cooked_porkchop_nutrition_expiration_time dummy
scoreboard objectives add victu__mutton_nutrition_expiration_time dummy
scoreboard objectives add victu__cooked_mutton_nutrition_expiration_time dummy
scoreboard objectives add victu__chicken_nutrition_expiration_time dummy
scoreboard objectives add victu__cooked_chicken_nutrition_expiration_time dummy
scoreboard objectives add victu__rabbit_nutrition_expiration_time dummy
scoreboard objectives add victu__cooked_rabbit_nutrition_expiration_time dummy
scoreboard objectives add victu__cod_nutrition_expiration_time dummy
scoreboard objectives add victu__cooked_cod_nutrition_expiration_time dummy
scoreboard objectives add victu__salmon_nutrition_expiration_time dummy
scoreboard objectives add victu__cooked_salmon_nutrition_expiration_time dummy
scoreboard objectives add victu__tropical_fish_nutrition_expiration_time dummy
scoreboard objectives add victu__pufferfish_nutrition_expiration_time dummy
scoreboard objectives add victu__bread_nutrition_expiration_time dummy
scoreboard objectives add victu__cookie_nutrition_expiration_time dummy
scoreboard objectives add victu__cake_nutrition_expiration_time dummy
scoreboard objectives add victu__pumpkin_pie_nutrition_expiration_time dummy
scoreboard objectives add victu__rotten_flesh_nutrition_expiration_time dummy
scoreboard objectives add victu__spider_eye_nutrition_expiration_time dummy
scoreboard objectives add victu__mushroom_stew_nutrition_expiration_time dummy
scoreboard objectives add victu__beetroot_soup_nutrition_expiration_time dummy
scoreboard objectives add victu__rabbit_stew_nutrition_expiration_time dummy
scoreboard objectives add victu__suspicious_stew_nutrition_expiration_time dummy
scoreboard objectives add victu__milk_bucket_nutrition_expiration_time dummy
scoreboard objectives add victu__honey_bottle_nutrition_expiration_time dummy

tellraw @a[tag=victu__debug] ["",{"text":"[","bold":true,"color":"light_purple"},{"text":"Victu ","bold":true,"color":"yellow","hoverEvent":{"action":"show_text","contents":[{"text":"Remove your ","color":"white"},{"text":"victu__debug","bold":true,"color":"light_purple"},{"text":" tag to disable this message.","color":"white"}]}},{"text":"Debug","color":"light_purple","hoverEvent":{"action":"show_text","contents":[{"text":"Remove your ","color":"white"},{"text":"victu__debug","bold":true,"color":"light_purple"},{"text":" tag to disable this message.","color":"white"}]}},{"text":"] ","bold":true,"color":"light_purple"},{"text":"Loaded Successfully.","color": "yellow"}]