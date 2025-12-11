function player_ladder()
{
	var move_v = (-input.up.check + input.down.check)
	
	vsp = move_v * 6
	
	if (move_v != 0)
		sprite_index = vsp <= 0 ? spr_playerP_laddermove : spr_playerP_ladderdown
	else
		sprite_index = spr_playerP_ladder
		
	image_speed = 0.35
	
	if (!place_meeting(x, y + 1, obj_ladder) || place_meeting(x, y + sign(vsp), obj_solid))
	{
		state = states.normal
		vsp = 0
		if sprite_index != spr_playerP_ladderdown //so the player doesnt clip down when at the bottom of a ladder
		{
			repeat 6 //using repeat to essentially do a capped while statement
			{
				if !scr_solid(x, y + 1)
					y++
				else
					break;
			}
		}
	}
	
	if sprite_index == spr_playerP_laddermove
	{
		if particle_timer > 0
			particle_timer--;
		else
		{
			particle_timer = 12;
			scr_sound_3d_pitched(sfx_step, x, y)
			create_effect(x, y, spr_cloudeffect)
		}
	}
	
	if input_buffers.jump > 0
	{
		input_buffers.jump = 0
		vsp = -12
		state = states.jump
		reset_anim(spr_playerP_jump)
		jumpstop = false
		ladderbuffer = 20
	}
}