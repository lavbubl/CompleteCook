if (!use_gravity)
{
	hsp = 0
	vsp = 0
}
if use_collision
{
	event_inherited()
	if (grounded && vsp > 0)
		noisethrow = 0
}
else
{
	x += hsp
	y += vsp
	if (vsp < 20)
		vsp += grav
	thrown = false
	noisethrow = 0
	if (y > (room_height + 100))
	{
		use_collision = 1
		use_gravity = 0
		x = xstart
		y = ystart
	}
}
