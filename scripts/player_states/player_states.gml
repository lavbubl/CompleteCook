enum states 
{
	normal,
	jump,
	mach2,
	mach3,
	tumble,
	climbwall,
	slide,
	bump,
	groundpound,
	grab,
	superjump,
	taunt,
	crouch,
	actor,
	ladder,
	punch,
	hold,
	piledriver,
	punchenemy,
	swingding,
	grind
}

#region the states

function player_normal()
{
	if (p_move != 0)
	{
		movespeed = approach(movespeed, 8, movespeed > 8 ? 0.1 : 0.5)
		if (floor(movespeed) == 8)
			movespeed = 6
		xscale = p_move
	}
	else
		movespeed = 0
	
	hsp = movespeed * xscale
	
	if (breakdance_secret.buffer < 10)
	{
		if p_move != 0
		{
			if (sprite_index != spr_player_landmove)
				sprite_index = spr_player_move
		}
		else
		{
			if (sprite_index != spr_player_machslideend && sprite_index != spr_player_land && sprite_index != spr_player_bodyslamland && sprite_index != spr_player_facehurt)
				sprite_index = spr_player_idle
		}
	}
	
	image_speed = 0.35
	
	if key_taunt.down
	{
		if breakdance_secret.buffer < 10
			breakdance_secret.buffer++
		else
		{
			sprite_index = spr_player_breakdance
			breakdance_secret.spd = approach(breakdance_secret.spd, 0.5, 0.005)
			image_speed = breakdance_secret.spd
		}
		if breakdance_secret.spd > 0.48
		{
			aftimg_timers.blur.do_it = true
			if (!instance_exists(obj_beatbox))
				instance_create(x, y, obj_beatbox)
		}
	}
	else
	{
		breakdance_secret.buffer = 0
		breakdance_secret.spd = 0.1
	}
	
	if (key_down.down || scr_solid(x, y - 16))
	{
		reset_anim(spr_player_crouchdown)
		state = states.crouch
	}
	
	if !grounded
	{
		state = states.jump
		reset_anim(spr_player_fall)
	}
	
	if (coyote_time && key_jump.pressed)
	{
		vsp = -11
		state = states.jump
		reset_anim(spr_player_jump)
		jumpstop = false
		scr_sound(sfx_jump)
	}
	
	if (key_dash.down && !place_meeting(x + xscale, y, obj_solid))
	{
		state = states.mach2
		if (movespeed < 6)
			movespeed = 6
		reset_anim(spr_player_mach1)
	}
	
	do_grab()
	
	switch (sprite_index)
	{
		case spr_player_move:
			image_speed = movespeed / 15
			break;
		case spr_player_machslideend:
		case spr_player_land:
			reset_anim_on_end(spr_player_idle)
			break;
		case spr_player_landmove:
			image_speed = movespeed / 15
			reset_anim_on_end(spr_player_idle)
			break;
		case spr_player_facehurt:
			reset_anim_on_end(spr_player_idle)
			break;
	}
	
	do_taunt()
}

function player_jump()
{
	if (p_move != 0)
	{
		movespeed = approach(movespeed, 6, 0.5)
		xscale = p_move
	}
	else if (p_move == 0 || xscale != p_move)
		movespeed = approach(movespeed, 0, 0.5)
	
	hsp = movespeed * xscale
	
	if (!jumpstop && !key_jump.down && vsp < 0)
	{
		jumpstop = true
		vsp /= 10
	}
	
	if sprite_index != spr_player_grabbump
		do_grab()
	do_groundpound()
	
	if (grounded && vsp >= 0)
	{
		state = states.normal
		reset_anim(movespeed < 1 ? spr_player_land : spr_player_landmove)
		if (key_dash.down)
		{
			state = states.mach2
			if (movespeed < 6)
				movespeed = 6
			reset_anim(spr_player_mach1)
		}
	}
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_player_jump:
		case spr_player_grabcancel:
		case spr_player_piledriverjump:
			reset_anim_on_end(spr_player_fall)
			break;
		case spr_player_stomp:
			if anim_ended()
				image_index = 3
			break;
	}
	do_taunt()
}

