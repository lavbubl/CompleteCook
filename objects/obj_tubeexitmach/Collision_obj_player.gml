if (playerid > -1)
	exit;
if (state != states.normal)
	exit;
if (other.state == states.hurt)
	exit;
if (other.state == states.gotoplayer)
	exit;
if (object_index != obj_tubeenter && other.state != states.tube)
	exit;
var _offset_x = (32 * image_xscale)
var _offset_y = (14 * image_yscale)
with (other)
{
	if (other.object_index == obj_tubeenter && other.stored_spd == 0)
	{
		if (abs(hsp) < other.movespeed)
			hsp = other.movespeed
		if (abs(vsp) < other.movespeed)
			vsp = other.movespeed
		other.stored_spd = max(abs(hsp), abs(vsp))
		trace(other.stored_spd)
	}
	state = states.tube
	hsp = 0
	movespeed = 0
	vsp = 0
	tube_vsp = 0
	x = Approach(x, (other.xstart + _offset_x), other.approach_spd)
	y = Approach(y, (other.ystart + _offset_y), other.approach_spd)
	if (y > (other.y + _offset_y))
		tube_vsp = (-other.approach_spd)
}
if (floor(other.x) == (xstart + _offset_x) && floor(other.y) == (ystart + _offset_y))
{
	other.x = (xstart + _offset_x)
	other.y = (ystart + _offset_y)
	image_index = 0
	playerid = other.id
	image_speed = 0.5
	other.state = states.tube
	other.tube_vsp = 0
	state = states.tube
}
