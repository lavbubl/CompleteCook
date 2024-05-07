function tile_layer_delete_at(argument0, argument1, argument2)
{
	var __depth = argument0
	var __x = argument1
	var __y = argument2
	var __tile_el = tile_layer_find(__depth, __x, __y)
	if (__tile_el != -1)
		layer_tile_destroy(__tile_el)
	exit;
}