function player_mach2() {
	hsp = xscale * movespeed
	
	if (grounded && vsp >= 0)
	{
		if (sprite_index != spr_player_mach1 && sprite_index != spr_player_rollgetup)
			sprite_index = spr_player_mach2
		if (!key_dash.down)
		{
			if (movespeed < 8)
			{
				state = states.normal
				movespeed = 0
			}
			else
			{
				reset_anim(spr_player_machslidestart)
				state = states.slide
			}
		}
		if (p_move != 0 && p_move != xscale)
		{
			if (movespeed < 8)
			{
				xscale = p_move
				movespeed = 6
			}
			else
			{
				reset_anim(spr_player_machslideboost)
				state = states.slide
			}
		}
		if (movespeed < 12)
			movespeed += 0.1
		else
		{
			if (sprite_index != spr_player_rollgetup)
				sprite_index = spr_player_mach3
			state = states.mach3
			flash = 8
		}
	}
	else
	{
		if (sprite_index != spr_player_secondjump && 
			sprite_index != spr_player_secondjumploop && 
			sprite_index != spr_player_walljump && 
			sprite_index != spr_player_walljumpfall && 
			sprite_index != spr_player_longjump &&
			sprite_index != spr_player_mach2jump)
			reset_anim(spr_player_secondjump)
		if (!jumpstop && !key_jump.down && vsp < 0)
		{
			jumpstop = true
			vsp /= 10
		}
	}
	if (key_jump.pressed && coyote_time) 
	{
		jumpstop = false
		vsp = -11
		scr_sound(sfx_jump)
	}
	do_slope_momentum()
	if (key_down.down)
	{
		state = states.tumble
		if (grounded)
			reset_anim(spr_player_machroll)
		else
		{
			sprite_index = spr_player_dive
			vsp = 10
		}
	}
	if ((!grounded || scr_slope(x, y + 1)) && place_meeting(x + xscale, y, obj_solid))
	{
		wallspeed = movespeed
		if (movespeed < 1)
			wallspeed = 1
		else
			movespeed = wallspeed
		state = states.climbwall
	}
	else if (grounded && place_meeting(x + xscale, y, obj_solid))
	{
		state = states.bump
		reset_anim(spr_player_wallsplat)
	}
	
	do_grab()
	
	image_speed = movespeed / 20
	switch (sprite_index)
	{
		case spr_player_mach1:
			image_speed = 0.5
			reset_anim_on_end(spr_player_mach2)
			break
		case spr_player_secondjump:
			image_speed = 0.4
			reset_anim_on_end(spr_player_secondjumploop)
			break
		case spr_player_walljump:
			image_speed = 0.4
			reset_anim_on_end(spr_player_walljumpfall)
			break
		case spr_player_rollgetup:
			image_speed = 0.4
			reset_anim_on_end(spr_player_mach2)
			break
		case spr_player_longjump:
			image_speed = 0.35
			if (anim_ended())
				image_index = 10
			break
		/*case spr_player_secondjump:
			sprite_index = spr_player_secondjumploop
			break
		case 'longjump':
			sprite_index = spr_player_longjumpend'
			break
		case 'walljump':
			sprite_index = spr_player_walljumpfall'
			break*/
	}
	do_taunt()
	
	aftimg_timers.mach.do_it = true
}

