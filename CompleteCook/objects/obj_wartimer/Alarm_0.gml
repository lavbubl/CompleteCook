seconds--
alarm[0] = 60
if (seconds < 0)
{
	if (minutes > 0)
	{
		minutes--
		seconds = 59
	}
	else
	{
		seconds = 0
		if (room != rank_room)
		{
			alarm[1] = 60
			alarm[0] = -1
		}
	}
}
