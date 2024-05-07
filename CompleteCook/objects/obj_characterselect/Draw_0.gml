if (ready == 0)
{
	var gp_num = gamepad_get_device_count()
	var gp_num2 = 0
	var gp_connected = 0
	for (var i = 0; i < gp_num; i++)
	{
		if gamepad_is_connected(i)
		{
			gp_connected = 1
			gp_num2++
		}
	}
	if (gp_connected && gp_num2 < 2 && obj_inputAssigner.player_input_device[0] > -1)
		gp_connected = 0
	if (selected == 0)
	{
		draw_sprite(spr_player1cursor, -1, 344, 94)
		if (global.coop == true)
			draw_sprite(spr_player2cursor, -1, 528, 94)
		else if gp_connected
			draw_sprite(spr_player2cursor_start, -1, (random_range(-1, 1) + 528), (random_range(-1, 1) + 94))
	}
	if (selected == 1)
	{
		draw_sprite(spr_player1cursor, -1, 528, 94)
		if (global.coop == true)
			draw_sprite(spr_player2cursor, -1, 344, 94)
		else if gp_connected
			draw_sprite(spr_player2cursor_start, -1, (random_range(-1, 1) + 344), (random_range(-1, 1) + 94))
	}
}
else
{
	if (selected == 0)
	{
		draw_sprite(spr_player1cursorselected, -1, 344, 94)
		if (global.coop == true)
			draw_sprite(spr_player2cursorselected, -1, 528, 94)
	}
	if (selected == 1)
	{
		draw_sprite(spr_player1cursorselected, -1, 528, 94)
		if (global.coop == true)
			draw_sprite(spr_player2cursorselected, -1, 344, 94)
	}
}
