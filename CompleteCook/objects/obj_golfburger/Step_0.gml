if (room == rm_editor)
	exit;
switch state
{
	case states.idle:
		scr_enemy_idle()
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
	case states.pummel:
		scr_enemy_pummel()
		break
	case states.staggered:
		scr_enemy_staggered()
		break
	case states.rage:
		scr_enemy_rage()
		break
	case states.ghostpossess:
		scr_enemy_ghostpossess()
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
if (state == states.throwing)
{
	hsp = 0
	if (floor(image_index) == (image_number - 1))
	{
		state = states.walk
		sprite_index = walkspr
	}
	if (!shot)
	{
		with (golfid)
		{
			hsp = 0
			vsp = 0
			sprite_index = stunfallspr
			image_xscale = other.image_xscale
			x = (other.x + (other.image_xscale * 24))
			y = (other.y + 23)
		}
	}
	if (floor(image_index) >= 6 && (!shot))
	{
		shot = 1
		with (golfid)
		{
			x = other.x
			y = other.y
			scr_pizzaball_go_to_thrown((14 * other.image_xscale), -7, 0)
		}
	}
}
scr_scareenemy()
if (state != states.grabbed)
	depth = 0
if (state != states.stun)
	thrown = false
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
