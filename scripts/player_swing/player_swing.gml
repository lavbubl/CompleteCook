function player_swingding()
{
	image_speed = abs(hsp) / 24
	
	if grounded
		hsp = approach(hsp, 0, 0.2)
		
	if abs(hsp) <= 3
	{
		state = states.hold
		sprite_index = spr_player_haulingidle
		movespeed = 0
	}
	
	if (input_buffers.grab > 0 || place_meeting(x + xscale, y, obj_solid))
	{
		input_buffers.grab = 0
		state = states.punchenemy
		reset_anim(spr_player_swingdingend)
	}
	
	if particle_timer > 0
		particle_timer--
	else if floor(image_index) >= image_number - 1
	{
		particle_timer = 2
		scr_sound_3d(sfx_spin, x, y)
		image_index = 0
	}
	
	aftimg_timers.blur.do_it = true
	instakill = true
}