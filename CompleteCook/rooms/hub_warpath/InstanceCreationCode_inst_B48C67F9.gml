if (global.kidspartycutscene == -4)
	global.kidspartycutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "kidsparty", 0)
if (!global.kidspartycutscene)
	instance_destroy()
if (global.ghostsoldiercutscene == -4)
	global.ghostsoldiercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "ghostsoldier", 0)
if global.ghostsoldiercutscene
	poweredon = 1
vmovespeed = 0
hmovespeed = 4
hscale = -1
active = 0
if (poweredon && obj_player1.x < (room_width / 2))
	active = 1
