if (other.state != states.gotoplayer)
{
	global.heattime = 60
	with (obj_camera)
		healthshaketime = 120
	scr_soundeffect(sfx_collectgiantpizza)
	var val = heat_calculate(1000)
	if (other.object_index == obj_player1)
		global.collect += val
	else
		global.collectN += val
	if (global.bullet < 3)
		global.bullet += 1
	var _x = (x - 48)
	var _y = (y - 48)
	var _xstart = _x
	for (var yy = 0; yy < 4; yy++)
	{
		for (var xx = 0; xx < 4; xx++)
		{
			create_collect(_x, _y, (obj_player1.ispeppino ? choose(1563, 1559, 2709, 1561) : choose(2080, 2082, 2086, 2087, 2088)))
			_x += 16
		}
		_x = _xstart
		_y += 16
	}
	with (instance_create((x + 16), y, obj_smallnumber))
		number = string(val)
	instance_destroy()
	if (secret && (!instance_exists(obj_fadeout)))
	{
		with (obj_player)
		{
			targetRoom = lastroom
			targetDoor = "S"
		}
		instance_create(x, y, obj_fadeout)
	}
}
