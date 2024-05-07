if (followID != noone)
{
	if instance_exists(followID)
	{
		x = followID.x
		y = followID.y
	}
	else
		instance_destroy()
}
