refresh--
if (refresh <= 0)
{
	image_speed = 0.35
	if (floor(image_index) == 5)
	{
		with (instance_create(x, (y - 20), obj_cheeseball))
		{
			image_xscale = other.image_xscale
			vsp = -5
		}
		refresh = 100
	}
}
