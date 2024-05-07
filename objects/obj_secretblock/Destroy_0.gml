if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat (2)
	{
		with (create_debris((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), spr_towerblockdebris))
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10)
			image_speed = 0.35
		}
	}
	with (instance_create((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), obj_parryeffect))
	{
		sprite_index = spr_deadjohnsmoke
		image_speed = 0.35
	}
	if (audio_is_playing(sfx_breakblock1) or audio_is_playing(sfx_breakblock2))
	{
		audio_stop_sound(sfx_breakblock1)
		audio_stop_sound(sfx_breakblock2)
	}
	scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
	ds_list_add(global.saveroom, id)
}
scr_destroy_tiles(32, "Tiles_1")
scr_destroy_tiles(32, "Tiles_2")
scr_destroy_tiles(32, "Tiles_3")
scr_destroy_tiles(32, "Tiles_4")
scr_destroy_tiles(32, "Tiles_Foreground1")
scr_destroy_tiles(32, "Tiles_Foreground2")
scr_destroy_nearby_tiles()
