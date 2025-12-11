function player_grind()
{
	if ((hsp < 10 && xscale == 1) || (hsp > -10 && xscale == -1))
		hsp = approach(hsp, xscale * 10, 0.4)
	sprite_index = spr_playerP_grind
	image_speed = 0.35
	
	if (input_buffers.jump > 0 && (place_meeting(x, y + 1, obj_grindrail) || place_meeting(x, y + 1, obj_grindrailslope)))
	{
		input_buffers.jump = 0
		vsp = -12
		jumpstop = false
		state = states.mach2
		sprite_index = spr_playerP_mach2jump
		movespeed = abs(hsp)
		scr_sound_3d(sfx_jump, x, y)
	}
	
	if (!place_meeting(x, y + 4, obj_grindrail) && !place_meeting(x, y + 4, obj_grindrailslope))
	{
		state = states.mach2
		sprite_index = spr_playerP_mach2jump
		movespeed = abs(hsp)
	}
}