if input_check_pressed(INPUTS.ui_left) || input_check_pressed(INPUTS.ui_right)
	quit = !quit

if (input_check_pressed(INPUTS.ui_accept) && !quit) || input_check_pressed(INPUTS.ui_deny)
	instance_destroy()
else if input_check_pressed(INPUTS.ui_accept) && quit
	game_end()
