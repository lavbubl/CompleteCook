with (other)
{
	vsp = Approach(vsp, -5, 5)
	jumpstop = 1
	if (state == states.machslide)
	{
		state = states.jump
		if (sprite_index == spr_mach3boost or sprite_index == spr_machslideboost)
			xscale *= -1
		sprite_index = spr_machfreefall
	}
}
