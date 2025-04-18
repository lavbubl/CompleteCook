with other
{
	if key_up.pressed
	{
		if (pal_select < 15)
			pal_select += 1
		else
			pal_select = 0
		ini_open($"saves/saveData{global.savefile}.ini")
		ini_write_real("Clothes", "palette_index", pal_select)
		ini_write_real("Clothes", "pattern_sprite", pattern_spr)
		ini_close()
	}
}
