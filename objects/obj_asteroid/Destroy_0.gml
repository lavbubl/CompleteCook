if (ds_list_find_index(global.saveroom, id) == -1)
{
	ds_list_add(global.saveroom, id)
	if audio_is_playing(sfx_collecttopping)
		audio_stop_sound(sfx_collecttopping)
	scr_soundeffect(sfx_collecttopping)
	global.heattime += 10
	global.heattime = clamp(global.heattime, 0, 60)
	with (obj_camera)
		healthshaketime = 30
	global.collect += 100
	with (instance_create(x, y, obj_smallnumber))
		number = string(100)
	var sep = 100
	repeat (10)
	{
		with (create_debris(irandom_range(((x + (sprite_width / 2)) - sep), ((x + (sprite_width / 2)) + sep)), irandom_range(((y + (sprite_height / 2)) - sep), ((y + (sprite_height / 2)) + sep)), spr_meteordebris))
			vsp = irandom_range(-6, -14)
	}
}
