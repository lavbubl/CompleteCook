get_input()

if (other.bbox_bottom <= bbox_bottom + 1 && other.bbox_bottom >= bbox_bottom - 1 && key_up.down && other.state != states.actor)
{
	with (other)
	{
		reset_anim(spr_player_lookdoor)
		state = states.actor
		hsp = 0
		movespeed = 0
		image_speed = 0.35
	}
	if !obj_fade.fade 
		scr_sound(sfx_door)
	do_fade(t_room, t_door, fade_types.door)
}

if (other.sprite_index = spr_player_lookdoor)
	other.x = approach(other.x, x + sprite_width / 2, 2)
