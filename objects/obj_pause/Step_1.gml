if room == mainmenu || room == rank_room ||  room == rm_timesup || instance_exists(obj_titlecard) || instance_exists(obj_technicaldifficulty) || (instance_exists(obj_shell) && obj_shell.isOpen)
	exit;

if instance_exists(obj_options)
{
	inputbuffer = 2
	exit;
}
else if inputbuffer > 0
{
	inputbuffer--
	exit;
}

#region pause and unpausing

if (input_check_pressed(INPUTS.ui_start) && !pause) || (((optionselected == 0 && input_check_pressed(INPUTS.ui_confirm)) || input_check_pressed(INPUTS.ui_start) || input_check_pressed(INPUTS.ui_back)) && pause)
{
	if !pause
	{
		pause = true
		pause_image = make_pause_image()
		instance_deactivate_all(true)
		instance_activate_object(obj_pause_angel)
		instance_activate_object(obj_screensizer)
		instance_activate_object(obj_shakytext)
		instance_activate_object(obj_fmodhandler) //god this sucks. why isnt it an array of objs to activate
		if global.option_timerspeedrun
			instance_activate_object(obj_timer)
		for (var i = 0; i < array_length(buses); i++)
		{
			fmod_studio_bus_set_paused(buses[i], true)
		}
		fmod_studio_event_instance_start(pause_music)
		instance_activate_object(obj_inputhandler)
		if global.option_timerspeedrun
			instance_activate_object(obj_timer)
		cursor.x = -60
		cursor.y = -300
		options = []
		for (var i = 0; i < array_length(baseoptions); i++) 
		{
			var cur_option = baseoptions[i]
			if (!global.in_level && cur_option.o_type == optiontypes.hub) 
			|| (global.in_level && cur_option.o_type == optiontypes.level)
			|| cur_option.o_type == optiontypes.both
				array_push(options, cur_option)
		}
	}
	else
		do_unpause()
}

#endregion
