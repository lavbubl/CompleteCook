function scr_player_highjump()
{
	move = (key_left + key_right)
	if (momemtum == 0)
		hsp = (move * movespeed)
	else
		hsp = (xscale * movespeed)
	if (move == 0 && momemtum == 0)
		movespeed = 0
	if (move != 0 && movespeed < 6)
		movespeed += 0.5
	if (((scr_solid((x + 1), y) && move == 1) or (scr_solid((x - 1), y) && move == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
		movespeed = 0
	if (dir != xscale)
	{
		dir = xscale
		movespeed = 2
	}
	landAnim = 1
	if ((!key_jump2) && jumpstop == 0 && vsp < 0)
	{
		vsp /= 2
		jumpstop = 1
	}
	if (ladderbuffer > 0)
		ladderbuffer--
	if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
	{
		vsp = grav
		jumpstop = 1
	}
	if (grounded && vsp > 0)
	{
		if key_attack
			landAnim = 0
		state = states.normal
		jumpAnim = 1
		jumpstop = 0
		image_index = 0
		freefallstart = 0
	}
	if (grounded && input_buffer_jump < 8 && (!key_attack) && (!key_down) && vsp > 0)
	{
		vsp = -9
		state = states.jump
		jumpAnim = 1
		jumpstop = 0
		image_index = 0
		freefallstart = 0
		audio_sound_gain(sfx_jump, 0.7, 0)
		if (!audio_is_playing(sfx_jump))
			audio_play_sound(sfx_jump, 1, false)
	}
	if key_jump
		input_buffer_jump = 0
	if (jumpAnim == 1)
	{
		sprite_index = spr_player_Sjumpstart
		if (floor(image_index) == 3)
			jumpAnim = 0
	}
	if (jumpAnim == 0)
		sprite_index = spr_player_Sjump
	if (move != 0)
		xscale = move
	image_speed = 0.35
	if ((!grounded) && key_down)
	{
		vsp = 0
		mach2 = 0
		image_index = 0
		vsp = -7
		state = states.freefallprep
	}
	exit;
}

