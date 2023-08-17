# Schedules a decrementation of the current players health.

$tellraw @s[tag=victu__debug] ["",{"text":"[","bold":true,"color":"light_purple"},{"text":"Victu ","bold":true,"color":"yellow","hoverEvent":{"action":"show_text","contents":[{"text":"Remove your ","color":"white"},{"text":"victu__debug","bold":true,"color":"light_purple"},{"text":" tag to disable this message.","color":"white"}]}},{"text":"Debug","color":"light_purple","hoverEvent":{"action":"show_text","contents":[{"text":"Remove your ","color":"white"},{"text":"victu__debug","bold":true,"color":"light_purple"},{"text":" tag to disable this message.","color":"white"}]}},{"text":"] ","bold":true,"color":"light_purple"},{"text":"Scheduling decrementation of health in ","color":"yellow"},{"text":"$(NutritionTime)","color":"light_purple"},{"text":" ticks for ","color":"yellow"},{"text":"$(FoodName)","color":"light_purple"}]
$execute store result score @s victu__$(FoodName)_nutrition_expiration_time run time query gametime
# Add the schedule interval to the 'action_time' score.
$execute store result score $interval victu__$(FoodName)_nutrition_expiration_time run data get storage victu:settings NutritionTime
$scoreboard players operation @s victu__$(FoodName)_nutrition_expiration_time += $interval victu__$(FoodName)_nutrition_expiration_time

# Schedule the function, keep in mind that it needs to be appended!
$schedule function victu:run_decrement/$(FoodName) $(NutritionTime)t append