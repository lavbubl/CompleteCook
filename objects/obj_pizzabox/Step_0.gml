get_input()

var up = key_up.down
var down = key_down.down

var livemax = 15

if (live <= livemax)
	live++

with (instance_place(x, y - image_yscale, obj_player))
{
	if (state != states.actor && other.live > livemax)
	{
		if ((down || state == states.groundpound) && place_meeting(x, y + 1, other) && other.image_yscale == 1)
		{
			dooryscale = 1
			state = states.actor
			hsp = 0
			vsp = 0
			movespeed = 0
			reset_anim(spr_player_downbox)
			image_speed = 0.35
		}
		
		if ((up || state == states.superjump) && place_meeting(x, y - 1, other) && other.image_yscale == -1)
		{
			dooryscale = -1
			state = states.actor
			hsp = 0
			vsp = 0
			movespeed = 0
			reset_anim(spr_player_upbox)
			image_speed = 0.35
			y = other.bbox_bottom + 18
		}
	}
	
	if (sprite_index == spr_player_upbox || sprite_index == spr_player_downbox)
	{
		hsp = 0
		x = other.x + 32
		if anim_ended()
		{
			do_fade(other.t_room, other.t_door, fade_types.box)
			image_index = image_number - 1
			image_speed = 0
		}
	}
}

depth = (obj_player.sprite_index == spr_player_upbox || obj_player.sprite_index == spr_player_downbox) ? -1000 : 50