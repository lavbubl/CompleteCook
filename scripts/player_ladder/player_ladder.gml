function player_ladder()
{
	var move_v = (-input.up.check + input.down.check)
	
	vsp = move_v * 6
	
	if (move_v != 0)
		sprite_index = vsp <= 0 ? spr_player_laddermove : spr_player_ladderdown
	else
		sprite_index = spr_player_ladder
		
	image_speed = 0.35
	
	if (!place_meeting(x, y + 1, obj_ladder) || place_meeting(x, y + sign(vsp), obj_solid))
	{
		state = states.normal
		vsp = 0
	}
	
	if sprite_index == spr_player_laddermove
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
		reset_anim(spr_player_jump)
		jumpstop = false
		ladderbuffer = 20
	}
}