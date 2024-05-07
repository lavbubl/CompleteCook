sprite_index = spr_mrstick_idle
dialog = [dialog_create("alright lets fight", -4, function()
{
	if (!global.mrstickcutscene2)
	{
		global.mrstickcutscene2 = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "mrstick2", 1)
	}
	exit;
}
)]
if (global.mrstickcutscene1 == -4)
	global.mrstickcutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "mrstick1", 0)
if (!global.mrstickcutscene1)
	instance_destroy()
if (global.mrstickcutscene2 == -4)
	global.mrstickcutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "mrstick2", 0)
if global.mrstickcutscene2
	instance_destroy()
