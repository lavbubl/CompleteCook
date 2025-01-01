enum states 
{
	normal,
	jump,
	mach2,
	mach3,
	tumble,
	climbwall,
	slide,
	bump
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
		sprite_index = spr_player_move
	else if (sprite_index != spr_player_machslideend)
		sprite_index = spr_player_idle
	
	if !grounded
	{
		state = states.jump
		sprite_index = spr_player_fall
		image_index = 0
	}
	
	if (coyote_time && key_jump.pressed)
	{
		vsp = -12
		state = states.jump
		sprite_index = spr_player_jump
		image_index = 0
		jumpstop = false
	}
	
	if (key_dash.down && !place_meeting(x + xscale, y, obj_solid))
	{
		state = states.mach2
		if (movespeed < 6)
			movespeed = 6
		sprite_index = spr_player_mach1
		image_index = 0
	}
	
	switch (sprite_index)
	{
		case spr_player_move:
			image_speed = movespeed / 15
			break
		case spr_player_idle:
			image_speed = 0.35
			break
		case spr_player_machslideend:
			if anim_ended()
				sprite_index = spr_player_idle
			break
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
		movespeed = 0
	
	hsp = movespeed * xscale
	
	if (!jumpstop && !key_jump.down && vsp < 0)
	{
		jumpstop = true
		vsp /= 10
	}
	
	if (grounded)
	{
		state = states.normal
		sprite_index = movespeed > 1 ? spr_player_land : spr_player_landmove
	}
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_player_jump:
			if anim_ended()
				sprite_index = spr_player_fall
			break;
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
	
	if (grounded)
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
				sprite_index = spr_player_machslidestart
				image_index = 0
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
				sprite_index = spr_player_machslideboost
				image_index = 0
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
		if (sprite_index != spr_player_secondjump && sprite_index != spr_player_secondjumploop && sprite_index != spr_player_walljump && sprite_index != spr_player_walljumpfall)
		{
			sprite_index = spr_player_secondjump
			image_index = 0
		}
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
		{
			sprite_index = spr_player_machroll
			image_index = 0
		}
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
		sprite_index = spr_player_wallsplat
		image_index = 0
	}
	/*if ((key_x.down || keyfastfall) && !key_up.down && sprite_index != 'dashpadmach.down
	{
		createEffect('jumpdust', depth - 10, xscale)
		sprite_index = 'suplexdash'
		state = 'grab'
		if (movespeed < 5)
			movespeed = 5
		animbuffer = 33
	}
	if (key_x.down && key_up.down && sprite_index != 'dashpadmach.down
	{
		sprite_index = 'uppercut'
		state = 'punch'
		animbuffer = 48
		movespeed = hsp
		vsp = -10
	}*/
	image_speed = movespeed / 20
	switch (sprite_index)
	{
		case spr_player_mach1:
			image_speed = 0.5
			if anim_ended()
				sprite_index = spr_player_mach2
			break
		case spr_player_secondjump:
			image_speed = 0.4
			if anim_ended()
				sprite_index = spr_player_secondjumploop
			break
		case spr_player_walljump:
			image_speed = 0.4
			if anim_ended()
			{
				sprite_index = spr_player_walljumpfall
				image_index = 0
			}
			break
		case spr_player_rollgetup:
			image_speed = 0.4
			if anim_ended()
				sprite_index = spr_player_mach2
			break
		/*case spr_player_secondjump:
			sprite_index = spr_player_secondjumploop
			break
		case 'longjump':
			sprite_index = 'longjumpend'
			break
		case 'walljump':
			sprite_index = 'walljumpfall'
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
		sprite_index = spr_player_mach3jump
		image_index = 0
	}
	if (grounded)
	{
		/*if (sprite_index == 'sjumpcancelloop.down
		{
			sprite_index = spr_player_mach3
		}*/
		if (!key_dash.down)
		{
			{
				sprite_index = spr_player_machslidestart
				image_index = 0
				state = states.slide
			}
		}
		if (move != 0 && move != xscale)
		{
			sprite_index = spr_player_machslideboost3
			image_index = 0
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
			sprite_index = 'superjumpprep'
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
		{
			sprite_index = spr_player_machroll
			image_index = 0
		}
		else
		{
			sprite_index = spr_player_dive
			vsp = 10
		}
	}
	/*if ((key_x.down || keyfastfall) && !key_up.down && sprite_index != 'dashpadmach.down
	{
		createEffect('jumpdust', depth - 10, xscale)
		sprite_index = 'suplexdash'
		state = 'grab'
		if (movespeed < 5)
			movespeed = 5
		animbuffer = 33
	}
	if (key_x.down && key_up.down && sprite_index != 'dashpadmach.down
	{
		sprite_index = 'uppercut'
		state = 'punch'
		animbuffer = 48
		movespeed = hsp
		vsp = -10
	}*/
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
		sprite_index = spr_player_mach3hitwall
		image_index = 0
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
			break;
		case spr_player_mach3jump:
		case spr_player_rollgetup:
			image_speed = 0.4
			if anim_ended()
				sprite_index = spr_player_mach3
			break;
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
	{
		sprite_index = spr_player_machroll
		image_index = 0
	}
	/*if (sprite_index == spr_player_dive && key_z.pressed)
	{
		sprite_index = 'poundcancel1'
		state = 'groundpound'
		vsp = -6
		dir = xscale
	}*/
	if movespeed <= 2
		state = states.normal
	if (sprite_index == spr_player_mach2jump && grounded)
		sprite_index = spr_player_machroll
	/*if (sprite_index == spr_player_crouchslip && !grounded)
		sprite_index = 'jumpdive2'
	if (sprite_index == 'jumpdive2' && grounded)
		sprite_index = spr_player_crouchslip*/
	if (anim_ended() && sprite_index == spr_player_machroll && movespeed > 12)
	{
		sprite_index = spr_player_backslide
		image_index = 0
	}
	if (sprite_index == spr_player_machroll && !grounded)
		sprite_index = spr_player_mach2jump
	//if (state != 'groundpound' && plusone.isTouching(solids))
	if place_meeting(x + xscale, y, obj_solid)
	{
		hsp = 0
		movespeed = 0
		/*if (sprite_index == spr_player_ball || sprite_index == 'tumblestart)
		{
			state = states.bump
			sprite_index = 'tumbleend'
			hsp = -xscale * 2
			vsp = -3
			jumpstop = true
		}
		else
		{*/
			state = states.bump
			sprite_index = spr_player_wallsplat
			image_index = 0
		//}
	}
	if (grounded && vsp > 0)
		jumpstop = false
	if (key_jump.pressed && state != states.bump && hsp != 0 && sprite_index == spr_player_ball)
		vsp = -11
	/*if (crouchslipbuffer > 0)
		crouchslipbuffer--*/
	//if (!key_down.down && key_dash.down && grounded && state != 1000 && (sprite_index != spr_player_ball && sprite_index != 'tumbleend) && !canuncrouch.isTouching(solids))
	if (!key_down.down && key_dash.down && grounded && !scr_solid(x, y - 1))
	{
		//if (crouchslipbuffer == 0)
		//{
			if (movespeed >= 12)
				state = states.mach3
			else
				state = states.mach2
			sprite_index = spr_player_rollgetup
			image_index = 0
		//}
	}
	//if (!keyDown('down.pressed && !keyDown('shift.pressed && grounded && vsp > 0 && state != 'bump' && (sprite_index != spr_player_ball && sprite_index != 'tumbleend.pressed && sprite_index != 'breakdance' && !canuncrouch.isTouching(solids))
	if (!key_down.down && !key_dash.down && grounded && vsp > 0 && state != states.bump && !scr_solid(x, y - 1))
	{
		//if (crouchslipbuffer == 0)
		///{
			if (movespeed > 6)
			{
				state = states.slide
				sprite_index = spr_player_machslidestart
				image_index = 0
			}
			else
				state = states.normal
		//}
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
	if (!key_dash.down)
	{
		state = states.normal
		movespeed = -5
	}
	if (key_jump.pressed)
	{
		sprite_index = spr_player_walljump
		image_index = 0
		movespeed = 10
		state = states.mach2
		vsp = -11
		xscale *= -1
		jumpstop = false
	}
	if scr_solid(x, y - 1)
	{
		state = states.bump
		sprite_index = spr_player_ceilinghit
		image_index = 0
	}
}

function player_slide() 
{
	hsp = movespeed * xscale;
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
			break;
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
			break;
		case spr_player_machslidestart:
			if (anim_ended())
				image_index--
			if (place_meeting(x + xscale, y, obj_solid))
			{
				sprite_index = spr_player_wallsplat
				image_index = 0
				state = states.bump
			}
			if (movespeed > 0)
				movespeed -= 0.3;
			else
			{
				sprite_index = spr_player_machslideend
				image_index = 0
				state = states.normal
			}
			break;
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
		sprite_index = spr_player_idle
	}
}