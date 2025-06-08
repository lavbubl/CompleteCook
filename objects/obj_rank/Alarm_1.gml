room_goto(tower_1)
reset_level()
with obj_player
{
	x = return_location.x
	y = return_location.y
	spawn = noone
	state = states.actor
	room_goto(return_location.room)
	reset_anim(spr_player_walkfront)
}

instance_destroy()
