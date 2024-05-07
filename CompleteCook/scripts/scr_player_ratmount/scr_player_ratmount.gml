function scr_player_ratmount()
{
	move = (key_left + key_right)
	doublejump = 0
	if (ratgrabbedID != noone && (!instance_exists(ratgrabbedID)))
		ratgrabbedID = noone
	hsp = movespeed
	if ((place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles)))) or (abs(movespeed) < 8 && move != xscale) or (!key_attack) or abs(movespeed) <= 6)
	{
		gustavodash = 0
		ratmount_movespeed = 8
	}
	if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && gustavodash != 51)
		movespeed = 0
	if (ratmount_movespeed == 12 && gustavodash != 51)
	{
		ratmount_movespeed = 12
		instance_create(x, y, obj_jumpdust)
		gustavodash = 51
	}
	if key_jump
		input_buffer_jump = 0
	if (move != xscale && move != 0)
	{
		xscale = move
		if (abs(movespeed) > 2 && grounded)
		{
			state = states.ratmountskid
			movespeed = abs(movespeed)
		}
	}
	if (move != 0)
	{
		if (move == xscale)
			movespeed = Approach(movespeed, (xscale * ratmount_movespeed), 0.5)
		else
			movespeed = Approach(movespeed, 0, 0.5)
	}
	else
		movespeed = Approach(movespeed, 0, 0.5)
	if (abs(movespeed) < 3 && move != 0)
		image_speed = 0.35
	else if (abs(movespeed) > 3 && abs(movespeed) < 6)
		image_speed = 0.45
	else
		image_speed = 0.6
	if brick
	{
		if (!landAnim)
		{
			if (hsp != 0)
			{
				if (ratmount_movespeed >= 12)
					sprite_index = spr_player_ratmountattack
				else
					sprite_index = spr_player_ratmountmove
			}
			else
			{
				image_speed = 0.35
				if (sprite_index != spr_player_ratmountidleanim)
				{
					sprite_index = spr_player_ratmountidle
					if (ratgrabbedID == noone)
					{
						if (idle < 400)
							idle++
						if (idle >= 150)
						{
							sprite_index = spr_player_ratmountidleanim
							image_index = 0
						}
					}
				}
				else if (floor(image_index) == (image_number - 1))
				{
					idle = 0
					sprite_index = spr_player_ratmountidle
				}
			}
		}
		if (floor(image_index) == (image_number - 1))
		{
			landAnim = 0
			if (sprite_index == spr_player_ratmountland)
				sprite_index = spr_player_ratmountidle
		}
		if (sprite_index == spr_player_ratmountland)
			image_speed = 0.35
	}
	else
	{
		if (hsp != 0)
		{
			if (ratmount_movespeed >= 12)
				sprite_index = spr_lonegustavo_dash
			else
				sprite_index = spr_lonegustavo_walk
		}
		else
			sprite_index = spr_lonegustavo_idle
		image_speed = 0.35
	}
	if (hsp != 0 && (!steppy) && floor(image_index) == 7)
	{
		steppy = 1
		create_particle(x, (y + 38), particle.cloudeffect, 0)
	}
	if (hsp != 0 && floor(image_index) != 7)
		steppy = 0
	if (input_buffer_jump < 8 && grounded && sprite_index != spr_player_ratmountswallow)
	{
		particle_set_scale(particle.highjumpcloud2, xscale, 1)
		create_particle(x, y, particle.highjumpcloud2, 0)
		scr_soundeffect(sfx_jump)
		if brick
			sprite_index = spr_player_ratmountjump
		else if (ratmount_movespeed >= 12)
			sprite_index = spr_lonegustavo_dashjump
		else
			sprite_index = spr_player_ratmountgroundpound
		image_index = 0
		jumpAnim = 1
		state = states.ratmountjump
		vsp = -11
		jumpstop = 0
	}
	if ((!grounded) && sprite_index != spr_player_ratmountswallow)
	{
		state = states.ratmountjump
		jumpAnim = 0
		if brick
			sprite_index = spr_player_ratmountfall
		else
			sprite_index = spr_player_ratmountgroundpoundfall
	}
	if (key_attack && grounded && (!(place_meeting((x + xscale), y, obj_solid))))
	{
		move = xscale
		if (ratmount_movespeed < 12)
			ratmount_movespeed += 0.1
	}
	if (key_slap2 && brick)
		ratmount_kickbrick()
	else if (key_slap2 && (!brick))
	{
		ratmountpunchtimer = 25
		state = states.ratmountpunch
		image_index = 0
		if (move != 0)
			xscale = move
		movespeed = (xscale * 12)
		sprite_index = spr_lonegustavo_punch
	}
	if ((!instance_exists(dashcloudid)) && grounded && ratmount_movespeed >= 12)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.xscale
			other.dashcloudid = id
		}
	}
	if ((key_down && grounded && vsp > 0) or scr_solid(x, y))
	{
		state = states.ratmountcrouch
		if (brick == 1)
		{
			with (instance_create(x, y, obj_brickcomeback))
			{
				wait = 1
				instance_create(x, y, obj_genericpoofeffect)
			}
		}
		brick = 0
	}
	with (ratgrabbedID)
		scr_enemy_ratgrabbed()
	ratmount_shootpowerup()
	ratmount_dotaunt()
	exit;
}

function ratmount_dotaunt()
{
	if (key_taunt2 && state != states.backbreaker && brick)
	{
		scr_soundeffect(sfx_taunt)
		tauntstoredisgustavo = 1
		taunttimer = 20
		tauntstoredmovespeed = movespeed
		tauntstoredsprite = sprite_index
		tauntstoredstate = state
		tauntstoredvsp = vsp
		state = states.backbreaker
		sprite_index = spr_player_ratmounttaunt
		with (instance_create(x, y, obj_taunteffect))
			player = other.id
	}
	exit;
}

function ratmount_kickbrick()
{
	var _pad = 32
	with (instance_create((x + (image_xscale * _pad)), y, obj_brickball))
	{
		if (other.state == states.ratmountjump or other.state == states.ratmountbounce)
			up = 1
		image_xscale = other.xscale
		xoffset = _pad
	}
	state = states.ratmountgroundpound
	sprite_index = spr_lonegustavo_kick
	image_index = 0
	image_speed = 0.35
	gustavokicktimer = 5
	brick = 0
	exit;
}

function ratmount_shootpowerup()
{
	if (key_shoot2 && ratpowerup != -4 && ratshootbuffer <= 0)
	{
		switch ratpowerup
		{
			case 445:
				with (instance_create((x + (20 * xscale)), y, obj_playernoisearrow))
					direction = point_direction(x, y, (x + (other.xscale * 4)), y)
				break
			case 222:
				with (instance_create((x + (20 * xscale)), (y + 20), obj_playersmokehitbox))
				{
					spd += (other.movespeed / 2)
					image_xscale = other.xscale
				}
				break
			case 460:
				with (instance_create((x + (20 * xscale)), y, obj_playerspikecheese))
				{
					spd += other.movespeed
					image_xscale = other.xscale
				}
				break
		}

		ratshootbuffer = 30
	}
	exit;
}

