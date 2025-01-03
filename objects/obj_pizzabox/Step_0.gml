get_input()

var up = key_up.down
var down = key_down.down
live++

with (obj_player)
{
	if (state != states.actor && other.live > 5)
	{
		if ((down || state == states.groundpound) && place_meeting(x, y + 1, other) && other.image_yscale == 1)
		{
			dooryscale = 1
			state = states.actor
			reset_anim(spr_player_downbox)
			image_speed = 0.35
		}
		
		if ((up || state == states.superjump) && place_meeting(x, y - 1, other) && other.image_yscale == -1)
		{
			dooryscale = -1
			state = states.actor
			reset_anim(spr_player_upbox)
			image_speed = 0.35
		}
	}
	
	if (sprite_index == spr_player_upbox || sprite_index == spr_player_downbox)
	{
		hsp = 0
		x = other.x
		if anim_ended()
		{
			do_fade(other.t_room, other.t_door, fade_types.box)
			image_speed = 0
		}
	}
}