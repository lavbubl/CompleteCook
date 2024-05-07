targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (hp <= 0 && state != states.arenaround)
{
	if ((!destroyed) && (!thrown) && (!destroyable))
		boss_destroy(lastplayerid)
}
switch state
{
	case states.arenaround:
		grav = 0.5
		state_boss_arenaround()
		break
	case states.normal:
		grav = 0.5
		boss_mrstick_normal()
		break
	case states.boss_shield:
		grav = 0.5
		boss_mrstick_shield()
		break
	case states.boss_helicopterhat:
		grav = 0.5
		boss_mrstick_helicopterhat()
		break
	case states.boss_panicjump:
		grav = 0.5
		boss_mrstick_panicjump()
		break
	case states.jump:
		grav = 0.5
		boss_mrstick_jump()
		break
	case states.boss_smokebombstart:
		grav = 0.5
		boss_mrstick_smokebombstart()
		break
	case states.boss_smokebombcrawl:
		grav = 0.5
		boss_mrstick_smokebombcrawl()
		break
	case states.boss_springshoes:
		grav = 0.5
		boss_mrstick_springshoes()
		break
	case states.boss_cardboard:
		grav = 0.5
		boss_mrstick_cardboard()
		break
	case states.boss_cardboardend:
		grav = 0.5
		boss_mrstick_cardboardend()
		break
	case states.boss_mockery:
		grav = 0.5
		boss_mrstick_mockery()
		break
	case states.walk:
		grav = 0.5
		state_boss_walk(boss_mrstick_decide_attack)
		inv_timer = 2
		invincible = 1
		break
	case states.chainsaw:
		grav = 0.5
		state_boss_chainsaw()
		break
	case states.backbreaker:
		grav = 0.5
		state_boss_taunt()
		invincible = 1
		inv_timer = 2
		break
	case states.parry:
		grav = 0.5
		state_boss_parry()
		invincible = 1
		inv_timer = 2
		break
	case states.hit:
		grav = 0.5
		scr_enemy_hit()
		stunned = targetstunned
		break
	case states.stun:
		grav = 0.5
		state_boss_stun()
		break
}

colliding = (!((state == states.jump or state == states.boss_cardboard or state == states.boss_cardboardend)))
attacking = (state == states.boss_shield or state == states.jump or state == states.boss_cardboard or state == states.boss_cardboardend or state == states.boss_smokebombstart)
