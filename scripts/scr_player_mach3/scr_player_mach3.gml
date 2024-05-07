function scr_player_mach3()
{
	if (windingAnim < 2000)
		windingAnim++
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = _railinst.movespeed
		raildir = _railinst.dir
	}
	hsp = ((xscale * movespeed) + (railmovespeed * raildir))
	if grounded
	{
		if (scr_slope() && hsp != 0 && movespeed > 10 && movespeed < 18)
			scr_player_addslopemomentum(0.1, 0.2)
		if (sprite_index == spr_player_Sjumpcancel)
			sprite_index = spr_mach4
	}
	if (move == xscale && grounded)
	{
		if (movespeed < 20)
		{
			if (mach4mode == 0)
				movespeed += 0.025
			else
				movespeed += 0.1
		}
	}
	mach2 = 100
	momemtum = 1
	move = (key_right + key_left)
	move2 = (key_right2 + key_left2)
	if (fightball == 1 && global.coop == true)
	{
		if (object_index == obj_player1)
		{
			x = obj_player2.x
			y = obj_player2.y
		}
		if (object_index == obj_player2)
		{
			x = obj_player1.x
			y = obj_player1.y
		}
	}
	if (sprite_index == spr_crazyrun)
	{
		if (flamecloud_buffer > 0)
			flamecloud_buffer--
		else
		{
			flamecloud_buffer = 10
			with (instance_create(x, y, obj_dashcloud))
			{
				image_xscale = other.xscale
				sprite_index = spr_flamecloud
			}
		}
	}
	crouchslideAnim = 1
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && sprite_index != spr_player_Sjumpcancel)
	{
		vsp /= 20
		jumpstop = 1
	}
	if (grounded && vsp > 0)
		jumpstop = 0
	if (input_buffer_jump < 8 && sprite_index != spr_mach3jump && grounded && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
	{
		scr_soundeffect(sfx_jump)
		if (sprite_index != spr_fightball)
		{
			image_index = 0
			sprite_index = spr_mach3jump
		}
		vsp = -11
	}
	if (fightball == 0)
	{
		if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
			sprite_index = spr_mach4
		if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup or sprite_index == spr_mach3hit or sprite_index == spr_dashpadmach))
			sprite_index = spr_mach4
		if (sprite_index == spr_mach2jump && grounded && vsp > 0)
			sprite_index = spr_mach4
		if (movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_taunt)
		{
			mach4mode = 1
			flash = 1
			sprite_index = spr_crazyrun
			with (create_debris(x, y, spr_slapstar))
			{
				hsp = random_range(-5, 5)
				vsp = random_range(-10, 10)
			}
		}
		else if (movespeed <= 16 && sprite_index == spr_crazyrun)
			sprite_index = spr_mach4
	}
	if (sprite_index == spr_crazyrun && (!instance_exists(crazyruneffectid)))
	{
		with (instance_create(x, y, obj_crazyrunothereffect))
		{
			playerid = other.object_index
			other.crazyruneffectid = id
		}
	}
	if (sprite_index == spr_mach4 or sprite_index == spr_fightball)
		image_speed = 0.4
	else if (sprite_index == spr_crazyrun)
		image_speed = 0.75
	else if (sprite_index == spr_rollgetup or sprite_index == spr_mach3hit or sprite_index == spr_dashpadmach)
		image_speed = 0.4
	if key_jump
		input_buffer_jump = 0
	if (((!key_attack) && fightball == 0 && (!launched) && sprite_index != spr_dashpadmach && grounded) or (character == "S" && (move == 0 or move != xscale) && grounded && fightball == 0))
	{
		sprite_index = spr_machslidestart
		scr_soundeffect(sfx_break)
		state = states.machslide
		image_index = 0
		launched = 0
	}
	if (move == (-xscale) && grounded && (!launched) && fightball == 0 && sprite_index != spr_dashpadmach)
	{
		scr_soundeffect(sfx_machslideboost)
		sprite_index = spr_mach3boost
		state = states.machslide
		image_index = 0
	}
	if (key_down && fightball == 0)
	{
		particle_set_scale(particle.jumpdust, xscale, 1)
		create_particle(x, y, particle.jumpdust, 0)
		flash = 0
		state = states.tumble
		image_index = 0
		vsp = 10
		if (!grounded)
			sprite_index = spr_mach2jump
		else
			sprite_index = spr_machroll
	}
	if (((!grounded) && (place_meeting((x + hsp), y, obj_solid) or scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock)))) or (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) or scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope)))
	{
		wallspeed = movespeed
		state = states.climbwall
	}
	if ((!grounded) && place_meeting((x + sign(hsp)), y, obj_climbablewall) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))))
	{
		wallspeed = movespeed
		state = states.climbwall
	}
	if (key_slap2 && !key_up && character != "V" && sprite_index != spr_dashpadmach)
	{
		sprite_index = spr_suplexdash
		suplexmove = 1
		suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
		sfx_gain(suplexdashsnd)
		state = states.handstandjump
		if (movespeed < 5)
			movespeed = 5
		image_index = 0
	}
	else if (key_slap2 && key_up && sprite_index != spr_dashpadmach)
	{
		state = states.punch
		image_index = 0
		sprite_index = spr_player_breakdanceuppercut
		scr_soundeffectpitched(sfx_uppercut)
		vsp = -10
		movespeed = hsp
		particle_set_scale(particle.highjumpcloud2, xscale, 1)
		create_particle(x, y, particle.highjumpcloud2, 0)
	}
	if (key_shoot2 && shotgunAnim == 1 && character != "V")
		scr_shotgunshoot()
	if (key_shoot2 && character == "V" && (!instance_exists(dynamite_inst)))
	{
		vsp = -5
		state = states.dynamite
		image_index = 0
		sprite_index = spr_playerV_dynamitethrow
		with (instance_create(x, y, obj_dynamite))
		{
			image_xscale = other.xscale
			other.dynamite_inst = id
			playerid = other.id
			movespeed = (other.movespeed + 4)
			vsp = -6
		}
	}
	if (key_slap2 && character == "V")
	{
		vsp = -5
		state = states.revolver
		image_index = 0
		sprite_index = spr_playerV_airrevolver
		image_index = 0
		with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
		{
			is_solid = 0
			image_xscale = other.xscale
		}
		scr_soundeffect(sfx_killingblow)
	}
	if (scr_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_mach3solid))) && (!scr_slope()) && (scr_solid_slope((x + sign(hsp)), y) or place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_climbablewall))) && grounded)
	{
		var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
		if _bump
		{
			with (obj_camera)
			{
				shake_mag = 20
				shake_mag_acc = (40 / room_speed)
			}
			with (obj_baddie)
			{
				if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
				{
					stun = 1
					alarm[0] = 200
					ministun = 0
					vsp = -5
					hsp = 0
				}
			}
			if (!fightball)
			{
				sprite_index = spr_hitwall
				scr_soundeffect(sfx_groundpound)
				scr_soundeffect(sfx_bumpwall)
				hsp = 0
				flash = 0
				state = states.bump
				hsp = (-6 * xscale)
				vsp = -6
				mach2 = 0
				image_index = 0
				instance_create((x + 10), (y + 10), obj_bumpeffect)
			}
			else
			{
				fightball = 0
				with (obj_player)
				{
					sprite_index = spr_hitwall
					scr_soundeffect(sfx_groundpound)
					scr_soundeffect(sfx_bumpwall)
					hsp = 0
					flash = 0
					state = states.bump
					hsp = (-6 * xscale)
					vsp = -6
					mach2 = 0
					image_index = 0
					instance_create((x + 10), (y + 10), obj_bumpeffect)
				}
			}
		}
	}
	if ((!instance_exists(dashcloudid)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if (other.fightball == 1)
				instance_create(obj_player.x, obj_player.y, obj_slapstar)
			image_xscale = other.xscale
			other.dashcloudid = id
		}
	}
	if ((!instance_exists(dashcloudid)) && grounded && place_meeting(x, (y + 1), obj_water))
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if (other.fightball == 1)
				instance_create(obj_player.x, obj_player.y, obj_slapstar)
			image_xscale = other.xscale
			sprite_index = spr_watereffect
			other.dashcloudid = id
		}
	}
	scr_dotaunt()
	if (!instance_exists(chargeeffectid))
	{
		with (instance_create(x, y, obj_chargeeffect))
		{
			playerid = other.object_index
			other.chargeeffectid = id
		}
	}
	if (sprite_index == spr_mach4 or sprite_index == spr_fightball)
		image_speed = 0.4
	else if (sprite_index == spr_crazyrun)
		image_speed = 0.75
	else if (sprite_index == spr_rollgetup or sprite_index == spr_mach3hit)
		image_speed = 0.4
	else
		image_speed = 0.4
	if (key_up && fightball == 0 && (character == "P" or character == "V") && grounded && sprite_index != spr_dashpadmach && (!(place_meeting(x, y, obj_dashpad))))
	{
		sprite_index = spr_superjumpprep
		superjumpprepsnd = audio_play_sound(sfx_superjumpprep, 1, false)
		sfx_gain(superjumpprepsnd)
		state = states.Sjumpprep
		hsp = 0
		image_index = 0
	}
	if (global.attackstyle == 2 && key_slap2)
	{
		randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch])
		image_index = 0
		state = states.lungeattack
	}
	exit;
}