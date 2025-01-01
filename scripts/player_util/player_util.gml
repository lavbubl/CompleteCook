function anim_ended()
{
	return image_index + image_speed >= image_number
}

function do_groundpound()
{
	if (key_down.pressed)
	{
		state = states.groundpound
		sprite_index = spr_player_bodyslamstart
		image_index = 0
		vsp = -6
	}
}
