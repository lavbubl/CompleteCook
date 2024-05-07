if (global.levelcomplete && (!global.kidspartycutscene))
{
	currentroom = room
	mechactor = -4
	scene_info = [[cutscene_entrance_start], [cutscene_waitfor_sprite, obj_player1], [cutscene_player_idleanim], [cutscene_change_room, hub_warpath], [cutscene_set_player_visible, 0], [cutscene_set_player_pos, 1848, 750], [cutscene_player_float, 1], [cutscene_wait, 50], [function()
	{
		mechactor = instance_create(1632, 416, obj_actor)
		mechactor.sprite_index = spr_pizzamech
		cutscene_end_action()
		exit;
	}
], [function()
	{
		with (mechactor)
		{
			y -= 2
			if (y < 118)
			{
				y = 118
				with (other)
					cutscene_end_action()
			}
		}
		with (obj_camera)
		{
			shake_mag = 3
			shake_mag_acc = (3 / room_speed)
		}
		exit;
	}
], [cutscene_wait, 100], [cutscene_change_room, currentroom], [cutscene_set_player_visible, 1], [cutscene_player_float, 0], [function()
	{
		with (obj_player)
		{
			state = states.normal
			x = backtohubstartx
			y = backtohubstarty
		}
		global.levelcomplete = 0
		global.kidspartycutscene = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "kidsparty", 1)
		cutscene_end_action()
		exit;
	}
], [cutscene_save_game]]
}
else if global.levelcomplete
{
	global.levelcomplete = 0
	scene_info = [[cutscene_save_game]]
}
else
	scene_info = [[cutscene_wait, 20]]
