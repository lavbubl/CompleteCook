if (global.levelcomplete && (!global.sewercutscene))
{
	currentroom = room
	scene_info = [[cutscene_entrance_start], [cutscene_waitfor_sprite, obj_player1], [cutscene_player_idleanim], [cutscene_change_room, hub_laundryroom], [cutscene_set_player_visible, 0], [cutscene_player_float, 1], [cutscene_set_player_pos, 320, 288], [cutscene_wait, 39], [function()
	{
		with (obj_hubwater)
		{
			y++
			if (y > (ystart + 32))
			{
				with (other)
					cutscene_end_action()
			}
		}
		exit;
	}
], [cutscene_wait, 150], [cutscene_change_room, currentroom], [cutscene_player_float, 0], [cutscene_set_player_visible, 1], [cutscene_sewer_end], [cutscene_save_game]]
}
else if global.levelcomplete
{
	global.levelcomplete = 0
	scene_info = [[cutscene_save_game]]
}
else
	scene_info = [[cutscene_wait, 20]]
