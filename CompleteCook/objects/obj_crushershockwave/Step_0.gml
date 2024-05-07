x += movespeed
if (scr_solid(x, y) or (!grounded))
	instance_destroy()
