if (global.timeattack == 1 && stop == 0)
{
	global.taseconds += 1
	if (global.collect >= 5)
		global.collect -= 5
	if instance_exists(obj_player2)
	{
		if (global.collectN >= 5)
			global.collectN -= 5
	}
	if (global.taseconds > 59)
	{
		global.taseconds = 0
		global.taminutes += 1
	}
}
alarm[1] = 60
