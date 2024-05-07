targetRoom = hub_pub
locked = 1
if (global.pubcutscene == -4)
	global.pubcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "pub", 0)
if global.pubcutscene
	locked = 0
