val = 10
follow = false;
movespeed = 0;
var type = choose("mushroom", "cheese", "pineapple", "sausage", "tomato")
sprite_index = asset_get_index($"spr_{type}collect")

if ds_list_find_index(global.ds_saveroom, id) != -1
	instance_destroy()
