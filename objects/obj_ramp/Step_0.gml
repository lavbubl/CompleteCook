if used
	image_index = 1
else
	image_index = 0
var s = 16
if place_meeting(x, (y - s), obj_player)
{
	with (obj_player)
	{
		var by = 4
		if (state == states.mach3)
			by = 10
		var bx = 8
		if (state == states.mach3 or state == states.ratmounttumble)
			bx = 18
		if ((state == states.mach2 or state == states.ratmounttumble or state == states.trashroll or state == states.tumble or state == states.mach3 or state == states.trickjump) && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, (y + s), other))
		{
			vsp = -12
			movespeed = 14
			sprite_index = spr_player_rampjump
			image_index = 0
			if isgustavo
			{
				sprite_index = spr_player_ratmountwalljump
				state = states.ratmounttrickjump
			}
			else
				state = states.trickjump
			if (!other.used)
			{
				ramp = 1
				other.used = 1
			}
			ramp_buffer = 16
			trace("trickjump")
		}
	}
}
