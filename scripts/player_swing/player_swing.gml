function player_swingding()
{
	image_speed = abs(hsp) / 24
	
	if grounded
		hsp = approach(hsp, 0, 0.2)
		
	if abs(hsp) <= 3
	{
		state = states.hold
		sprite_index = spr_player_holdidle
		movespeed = 0
	}
	
	if (key_attack.pressed || place_meeting(x + xscale, y, obj_solid))
	{
		state = states.punchenemy
		reset_anim(spr_player_swingdingend)
	}
	
	aftimg_timers.blur.do_it = true
	instakill = true
}