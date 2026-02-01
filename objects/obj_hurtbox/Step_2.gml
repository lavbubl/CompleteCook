if instance_exists(follow_obj)
{
	x = follow_obj.x + off_x
	y = follow_obj.y + off_y //OFFY JUMPSCARE
	image_xscale = follow_obj.xscale
}
else
	instance_destroy()
