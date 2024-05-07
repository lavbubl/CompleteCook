if (!active)
{
	active = 1
	sprite_index = spr_checkpoint_activating
	image_index = 0
	with (obj_player)
	{
		roomstartx = (other.x + 6)
		roomstarty = (other.y - 46)
	}
}
