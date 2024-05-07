if (global.dungeoncutscene == -4)
	global.dungeoncutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "dungeon", 0)
if global.dungeoncutscene
{
	destroy = 0
	instance_destroy()
}
