if input_direction_check_pressed(INPUTS.ui_left) || input_direction_check_pressed(INPUTS.ui_right)
{
	confirm = !confirm
	fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_step")
}

if timer <= 1 || input_check_pressed(INPUTS.ui_back) || (input_check_pressed(INPUTS.ui_confirm) && !confirm)
{
	if change
	{
		global.option_windowmode = prev_mode
		event_user(0)
	}
	
	fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_back")
	instance_destroy()
}
else if input_check_pressed(INPUTS.ui_confirm)
{
	fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_accept")
	instance_destroy()
}
else
	timer--
