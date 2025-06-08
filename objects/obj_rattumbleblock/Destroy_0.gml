if ds_list_find_index(global.ds_saveroom, id) == -1
{
	with instance_create(x, y, obj_enemycorpse)
		sprite_index = other.sprs.dead
	
	global.combo.count++
	global.combo.timer = 60
	
	var x1 = (x - sprite_xoffset) + (sprite_width / 2)
	var y1 = (y - sprite_yoffset) + (sprite_height / 2)
	
	repeat 3
		particle_create(x1, y1, particles.stars)
	particle_create(x1, y1, particles.bang)
	
	shake_camera(3, 3 / room_speed)
	scr_sound(sfx_killenemy)
	scr_sound(sfx_ratdead)
	ds_list_add(global.ds_saveroom, id)
}
