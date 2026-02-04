switch global.windowmode
{
	case 0:
		gameframe_set_fullscreen(0)
		var _split = string_split(global.res_strings[global.chosen_res], "X")
		window_set_size(real(_split[0]), real(_split[1]))
		window_center()
		break;
	case 1:
		gameframe_set_fullscreen(1)
		break;
	case 2:
		gameframe_set_fullscreen(2)
		break;
}

quick_ini_write_real("globalsave.ini", "options", "windowmode", global.windowmode)
