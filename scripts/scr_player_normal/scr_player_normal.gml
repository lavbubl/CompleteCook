function state_player_normal()
{
	mach2 = 0
	move = (key_left + key_right)
	skateboarding = 0
	momemtum = 0
	jumpstop = 0
	if (dir != xscale)
	{
		dir = xscale
		movespeed = 2
		facehurt = 0
	}
	if key_taunt2
	{
		input_finisher_buffer = 60
		input_attack_buffer = 0
		input_up_buffer = 0
		input_down_buffer = 0
	}
	if (key_taunt)
	{
		if (breakdance_buffer > 0)
			breakdance_buffer--
	}
	else
		breakdance_buffer = 15
	if (breakdance_buffer == 0)
		breakdance_speed = Approach(breakdance_speed, 0.6, 0.005)
	else
		breakdance_speed = 0.25
	if (breakdance_speed >= 0.5)
	{
		if (!instance_exists(obj_beatbox))
		{
			instance_create(x, y, obj_genericpoofeffect)
			with (instance_create(x, y, obj_beatbox))
				vsp = -11
		}
		notecreate--
	}
	if (notecreate <= 0)
	{
		instance_create((x + random_range(-70, 70)), (y + random_range(-70, 70)), obj_notes)
		notecreate = 10
	}
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = _railinst.movespeed
		raildir = _railinst.dir
		railmomentum = 1
	}
	hsp = ((move * movespeed) + (railmovespeed * raildir))
	if (move != 0)
	{
		xscale = move
		if (movespeed < 8)
			movespeed += 0.5
		else if (floor(movespeed) == 8)
			movespeed = 6
		if (movespeed < 3 && move != 0)
			image_speed = 0.35
		else if (movespeed > 3 && movespeed < 6)
			image_speed = 0.45
		else
			image_speed = 0.6
		if ((!machslideAnim) && (!landAnim) && (!shotgunAnim))
		{
			machslideAnim = 0
			idle = 0
			facehurt = 0
			if shoot
				sprite_index = spr_pistolwalk
			else if mort
				sprite_index = spr_player_mortwalk
			else if (key_taunt && breakdance_buffer == 0)
				sprite_index = spr_player_breakdance
			else if (global.minutes == 0 && global.seconds == 0)
				sprite_index = spr_hurtwalk
			else if (global.stylethreshold == 2)
				sprite_index = spr_3hpwalk
			else if (global.stylethreshold >= 3)
				sprite_index = spr_ragemove
			else
				sprite_index = spr_move
		}
		if (scr_solid((x + sign(hsp)), y) && (!(scr_solid_slope((x + sign(hsp)), y))) && xscale == move && (!(place_meeting(x, (y + 1), obj_slope))))
			movespeed = 0
		if (grounded && vsp > 0)
		{
			if (steppybuffer > 0)
				steppybuffer--
			else if (sprite_index != spr_player_breakdance)
			{
				instance_create(x, (y + 48), obj_cloudeffect)
				steppybuffer = 12
				scr_soundeffectpitched(sfx_step, 0.9, 1.1)
			}
		}
		if ((!steppy) && character != "V" && (floor(image_index == 3) or floor(image_index) == 8))
		{
			create_particle(x, (y + 43), particle.cloudeffect, 0)
			steppy = 1
		}
		if (floor(image_index) != 3 && floor(image_index) != 8)
			steppy = 0
	}
	else
	{
		if (sprite_index == spr_player_breakdance)
			image_speed = breakdance_speed
		else
			image_speed = 0.35
		movespeed = 0
		if ((!machslideAnim) && (!landAnim) && (!shotgunAnim))
		{
			if (idle < 400 && (!key_taunt))
				idle++
			if (idle >= 150 && (!key_taunt))
			{
				if (sprite_index != spr_idle && floor(image_index) == (image_number - 1))
				{
					facehurt = 0
					idle = 0
				}
				if (sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6)
				{
					idleanim = random_range(0, 100)
					image_index = 0
					if (irandom(100) <= 25)
						scr_soundeffectpitched(choose(sfx_pepvoice1, sfx_pepvoice2, sfx_pepvoice3, sfx_pepvoice4, sfx_pepvoice3), 0.9, 1.1)
					if (idleanim <= 16)
						sprite_index = spr_idle1
					else if (idleanim > 16 && idleanim <= 32)
						sprite_index = spr_idle2
					else if (idleanim > 32 && idleanim <= 48)
						sprite_index = spr_idle3
					else if (idleanim > 48 && idleanim <= 64)
						sprite_index = spr_idle4
					else if (idleanim > 64 && idleanim <= 80)
						sprite_index = spr_idle5
					else
						sprite_index = spr_idle6
				}
			}
			else if (!facehurt)
			{
				if (windingAnim < 1800 or angry or shoot)
				{
					start_running = 1
					movespeed = 0
					if shoot
						sprite_index = spr_player_pistolidle
					else if mort
						sprite_index = spr_player_mortidle
					else if (key_taunt && breakdance_buffer == 0)
						sprite_index = spr_player_breakdance
					else if (global.fill <= 0 && global.panic)
						sprite_index = spr_hurtidle
					else if global.panic
						sprite_index = spr_panic
					else if (global.stylethreshold == 2)
						sprite_index = spr_3hpidle
					else if (global.stylethreshold >= 3)
						sprite_index = spr_rageidle
					else
						sprite_index = spr_idle
				}
				else
				{
					idle = 0
					windingAnim--
					sprite_index = spr_winding
					if (key_taunt && breakdance_buffer == 0)
						sprite_index = spr_player_breakdance
				}
			}
			else
			{
				windingAnim = 0
				if (sprite_index != spr_facehurt && floor(image_index) == (image_number - 1))
					sprite_index = spr_facehurt
				if (key_taunt && breakdance_buffer == 0)
					sprite_index = spr_player_breakdance
			}
		}
	}
	if (movespeed > 8)
		movespeed -= 0.1
	if landAnim
	{
		if (sprite_index == spr_player_mortland)
		{
			if (floor(image_index) == (image_number - 1))
			{
				landAnim = 0
				sprite_index = spr_player_mortidle
				image_index = 0
			}
		}
		else if (!shotgunAnim)
		{
			if (move == 0)
			{
				movespeed = 0
				sprite_index = spr_land
				if (floor(image_index) == (image_number - 1))
					landAnim = 0
			}
			else
			{
				sprite_index = spr_land2
				if (floor(image_index) == (image_number - 1))
				{
					landAnim = 0
					sprite_index = spr_move
					image_index = 0
				}
			}
		}
		else
		{
			sprite_index = spr_shotgunland
			if (floor(image_index) == (image_number - 1))
			{
				landAnim = 0
				sprite_index = spr_shotgunidle
				if (move != 0)
					sprite_index = spr_shotgunwalk
				image_index = 0
			}
		}
	}
	else if (shotgunAnim && sprite_index != spr_shotgunshoot && (!machslideAnim))
		sprite_index = (move == 0 ? spr_shotgunidle : spr_shotgunwalk)
	if machslideAnim
		sprite_index = spr_machslideend
	if (floor(image_index) == (image_number - 1))
	{
		switch sprite_index
		{
			case spr_machslideend:
				machslideAnim = 0
				sprite_index = spr_idle
				if shotgunAnim
					sprite_index = spr_shotgunidle
				break
			case spr_playerV_revolverend:
				sprite_index = spr_idle
				break
			case spr_shotgunshoot:
				sprite_index = spr_shotgunidle
				break
		}
	}
	if grounded
	{
		if ((key_jump or (input_buffer_jump < 8 && (!key_attack) && vsp > 0)) && (!key_down))
		{
			scr_soundeffect(sfx_jump)
			if (sprite_index != spr_shotgunshoot)
			{
				sprite_index = spr_jump
				if shotgunAnim
					sprite_index = spr_shotgunjump
				image_index = 0
			}
			particle_set_scale(particle.highjumpcloud2, xscale, 1)
			create_particle(x, y, particle.highjumpcloud2, 0)
			vsp = -11
			state = states.jump
			jumpAnim = 1
			jumpstop = 0
			if place_meeting(x, (y + 1), obj_railparent)
				railmomentum = 1
			freefallstart = 0
		}
		if (key_down or (grounded && vsp > 0 && scr_solid(x, (y - 3)) && scr_solid(x, y)) or place_meeting(x, y, obj_solid))
		{
			state = states.crouch
			landAnim = 0
			crouchAnim = 1
			image_index = 0
			idle = 0
		}
	}
	else if (!key_jump)
	{
		if (sprite_index != spr_shotgunshoot)
		{
			if (!shotgunAnim)
				sprite_index = spr_fall
			else
				sprite_index = spr_shotgunfall
			image_index = 0
			jumpAnim = 0
		}
		else
			jumpAnim = 1
		state = states.jump
	}
	if (sprite_index == spr_player_breakdance && breakdance_speed > 0.4)
	{
		if ((!instance_exists(dashcloudid)) && grounded)
		{
			with (instance_create((x + 25), y, obj_dashcloud))
			{
				image_xscale = other.xscale
				other.dashcloudid = id
			}
		}
		if ((!instance_exists(dashcloudid)) && grounded)
		{
			with (instance_create((x - 25), y, obj_dashcloud))
			{
				image_xscale = (-other.xscale)
				other.dashcloudid = id
			}
		}
	}
	if (key_shoot2 && shotgunAnim)
		scr_shotgunshoot()
	if ((key_slap2 or input_buffer_slap < 8) && (!key_up))
	{
		sprite_index = spr_suplexdash
		suplexmove = 1
		particle_set_scale(particle.jumpdust, xscale, 1)
		create_particle(x, y, particle.jumpdust, 0)
		suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
		sfx_gain(suplexdashsnd)
		state = states.handstandjump
		movespeed = 8
		image_index = 0
	}
	else if ((key_slap2 or input_buffer_slap < 8) && key_up)
	{
		if (character != "V")
		{
			state = states.punch
			image_index = 0
			sprite_index = spr_player_breakdanceuppercut
			vsp = -14
			movespeed = hsp
			scr_soundeffectpitched(sfx_uppercut)
			particle_set_scale(particle.highjumpcloud2, xscale, 1)
			create_particle(x, y, particle.highjumpcloud2, 0)
		}
		else
		{
			particle_set_scale(particle.highjumpcloud2, xscale, 1)
			create_particle(x, y, particle.highjumpcloud2, 0)
			image_index = 0
			state = states.bazooka
			vsp = -16
			sprite_index = spr_jump
		}
	}
	switch character
	{
		case "P":
			if (key_attack && state != states.handstandjump && (!(place_meeting((x + xscale), y, obj_solid))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) or (!(place_meeting((x + (xscale * 5)), y, obj_solid)))) && (!global.kungfu))
			{
				sprite_index = spr_mach1
				image_index = 0
				state = states.mach2
				if (movespeed < 6)
					movespeed = 6
			}
			if (global.kungfu && key_attack && state != states.handstandjump)
			{
				state = states.blockstance
				sprite_index = spr_player_airattack
				hsp = 0
				movespeed = 0
			}
			break
		case "N":
			if (pogochargeactive or pizzapepper > 0)
			{
				if key_attack2
				{
					scr_soundeffect(sfx_noisewoah)
					state = states.Sjumpprep
					image_index = 0
					sprite_index = ((!key_up) ? spr_playerN_jetpackstart : spr_superjumpprep)
					hsp = 0
					vsp = 0
				}
			}
			else if (key_attack && (!key_slap2))
			{
				sprite_index = spr_playerN_pogostart
				image_index = 0
				state = states.pogo
			}
			break
		case "V":
			if (key_attack && state != states.handstandjump && (!(place_meeting((x + xscale), y, obj_solid))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) or (!(place_meeting((x + (xscale * 5)), y, obj_solid)))) && (!global.kungfu))
			{
				sprite_index = spr_mach1
				image_index = 0
				state = states.mach2
				if (movespeed < 6)
					movespeed = 6
			}
			if (global.kungfu && key_attack && state != states.handstandjump)
			{
				state = states.blockstance
				sprite_index = spr_player_airattack
				hsp = 0
				movespeed = 0
			}
			if (key_shoot2 && (!instance_exists(dynamite_inst)))
			{
				if (move == 0)
					movespeed = 0
				state = states.dynamite
				sprite_index = spr_playerV_dynamitethrow
				image_index = 0
				with (instance_create(x, y, obj_dynamite))
				{
					image_xscale = other.xscale
					movespeed = 6
					vsp = -6
					other.dynamite_inst = id
					playerid = other.id
				}
			}
			if key_slap2 && !key_up
			{
				if (move == 0)
					movespeed = 0
				sprite_index = spr_playerV_revolverstart
				image_index = 0
				state = states.revolver
			}
			break
	}

	scr_dotaunt()
	if (sprite_index == spr_shotgunshoot)
	{
		landAnim = 0
		machslideAnim = 0
		image_speed = 0.45
	}
	exit;
}

