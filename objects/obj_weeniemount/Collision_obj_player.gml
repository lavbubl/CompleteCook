with (other)
{
	if (state == states.handstandjump or state == states.punch)
	{
		state = states.rideweenie
		movespeed = hsp
		sprite_index = spr_rideweenie
		xscale = other.image_xscale
		jumpstop = 1
		if (vsp < 0)
			vsp = 0
		instance_destroy(other)
	}
}
