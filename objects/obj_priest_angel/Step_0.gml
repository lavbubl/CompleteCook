var _x = obj_player.x
var _y = obj_player.y - 60
var acc = 0.1

if follow
{
	x = lerp(x, _x, acc)
	y = lerp(y, _y, acc)
	
	if point_distance(x, y, _x, _y) < 8 && alarm[0] == -1
	    alarm[0] = 50
}
