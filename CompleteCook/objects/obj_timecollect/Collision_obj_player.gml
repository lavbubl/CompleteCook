if (other.state != states.gotoplayer)
{
	global.heattime = 60
	with (obj_camera)
		healthshaketime = 60
	scr_soundeffect(sfx_collectpizza)
	instance_destroy()
	var _number = 0
	if (global.fill <= 2500)
	{
		global.fill += 500
		_number = 500
	}
	else
	{
		_number = heat_calculate(50)
		global.collect += _number
	}
	create_collect(x, y, sprite_index, val)
	with (instance_create((x + 16), y, obj_smallnumber))
		number = string(_number)
}
