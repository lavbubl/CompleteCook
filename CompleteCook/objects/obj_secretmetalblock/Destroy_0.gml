if (ds_list_find_index(global.saveroom, id) == -1)
{
	with (instance_create((x + 32), (y + 32), obj_sausageman_dead))
		sprite_index = spr_harddoughblockdead
	GamepadSetVibration(playerindex, 1, 1, 0.8)
	tile_layer_delete_at(1, x, y)
	tile_layer_delete_at(1, (x + 32), y)
	tile_layer_delete_at(1, (x + 32), (y + 32))
	tile_layer_delete_at(1, x, (y + 32))
	with (obj_camera)
	{
		shake_mag = 20
		shake_mag_acc = (40 / room_speed)
	}
	scr_soundeffect(sfx_breakmetal)
	ds_list_add(global.saveroom, id)
}
scr_destroy_tiles(32, "Tiles_1")
scr_destroy_tiles(32, "Tiles_2")
scr_destroy_tiles(32, "Tiles_3")
scr_destroy_tiles(32, "Tiles_Foreground1")
scr_destroy_tiles(32, "Tiles_Foreground2")
scr_destroy_nearby_tiles()
depth = 1
