get_input()

var canenter = ds_list_find_index(global.ds_saveroom, id) != -1 || other.haskey

if (other.bbox_bottom <= bbox_bottom + 1 && other.bbox_bottom >= bbox_bottom - 1 && key_up.down && other.state != states.actor && canenter)
{
	var enterspr = spr_player_enterkeydoor
	
	if other.haskey
	{
		image_index++
		other.haskey = false
		scr_sound(sfx_unlock)
		ds_list_add(global.ds_saveroom, id)
		instance_create(x, y, obj_lockdebris)
	}
	else
	{
		enterspr = spr_player_lookdoor
		scr_sound(sfx_door)
		do_fade(t_room, t_door, fade_types.door)
	}
	
	with other
	{
		reset_anim(enterspr)
		state = states.actor
		hsp = 0
		movespeed = 0
		image_speed = 0.35
	}
}

if (other.sprite_index = spr_player_lookdoor || other.sprite_index = spr_player_enterkeydoor)
	other.x = approach(other.x, x + sprite_width / 2, 2)
