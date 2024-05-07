event_inherited()
dmg = 10
col_buffer = 0
col_max = 10
function player_hurt(argument0, argument1)
{
	if ((!collisioned) && argument1.state != states.arenaround)
	{
		col_buffer = col_max
		SUPER_player_hurt(argument0, argument1)
	}
	exit;
}

