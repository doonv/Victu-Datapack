# This uses a quirk of @e[type=player] which is that it only 
# selects alive players whereas @a selects all players dead or alive 
execute as @e[type=player,tag=!victu__alive] run function victu:reset_me

tag @a remove victu__alive
tag @e[type=player] add victu__alive