function scr_heatup()
{
	global.baddiespeed += 1
	if (global.stylethreshold == 2)
		global.baddiepowerup = 1
	if (global.stylethreshold >= 2)
	{
		global.baddierage = 1
		obj_heatafterimage.visible = true
	}
	with (obj_tv)
	{
		message = "HEAT UP!!"
		alarm[0] = 200
		showtext = 1
	}
	obj_stylebar.toggle = 1
	obj_stylebar.alarm[0] = 5
	exit;
}

