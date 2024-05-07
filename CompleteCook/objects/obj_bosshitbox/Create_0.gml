collisioned = 0
dmg = 30
parryable = 0
parried = 0
team = 1
function SUPER_player_hurt(argument0, argument1)
{
	if ((!collisioned) && argument1.state != states.arenaround)
	{
		if instance_exists(obj_bosscontroller)
			obj_bosscontroller.player_hp -= argument0
		collisioned = 1
		with (argument1)
		{
			scr_soundeffect(sfx_killingblow)
			var lag = 8
			if (state == states.chainsaw or state == states.hit)
			{
				x = hitX
				y = hitY
			}
			hitLag = lag
			hitX = x
			hitY = y
			xscale = (x != other.x ? sign((other.x - x)) : other.image_xscale)
			hitxscale = (x != other.x ? sign((other.x - x)) : other.image_xscale)
			sprite_index = spr_hurt
			hithsp = 15
			hitstunned = 100
			hitvsp = -8
			state = states.hit
			instance_create(other.x, other.y, obj_parryeffect)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			instance_create(x, y, obj_baddiegibs)
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
		}
	}
	exit;
}

function SUPER_parry()
{
	if (!parried)
	{
		team = 0
		parried = 1
	}
	exit;
}

function SUPER_boss_hurt(argument0)
{
	if ((!collisioned) && team != argument0.team)
	{
		with (argument0)
			boss_hurt_noplayer(other.dmg)
		collisioned = 1
	}
	exit;
}

function boss_hurt(argument0)
{
	SUPER_boss_hurt(argument0)
	exit;
}

function parry()
{
	SUPER_parry()
	exit;
}

function player_hurt(argument0, argument1)
{
	SUPER_player_hurt(argument0, argument1)
	exit;
}

