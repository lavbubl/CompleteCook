if (!cutscene)
{
	instance_create(x, y + 32, obj_genericpoofeffect)
	cutscene = true
	image_speed = 0.35
	alarm[0] = 65
	alarm[1] = 180
	with (other)
	{
		sprite_index = spr_idle
		state = states.actor
		visible = false
	}
}
with (other)
{
	image_index = 0
	hsp = 0
	vsp = 0
	movespeed = 0
}