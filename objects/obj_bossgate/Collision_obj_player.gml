if !instance_exists(obj_gatehats) && save_exists
{
	with (instance_create(x, y - 250, obj_gatehats))
	{
		hats = other.hats
		extrahats = other.extrahats
		rank_index = other.rank
	}
}
