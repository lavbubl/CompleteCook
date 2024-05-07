if (invtime <= 0)
{
	invtime = 15
	hp--
	scr_soundeffect(sfx_punch)
}
instance_destroy(other)
