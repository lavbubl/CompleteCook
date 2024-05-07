prevclosed = closed
var _closed = 0
if (!graffiti)
{
	with (obj_player)
	{
		if (check_player_coop() && x > other.bbox_right)
		{
			_closed = 1
			if (!other.closed)
				other.closed = 1
		}
	}
	if (!_closed)
	{
		with (obj_player)
		{
			if (check_player_coop() && x < other.bbox_left)
				other.closed = 0
		}
	}
}
else
	closed = 0
if (prevclosed != closed)
{
	if closed
	{
		with (obj_factorygate)
		{
			state = states.transitioncutscene
			sprite_index = spr_arenagate_close
			image_index = 0
		}
	}
	else
	{
		with (obj_factorygate)
		{
			state = states.transitioncutscene
			sprite_index = spr_arenagate_open
			image_index = 0
		}
	}
}
