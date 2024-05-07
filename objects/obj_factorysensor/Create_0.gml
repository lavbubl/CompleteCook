closed = 0
graffiti = 0
if (global.factorygraffiti == -4)
	global.factorygraffiti = quick_ini_read_real(get_savefile_ini(), "cutscene", "factorygraffiti", 0)
if (global.graffiticutscene == -4)
	global.graffiticutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "graffiti", 0)
if global.factorygraffiti
	graffiti = 1
