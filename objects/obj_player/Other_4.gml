
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
				other.x += other.doorxscale * 64
				break;
			case fade_types.v_hallway:
				other.y += other.dooryscale * 128
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
							if (place_meeting(x + xscale, y, obj_solid))
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
			case fade_types.box:
				if (other.dooryscale == 1)
					other.y += 15
				other.state = states.normal
				break;
		}
	}
	else
		state = states.normal
}
