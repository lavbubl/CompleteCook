if (!instance_exists(baddieid))
	refresh--
if (refresh <= 0)
{
	with (instance_create(x, y, content))
	{
		image_xscale = other.image_xscale
		other.baddieid = id
		defused = 1
		countdown = 50
	}
	refresh = 20
}
