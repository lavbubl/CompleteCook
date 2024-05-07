if (room == rm_editor)
	exit;
targetplayer = instance_nearest(x, y, obj_player)
wastedhits = (8 - elitehit)
if (elitehit <= 2)
	attackpool = [states.boss_shield, states.turn, states.pistol, states.pistol, states.pistol]
else if (elitehit <= 4)
	attackpool = [states.boss_shield, states.boss_shield, states.boss_shield, states.turn]
else if (elitehit <= 6)
	attackpool = [states.turn]
switch state
{
	case states.walk:
		scr_noise_walk()
		break
	case states.jump:
		scr_noise_jump()
		break
	case states.punch:
		scr_noise_punch()
		break
	case states.boss_shield:
		scr_noise_shield()
		break
	case states.pistol:
		scr_noise_pistol()
		break
	case states.hit:
		scr_enemy_hit()
		break
	case states.stun:
		scr_enemy_stun()
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
}

if (state != states.freefall && state != states.freefallland)
	hit = 0
if (state == states.stun)
{
	movespeed = 0
	if thrown
	{
		savedthrown = true
		placedtraps = 0
		jumpbuffer = 1
		attacked = 0
		with (obj_noisetrap)
			instance_destroy()
	}
	if (grounded && vsp > 0 && savedthrown)
	{
		stunned = 1
		idle_timer = 1
	}
}
else
	savedthrown = false
if (state == states.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = 1
	with (instance_create(x, y, obj_enemybird))
		ID = other.id
}
if (state == states.jump or (state == states.boss_shield && substate == states.jump))
{
	use_collision = 0
	x += hsp
	y += vsp
	if (vsp < 20)
		vsp += grav
}
else
	use_collision = 1
if ((state == states.pistol && substate == states.shotgun) or (state == states.boss_shield && substate == states.boss_shield) or (state == states.walk && ((!placedtraps) or ((!obj_player1.brick) && (!instance_exists(obj_brickball))))) or state == states.punch or state == states.stun or (!use_collision))
	invincible = 1
else
	invincible = 0
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
