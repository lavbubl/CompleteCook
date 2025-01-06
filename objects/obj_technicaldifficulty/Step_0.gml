if (state != 1)
{
	if (state == 0 && anim_ended())
	{
		state++
		alarm[0] = 80
		image_speed = 0
		t_ix = irandom(2)
		sprite_index = spr_techdiff_bg
	}
	if (state == 2 && round(image_index) == 0)
		instance_destroy()
}
