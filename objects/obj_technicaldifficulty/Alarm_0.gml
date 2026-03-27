state = 2
sprite_index = spr_techdiff_static
image_speed = -0.35
image_index = image_number - 1
fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/techdiffend", x, y)
with (obj_player)
{
	x = xstart
	y = ystart
	hsp = 0
	vsp = 0
	movespeed = 0
	state = states.normal
}
