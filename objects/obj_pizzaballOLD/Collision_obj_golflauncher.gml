if (state == states.golf)
	exit;
hsp = (14 * other.image_xscale)
image_xscale = other.image_xscale
movespeed = 14
vsp = 0
kicked = 1
other.image_index = 0
other.sprite_index = spr_goblinbot_kick
var _max = 45
y = (other.y - _max)
thrown = true
with (obj_camera)
{
	follow_golf = 1
	targetgolf = other.id
}
