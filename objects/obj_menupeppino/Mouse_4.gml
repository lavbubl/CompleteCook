if painless || instance_exists(obj_options)
	exit;

vspeed = -2
sprite_index = spr_titlepep_punch
image_index = irandom(image_number - 1)
image_speed = 0
alarm[0] = 20

scr_sound(sfx_peppinopunch)
particle_create(mouse_x, mouse_y, particles.bang).depth = -200

repeat 2
	particle_create(mouse_x, mouse_y, particles.stars).depth = -200
