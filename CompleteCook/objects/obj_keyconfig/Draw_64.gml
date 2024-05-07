draw_set_font(global.bigfont)
if (player == 0)
{
	if (key_select == -1)
		draw_text_colour(280, 50, "BACK", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(280, 50, "BACK", c_white, c_white, c_white, c_white, 0.5)
	if (key_select == 0)
		draw_text_colour(420, 50, "UP", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 50, "UP", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 50, scr_keyname(global.key_up))
	if (key_select == 1)
		draw_text_colour(420, 100, "DOWN", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 100, "DOWN", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 100, scr_keyname(global.key_down))
	if (key_select == 2)
		draw_text_colour(420, 150, "RIGHT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 150, "RIGHT", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 150, scr_keyname(global.key_right))
	if (key_select == 3)
		draw_text_colour(420, 200, "LEFT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 200, "LEFT", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 200, scr_keyname(global.key_left))
	if (key_select == 4)
		draw_text_colour(420, 250, "JUMP", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 250, "JUMP", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 250, scr_keyname(global.key_jump))
	if (key_select == 5)
		draw_text_colour(420, 300, "GRAB", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 300, "GRAB", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 300, scr_keyname(global.key_slap))
	if (key_select == 6)
		draw_text_colour(420, 350, "DASH", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 350, "DASH", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 350, scr_keyname(global.key_attack))
	if (key_select == 7)
		draw_text_colour(420, 400, "SHOOT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 400, "SHOOT", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 400, scr_keyname(global.key_shoot))
	if (key_select == 8)
		draw_text_colour(420, 450, "TAUNT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 450, "TAUNT", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 450, scr_keyname(global.key_taunt))
	if (key_select == 9)
		draw_text_colour(420, 500, "PAUSE", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 500, "PAUSE", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 500, scr_keyname(global.key_start))
}
if (player == 1)
{
	draw_text_colour(280, 25, "PLAYER 2", c_white, c_white, c_white, c_white, 1)
	if (key_select == -1)
		draw_text_colour(280, 50, "BACK", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(280, 50, "BACK", c_white, c_white, c_white, c_white, 0.5)
	if (key_select == 0)
		draw_text_colour(420, 50, "UP", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 50, "UP", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 50, scr_keyname(global.key_upN))
	if (key_select == 1)
		draw_text_colour(420, 100, "DOWN", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 100, "DOWN", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 100, scr_keyname(global.key_downN))
	if (key_select == 2)
		draw_text_colour(420, 150, "RIGHT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 150, "RIGHT", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 150, scr_keyname(global.key_rightN))
	if (key_select == 3)
		draw_text_colour(420, 200, "LEFT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 200, "LEFT", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 200, scr_keyname(global.key_leftN))
	if (key_select == 4)
		draw_text_colour(420, 250, "JUMP", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 250, "JUMP", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 250, scr_keyname(global.key_jumpN))
	if (key_select == 5)
		draw_text_colour(420, 300, "GRAB", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 300, "GRAB", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 300, scr_keyname(global.key_slapN))
	if (key_select == 6)
		draw_text_colour(420, 350, "DASH", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 350, "DASH", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 350, scr_keyname(global.key_attackN))
	if (key_select == 7)
		draw_text_colour(420, 400, "SHOOT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 400, "SHOOT", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 400, scr_keyname(global.key_shootN))
	if (key_select == 8)
		draw_text_colour(420, 450, "TAUNT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 450, "TAUNT", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 450, scr_keyname(global.key_tauntN))
	if (key_select == 9)
		draw_text_colour(420, 500, "PAUSE", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 500, "PAUSE", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 500, scr_keyname(global.key_startN))
}
