if (state != states.grabbing && x == xstart && y == ystart)
{
	with (other)
	{
		if (state != states.chainsaw)
		{
			tauntstoredmovespeed = movespeed
			tauntstoredvsp = vsp
			tauntstoredsprite = sprite_index
			tauntstoredstate = state
		}
		state = states.bump
		if (boxxed == 0)
			sprite_index = spr_player_catched
		else
			sprite_index = spr_boxxedpep_air
		other.playerid = id
		other.state = states.grabbing
	}
}
