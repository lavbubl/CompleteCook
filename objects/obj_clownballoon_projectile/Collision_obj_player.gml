if (other.clowntimer <= 0)
{
	instance_create(x, y, obj_genericpoofeffect)
	other.movespeed = 10
	other.state = states.mach2
	other.skateboarding = 1
	other.clowntimer = 150
}
