scr_getinput()
if (key_jump)
{
	switch (selected)
	{
		case -1:
			instance_destroy()
			obj_option.alarm[0] = 2
			break;
		case 0:
			global.option_fullscreen = !global.option_fullscreen
			window_set_fullscreen(global.option_fullscreen)
			break;
		case 1:
		case 2:
		case 3:
		case 4:
			global.option_resolution = selected - 1
			window_set_size(sizes[selected - 1][0], sizes[selected - 1][1])
			window_center()
			break;
	}
}
selected += (key_down2 - key_up2)
if selected > array_length(sizes)
	selected = -1
if selected < -1
	selected = array_length(sizes)
