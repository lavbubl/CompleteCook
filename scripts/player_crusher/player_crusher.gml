function player_crusher()
{
	image_speed = 0.35;
	if sprite_index == spr_playerN_crusherland
	{
		hsp = 0
		vsp = 0
		movespeed = 0
		if anim_ended()
			state = states.normal
		exit;
	}
	hsp = approach(hsp, p_move * 8, 0.5)
	if vsp > 0
		vsp += 0.5
	if input_buffers.grab > 0
	{
		input_buffers.grab = 0
		input.up.check = false //prevent uppercutting making infinite jumps easier
		do_spin_cancel()
	}
	if grounded && vsp >= 0
	{
		with par_enemy
		{
			if grounded && vsp >= 0 && bbox_in_camera()
			{
				state = states.stun
				stun_timer = 60
				vsp = -11
				xscale *= -1
				hsp = 0
			}
		}
		
		shake_camera(10, 30 / room_speed)
		scr_sound_3d(sfx_groundpound, x, y)
		reset_anim(spr_playerN_crusherland)
	}
	
	if anim_ended()
		image_index = 6
	
	do_taunt()
	
	instakill = true
}
