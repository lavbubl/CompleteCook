if (sprite_index == spr_player_enterdoor || sprite_index == spr_player_startgate || sprite_index == spr_player_enterkeydoor)
{
	reset_anim(spr_player_exitdoor)
	image_speed = 0.35
}

with obj_spawnpoint
{
	if other.spawn == spawn
	{
		other.x = x
		other.y = y - 14
		switch (other.door_type)
		{
			case fade_types.hallway:
				other.x += other.doorxscale * 64
				break;
			case fade_types.v_hallway:
				other.y += other.dooryscale * 128
				if other.wasclimbingwall
				{
					other.wasclimbingwall = false
					var w = 0
					var m = 100
					while (w < m)
					{
						w++
						with other
						{
							if place_meeting(x + xscale, y, obj_solid)
								w = m
							else
								x += xscale
						}
					}
					other.state = states.climbwall
				}
				break;
			case fade_types.door:
				if !place_meeting(x, y, obj_exitgate)
					other.x += sprite_width / 2
				break;
			case fade_types.box:
				with (obj_player)
				{
					if place_meeting(x, y - 1, obj_pizzabox)
						y += 10
					state = states.normal
				}
				break;
		}
	}
	else
		state = states.normal
}

if (secret_exit && !instance_exists(obj_secretportal_exit))
{
	x = obj_secretportal.x
	y = obj_secretportal.y
	secret_cutscene = false
	secret_exit = false
}

if (state == states.hold || state == states.swingding)
	state = states.normal

other.xstart = other.x
other.ystart = other.y

	
if state = states.backtohub
	y -= screen_h * 2
