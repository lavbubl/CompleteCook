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
	grab
}

function player_normal()
{
	move = -key_left.down + key_right.down
	
	if (move != 0)
	{
		movespeed = approach(movespeed, 6, 0.5)
		xscale = move
	}
	else
		movespeed = 0
	
	hsp = movespeed * xscale
	
	if move != 0
	{
		if (sprite_index != spr_player_landmove)
			sprite_index = spr_player_move
	}
	else
	{
		if (sprite_index != spr_player_machslideend && sprite_index != spr_player_land && sprite_index != spr_player_bodyslamland && sprite_index != spr_player_facehurt)
			sprite_index = spr_player_idle
	}
	
	if !grounded
	{
		state = states.jump
		reset_anim(spr_player_fall)
	}
	
	if (coyote_time && key_jump.pressed)
	{
		vsp = -12
		state = states.jump
		reset_anim(spr_player_jump)
		jumpstop = false
	}
	
	if (key_dash.down && !place_meeting(x + xscale, y, obj_solid))
	{
		state = states.mach2
		if (movespeed < 6)
			movespeed = 6
		reset_anim(spr_player_mach1)
	}
	
	do_grab()
	
	image_speed = 0.35
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
}

function player_jump()
{
	move = -key_left.down + key_right.down
	
	if (move != 0)
	{
		movespeed = approach(movespeed, 6, 0.5)
		xscale = move
	}
	else if (move == 0 || xscale != move)
		movespeed = approach(movespeed, 0, 0.5)
	
	hsp = movespeed * xscale
	
	if (!jumpstop && !key_jump.down && vsp < 0)
	{
		jumpstop = true
		vsp /= 10
	}
	
	do_grab()
	do_groundpound()
	
	if (grounded)
	{
		state = states.normal
		reset_anim(movespeed < 1 ? spr_player_land : spr_player_landmove)
	}
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_player_jump:
		case spr_player_grabcancel:
			reset_anim_on_end(spr_player_fall)
			break
	}
}

