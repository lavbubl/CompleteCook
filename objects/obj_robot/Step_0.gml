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
		scr_enemy_stun()
		break
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw()
		break
	case states.grabbed:
		scr_enemy_grabbed()
		break
	case states.mach1:
		if (image_index > (image_number - 1))
		{
			hsp = (image_xscale * startmachspeed)
			if place_meeting(x, (y + 1), obj_railparent)
			{
				var _railinst = instance_place(x, (y + 1), obj_railparent)
				hsp += (_railinst.movespeed * _railinst.dir)
			}
			sprite_index = spr_robot_mach
			image_index = 0
			state = states.mach2
		}
		break
	case states.mach2:
		hsp = (Approach(hsp, (image_xscale * machspeed), 0.5) + railmovespeed)
		if place_meeting(x, (y + 1), obj_railparent)
		{
			_railinst = instance_place(x, (y + 1), obj_railparent)
			railmovespeed = (_railinst.movespeed * _railinst.dir)
		}
		else
			railmovespeed = 0
		with (instance_place((x + hsp), y, obj_destructibles))
			instance_destroy()
		if (place_meeting((x + sign(hsp)), y, obj_solid) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting(x, y, obj_destructibles))))
		{
			state = states.stun
			stunned = 100
			vsp = -4
			hsp = ((-image_xscale) * 2)
		}
		break
	case states.tackle:
		if (image_index > 8)
		{
			hsp = (image_xscale * tacklespeed)
			if place_meeting(x, (y + 1), obj_railparent)
			{
				_railinst = instance_place(x, (y + 1), obj_railparent)
				hsp += (_railinst.movespeed * _railinst.dir)
			}
			with (instance_place((x + hsp), y, obj_destructibles))
				instance_destroy()
		}
		if (image_index > (image_number - 1))
		{
			state = states.walk
			hsp = 0
			railspeed = 0
			sprite_index = walkspr
		}
		if (place_meeting((x + sign(hsp)), y, obj_solid) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting(x, y, obj_destructibles))))
		{
			state = states.stun
			stunned = 100
			vsp = -8
			hsp = ((-image_xscale) * 5)
		}
		break
	case states.slap:
		hsp = 0
		if (image_index > (image_number - 1))
		{
			state = states.walk
			sprite_index = walkspr
		}
		break
}

if (state == states.stun && stunned > 40 && birdcreated == 0)
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
if (bombreset > 0)
	bombreset--
invincible = state == states.mach2
targetplayer = instance_nearest(x, y, obj_player)
if (x != targetplayer.x && state != states.pizzagoblinthrow && bombreset == 0)
{
	if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20))
	{
		if (state == states.walk or state == states.idle)
		{
			image_index = 0
			image_xscale = (-(sign((x - targetplayer.x))))
			state = chosenstate
			bombreset = 100
			switch state
			{
				case states.mach1:
					sprite_index = spr_robot_machstart
					image_index = 0
					image_speed = 0.6
					hsp = 0
					break
				case states.pizzagoblinthrow:
					bombreset = 0
					sprite_index = spr_robot_attack
					image_index = 0
					image_speed = 0.35
					hsp = 0
					break
				case states.tackle:
					sprite_index = spr_robot_tackle
					image_index = 0
					image_speed = 0.6
					hsp = 0
					break
				case states.slap:
					sprite_index = spr_robot_slap
					image_index = 0
					image_speed = 0.6
					hsp = 0
					break
			}

		}
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
if (state == states.mach2 or (state == states.slap && image_index > 11) or (state == states.tackle && image_index > 8))
{
	if (!hitboxcreate)
	{
		hitboxcreate = 1
		with (instance_create(x, y, obj_forkhitbox))
		{
			if (other.state == states.slap)
				sprite_index = spr_swordhitbox
			else if (other.state == states.mach2 or other.state == states.tackle)
				sprite_index = spr_bighitbox
			ID = other.id
		}
	}
}
else
	hitboxcreate = 0
