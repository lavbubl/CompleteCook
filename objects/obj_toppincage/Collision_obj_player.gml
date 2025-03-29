scr_sound(sfx_collecttoppin)
instance_destroy()

with instance_create(x, y, obj_toppincollected)
{
	toppin = other.toppin
	
	var toppin_global = global.level_data.toppins
	
	switch (other.toppin)
	{
		case toppin_enum.shroom:
			sprite_index = spr_shroomtoppin_intro
			toppin_global.shroom = true
			break;
		case toppin_enum.cheese:
			sprite_index = spr_cheesetoppin_intro
			toppin_global.cheese = true
			break;
		case toppin_enum.tomato:
			sprite_index = spr_tomatotoppin_intro
			toppin_global.tomato = true
			break;
		case toppin_enum.sausage:
			sprite_index = spr_sausagetoppin_intro
			toppin_global.sausage = true
			break;
		case toppin_enum.pineapple:
			sprite_index = spr_pineappletoppin_intro
			toppin_global.pineapple = true
			break;
	}
}

global.score += 1000
global.combo.timer = 60

with instance_create(x, y, obj_collect_number)
	num = 1000

with obj_tv
	tv_expression(spr_tv_collect)
