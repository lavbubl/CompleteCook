function player_noclip()
{
	var v_move = -key_up.down + key_down.down
	var s = keyboard_check(vk_shift) ? 2 : 1
	
	x += p_move * 5 * s
	y += v_move * 5 * s
	
	if key_jump.pressed
		state = states.normal
}