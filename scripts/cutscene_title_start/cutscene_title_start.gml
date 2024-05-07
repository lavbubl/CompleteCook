function cutscene_title_start()
{
	with (obj_player1)
		state = states.actor
	cutscene_end_action()
	exit;
}

function cutscene_title_middle()
{
	var finish = 0
	with (obj_title)
	{
		collide = 1
		if grounded
			finish = 1
	}
	if finish
		cutscene_end_action()
	exit;
}

function cutscene_title_end()
{
	with (obj_player1)
		sprite_index = spr_idle
	if obj_inputAssigner.device_selected[0]
	{
		with (obj_player1)
			state = states.normal
		cutscene_end_action()
	}
	else
	{
		with (obj_inputAssigner)
			press_start = 1
	}
	exit;
}

