if (room == rm_editor)
	exit;
if (state == states.walk && grounded && vsp > 0 && obj_player.state == states.freefallland)
	scr_pizzaball_go_to_thrown(0, -10)
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
		scr_pizzaball_hit()
		break
	case states.golf:
		scr_pizzaball_golf()
		break
	case states.thrown:
		scr_pizzaball_thrown()
		break
	case states.stun:
		scr_pizzaball_go_to_thrown(0, (vsp * 0.5))
		break
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw()
		break
	case states.grabbed:
		scr_pizzaball_grabbed()
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

if ((state == states.walk or state == states.idle) && sit)
{
	hsp = 0
	sprite_index = spr_pizzaball_idle1
}
if (state != states.walk)
	sit = 0
if (state == states.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = 1
	with (instance_create(x, y, obj_enemybird))
		ID = other.id
}
if (state == states.thrown && (!instance_exists(pointerID)))
{
	pointerID = instance_create(x, y, obj_objecticontracker)
	pointerID.sprite_index = spr_icon_pizzaball
	pointerID.objectID = id
}
if (state != states.stun)
	birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
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
if (state == states.thrown)
{
	with (instance_place((x + xscale), y, obj_destructibles))
		instance_destroy()
	with (instance_place(((x + hsp) + xscale), y, obj_destructibles))
		instance_destroy()
	with (instance_place(x, ((y + vsp) + 1), obj_destructibles))
		instance_destroy()
	with (instance_place(x, ((y + vsp) - 1), obj_destructibles))
		instance_destroy()
	with (instance_place(x, (y + 1), obj_destructibles))
		instance_destroy()
	with (instance_place(x, (y - 1), obj_destructibles))
		instance_destroy()
}
