function player_slip() 
{
	hsp = xscale * movespeed;
	if grounded
		movespeed = approach(movespeed, 0, 0.5);
	image_speed = 0.35
	if anim_ended() && sprite_index != spr_player_rockethitwall
		image_speed = 0
	if sprite_index == spr_player_slipbanana2
	{
		do_slope_momentum()
		if !grounded
		{
			sprite_index = spr_player_slipbanana1;
			image_index = 3
			fmod_studio_event_instance_oneshot_3d("event:/sfx/player/slip", x, y)
		}
		if anim_ended() && abs(hsp) <= 2
			state = states.normal
	}
	if grounded && vsp > -1 && sprite_index != spr_player_slipbanana2 && !place_meeting(x, y + 1, obj_metalblock) && !place_meeting(x, y + 1, obj_destroyable)
	{
		if (sprite_index == spr_player_rockethitwall)
		{
			sprite_index = spr_player_slipbanana2;
			image_index = 0;
			image_speed = 0.35;
			fmod_studio_event_instance_oneshot_3d("event:/sfx/player/slipend", x, y)
		}
		else
		{
			vsp = -6
			movespeed = approach(movespeed, 0, 3)
			sprite_index = spr_player_rockethitwall
			particle_create(x, y + 43, particles.bang)
			fmod_studio_event_instance_oneshot_3d("event:/sfx/player/sliphit", x, y)
		}
	}
	if scr_hitwall(x + xscale, y) && !place_meeting(x + xscale, y, obj_destroyable)
	{
		xscale *= -1
		sleep(1)
		particle_create(x + 30, y, particles.bang)
		fmod_studio_event_instance_oneshot_3d("event:/sfx/player/sliphit", x, y)
		if sprite_index == spr_player_slipbanana1
			movespeed = approach(movespeed, 0, 3)
		sprite_index = spr_player_rockethitwall
	}
	instakill = true
}