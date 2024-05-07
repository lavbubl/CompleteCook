hsp = 0
vsp = 0
hsp_carry = 0
vsp_carry = 0
platformid = -4
grav = 0.5
grounded = false
event_inherited()
monsterid = 2
spr_dead = spr_monstertomato_dead
spr_intro = spr_puppet_intro
spr_introidle = spr_puppet_introidle
state = states.robotidle
inactivebuffer = 900
xs = (room_width / 2)
yy = -100
substate = states.fall
backgroundID = -4
var a = layer_get_all()
var lowestdepth = 10000
for (var i = 0; i < array_length(a); i++)
{
	var b = a[i]
	if (layer_get_element_type(b) == 1)
	{
		trace("layer background")
		if (layer_get_depth(b) < lowestdepth)
		{
			backgroundID = layer_background_get_id(b)
			lowestdepth = layer_get_depth(b)
			trace(lowestdepth)
		}
	}
}
trace(backgroundID)
trace(a)
