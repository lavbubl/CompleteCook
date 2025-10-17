with obj_player
{
	var kill = false
	if (state == states.mach3 && place_meeting(x + hsp + xscale, y, other))
		kill = true
	else if (state == states.groundpound && freefallsmash >= 10 && place_meeting(x, y + vsp + 1, other))
	{
		kill = true
		grounded = true
	}
	else if (state == states.piledriver && vsp >= 10 && place_meeting(x, y + vsp + 1, other))
	{
		kill = true
		grounded = true
	}
		
	if kill
		instance_destroy(other)
}
