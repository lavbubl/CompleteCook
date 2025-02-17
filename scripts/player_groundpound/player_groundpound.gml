function player_groundpound()
{
	if (vsp >= 2)
	{
		if (vsp > 17)
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
				particle_timer = 15
			}
		}
		vsp += 0.5
	}
	if (anim_ended() && sprite_index == spr_player_bodyslamstart)
		sprite_index = spr_player_bodyslamfall
	/*
	if (floor(image_index) == image_number - 1 && sprite_index == spr_shotgunjump1)
		sprite_index = spr_shotgunjump3*/
	
	if (!grounded)
	{
		//if (sprite_index != 'rockethitwall')
			hsp = p_move * movespeed
		/*else
			hsp = 0*/
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
		if (p_move != 0 && sprite_index != spr_player_poundcancel1)
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
		if (scr_slope(x, y + 1))
		{
			var slopeinst = -4
			with (instance_place(x, y + 1, obj_slope))
				slopeinst = id
			//intentionally overwrites if touching a slope platform
			with (instance_place(x, y + 1, obj_slopeplatform))
				slopeinst = id
			
			with slopeinst 
			{
				other.xscale = -sign(image_xscale)
				other.state = states.tumble
				other.sprite_index = spr_player_crouchslip
				if other.freefallsmash > 20
					other.movespeed = 12
				else
					other.movespeed = 8
			}
			particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
		}
		else
		{
			reset_anim(sprite_index == spr_player_poundcancel1 ? spr_player_poundcancel2 : spr_player_bodyslamland)
			/*else if shotgunAnim == 0
				sprite_index = spr_bodyslamland
			else
				sprite_index = spr_shotgunjump2*/
			image_index = 0
			state = states.bump
			shake_camera()
			scr_sound_3d(sfx_groundpound, x, y)
			create_effect(x, y + 2, spr_groundpoundeffect)
			if freefallsmash >= 10
			{
				with (par_enemy)
				{
					//if (shakestun && grounded && view point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && !invincible && groundpound)
					if (grounded && vsp >= 0)
					{
						state = e_states.stun
						stun_timer = 60
						vsp = -11
						xscale *= -1
						hsp = 0
					}
				}
				shake_camera(10, 0.5)
			}
		}
	}
	
	image_speed = 0.35
	aftimg_timers.blur.do_it = true
	instakill = true
}