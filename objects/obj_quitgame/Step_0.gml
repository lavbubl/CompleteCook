if input_direction_check_pressed(INPUTS.ui_left) || input_direction_check_pressed(INPUTS.ui_right)
	quit = !quit

if (input_check_pressed(INPUTS.ui_confirm) && !quit) || input_check_pressed(INPUTS.ui_back)
{
	instance_destroy()
	obj_menuhandler.buffer = 2
}
else if input_check_pressed(INPUTS.ui_confirm) && quit
	game_end()
