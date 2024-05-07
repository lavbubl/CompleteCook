function scr_loophallway(argument0)
{
	if argument0.start
	{
		var yy = (y - argument0.y)
		var _per = (yy / argument0.sprite_height)
		with (obj_loophallway)
		{
			if (id != argument0.id && (!start))
			{
				other.x = (x + (sprite_width / 2))
				other.y = ((y + (sprite_height * _per)) - 1)
				if (other.object_index == obj_vigilanteboss)
					other.oldtargetspot = -4
			}
		}
	}
}
