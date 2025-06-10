function boss_normal()
{
	if grounded
		hsp = approach(hsp, 0, 0.3)
}

function boss_stun()
{
	if grounded
	{
		if vulnerable
			hsp = approach(hsp, 0, 0.25)
		else
		{
			bounces--
			if bounces >= 0
			{
				vsp = -5
				sprite_index = sprs.dead
			}
		}
	}
	image_speed = 0.35
	if ((stun_timer <= 0 || (bounces < 0 && !vulnerable)) && grounded)
	{
		sprite_index = sprs.move
		state = states.normal
		vulnerable = false
	}
	else
		stun_timer--
}

function boss_hit()
{
	if (scr_solid(x + 1, y) || scr_solid(x - 1, y) || (grounded && vsp > 0))
	{
		particle_create(x, y, particles.bang)
		repeat (3)
			particle_create(x, y, particles.yellowstar)
		shake_camera()
		scr_sound_3d(sfx_killenemy, x, y)
		grav = 0.5
		xscale *= -1
		with obj_bosscontroller.opponent
		{
			with instance_create(hphudpos.x, hphudpos.y, obj_hudhpdebris)
			{
				sprite_index = other.hpspr
				image_index = other.hpix
				dir = -1
			}
			hp--
		}
		event_perform(ev_alarm, 0)
	}
}

function do_vulnerability()
{
	if place_meeting(x, y, obj_player) && vulnerable
	{
		if obj_player.instakill || obj_player.state == states.grab
		{
			with (obj_player)
			{
				if (state == states.mach3)
					reset_anim(spr_player_mach3hit)
				if (input.jump.check && state != states.groundpound)
				{
					vsp = -10
					jumpstop = false
				}
			}
		
			sprite_index = sprs.stun
	
			do_enemygibs()
			create_effect(x, y, spr_bosshiteffect)
			scr_sound_3d(sfx_punch, x, y)
		
			obj_player.hitstun = 5
			obj_player.prev_ix = obj_player.image_index
			vulnerable = false
			state = states.hit
			bounces = 3
		
			var spd = 18
		
			hsp = x >= obj_player.x ? spd : -spd
			xscale = x >= obj_player.x ? -1 : 1
			if obj_player.state == states.grab
			{
				with obj_player
				{
					hitstun = 5
					reset_anim(choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3, spr_player_lungehit))
					image_speed = 0.35
					prev_ix = image_index
					state = states.punchstun
					xscale = -other.xscale
					movespeed = -10
					other.x = x
					other.y = y
				}
				scr_sound_3d(sfx_killingblow, x, y)
				hitstun = 5
				vsp = 0
				grav = 0
			}
			else
			{
				obj_player.hitstun = 15
				hitstun = 15
				vsp = -5
				grav = 0.5
			}
		}
		if (obj_player.state == states.mach2 || obj_player.state == states.tumble) && stun_timer < 90
		{
			sleep(50)
			sprite_index = sprs.stun
			hsp = obj_player.xscale * 18
			xscale = -obj_player.xscale
			warp = 0.4
			state = states.stun
			stun_timer = 120
			vsp = -5
			repeat (4)
				particle_create(x, y, particles.stars)
			flash = 8
		}
	}
}
