function player_noclip()
{
	var v_move = -input.up.check + input.down.check
	var s = keyboard_check(vk_shift) ? 2 : 1
	
	x += p_move * 5 * s
	y += v_move * 5 * s
	
	if input.jump.pressed
		state = states.normal
}