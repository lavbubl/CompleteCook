ini_open(global.savestring)

var bn = global.level_data.boss_name

if ini_read_real(bn, "hats", 0) < player.hp
	ini_write_real(bn, "hats", player.hp)
if ini_read_real(bn, "extrahats", 0) < extrahats
	ini_write_real(bn, "extrahats", extrahats)
if ini_read_real(bn, "rank", 0) < player.hp - 1
	ini_write_real(bn, "rank", player.hp - 1)

ini_close()

room_goto(tower_1)
reset_level()

with obj_player
{
	x = return_location.x
	y = return_location.y
	spawn = noone
	state = states.actor
	room_goto(return_location.room)
	reset_anim(spr_playerP_walkfront)
}
