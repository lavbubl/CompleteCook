var _actor = 0
with (obj_player)
{
	if (state == states.actor)
		_actor = 1
}
if _actor
	exit;
with (other)
{
	if (key_up && grounded && (!instance_exists(obj_option)) && (state == states.normal or state == states.mach1 or state == states.mach2 or state == states.pogo or state == states.mach3 or state == states.Sjumpprep))
	{
		instance_create(x, y, obj_option)
		state = states.actor
	}
}
