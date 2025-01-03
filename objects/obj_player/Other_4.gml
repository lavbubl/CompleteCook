
if (sprite_index == spr_player_enterdoor)
	reset_anim(spr_player_exitdoor)
with (obj_spawnpoint)
{
	if (other.spawn == spawn)
	{
		other.x = x
		other.y = y - 15
		switch (other.door_type)
		{
			case fade_types.hallway:
				other.x += other.hallxscale * 64
				break;
			case fade_types.v_hallway:
				other.y += other.hallyscale * 128
				if (other.wasclimbingwall)
				{
					other.wasclimbingwall = false
					var w = 0
					var m = 100
					while (w < m)
					{
						w++
						with (other)
						{
							if (scr_solid(x + xscale, y))
								w = m
							else
								x += xscale
						}
					}
					other.state = states.climbwall
				}
				break;
			case fade_types.door:
				if (!place_meeting(x, y, obj_exitgate))
					other.x += sprite_width / 2
				break;
		}
	}
	else
		state = states.normal
}
