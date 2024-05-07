if (escape == false or (escape == true && global.panic == true))
{
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = spr_meatball_dead
}
