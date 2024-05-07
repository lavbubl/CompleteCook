sprite_index = spr_soldier_walk
g_dialog[0] = [dialog_create("Don't have anything to do")]
g_dialog[1] = [dialog_create("The robot is busted", -4, function()
{
	if (!global.mrstickcutscene1)
	{
		global.mrstickcutscene1 = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "mrstick1", 1)
	}
	exit;
}
)]
g_dialog[2] = [dialog_create("The robot has no gasoline")]
g_dialog[3] = [dialog_create("Go right ahead", -4, function()
{
	if (!global.ghostsoldiercutscene)
	{
		global.ghostsoldiercutscene = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "ghostsoldier", 1)
	}
	with (obj_pizzamech)
		poweredon = 1
	exit;
}
)]
dialog_func = function()
{
	if (!global.kidspartycutscene)
		do_dialog(g_dialog[0])
	else if ((!global.mrstickcutscene1) or (!global.mrstickcutscene2) or (!global.mrstickcutscene3))
		do_dialog(g_dialog[1])
	else if (!global.gasolinecutscene)
		do_dialog(g_dialog[2])
	else
		do_dialog(g_dialog[3])
	exit;
}

if (global.kidspartycutscene == -4)
	global.kidspartycutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "kidsparty", 0)
if (global.mrstickcutscene1 == -4)
	global.mrstickcutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "mrstick1", 0)
if (global.mrstickcutscene2 == -4)
	global.mrstickcutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "mrstick2", 0)
if (global.mrstickcutscene3 == -4)
	global.mrstickcutscene3 = quick_ini_read_real(get_savefile_ini(), "cutscene", "mrstick3", 0)
if (global.gasolinecutscene == -4)
	global.gasolinecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "gasoline", 0)
if (global.chateaucutscene == -4)
	global.chateaucutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "chateau", 0)
if (!global.chateaucutscene)
	instance_destroy()
if (global.ghostsoldiercutscene == -4)
	global.ghostsoldiercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "ghostsoldier", 0)
if global.ghostsoldiercutscene
	instance_destroy()
