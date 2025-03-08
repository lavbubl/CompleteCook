scr_sound(sfx_collecttoppin)
instance_destroy()

with instance_create(x, y, obj_toppincollected)
{
	toppin = other.toppin
	switch (other.toppin)
	{
		case toppin_enum.shroom:
			sprite_index = spr_shroomtoppin_intro
			break;
		case toppin_enum.cheese:
			sprite_index = spr_cheesetoppin_intro
			break;
		case toppin_enum.tomato:
			sprite_index = spr_tomatotoppin_intro
			break;
		case toppin_enum.sausage:
			sprite_index = spr_sausagetoppin_intro
			break;
		case toppin_enum.pineapple:
			sprite_index = spr_pineappletoppin_intro
			break;
	}
}

global.score += 1000

with instance_create(x, y, obj_collect_number)
	num = 1000