if (place_meeting(x, y, other) && other.state != states.tumble && other.state != states.backbreaker && other.state != states.bump && other.y > other.yprevious && other.y < y)
{
	if (!other.isgustavo)
	{
		other.y = (y - 49)
		other.state = states.grind
	}
	else if (other.state != states.ratmountgrind)
	{
		with (other)
		{
			if (brick == 1)
			{
				with (instance_create(x, y, obj_brickcomeback))
					wait = 1
			}
			brick = 0
		}
		other.y = (y + 8)
		other.state = states.ratmountgrind
	}
}
