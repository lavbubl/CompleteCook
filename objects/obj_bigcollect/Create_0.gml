val = 100
var type = choose("mushroom", "cheese", "tomato", "sausage", "pineapple")
sprite_index = asset_get_index($"spr_bigcollect{type}")
depth = 50

if ds_list_find_index(global.ds_saveroom, id) != -1
	instance_destroy()
