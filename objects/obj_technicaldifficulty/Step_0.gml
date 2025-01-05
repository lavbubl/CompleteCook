if (state != 1)
{
	if (state == 0 && round(image_index) == image_number - 1)
	{
		state = 1
		alarm[0] = 80
		image_speed = 0
		image_index = irandom(2)
		sprite_index = spr_techdiff
	}
	if (state == 2 && round(image_index) == 0)
		instance_destroy()
}
