if spawn
{
	with (instance_create(x, y, content))
	{
		santaID = other.baddieID
		switch object_index
		{
			case obj_spike:
				fake = 1
				y -= 32
				break
			
			default:
				if scr_solid(x, y)
				{
					var old_y = y
					while scr_solid(x, y)
					{
						y--
						if (abs((old_y - y)) > room_height)
						{
							y = old_y
							break
						}
						else
							continue
					}
				}
				break
		}
	}
}
