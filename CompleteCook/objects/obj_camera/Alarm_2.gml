if (global.timedgate == 1)
{
	global.timedgate = 0
	global.seconds = 30
	ded = 0
	alarm[2] = -1
}
if (global.miniboss == true)
{
	with (obj_player)
	{
		instance_create(x, y, obj_bangeffect)
		repeat (6)
			instance_create(x, y, obj_slapstar)
		state = states.ejected
		vsp = -10
		audio_stop_all()
		scr_soundeffect(mu_timesup)
	}
	alarm[2] = -1
	global.miniboss = false
}
