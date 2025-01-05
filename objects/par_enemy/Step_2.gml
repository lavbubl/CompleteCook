if follow_player
{
	with (obj_player)
	{
		other.x = x
		other.y = y - 64
		if (sprite_index == spr_player_holdrise)
			other.y += floor(image_number - image_index) * 10
		other.state = e_states.grabbed
		if (key_down.down)
		{
			if grounded
			{
				state = states.normal
				with (other)
				{
					follow_player = false
					y = other.y
					state = e_states.stun
				}
			}
			//else
		}	
	}
}
