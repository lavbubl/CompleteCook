locked = 1
targetRoom = hub_superpinball
if (global.superpinballcutscene == -4)
	global.superpinballcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "superpinball", 0)
if global.superpinballcutscene
	locked = 0
