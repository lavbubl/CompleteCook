if ds_list_find_index(global.ds_saveroom, id) == -1
	exit;

if (obj_player.visual_size < 1 && state == 1)
	do_hold_player(false)
else if state == 1
{
	state++
	with obj_player
	{
		state = states.groundpound
		movespeed = 0
		vsp = 10
	}
}
