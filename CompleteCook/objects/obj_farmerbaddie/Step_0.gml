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
		if (!idle)
			scr_enemy_walk()
		else
		{
			sprite_index = idlespr
			hsp = 0
		}
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

scr_scareenemy()
if (state != states.walk)
	idle = 0
if (state == states.walk)
{
	var x1 = 270
	playerid = instance_nearest(x, y, obj_player)
	var t = (playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 100) && playerid.y < (y + 100))
	if (cooldown > 0)
		cooldown--
	else if (t && collision_line(x, y, playerid.x, playerid.y, obj_solid, false, true) == -4)
	{
		var b = id
		with (obj_farmerbaddie)
		{
			if ((id == b or distance_to_object(other) < 300) && state != states.grabbed && state != states.stun && state != states.hit && state != states.secret)
			{
				state = states.jump
				sprite_index = ragespr
				vsp = -5
				hsp = 0
				if (other.playerid.x != x)
					image_xscale = sign((other.playerid.x - x))
				if (id != b)
					leaderID = b
				else
					leaderID = noone
			}
		}
	}
}
else if (state == states.jump)
{
	if (grounded && vsp > 0)
	{
		state = states.punch
		sprite_index = ragespr
		attackspeed = 8
	}
}
else if (state == states.punch)
{
	if (object_index != obj_farmerbaddie3 && (!instance_exists(hitboxID)))
	{
		with (instance_create(x, y, obj_forkhitbox))
		{
			ID = other.id
			other.hitboxID = id
		}
	}
	x1 = 450
	playerid = instance_nearest(x, y, obj_player)
	t = (playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 400) && playerid.y < (y + 400))
	hsp = (image_xscale * attackspeed)
	var q = outofsight
	if (leaderID == noone)
	{
		if ((!t) or collision_line(x, y, playerid.x, playerid.y, obj_solid, true, false) != -4)
			outofsight = 1
		if t
			outofsight = 0
	}
	else if (instance_exists(leaderID) && leaderID.state == states.punch)
		outofsight = leaderID.outofsight
	else
		leaderID = noone
	if outofsight
	{
		if (q != outofsight)
			waitbuffer = 30
		if (waitbuffer > 0)
			waitbuffer--
		else
			attackspeed = Approach(attackspeed, 0, 0.1)
	}
	else
		attackspeed = Approach(attackspeed, attackmaxspeed, 1)
	if (attackspeed <= 0)
	{
		cooldown = 60
		state = states.walk
		idle = 0
		hsp = 0
		sprite_index = walkspr
	}
	if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))))
		image_xscale *= -1
}
if (state != states.punch && hitboxID != noone && instance_exists(hitboxID))
{
	instance_destroy(hitboxID)
	hitboxID = -4
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
