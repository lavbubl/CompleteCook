if !collected
{
	with other
	{
		state = states.actor
		hsp = 0
		vsp = 0
		fmod_studio_event_instance_oneshot_3d("event:/music/treasurefound", x, y)
		other.x = x
		other.y = y
	}
	alarm[0] = 150
	
	fmod_studio_system_set_parameter_by_name("sideline", 1)
	
	collected = true
}
