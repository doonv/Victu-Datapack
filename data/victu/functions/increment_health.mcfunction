
execute store result score @s temp run attribute @s minecraft:generic.max_health base get 1.0
scoreboard players add @s temp 1

tellraw @s[tag=victu__debug] ["",{"text":"[","bold":true,"color":"light_purple"},{"text":"Victu ","bold":true,"color":"yellow","hoverEvent":{"action":"show_text","contents":[{"text":"Remove your ","color":"white"},{"text":"victu__debug","bold":true,"color":"light_purple"},{"text":" tag to disable this message.","color":"white"}]}},{"text":"Debug","color":"light_purple","hoverEvent":{"action":"show_text","contents":[{"text":"Remove your ","color":"white"},{"text":"victu__debug","bold":true,"color":"light_purple"},{"text":" tag to disable this message.","color":"white"}]}},{"text":"] ","bold":true,"color":"light_purple"},{"text":"Increasing health to ","color":"yellow"},{"score":{"name":"@s","objective":"temp"},"color":"light_purple"},{"text":"HP","color":"light_purple"}]
execute if score @s temp matches 10.. run advancement grant @s only victu:five_hearts
execute if score @s temp matches 20.. run advancement grant @s only victu:ten_hearts
execute if score @s temp matches 30.. run advancement grant @s only victu:fifteen_hearts
execute if score @s temp matches 40.. run advancement grant @s only victu:twenty_hearts
execute if score @s temp matches 48.. run advancement grant @s only victu:twenty_four_hearts

execute store result storage victu:temp health int 1.0 run scoreboard players get @s temp
function victu:set_health with storage victu:temp