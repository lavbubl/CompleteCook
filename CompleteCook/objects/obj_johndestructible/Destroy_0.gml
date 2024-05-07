if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat (7)
		create_debris((x + 32), (y + 32), spr_johndestructible_debris)
	tile_layer_delete_at(1, x, y)
	tile_layer_delete_at(1, (x + 32), y)
	tile_layer_delete_at(1, (x + 32), (y + 32))
	tile_layer_delete_at(1, x, (y + 32))
	if (audio_is_playing(sfx_breakblock1) or audio_is_playing(sfx_breakblock2))
	{
		audio_stop_sound(sfx_breakblock1)
		audio_stop_sound(sfx_breakblock2)
	}
	scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
	ds_list_add(global.saveroom, id)
	with (instance_create(x, y, obj_johnghost))
		playerid = instance_nearest(x, y, obj_player)
}
