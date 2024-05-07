var mh_id = other.id
with (playerid)
{
	if (state != states.morthook)
	{
		state = states.morthook
		morthookID = mh_id
		tauntstoredmovespeed = movespeed
		movespeed = 12
		jumpstop = 0
		instance_destroy(other)
	}
}
