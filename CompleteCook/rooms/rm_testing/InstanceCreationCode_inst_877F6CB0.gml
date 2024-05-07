trigger = 7
func = function(argument0)
{
	if (!active)
	{
		if (following_count(obj_chickenfollow) >= 3)
		{
			active = 1
			instance_destroy(obj_chickenfollow)
		}
	}
	exit;
}

