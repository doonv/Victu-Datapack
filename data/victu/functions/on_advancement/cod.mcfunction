# THIS FUNCTION IS AUTO-GENERATED. Please edit `gen.py` instead.
tellraw @s[tag=victu__debug] ["",{"text":"[","bold":true,"color":"light_purple"},{"text":"Victu ","bold":true,"color":"yellow","hoverEvent":{"action":"show_text","contents":[{"text":"Remove your ","color":"white"},{"text":"victu__debug","bold":true,"color":"light_purple"},{"text":" tag to disable this message.","color":"white"}]}},{"text":"Debug","color":"light_purple","hoverEvent":{"action":"show_text","contents":[{"text":"Remove your ","color":"white"},{"text":"victu__debug","bold":true,"color":"light_purple"},{"text":" tag to disable this message.","color":"white"}]}},{"text":"] ","bold":true,"color":"light_purple"},{"text":"Ate ","color": "yellow"},{"text":"cod","color":"light_purple"}]
execute unless score @s victu__cod_nutrition_expiration_time matches 1.. run function victu:increment_health
execute if score @s victu__cod_nutrition_expiration_time matches 1.. run tellraw @s[tag=victu__debug] ["",{"text":"[","bold":true,"color":"light_purple"},{"text":"Victu ","bold":true,"color":"yellow","hoverEvent":{"action":"show_text","contents":[{"text":"Remove your ","color":"white"},{"text":"victu__debug","bold":true,"color":"light_purple"},{"text":" tag to disable this message.","color":"white"}]}},{"text":"Debug","color":"light_purple","hoverEvent":{"action":"show_text","contents":[{"text":"Remove your ","color":"white"},{"text":"victu__debug","bold":true,"color":"light_purple"},{"text":" tag to disable this message.","color":"white"}]}},{"text":"] ","bold":true,"color":"light_purple"},{"text":"Not incrementing hearts due to player already having ","color": "yellow"},{"text":"cod","color":"light_purple"}, {"text":"'s benefits. (Please wait ","color":"yellow"}, {"nbt":"NutritionTime","storage":"victu:settings","color":"light_purple"}, {"text": " ticks and then try again)","color":"yellow"}]

data modify storage victu:temp FoodName set value "cod"
execute store result storage victu:temp NutritionTime int 1.0 run data get storage victu:settings NutritionTime 1.0

function victu:schedule_decrement with storage victu:temp

advancement revoke @s only victu:consume/cod