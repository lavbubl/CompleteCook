event_inherited()
dialog[0] = dialog_create("Stop right there fella, if you wanna get pass this point you're gonna have to beat me.")
dialog[1] = dialog_create("Not right here though. As I am not comfortable in this environment, pardon me.")
dialog[2] = dialog_create("Meet me at the Mr. Stick arena just east of here, and we can settle this.", -4, function()
{
	if (global.peppermancutscene1 == -4 or (!global.peppermancutscene1))
	{
		global.peppermancutscene1 = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "pepperman1", 1)
	}
	exit;
}
)
