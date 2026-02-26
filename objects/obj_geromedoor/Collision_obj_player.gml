enter_door.update(global.keybinds.up);

var canenter = (ds_list_find_index(global.ds_saveroom, id) != -1 || other.hasgerome) && scr_can_enter_door(other.state)

if (other.bbox_bottom <= bbox_bottom + 1 && other.bbox_bottom >= bbox_bottom - 1 && enter_door.check && canenter)
{
	var enterspr = spr_player_enterkeydoor
	
	if other.hasgerome
	{
		image_index++
		other.hasgerome = false
		scr_sound(sfx_unlock)
		ds_list_add(global.ds_saveroom, id)
		instance_create(obj_player.x, obj_player.y, obj_geromeopendoor)
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
		
		if other.t_room = treasure_room
		{
			prev_g_room = room
			prev_g_door = other.t_door
		}
	}
}
