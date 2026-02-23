function player_wallbounce()
{
	var _spd = 8
	
	movespeed = approach(movespeed, p_move != 0 ? p_move * _spd : 0, p_move != 0 ? 1 : 0.5)
	
	hsp = movespeed
	
	if !grounded
	{
		if input_buffers.grab > 0
		{
			input_buffers.grab = 0
			do_spin_cancel()
		}
		else if input.down.check
		{
			state = states.divebomb
			vsp = 20
			sprite_index = spr_playerN_divebombfall
		}
	}
	else if vsp >= 0
	{
		flash = 8
		scr_sound_3d(sfx_N_machland, x, y)
		particle_create(x, y, particles.noisebump)
		with create_effect(x, y, spr_crazyruneffect)
		{
			image_xscale = other.xscale
			depth = -150
		}
		if input.dash.check
		{
			if p_move != 0
				xscale = p_move
			state = states.mach3
			movespeed = max(abs(movespeed), 12)
			sprite_index = spr_player_mach3
		}
		else
			state = states.normal
	}
	
	if !particle_contains_sprite(spr_drilleffect)
		create_followingeffect(spr_drilleffect, states.wallbounce, xscale).depth = -100
	
	image_speed = 0.5
	
	do_crusher()
	
	do_taunt()
	
	if state != states.wallbounce
		audio_stop_sound(sfx_N_wallkick)
	
	aftimg_timers.noise.do_it = true
}
