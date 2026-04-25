function player_noclip()
{
	var v_move = -input_check(INPUTS.up) + input_check(INPUTS.down)
	var s = keyboard_check(vk_shift) ? 2 : 1
	
	x += p_move * 5 * s
	y += v_move * 5 * s
	
	sprite_index = spr_player_idle
	image_speed = 1
	
	if input_check_pressed(INPUTS.jump)
		state = states.normal
}
