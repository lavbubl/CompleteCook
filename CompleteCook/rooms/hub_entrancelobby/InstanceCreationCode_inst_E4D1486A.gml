if (global.levelcomplete && (!global.entrancecutscene))
{
	currentroom = room
	scene_info = [[cutscene_entrance_start], [cutscene_waitfor_sprite, obj_player1], [cutscene_player_idleanim], [cutscene_change_room, hub_pizzatowerlobby], [cutscene_set_player_visible, 0], [cutscene_set_player_pos, 396, 750], [cutscene_wait, 100], [cutscene_entrance_middle], [cutscene_wait, 100], [cutscene_change_room, currentroom], [cutscene_set_player_visible, 1], [cutscene_entrance_end], [cutscene_save_game]]
}
else if global.levelcomplete
{
	global.levelcomplete = 0
	scene_info = [[cutscene_save_game]]
}
else
	scene_info = [[cutscene_wait, 20]]
