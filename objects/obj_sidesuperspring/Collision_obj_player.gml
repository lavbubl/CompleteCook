with (other)
{
	if (state != states.gotoplayer)
	{
		if (state == states.bombpepside or state == states.motorcycle or state == states.slipnslide or state == states.rocket or state == states.grind or state == states.tumble or state == states.cheeseball or state == states.knightpepslopes or state == states.machroll or state == states.mach3 or state == states.mach2)
		{
			other.sprite_index = spr_sidespringblock_bounce
			other.image_index = 0
			if (xscale != other.image_xscale)
				xscale = other.image_xscale
		}
	}
}
