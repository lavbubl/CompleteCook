if obj_player.visual_size < 1
	do_hold_player(false)
else if state == 0
{
	state++
	with obj_player
	{
		state = states.groundpound
		movespeed = 0
		vsp = 10
	}
}
