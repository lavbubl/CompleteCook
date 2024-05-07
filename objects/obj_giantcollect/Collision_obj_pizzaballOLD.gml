global.heattime = 60
with (obj_camera)
	healthshaketime = 120
scr_soundeffect(sfx_collectgiantpizza)
global.collect += 1000
var _x = (x - 48)
var _y = (y - 48)
var _xstart = _x
for (var yy = 0; yy < 4; yy++)
{
	for (var xx = 0; xx < 4; xx++)
	{
		create_collect(_x, _y, choose(1563, 1559, 2709, 1561))
		_x += 16
	}
	_x = _xstart
	_y += 16
}
with (instance_create((x + 16), y, obj_smallnumber))
	number = string(1000)
instance_destroy()