function player_mach3() {
	
	hsp = xscale * movespeed
	mach4mode = movespeed > 16
	
	var dashpad = sprite_index == spr_player_dashpad
	
	if (mach4mode)
	{
		if (sprite_index != spr_player_mach4)
		{
			flash = 8
			sprite_index = spr_player_mach4
		}
		/*if (superjumpeffecttimer > 0)
			superjumpeffecttimer--
		else
		{
			superjumpeffecttimer = 20
			createEffect('mach4effect', depth + 1)
			particleeffect.mirrorX(xscale)
			createEffect('flamecloud.down
		}*/
	}
	else if (sprite_index == spr_player_mach4)
	{
		flash = 8
		sprite_index = spr_player_mach3
	}
	
	if (key_jump.pressed && coyote_time) 
	{
		vsp = -11
		jumpstop = false
		reset_anim(spr_player_mach3jump)
		scr_sound(sfx_jump)
	}
	
	if (grounded)
	{
		if (sprite_index == spr_player_Sjumpcancel)
			sprite_index = spr_player_mach3
		if (!key_dash.down && !dashpad)
		{
			reset_anim(spr_player_machslidestart)
			state = states.slide
		}
		if (p_move != 0 && p_move != xscale && !dashpad)
		{
			reset_anim(spr_player_machslideboost3)
			state = states.slide
		}
		if (movespeed < 20 && p_move == xscale)
		{
			if (mach4mode)
			{
				movespeed += 0.1
			}
			else
			{
				movespeed += 0.025
			}
		}
		if (p_move != xscale && movespeed > 13)
			movespeed -= 0.1
		if (key_up.down && !dashpad)
		{
			state = states.superjump
			reset_anim(spr_player_superjumpprep)
		}
	}
	else
	{
		if (!jumpstop && !key_jump.down && vsp < 0)
		{
			jumpstop = true
			vsp /= 10
		}
	}
	
	do_slope_momentum()
	
	if (key_down.down)
	{
		state = states.tumble
		if (grounded)
			reset_anim(spr_player_machroll)
		else
		{
			sprite_index = spr_player_dive
			vsp = 10
		}
	}
	
	do_grab()
	
	if ((!grounded || scr_slope(x, y + 1)) && place_meeting(x + xscale, y, obj_solid))
	{
		{
			wallspeed = movespeed
			if (movespeed < 1)
				wallspeed = 1
			else
				movespeed = wallspeed
			state = states.climbwall
		}
	}
	else if (grounded && place_meeting(x + xscale, y, obj_solid))
	{
		state = states.bump
		reset_anim(spr_player_mach3hitwall)
		vsp = -6
		hsp = xscale * -6
		shake_camera()
		scr_sound(sfx_groundpound)
	}
	image_speed = 0.4
	switch (sprite_index)
	{
		case spr_player_mach3:
			image_speed = 0.35
			break
		case spr_player_mach4:
			image_speed = movespeed / 30
			break
		case spr_player_mach3jump:
		case spr_player_rollgetup:
		case spr_player_mach3kill:
		case spr_player_dashpad:
			reset_anim_on_end(spr_player_mach3)
			break
	}
	do_taunt()
	
	aftimg_timers.mach.do_it = true
	instakill = true
	
	if !obj_particlecontroller.active_particles.machcharge
		particle_create(x, y, particles.machcharge, xscale)
}

function player_tumble() {
	hsp = xscale * movespeed
	
	if (!grounded && (sprite_index == spr_player_crouchslip || sprite_index == spr_player_machroll || sprite_index == spr_player_mach2jump || sprite_index == spr_player_backslide))
	{
		vsp = 10
		sprite_index = spr_player_dive
	}
	if (sprite_index == spr_player_ball && grounded)
	{
		if (p_move == xscale)
			movespeed = approach(movespeed, 12, 0.25)
		else if (p_move == -xscale)
			movespeed = approach(movespeed, 8, 0.25)
		else
			movespeed = approach(movespeed, 10, 0.25)
	}
	if (grounded && sprite_index == spr_player_dive)
		reset_anim(spr_player_machroll)
	if (sprite_index == spr_player_dive && key_jump.pressed)
	{
		sprite_index = spr_player_poundcancel1
		state = states.groundpound
		vsp = -6
		dir = xscale
	}
	if movespeed <= 2
		state = states.normal
	if (sprite_index == spr_player_mach2jump && grounded)
		sprite_index = spr_player_machroll
	/*if (sprite_index == spr_player_crouchslip && !grounded)
		sprite_index = spr_player_jumpdive2'
	if (sprite_index == 'jumpdive2' && grounded)
		sprite_index = spr_player_crouchslip*/
	if (sprite_index == spr_player_machroll && movespeed > 12)
		reset_anim_on_end(spr_player_backslide)
	if (sprite_index == spr_player_machroll && !grounded)
		sprite_index = spr_player_mach2jump
	//if (state != 'groundpound' && place_meeting(x + xscale, y, obj_solid))
	if place_meeting(x + xscale, y, obj_solid)
	{
		hsp = 0
		movespeed = 0
		/*if (sprite_index == spr_player_ball || sprite_index == 'tumblestart)
		{
			state = states.bump
			sprite_index = spr_player_tumbleend'
			hsp = -xscale * 2
			vsp = -3
			jumpstop = true
		}
		else
		{*/
			state = states.bump
			reset_anim(spr_player_wallsplat)
		//}
	}
	if (grounded && vsp > 0)
		jumpstop = false
	if (key_jump.pressed && state != states.bump && hsp != 0 && sprite_index == spr_player_ball)
		vsp = -11
	if (crouchslipbuffer > 0)
		crouchslipbuffer--
	//if (!key_down.down && key_dash.down && grounded && state != 1000 && (sprite_index != spr_player_ball && sprite_index != 'tumbleend) && !canuncrouch.isTouching(solids))
	if (!key_down.down && key_dash.down && grounded && !scr_solid(x, y - 16) && crouchslipbuffer <= 0)
	{
		if (movespeed >= 12)
			state = states.mach3
		else
			state = states.mach2
		reset_anim(spr_player_rollgetup)
	}
	//if (!keyDown('down.pressed && !keyDown('shift.pressed && grounded && vsp > 0 && state != 'bump' && (sprite_index != spr_player_ball && sprite_index != 'tumbleend.pressed && sprite_index != 'breakdance' && !canuncrouch.isTouching(solids))
	if (!key_down.down && !key_dash.down && grounded && vsp > 0 && state != states.bump && !scr_solid(x, y - 16) && crouchslipbuffer <= 0)
	{
		if (movespeed > 6)
		{
			state = states.slide
			reset_anim(spr_player_machslidestart)
		}
		else
			state = states.normal
	}
	if (sprite_index == spr_player_dive && vsp < 10)
		vsp = 10
	if (sprite_index == spr_player_machroll)
		image_speed = movespeed / 20
	if (sprite_index == spr_player_backslide)
	{
		image_speed = movespeed / 20
		if (anim_ended())
			image_index = 2
	}
	aftimg_timers.blur.do_it = true
}

