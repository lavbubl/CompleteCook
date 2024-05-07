with (other)
{
	if (other.hurtplayer == 0)
	{
		if key_jump2
		{
			vsp = -20
			if (state == states.normal or state == states.jump or hsp == 0)
			{
				sprite_index = spr_playerV_superjump
				state = states.jump
			}
			image_index = 0
			jumpAnim = 1
			jumpstop = 1
			other.hurtplayer = 1
		}
	}
}
