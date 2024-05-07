if obj_player1.key_up2
{
	if (obj_player1.paletteselect < 15)
		obj_player1.paletteselect += 1
	else
		obj_player1.paletteselect = 1
	quick_ini_write_real(get_savefile_ini(), "Game", "paletteselect", obj_player1.paletteselect)
}
