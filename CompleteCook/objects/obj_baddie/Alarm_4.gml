with (create_afterimage(x, y, sprite_index, 0))
	image_xscale = other.image_xscale
if (grounded == true)
{
	with (instance_create(x, y, obj_dashcloud2))
		image_xscale = other.image_xscale
}
if (state == states.rage)
	alarm[4] = 5
