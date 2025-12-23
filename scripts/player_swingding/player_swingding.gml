function player_swingding()
{
	image_speed = 0.5
	
	if grounded
		hsp = approach(hsp, 0, 0.2)
	
	if floor(image_index) == 0 && particle_timer == 0
	{
		particle_timer = 5
		scr_sound_3d(sfx_spin, x, y)
	}
	else
		particle_timer = max(particle_timer - 1, 0)
	
	if abs(hsp) <= 0
	{
		state = states.hold
		sprite_index = spr_player_haulingidle
		movespeed = 0
	}
	
	if input_buffers.grab > 0 || (scr_hitwall(x + xscale, y) && !place_meeting(x + xscale, y, obj_destroyable))
	{
		input_buffers.grab = 0
		hsp = 0
		state = states.punchenemy
		reset_anim(spr_player_swingdingend)
	}
	
	aftimg_timers.blur.do_it = true
	instakill = true
}