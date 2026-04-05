update_input();

if left.pressed || right.pressed
{
	confirm = !confirm
	scr_sound(sfx_step)
}

if timer <= 1 || ui_deny.pressed || (ui_accept.pressed && !confirm)
{
	if change
	{
		global.option_windowmode = prev_mode
		event_user(0)
	}
	scr_sound(sfx_ui_back)
	instance_destroy()
}
else if ui_accept.pressed
{
	scr_sound(choose(sfx_ui_accept1, sfx_ui_accept2, sfx_ui_accept3))
	instance_destroy()
}
else
	timer--
