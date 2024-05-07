event_inherited()
dmg = 30
spd = 25
parryable = 1
function player_hurt(argument0, argument1)
{
	if (!collisioned)
	{
		var prevstate = argument1.state
		SUPER_player_hurt(argument0, argument1)
		argument1.xscale = (-image_xscale)
		argument1.hitxscale = (-image_xscale)
		if (prevstate == states.boss_superattack)
		{
			argument1.hithsp = 0
			argument1.hitvsp = 0
			argument1.hitstate = states.boss_superattack
			with (obj_vigilanteboss)
				duel_buffer = (duel_max + irandom(duel_random))
		}
	}
	exit;
}

function parry()
{
	var prevparried = parried
	SUPER_parry()
	if (prevparried != parried)
	{
		image_xscale *= -1
		dmg = 100
		spd = 30
	}
	exit;
}

