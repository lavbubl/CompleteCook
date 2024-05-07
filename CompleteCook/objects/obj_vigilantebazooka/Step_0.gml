hsp = spd * image_xscale
vsp = spd
x += hsp
y += vsp
if (scr_solid(x, y + sign(vsp)) or place_meeting(x, y, obj_platform) or scr_solid_slope(x, y))
	instance_destroy()

