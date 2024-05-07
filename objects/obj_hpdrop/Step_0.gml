if (vsp < 20)
	vsp += grav
x += hsp
y += vsp
if (y > 640)
	instance_destroy()