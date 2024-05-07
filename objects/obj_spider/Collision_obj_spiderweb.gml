if ((!other.active) && active && other.id == webID)
{
	other.active = 1
	active = 0
	create_particle(other.x, other.y, particle.genericpoofeffect, 0)
}
