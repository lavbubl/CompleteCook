enter_door.update(global.keybinds.up);

var canenter = (ds_list_find_index(global.ds_saveroom, id) != -1 || other.haskey) && scr_can_enter_door(other.state)

if (other.bbox_bottom <= bbox_bottom + 1 && other.bbox_bottom >= bbox_bottom - 1 && enter_door.check && canenter)
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