function player_mach2() {
	move = -key_left.down + key_right.down
	hsp = xscale * movespeed
	
	if (key_jump.pressed && coyote_time) 
	{
		jumpstop = false
		vsp = -11
	}
	
	if (grounded && vsp >= 0)
	{
		//if (sprite_index != spr_player_mach1 && sprite_index != 'rollgetup.down
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
		if (move != 0 && move != xscale)
		{
			if (movespeed < 8)
			{
				xscale = move
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
			sprite_index = spr_player_mach3
			state = states.mach3
			flash = 8
		}
	}
	else
	{
		if (sprite_index != spr_player_secondjump && sprite_index != spr_player_secondjumploop && sprite_index != spr_player_walljump && sprite_index != spr_player_walljumpfall && sprite_index != spr_player_longjump)
			reset_anim(spr_player_secondjump)
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
			image_speed = 0.4
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
	//dotaunt()
}

function player_mach3() {
	move = -key_left.down + key_right.down
	hsp = xscale * movespeed
	mach4mode = movespeed > 18
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
	}
	if (grounded)
	{
		/*if (sprite_index == 'sjumpcancelloop.down
		{
			sprite_index = spr_player_mach3
		}*/
		if (!key_dash.down)
		{
			reset_anim(spr_player_machslidestart)
			state = states.slide
		}
		if (move != 0 && move != xscale)
		{
			reset_anim(spr_player_machslideboost3)
			state = states.slide
		}
		if (movespeed < 20 && move == xscale)
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
		if (move != xscale && movespeed > 13)
			movespeed -= 0.1
		/*
		if (key_up.down)
		{
			animbuffer = 20
			state = 'superjump'
			sprite_index = spr_player_superjumpprep'
			playSound('sfx_superjumpprep.wav.down
			setTimeout(function()
			{
				playSound('sfx_superjumphold.wav', true)
				sjumpplayvar = true
			}, 450)
		}
		*/
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
	}
	/*if (round(image_index) == image_number)
	{
		switch (sprite_index)
		{
			case 'mach3jump':
			case 'rollgetup':
				sprite_index = spr_player_mach3
				break
		}
	}
	dotaunt()*/
	switch (sprite_index)
	{
		case spr_player_mach3:
		case spr_player_mach4:
			image_speed = movespeed / 40
			break
		case spr_player_mach3jump:
		case spr_player_rollgetup:
			image_speed = 0.4
			if anim_ended()
				sprite_index = spr_player_mach3
			break
	}
}

function player_tumble() {
	hsp = xscale * movespeed
	move = -key_left.down + key_right.down
	if (!grounded && (sprite_index == spr_player_crouchslip || sprite_index == spr_player_machroll || sprite_index == spr_player_mach2jump || sprite_index == spr_player_backslide))
	{
		vsp = 10
		sprite_index = spr_player_dive
	}
	if (sprite_index == spr_player_ball && grounded)
	{
		if (move == xscale)
			movespeed = approach(movespeed, 12, 0.25)
		else if (move == -xscale)
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
	if (!key_down.down && key_dash.down && grounded && !scr_solid(x, y - 1) && crouchslipbuffer <= 0)
	{
		if (movespeed >= 12)
			state = states.mach3
		else
			state = states.mach2
		reset_anim(spr_player_rollgetup)
	}
	//if (!keyDown('down.pressed && !keyDown('shift.pressed && grounded && vsp > 0 && state != 'bump' && (sprite_index != spr_player_ball && sprite_index != 'tumbleend.pressed && sprite_index != 'breakdance' && !canuncrouch.isTouching(solids))
	if (!key_down.down && !key_dash.down && grounded && vsp > 0 && state != states.bump && !scr_solid(x, y - 1) && crouchslipbuffer <= 0)
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
}

function player_climbwall() 
{
	move = -key_left.down + key_right.down
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
	sprite_index = spr_player_climbwall
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
	}
	grabclimbbuffer = approach(grabclimbbuffer, 0, 1)
	if (!key_dash.down && grabclimbbuffer <= 0)
	{
		state = states.jump
		sprite_index = spr_player_fall
		movespeed = -5
	}
	if (key_jump.pressed)
	{
		reset_anim(spr_player_walljump)
		movespeed = 10
		state = states.mach2
		vsp = -11
		xscale *= -1
		jumpstop = false
	}
	if scr_solid(x, y - 1)
	{
		state = states.bump
		reset_anim(spr_player_ceilinghit)
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
		vsp += 0.5
	}
	if (anim_ended() && sprite_index == spr_player_bodyslamstart)
		sprite_index = spr_player_bodyslamfall
	/*
	if (floor(image_index) == image_number - 1 && sprite_index == spr_shotgunjump1)
		sprite_index = spr_shotgunjump3*/
	move = -key_left.down + key_right.down
	if (!grounded)
	{
		//if (sprite_index != 'rockethitwall')
			hsp = move * movespeed
		/*else
			hsp = 0*/
		if (move != xscale && !place_meeting(x + xscale, y, obj_solid) && movespeed != 0)
			movespeed -= 0.05
		//if (movespeed == 0)
		//	momemtum = false
		if (move != dir && move != 0)
		{
			dir = move
			movespeed = 0
		}
		if (move == 0)
			movespeed = 0
		//if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
		if (move != 0 && movespeed < 7)
			movespeed += 0.25
		if (movespeed > 7)
			movespeed -= 0.05
		if (place_meeting(x + move, y, obj_solid))
		{
			hsp = 0
			movespeed = 0
		}
		if (move != 0 && sprite_index != spr_player_poundcancel1)
			xscale = move
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
			with (instance_place(x, y + 1, obj_slope))
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
			if freefallsmash >= 10
			{
				/*with obj_baddie
				{
					if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && !invincible && groundpound)
					{
						state = states.stun
						if stunned < 60
							stunned = 60
						vsp = -11
						image_xscale *= -1
						hsp = 0
						momentum = 0
					}
				}
				with obj_camera
				{
					shake_mag = 10
					shake_mag_acc = 30 / room_speed
				}
				combo = 0
				bounce = false*/
				shake_camera(10, 0.5)
			}
		}
	}
	image_speed = 0.35
}

function player_grab() {
	move = -key_left.down + key_right.down
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
	if (key_jump.pressed && !key_down.down && grounded)
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
	if (grounded && sprite_index == spr_player_suplexgrabjump && key_dash.down)
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
				state = states.normal
			break;
		case spr_player_suplexgrabjump:
			if anim_ended()
				image_index = 5
			if (grounded && !key_dash.down)
				state = states.normal
			break;
	}
	if (anim_ended() && key_dash.down && sprite_index == spr_player_suplexgrab)
	{
		state = states.mach2
		sprite_index = spr_player_mach2
	}
	if (move != 0 && move != xscale)
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
}