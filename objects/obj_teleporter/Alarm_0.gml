if instance_exists(obj_teleporterexit)
{
	with obj_teleporterexit
	{
		if warptag == other.warptag
		{
			var p = other.playerid
		
			p.x = self.x
			p.y = self.y - 14
		}
	}
	
	alarm[1] = 10
}
else
{
	with playerid
	{
		x = other.x
		y = other.x
		visible = true
		state = other.prev_state
		image_index = other.prev_ix
		warping = false
	}
}