function player_climbwall() 
{
	
	vsp = -wallspeed
	hsp = 0
	
	if (wallspeed < 20000)
		wallspeed += 0.15
	if (wallspeed < 0)
	{
		if (mach4mode == 0)
			movespeed += 0.2
		else
			movespeed += 0.4
	}
	sprite_index = wallspeed > 4 ? spr_player_climbwall : spr_player_clingwall
	image_speed = 0.5
	if (!place_meeting(x + xscale, y, obj_solid))
	{
		vsp = 0
		if (wallspeed < 6)
			wallspeed = 6
		if (wallspeed >= 6 && wallspeed < 12)
		{
			state = states.mach2
			movespeed = wallspeed
		}
		else if (wallspeed >= 12)
		{
			flash = 8
			state = states.mach3
			sprite_index = spr_player_mach3
			movespeed = wallspeed
		}
		x += xscale
	}
	else if scr_solid(x, y - 1)
	{
		state = states.bump
		reset_anim(spr_player_ceilinghit)
	}
	grabclimbbuffer = approach(grabclimbbuffer, 0, 1)
	if (!key_dash.down && grabclimbbuffer <= 0)
	{
		state = states.jump
		sprite_index = spr_player_fall
		movespeed = -5
		jumpstop = false
	}
	if (key_jump.pressed)
	{
		reset_anim(spr_player_walljump)
		movespeed = 10
		state = states.mach2
		vsp = -11
		xscale *= -1
		jumpstop = false
		scr_sound(sfx_jump)
	}
}

function player_slide() 
{
	hsp = movespeed * xscale
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_player_machslideboost:
		case spr_player_machslideboost3:
			var ismach2 = sprite_index == spr_player_machslideboost
			
			if (movespeed > 0)
				movespeed -= 0.4
			else
				movespeed = 0
			if anim_ended()
			{
				if grounded
				{
					sprite_index = ismach2 ? spr_player_mach2 : spr_player_mach3
					state = ismach2 ? states.mach2 : states.mach3
					movespeed = ismach2 ? 8 : 12
					xscale *= -1
				}
				else
					sprite_index = ismach2 ? spr_player_machslideboostfall : spr_player_machslideboost3fall
			}
			break
		case spr_player_machslideboostfall:
		case spr_player_machslideboost3fall:
			var ismach2 = sprite_index == spr_player_machslideboostfall
			
			if (movespeed > 0)
				movespeed -= 0.4
			else
				movespeed = 0
			
			if (grounded)
			{
				sprite_index = ismach2 ? spr_player_mach2 : spr_player_mach3
				state = ismach2 ? states.mach2 : states.mach3
				movespeed = ismach2 ? 8 : 12
				xscale *= -1
			}
			break
		case spr_player_machslidestart:
			if (anim_ended())
				image_index--
			if (place_meeting(x + xscale, y, obj_solid))
			{
				reset_anim(spr_player_wallsplat)
				state = states.bump
			}
			if (movespeed > 0)
				movespeed -= 0.3
			else
			{
				reset_anim(spr_player_machslideend)
				state = states.normal
			}
			break
	}
	if (sprite_index == spr_player_machslideboost3)
		instakill = true
}

