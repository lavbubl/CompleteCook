// update input
key_up = obj_player.input.up;
key_down = obj_player.input.down;

var up = key_up.check
var down = key_down.check

var livemax = 15

if (live <= livemax)
	live++

with instance_place(x, y - (image_yscale * 16), obj_player)
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
			image_speed = 0.35
			reset_anim(spr_player_downpizzabox)
			scr_sound(sfx_box)
		}
		else if ((up || state == states.superjump || state == states.climbwall) && place_meeting(x, y - 10, other) && other.image_yscale == -1)
		{
			if state == states.climbwall
				scr_sound_3d(sfx_groundpound, x, y)
			dooryscale = -1
			state = states.actor
			hsp = 0
			vsp = 0
			movespeed = 0
			y = other.bbox_bottom - 1
			image_speed = 0.35
			reset_anim(spr_player_uppizzabox)
			scr_sound(sfx_box)
		}
	}
	
	if (sprite_index == spr_player_uppizzabox || sprite_index == spr_player_downpizzabox)
	{
		hsp = 0
		x = other.x + 32
		if (anim_ended() && image_speed != 0)
		{
			do_fade(other.t_room, other.t_door, fade_types.box)
			image_index = image_number - 1
			image_speed = 0
		}
	}
}

depth = (obj_player.sprite_index == spr_player_uppizzabox || obj_player.sprite_index == spr_player_downpizzabox) ? -1000 : 50