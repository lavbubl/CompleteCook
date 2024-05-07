var _tank = id
var _baddie = other.id
with (_baddie)
{
	if (instance_exists(baddieID) && baddieID != other.id)
	{
		if (baddieID.state == states.stun && baddieID.thrown == true)
		{
			with (_tank)
				instance_destroy()
		}
	}
}
