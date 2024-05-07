if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat (8)
	{
		with (create_debris((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), spr_deadjohndebris))
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10)
		}
	}
	repeat (5)
	{
		with (instance_create((x + random_range(0, 64)), (y + random_range(0, 64)), obj_parryeffect))
		{
			sprite_index = spr_deadjohnsmoke
			image_speed = 0.35
		}
	}
	scr_sleep(5)
	if (audio_is_playing(sfx_breakblock1) or audio_is_playing(sfx_breakblock2))
	{
		audio_stop_sound(sfx_breakblock1)
		audio_stop_sound(sfx_breakblock2)
	}
	scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
	instance_create((x + 32), (y + (sprite_height / 2)), obj_bangeffect)
	ds_list_add(global.saveroom, id)
}
