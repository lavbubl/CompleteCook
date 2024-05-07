sprite_index = spr_gnome4_idle
if (global.chateauswap == -4)
	global.chateauswap = quick_ini_read_real(get_savefile_ini(), "cutscene", "chateauswap", 0)
dialog = [dialog_create("Abracadabra", -4, function()
{
	global.chateauswap = (!global.chateauswap)
	quick_ini_write_real(get_savefile_ini(), "cutscene", "chateauswap", global.chateauswap)
	exit;
}
)]
