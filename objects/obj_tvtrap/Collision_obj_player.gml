if (other.instakillmove or other.state == states.handstandjump)
{
	with (other)
	{
		scr_pummel()
		instance_destroy(other)
	}
}
