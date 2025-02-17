if other.key_up.pressed
{
	if (other.pal_select < 15)
		other.pal_select += 1
	else
		other.pal_select = 0
	ini_open("globalsave.ini")
	ini_write_real("game", "pal_select", obj_player.pal_select)
	ini_close()
}
