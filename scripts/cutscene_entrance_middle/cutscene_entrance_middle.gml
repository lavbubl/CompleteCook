function cutscene_entrance_middle()
{
	with (obj_solidpillar)
	{
		destroy = 1
		instance_destroy()
	}
	cutscene_end_action()
	exit;
}

