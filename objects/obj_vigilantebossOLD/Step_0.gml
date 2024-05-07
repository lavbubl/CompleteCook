targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (hp <= 0 && state != states.arenaround && state != states.boss_fistmatch)
{
	if ((!thrown) && (!destroyable))
		boss_destroy(lastplayerid)
}
if ((state == states.mach1 or state == states.machslide or state == states.crouchslide or state == states.uppunch or state == states.punch or state == states.boss_millionpunch or state == states.handstandjump) && alarm[0] <= 0)
	alarm[0] = 6
if (chooseparry_buffer > 0)
	chooseparry_buffer--
if (important && honor && nexthonor && phase > 3 && state != states.boss_superattack)
{
	var ch = 0
	with (obj_player)
	{
		if (state == states.chainsawbump)
			ch = 1
	}
	if (instance_exists(obj_shotgunbullet) or ch)
	{
		nexthonor = 0
		with (obj_tv)
		{
			showtext = 1
			message = "NO HONOR"
			alarm[0] = 200
		}
	}
}
switch phase
{
	case 4:
	case 5:
	case 6:
		normal_func = boss_vigilante_normal_phase4
		break
	default:
		normal_func = boss_vigilante_normal
}

switch state
{
	case states.arenaround:
		grav = 0.5
		state_boss_arenaround()
		honor = nexthonor
		break
	case states.normal:
		grav = 0.5
		normal_func()
		break
	case states.float:
		grav = 0.5
		boss_vigilante_float()
		break
	case states.revolver:
		grav = 0.5
		boss_vigilante_revolver()
		break
	case states.mach1:
		grav = 0.5
		boss_vigilante_mach1()
		break
	case states.crouchslide:
		grav = 0.5
		boss_vigilante_crouchslide()
		break
	case states.machslide:
		grav = 0.5
		boss_vigilante_machslide()
		break
	case states.bump:
		grav = 0.5
		state_boss_bump()
		break
	case states.jump:
		grav = 0.5
		boss_vigilante_jump()
		break
	case states.dynamite:
		grav = 0.5
		boss_vigilante_dynamite()
		break
	case states.charge:
		grav = 0.5
		boss_vigilante_charge()
		break
	case states.punch:
		grav = 0.5
		boss_vigilante_punch()
		break
	case states.boss_groundpunchstart:
		grav = 0.5
		boss_vigilante_groundpunchstart()
		break
	case states.freefallprep:
		grav = 0.5
		boss_vigilante_freefallprep()
		break
	case states.freefall:
		grav = 0.5
		boss_vigilante_freefall()
		break
	case states.freefallland:
		grav = 0.5
		boss_vigilante_freefallland()
		break
	case states.boss_millionpunch:
		grav = 0.5
		boss_vigilante_millionpunch()
		break
	case states.uppunch:
		grav = 0.5
		boss_vigilante_uppunch()
		break
	case states.handstandjump:
		grav = 0.5
		boss_vigilante_handstandjump()
		break
	case states.boss_superattackstart:
		grav = 0.5
		boss_vigilante_superattackstart()
		break
	case states.boss_superattack:
		grav = 0.5
		boss_vigilante_superattack()
		break
	case states.walk:
		grav = 0.5
		state_boss_walk(boss_vigilante_decide_attack)
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
		normalattack_cooldown = normalattack_max[(phase - 1)]
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

if (hitstate == states.boss_superattack or state == states.boss_superattack)
{
	with (lastplayerid)
	{
		if (state != states.hit && state != states.thrown)
		{
			if (sprite_index == spr_player_pistolshot && image_index > (image_number - 1))
				sprite_index = spr_player_pistolidle
			if (sprite_index != spr_player_pistolshot && sprite_index != spr_idle && other.state == states.boss_superattack && other.duel_buffer > 0)
				sprite_index = spr_idle
		}
	}
}
attacking = (state == states.revolver or state == states.mach1 or state == states.charge or state == states.punch or state == states.boss_groundpunchstart or state == states.boss_millionpunch or state == states.freefall or state == states.uppunch or state == states.handstandjump or state == states.boss_superattack or state == states.boss_superattackstart or state == states.crouchslide)