function player_bump() 
{
	image_speed = 0.35
	if (sprite_index != spr_player_mach3hitwall && sprite_index != spr_player_bump)
	{
		hsp = 0
		vsp = 0
	}
	movespeed = 0
	if (grounded)
		hsp = 0
	if anim_ended()
	{
		state = states.normal
		if (sprite_index == spr_player_bodyslamland)
			reset_anim(spr_player_facehurt)
		else if (sprite_index == spr_player_ceilinghit)
		{
			reset_anim(spr_player_superjumpfall)
			state = states.jump
		}
		else
			sprite_index = spr_player_idle
	}
}

function player_groundpound()
{
	if (vsp >= 2)
	{
		/*if (vsp > 17)
		{
			if punch_afterimage > 0
				punch_afterimage--
			else
			{
				punch_afterimage = 5
				with (create_mach3effect(x, y, sprite_index, image_index, true))
				{
					image_xscale = other.xscale
					playerid = other.id
					maxmovespeed = 6
					vertical = true
					fadeoutstate = states.freefall
				}
			}
			if (superjumpeffect > 0)
				superjumpeffect--
			else
			{
				createEffect('freefalleffect')
				superjumpeffect = 15
			}
		}
		  */
		if (vsp > 17)
			aftimg_timers.mach.do_it = true
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
	if (grounded && vsp > 0)
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
				/*with (instance_create(other.x, other.y, obj_jumpdust))
					image_xscale = -sign(other.image_xscale)*/
			}
		}
		else
		{
			if sprite_index == spr_player_poundcancel1
				sprite_index = spr_player_poundcancel2
			else
				sprite_index = spr_player_bodyslamland
			/*else if shotgunAnim == 0
				sprite_index = spr_bodyslamland
			else
				sprite_index = spr_shotgunjump2*/
			image_index = 0
			state = states.bump
			shake_camera()
			scr_sound(sfx_groundpound)
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

function player_grab() {
	
	hsp = xscale * movespeed
	if (movespeed < 10)
	{
		movespeed += 0.5
	}
	
	if (!key_jump.down && !jumpstop && vsp < 0.5)
	{
		vsp /= 20
		jumpstop = true
	}
	
	if (key_jump.pressed && !key_down.down && coyote_time)
	{
		jumpstop = false
		vsp = -11
		state = states.mach2
		reset_anim(spr_player_longjump)
	}
	
	if (key_down.down && !key_jump.down && grounded)
	{
		movespeed = 12
		crouchslipbuffer = 25
		state = states.tumble
		sprite_index = spr_player_crouchslip
	}
	
	if (sprite_index == spr_player_suplexgrab && !grounded)
		reset_anim(spr_player_suplexgrabjump)
	if (grounded && sprite_index == spr_player_suplexgrabjump && image_index >= 4 && key_dash.down)
	{
		state = states.mach2
		sprite_index = spr_player_mach2
	}
	
	if (place_meeting(x + xscale, y, obj_solid) && !grounded)
	{
		wallspeed = 6
		grabclimbbuffer = 10
		state = states.climbwall
	}
	else if (place_meeting(x + xscale, y, obj_solid) && grounded)
	{
		sprite_index = spr_player_grabbump
		state = states.jump
		jumpstop = true
		hsp = 0
		movespeed = 0
		vsp = -5
	}
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_player_suplexgrab:
			if anim_ended()
			{
				reset_anim(spr_player_land)
				state = states.normal
			}
			break;
		case spr_player_suplexgrabjump:
			if anim_ended()
				image_index = 4
			if (grounded && !key_dash.down && image_index >= 4)
				state = states.normal
			break;
	}
	
	if (anim_ended() && key_dash.down && sprite_index == spr_player_suplexgrab)
	{
		state = states.mach2
		sprite_index = spr_player_mach2
	}
	
	if (p_move != 0 && p_move != xscale)
	{
		if !grounded
		{
			reset_anim(spr_player_grabcancel)
			state = states.jump
		}
		else
			state = states.normal
		movespeed = 0
	}
	aftimg_timers.blur.do_it = true
}



