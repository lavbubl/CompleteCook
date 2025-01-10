create_image = false
pause = false
pause_image = spr_null
ini_open("globalsave.ini")
global.fullscreen = ini_read_real("options", "fullscreen", false)
ini_close()
