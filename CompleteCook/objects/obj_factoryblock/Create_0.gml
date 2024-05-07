destroy = 0
if (global.factoryblock == -4)
	global.factoryblock = quick_ini_read_real(get_savefile_ini(), "cutscene", "factoryblock", 0)
if global.factoryblock
{
	destroy = 0
	instance_destroy()
}
