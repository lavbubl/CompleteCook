room_goto(tower_1)
reset_level()
with obj_player
{
	spawn = noone
	x = return_location.x
	y = return_location.y
	room_goto(return_location.room)
	state = states.actor
	reset_anim(spr_player_exitdoor)
}

instance_destroy()
