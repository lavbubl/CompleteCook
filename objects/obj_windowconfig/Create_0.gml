sizes = [
	[480, 270],
	[960, 540],
	[1440, 810],
	[1920, 1080]
]
selected = 0
depth = -100
function set_window_config() 
{
	ini_open("saveData.ini")
	ini_write_real("Option", "fullscreen", global.option_fullscreen)
	ini_write_real("Option", "resolution", global.option_resolution)
	ini_close()
}