function player_superjump() 
{
	hsp = xscale * movespeed
	image_speed = 0.35
	
	if (sprite_index == spr_player_superjumpprep || sprite_index == spr_player_superjumpflash)
		movespeed = approach(movespeed, 0, 1)
		
	if (sprite_index == spr_player_superjumpprep)
		reset_anim_on_end(spr_player_superjumpflash)
		
	if (sprite_index == spr_player_Sjumpcancelstart)
	{
		image_speed = 0.5
		vsp = 0
		if (p_move != 0)
		  xscale = p_move
	}
	if ((key_up.down || !grounded) && (sprite_index == spr_player_superjumpflash || sprite_index == spr_player_superjumpmove))
	{
		if (!place_meeting(x + xscale, y, obj_solid))
			movespeed = 2 * abs(p_move)
		else
			movespeed = 0
		if (abs(p_move))
		{
			xscale = p_move
			sprite_index = spr_player_superjumpmove
		}
		else
			sprite_index = spr_player_superjumpflash
	}
	if (anim_ended() && sprite_index == spr_player_Sjumpcancelstart)
	{
		state = states.mach3
		sprite_index = spr_player_Sjumpcancel
		jumpstop = true
		vsp = -4
		flash = 8
		movespeed = 12
		image_speed = 0.35
	}
	if (sprite_index != spr_player_superjump && sprite_index != spr_player_Sjumpcancel && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_player_superjumpprep && !key_up.down && grounded)
	{
		vsp = -11
		sprite_index = spr_player_superjump
	}
	if (sprite_index == spr_player_superjump)
	{
		instakill = true
		image_speed = abs(vsp) / 25
		/*if (superjumpeffecttimer > 0)
			superjumpeffecttimer--
		else
		{
			superjumpeffecttimer = 20
			createEffect('superjumpeffect', depth + 1)
			createEffect('genericdust')
		}*/
		movespeed = 0
		
		if (place_meeting(x, y - 1, obj_solid))
		{
			reset_anim(spr_player_ceilinghit)
			state = states.bump
			scr_sound(sfx_groundpound)
		}
		
		if (sprite_index != spr_player_Sjumpcancelstart)
			vsp -= 0.6
		
		if (key_attack.pressed && state != states.bump)
			reset_anim(spr_player_Sjumpcancelstart)
		
		aftimg_timers.blur.do_it = true
	}
}

function player_taunt()
{
	hsp = 0
	vsp = 0
	if (taunttimer <= 0)
	{
		state = prev.state
		hsp = prev.hsp
		vsp = prev.vsp
		sprite_index = prev.sprite_index
	}
}

function player_crouch()
{
	if p_move != 0
		xscale = p_move
	hsp = p_move * 4
	image_speed = 0.4
	
	if (!(grounded && vsp >= 0))
	{
		if sprite_index != spr_player_crouchfall
			reset_anim(spr_player_crouchfall)
		
		if anim_ended()
			image_index = 5
	}
	else
	{
		if sprite_index == spr_player_crouchfall
			reset_anim(spr_player_crouchdown)
			
		if sprite_index == spr_player_crouchdown
			reset_anim_on_end(spr_player_crouch)
		
		if (sprite_index != spr_player_crouchdown)
			sprite_index = p_move != 0 ? spr_player_crawl : spr_player_crouch
	
		if (coyote_time && key_jump.pressed && !scr_solid(x, y - 16))
		{
			vsp = -12
			scr_sound(sfx_jump)
		}
	}
	
	if !key_down.down && !scr_solid(x, y - 16) && grounded && vsp >= 0
		state = states.normal
}

function player_actor()
{
	switch (sprite_index)
	{
		case spr_player_exitdoor:
		case spr_player_timesup:
			if anim_ended()
				state = states.normal
			break;
		case spr_player_upbox:
			vsp = 0
			break;
	}
}

