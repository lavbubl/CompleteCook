if (obj_player1.state != states.ghost)
{
	targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
	var _g = distance_to_point(targetplayer.x, targetplayer.y)
	if (_g < 150)
		movespeed = 2
	else if (_g < 300)
		movespeed = 3
	else if (_g < 450)
		movespeed = 7
	else
		movespeed = 11
	var _d = point_direction(x, y, targetplayer.x, targetplayer.y)
	hsp = lengthdir_x(movespeed, _d)
	vsp = lengthdir_y(movespeed, _d)
	image_xscale = (targetplayer.x != x ? sign((targetplayer.x - x)) : image_xscale)
}
else
{
	_d = point_direction(x, y, xstart, ystart)
	hsp = lengthdir_x(10, _d)
	vsp = lengthdir_y(10, _d)
	image_xscale = (xstart != x ? sign((xstart - x)) : image_xscale)
}
x += hsp
y += vsp
