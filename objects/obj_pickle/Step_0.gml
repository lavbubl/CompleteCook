if (room == rm_editor)
	exit;
if (!instance_exists(cloneid))
	cloneid = noone
switch state
{
	case states.idle:
		scr_enemy_idle()
		break
	case states.charge:
		scr_enemy_charge()
		break
	case states.turn:
		scr_enemy_turn()
		break
	case states.walk:
		scr_enemy_walk()
		break
	case states.land:
		scr_enemy_land()
		break
	case states.hit:
		scr_enemy_hit()
		break
	case states.stun:
		image_alpha = 1
		scr_enemy_stun()
		break
	case states.pizzagoblinthrow:
		image_alpha = 1
		scr_pizzagoblin_throw()
		break
	case states.grabbed:
		image_alpha = 1
		scr_enemy_grabbed()
		break
	case states.chase:
		scr_enemy_chase()
		break
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = 1
	with (instance_create(x, y, obj_enemybird))
		ID = other.id
}
if (state != states.stun)
	birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
if (state != states.grabbed)
	depth = 0
if (state != states.stun)
	thrown = false
if (state != states.chase && image_alpha >= 1)
	scr_scareenemy()
if (bombreset > 0)
	bombreset--
if (sprite_index == scaredspr)
{
	image_alpha = 1
	attacking = 0
}
if (bombreset == 0 && state == states.walk)
{
	attacking = 0
	targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
	if (targetplayer.x > (x - threshold_x) && targetplayer.x < (x + threshold_x) && y <= (targetplayer.y + threshold_y) && y >= (targetplayer.y - threshold_y))
	{
		attacking = 1
		pos = sign((x - targetplayer.x))
		state = states.chase
		fade = 1
	}
}
if (state == states.chase)
{
	if fade
	{
		if (image_alpha > 0)
		{
			if (hsp < -0.2 or hsp > 0.2)
				hsp *= 0.5
			image_alpha -= fadeout_time
		}
		else if (image_alpha <= 0)
		{
			x = targetplayer.x
			y = targetplayer.y
			if (pos != 0 && (!(scr_solid((x + (pos * attack_offset)), y))))
			{
				x = (targetplayer.x + (pos * attack_offset))
				if place_meeting(x, y, obj_pickle)
				{
					if (!(scr_solid((x + 32), y)))
						x += 32
					else if (!(scr_solid((x - 32), y)))
						x -= 32
				}
			}
			if (!(scr_solid(x, (y + 1))))
			{
				var yy = y
				var ground = 0
				var i = 1
				while (i < ground_check)
				{
					if scr_solid(x, (y + i))
					{
						ground = 1
						i--
						yy = (y + i)
						break
					}
					else
					{
						i++
						continue
					}
				}
				if ground
					y = yy
			}
			fade = 0
		}
	}
	else
	{
		if (image_alpha < 1)
			image_alpha += fadein_time
		if (image_alpha >= 1)
		{
			image_alpha = 1
			image_index = 0
			sprite_index = spr_pickle_attack
			var old_xscale = image_xscale
			image_xscale = (-(sign((x - targetplayer.x))))
			if (image_xscale == 0)
				image_xscale = old_xscale
			state = states.pizzagoblinthrow
			if (elite && cloneid == noone)
			{
				var tx = (image_xscale * 32)
				if scr_solid((x + tx), y)
					tx = 0
				cloneid = instance_create((x + tx), y, obj_pickle)
				with (cloneid)
				{
					cloneid = other.id
					important = 1
					bombreset = 0
					image_index = 0
					image_xscale = other.image_xscale
					state = states.pizzagoblinthrow
					hsp = (other.image_xscale * 2)
					vsp = -6
				}
				flash = 1
				alarm[4] = 5
				create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
			}
		}
	}
}
invincible = attacking
if (state == states.idle)
{
	if (scaredbuffer > 0 && attacking)
	{
		image_alpha = 0.8
		invincible = 1
	}
}
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index
		mask_index = other.sprite_index
		baddieID = other.id
		other.boundbox = 1
	}
}
