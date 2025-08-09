image_alpha = clamp(image_alpha + (dying ? -0.025 : 0.025), 0, 1)
if image_alpha <= 0 && dying
	instance_destroy()

var spd = 10
if !obj_pause.pause
	hspeed = x >= (screen_w / 2) ? spd : -spd
else
	hspeed = 0
	
if y < 100
	dying = true
