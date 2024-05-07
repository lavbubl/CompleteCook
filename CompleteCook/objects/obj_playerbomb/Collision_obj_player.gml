if ((!kick) && countdown <= 0)
{
	other.vsp = -14
	other.jumpstop = 1
	if (other.state == states.jump)
	{
		other.sprite_index = other.spr_stompprep
		other.image_index = 0
		other.jumpAnim = 1
	}
	countdown = 10
	scr_soundeffect(sfx_stompenemy)
	create_particle(x, y, particle.jumpdust, 0)
}
