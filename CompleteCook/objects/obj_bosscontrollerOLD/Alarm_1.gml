if (!fakedeath)
{
	scr_playerreset()
	with (obj_player)
	{
		if (object_index == obj_player1 or global.coop)
		{
			state = states.normal
			targetDoor = "A"
		}
	}
	gamesave_async_save()
	room = hub_mrstickarena
}
else
{
	extrarounds = 1
	round_count = 1
	round_max = extrarounds_count
	fakedeath = 0
	timer_buffer = timer_max
	state = states.arenaround
	fade = 1
	with (par_boss)
	{
		destroyed = 0
		destroyable = 1
		max_hp /= 2
		max_hp = floor(max_hp)
		hp = max_hp
		stunned = 0
		targetstunned = 0
		phase++
		phase = clamp(phase, 0, max_phase)
		state = states.arenaround
		vsp = -11
	}
}
