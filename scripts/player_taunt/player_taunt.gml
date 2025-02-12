function player_taunt()
{
	hsp = 0
	vsp = 0
	if (taunttimer <= 0)
	{
		state = prev.state
		vsp = prev.vsp + grav
		sprite_index = prev.sprite_index
	}
}