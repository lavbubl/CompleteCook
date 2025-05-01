reset_level()

with obj_player
{
	spawn = noone
	state = states.backtohub
	vsp = 0
	sprite_index = spr_player_slipbanana1
	x = return_location.x
	y = return_location.y
	room_goto(return_location.room)
}

instance_create(0, 0, obj_fadevisual)
