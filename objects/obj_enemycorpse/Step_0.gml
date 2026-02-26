x += hsp
y += vsp
vsp += grav

if !bbox_in_camera()
	instance_destroy()
