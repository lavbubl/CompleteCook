with (obj_player)
{
	if (character != "V")
	{
		if ((state == states.knightpepslopes or state == states.rocket) && (place_meeting((x + hsp), y, other) or place_meeting((x + xscale), y, other)))
			instance_destroy(other)
		with (other)
		{
			if (place_meeting(x, (y + 1), other) or place_meeting(x, (y - 1), other) or place_meeting((x - 1), y, other) or place_meeting((x + 1), y, other))
			{
				if (place_meeting(x, (y - 1), other) && (other.state == states.knightpep or other.state == states.hookshot))
				{
					instance_destroy()
					tile_layer_delete_at(1, x, y)
				}
			}
		}
	}
}
