function player_groundpound()
{
	if vsp >= 2
	{
		if vsp > 17
		{
			aftimg_timers.mach.do_it = true
			if particle_timer > 0
				particle_timer--
			else
			{
				if !particle_contains_sprite(spr_piledrivereffect)
				{
					with create_effect(x, y, spr_piledrivereffect)
						depth = -150
				}
				if !particle_contains_sprite(spr_groundpoundcharge)
					create_followingeffect(spr_groundpoundcharge, states.groundpound, xscale)
				particle_timer = 15
			}
		}
		vsp += 0.5
	}
	
	if particle_timer2 > 0
		particle_timer2--
	else
	{
		create_effect(x, y, spr_cloudeffect)
		particle_timer2 = 10
	}
	
	if (anim_ended() && sprite_index == spr_player_bodyslamstart)
		sprite_index = spr_player_bodyslamfall
	else if (anim_ended() && sprite_index == spr_player_shotgun_shootdown)
		image_index = image_number - 3
	/*
	if (floor(image_index) == image_number - 1 && sprite_index == spr_shotgunjump1)
		sprite_index = spr_shotgunjump3*/
	
	if (!grounded)
	{
		hsp = sprite_index != spr_player_rockethitwall ? p_move * movespeed : 0
		if (p_move != xscale && !place_meeting(x + xscale, y, obj_solid) && movespeed != 0)
			movespeed -= 0.05
		//if (movespeed == 0)
		//	momemtum = false
		if (p_move != dir && p_move != 0)
		{
			dir = p_move
			movespeed = 0
		}
		if (p_move == 0)
			movespeed = 0
		//if ((p_move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
		if (p_move != 0 && movespeed < 7)
			movespeed += 0.25
		if (movespeed > 7)
			movespeed -= 0.05
		if (place_meeting(x + p_move, y, obj_solid))
		{
			hsp = 0
			movespeed = 0
		}
		if (p_move != 0 && sprite_index != spr_player_poundcancel1 && sprite_index != spr_player_rockethitwall)
			xscale = p_move
	}
	if (vsp > 0)
		freefallsmash++
	else if (vsp < 0)
		freefallsmash = -14
	/*if (freefallsmash >= 10 && !instance_exists(superslameffectid))
	{
		with (instance_create(x, y, obj_superslameffect))
		{
			playerid = other.object_index
			other.superslameffectid = id
		}
	}*/
	//if (grounded && vsp > 0 && (freefallsmash < 10 || !place_meeting(x, y + vsp, obj_metalblock)) && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + vsp, obj_destructibles) && !place_meeting(x, y + vsp + 6, obj_destructibles))
	if (grounded && vsp >= 0)
	{
		if scr_slope(x, y + 1)
		{
			var slopeinst = -4
			with (instance_place(x, y + 1, obj_slope))
				slopeinst = id
			
			with (instance_place(x, y + 1, obj_slopeplatform))
				slopeinst = id
			
			xscale = -sign(slopeinst.image_xscale)
			
			state = states.tumble
			sprite_index = spr_player_crouchslip
			if freefallsmash > 20
				movespeed = 12
			else
				movespeed = 8
			particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
		}
		else
		{
			var landanim = spr_player_bodyslamland
			if sprite_index == spr_player_poundcancel1
				landanim = spr_player_poundcancel2
			else if has_shotgun
				landanim = spr_player_shotgun_shootdownland
			reset_anim(landanim)
			image_index = 0
			state = states.bump
			hsp = 0
			movespeed = 0
			shake_camera(5, 15 / room_speed)
			scr_sound_3d(sfx_groundpound, x, y)
			create_effect(x, y + 2, spr_groundpoundeffect)
			if freefallsmash >= 10
			{
				with par_enemy
				{
					if (grounded && vsp >= 0 && bbox_in_camera())
					{
						state = states.stun
						stun_timer = 60
						vsp = -11
						xscale *= -1
						hsp = 0
					}
				}
				shake_camera(10, 30 / room_speed)
			}
		}
	}
	
	image_speed = 0.35
	aftimg_timers.blur.do_it = true
	instakill = true
}