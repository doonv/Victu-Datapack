# THIS FUNCTION IS AUTO-GENERATED. Please edit `gen.py` instead.
execute store result score $current victu__glow_berries_nutrition_expiration_time run time query gametime

execute as @a if score @s victu__glow_berries_nutrition_expiration_time = $current victu__glow_berries_nutrition_expiration_time run tellraw @s[tag=victu__debug] ["",{"text":"[","bold":true,"color":"light_purple"},{"text":"Victu ","bold":true,"color":"yellow","hoverEvent":{"action":"show_text","contents":[{"text":"Remove your ","color":"white"},{"text":"victu__debug","bold":true,"color":"light_purple"},{"text":" tag to disable this message.","color":"white"}]}},{"text":"Debug","color":"light_purple","hoverEvent":{"action":"show_text","contents":[{"text":"Remove your ","color":"white"},{"text":"victu__debug","bold":true,"color":"light_purple"},{"text":" tag to disable this message.","color":"white"}]}},{"text":"] ","bold":true,"color":"light_purple"},{"text":"Nutrition from ","color": "yellow"},{"text":"glow_berries","color":"light_purple"},{"text":" has ended","color": "yellow"}]
execute as @a if score @s victu__glow_berries_nutrition_expiration_time = $current victu__glow_berries_nutrition_expiration_time run function victu:decrement_health
execute as @a if score @s victu__glow_berries_nutrition_expiration_time = $current victu__glow_berries_nutrition_expiration_time run scoreboard players reset @s victu__glow_berries_nutrition_expiration_time