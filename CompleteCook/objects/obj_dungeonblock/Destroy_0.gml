if destroy
{
	global.ruincutscene3 = 1
	quick_ini_write_real(get_savefile_ini(), "cutscene", "ruin3", 1)
	repeat (4)
		create_debris((x + 32), (y + 32), spr_bombdebris)
}
