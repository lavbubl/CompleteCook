dialog[0] = dialog_create("no")
loop = 1
persistent = 0
scene_info = [[function()
{
	if (!global.noisecutscene2)
	{
		with (obj_player)
		{
			if (x > other.x)
			{
				with (other)
					cutscene_end_action()
			}
		}
	}
	exit;
}
], [cutscene_set_player_actor], [cutscene_do_dialog, dialog], [cutscene_waitfor_dialog], [cutscene_set_player_actor], [cutscene_move_player, 322, (x - 200), 8, 12], [cutscene_set_player_normal]]
if (global.noisecutscene2 == -4)
	global.noisecutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "noise2", 0)
if global.noisecutscene2
	instance_destroy()
