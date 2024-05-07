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
}

if (state == states.walk)
	hsp = 0
else if (state == states.throwing)
{
	hsp = 0
	if (floor(image_index) == (image_number - 1))
	{
		state = states.walk
		sprite_index = spr_bigcheese_idle
	}
	if (!shot)
	{
		if (!pizzaball)
		{
			with (playerid)
			{
				xscale = other.image_xscale
				hsp = 0
				vsp = 0
				state = states.tumble
				jumpstop = 1
				x = other.x
				y = other.y
			}
		}
		else
		{
			with (golfid)
			{
				image_xscale = other.image_xscale
				x = other.x
				y = other.y
				hsp = 0
				vsp = 0
				hsp_carry = 0
				vsp_carry = 0
			}
		}
	}
	if (floor(image_index) > 2 && (!shot))
	{
		shot = 1
		if (!pizzaball)
		{
			with (playerid)
			{
				xscale = other.image_xscale
				movespeed = 12
				state = states.tumble
				vsp = -14
				jumpstop = 1
			}
		}
		else
		{
			with (golfid)
			{
				image_xscale = other.image_xscale
				scr_pizzaball_go_to_thrown((12 * image_xscale), -14, 0)
			}
		}
	}
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
