if input_check_pressed(INPUTS.ui_left) || input_check_pressed(INPUTS.ui_right)
{
	confirm = !confirm
	scr_sound(sfx_step)
}

if timer <= 1 || input_check_pressed(INPUTS.ui_deny) || (input_check_pressed(INPUTS.ui_accept) && !confirm)
{
	if change
	{
		
		global.option_windowmode = prev_mode
		event_user(0)
	}
	scr_sound(sfx_ui_back)
	instance_destroy()
}
else if input_check_pressed(INPUTS.ui_accept)
{
	scr_sound(choose(sfx_ui_accept1, sfx_ui_accept2, sfx_ui_accept3))
	instance_destroy()
}
else
	timer--
