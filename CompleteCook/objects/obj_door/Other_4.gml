if (place_meeting(x, y, obj_player) && (!(ds_list_find_index(global.saveroom, id))))
	ds_list_add(global.saveroom, id)
if ds_list_find_index(global.saveroom, id)
	visited = 1
if (visited == 1 && sprite_index != spr_pepperdoor)
	sprite_index = spr_doorvisited
if (john && global.panic)
	sprite_index = spr_doorblocked
