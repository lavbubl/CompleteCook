if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat (8)
	{
		with (create_debris((x + random_range(0, 64)), (y + random_range(0, 64)), spr_towerblockdebris, 1))
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10)
			image_speed = 0.35
		}
	}
	repeat (3)
	{
		with (instance_create((x + random_range(0, 64)), (y + random_range(0, 64)), obj_parryeffect))
		{
			sprite_index = spr_deadjohnsmoke
			image_speed = 0.35
		}
	}
	scr_sleep(5)
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
}
