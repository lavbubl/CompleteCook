with obj_player
{
	state = states.actor
	reset_anim(spr_player_walkfront)
}

ini_open(global.savestring)

with obj_timer
{
	level_timer = 0
	file_timer = ini_read_real("General", "file_timer", 0)
}

ini_close()