function player_ladder()
{
	var move_v = (-key_up.down + key_down.down)
	
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
	
	if (key_jump.pressed)
	{
		vsp = -12
		state = states.jump
		reset_anim(spr_player_jump)
		jumpstop = false
		ladderbuffer = 20
	}
}

function player_punch()
{
	hsp = approach(hsp, p_move * 4, 0.4)
	
	if image_index < 2
		image_speed = 0.35
	
	if anim_ended()
		image_speed = 0
	
	if grounded
	{
		state = states.normal
		movespeed = abs(hsp)
		if p_move != 0
			xscale = p_move
	}
	
	if (vsp < 0)
	{
		aftimg_timers.mach.do_it = true
		instakill = true
	}
}

function player_hold()
{
	if (p_move != 0)
	{
		movespeed = approach(movespeed, 6, 0.5)
		xscale = p_move
	}
	else
		movespeed = 0
		
	hsp = movespeed * xscale
	
	if grounded
	{
		if (sprite_index == spr_player_holdjump || sprite_index == spr_player_holdfall)
			reset_anim(spr_player_holdland)
		if (sprite_index != spr_player_holdland && sprite_index != spr_player_holdrise)
			sprite_index = p_move != 0 ? spr_player_holdmove : spr_player_holdidle
	}
	else
	{
		if (sprite_index != spr_player_holdjump && sprite_index != spr_player_holdfall)
			reset_anim(spr_player_holdjump)
		if (!jumpstop && !key_jump.down && vsp < 0)
		{
			jumpstop = true
			vsp /= 10
		}
	}
	
	if (coyote_time && key_jump.pressed)
	{
		vsp = -12
		jumpstop = false
		scr_sound(sfx_jump)
	}
		
	if p_move != 0
		xscale = p_move
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_player_holdland:
		case spr_player_holdrise:
			reset_anim_on_end(spr_player_holdidle)
			break;
		case spr_player_holdjump:
			reset_anim_on_end(spr_player_holdfall)
			break;
	}
	
	if (key_attack.pressed)
	{
		state = states.punchenemy
		var str = string_concat("spr_player_finishingblow_", string(irandom_range(1, 5)))
		reset_anim(asset_get_index(str))
		if (key_up.down)
			reset_anim(spr_player_finishingblowup)
	}
}


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

function player_punchenemy()
{
	image_speed = 0.4
	hsp = approach(hsp, 0, 0.4)
	movespeed = 0
	
	var ixcheck = 7
	
	if sprite_index == spr_player_finishingblowup
		ixcheck = 5
	if sprite_index == spr_player_swingdingend
		ixcheck = 1
	
	if (floor(image_index) == ixcheck)
	{
		hsp = xscale * -5
		vsp = -6
	}
	
	if anim_ended()
		state = states.normal
		
	aftimg_timers.mach.do_it = true
}

function player_piledriver()
{
	if (vsp > 0)
		vsp += 0.5
		
	if (p_move != 0)
		movespeed = approach(movespeed, 4, 0.2)
	if (p_move == 0 || sprite_index == spr_player_piledriverland)
		movespeed = 0
		
	dir = p_move
	
	hsp = movespeed * dir
	if (grounded && sprite_index != spr_player_piledriverland && vsp >= 0)
	{
		reset_anim(spr_player_piledriverland)
		shake_camera()
		scr_sound(sfx_groundpound)
	}
	
	instakill = true
}

function player_grind()
{
	if ((hsp < 10 && xscale == 1) || (hsp > -10 && xscale == -1))
		hsp = approach(hsp, xscale * 10, 0.4)
	sprite_index = spr_player_grind
	image_speed = 0.35
	
	if (key_jump.pressed && (place_meeting(x, y + 1, obj_grindrail) || place_meeting(x, y + 1, obj_grindrailslope)))
	{
		vsp = -12
		jumpstop = false
		state = states.mach2
		sprite_index = spr_player_mach2jump
		movespeed = abs(hsp)
		scr_sound(sfx_jump)
	}
	
	if (!place_meeting(x, y + 4, obj_grindrail) && !place_meeting(x, y + 4, obj_grindrailslope))
	{
		state = states.mach2
		sprite_index = spr_player_mach2jump
		movespeed = abs(hsp)
	}
}

#endregion
