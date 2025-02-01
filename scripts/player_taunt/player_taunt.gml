function player_taunt()
{
	hsp = 0
	vsp = 0
	if (taunttimer <= 0)
	{
		state = prev.state
		hsp = prev.hsp
		vsp = prev.vsp
		sprite_index = prev.sprite_index
	}
}