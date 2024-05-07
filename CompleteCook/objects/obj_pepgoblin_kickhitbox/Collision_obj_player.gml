with (other)
{
	if scr_transformationcheck()
	{
		if (instance_exists(other.baddieID) && sprite_index != spr_tumbleend && state != states.tumble && state != states.knightpep && state != states.knightpepslopes && state != states.parry)
		{
			scr_losepoints()
			state = states.tumble
			xscale = other.baddieID.image_xscale
			movespeed = 10
			vsp = 0
			sprite_index = spr_tumble
			if (other.baddieID.object_index == obj_pepbat)
				other.baddieID.hit = 1
		}
	}
}