function state_pepperman_normal()
{
	pepperman_grab_reset()
	move = (key_left + key_right)
	if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
		movespeed += pepperman_accel
	else if (move != 0 && move != sign(xscale) && movespeed > 0)
		movespeed -= pepperman_deccel
	else if (move == 0)
		movespeed -= pepperman_deccel
	if (floor(movespeed) == pepperman_maxhsp_normal)
		movespeed = pepperman_maxhsp_normal
	if (movespeed > pepperman_maxhsp_normal)
		movespeed -= 0.3
	else if (movespeed < 0)
		movespeed = 0
	if (move != 0 && movespeed == 0)
		xscale = move
	hsp = (xscale * movespeed)
	if (sprite_index != spr_pepperman_throw)
	{
		if (hsp != 0)
			sprite_index = spr_move
		else
			sprite_index = spr_idle
	}
	if ((input_buffer_jump < 8 or key_jump) && grounded && vsp > 0)
	{
		scr_soundeffect(sfx_jump)
		sprite_index = spr_jump
		image_index = 0
		vsp = (-pepperman_jumpspeed)
		state = states.jump
		with (instance_create(x, (y - 5), obj_highjumpcloud2))
			image_xscale = other.xscale
	}
	if ((!grounded) && (!key_jump))
	{
		state = states.jump
		sprite_index = spr_fall
	}
	if (key_attack && ((!(place_meeting((x + xscale), y, obj_solid))) or place_meeting((x + xscale), y, obj_destructibles)) && pepperman_grabID == noone && sprite_index != spr_pepperman_throw)
	{
		if (move != 0)
			xscale = move
		state = states.shoulderbash
		sprite_index = spr_pepperman_shoulderstart
		image_index = 0
		scr_soundeffect(sfx_suplexdash)
	}
	if (sprite_index == spr_pepperman_throw && floor(image_index) == (image_number - 1))
		sprite_index = spr_pepperman_idle
	if (move != 0 && (floor(image_index) == 4 or floor(image_index) == 11) && steppy == 0 && character != "V")
	{
		instance_create(x, (y + 38), obj_cloudeffect)
		steppy = 1
	}
	if (move != 0 && floor(image_index) != 4 && floor(image_index) != 11)
		steppy = 0
	exit;
}

function pepperman_grab_reset()
{
	if (pepperman_grabID != noone)
	{
		if (!instance_exists(pepperman_grabID))
			pepperman_grabID = -4
	}
	exit;
}

function scr_player_normal()
{
	if (character != "M")
		state_player_normal()
	else
		state_pepperman_normal()
	exit;
}

