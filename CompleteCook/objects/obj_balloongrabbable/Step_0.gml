if (cooldown > 0)
{
	cooldown--
	active = false
}
else if (!active)
{
	active = 1
	create_particle(x, y, particle.genericpoofeffect, 0)
}
visible = active
