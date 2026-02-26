if state == states.normal
{
	global.combo.timer = 60
	
	with instance_create(x, adjusted_y, obj_collect_number)
		num = other.scoretogive
	
	with obj_tv
		tv_expression(spr_tv_collect)
	
	scr_sound(sfx_collectbig)
	
	sprite_index = throwspr;
	image_index = 0;
	alarm[0] = 50;
	showtext = true;
	state = states.throwing
}
