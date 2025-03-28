if escape_frozen
{
	visible = false
	
	if (distance_to_object(obj_player) <= 500 && alarm[1] == -1 && global.panic.active)
	{
		create_effect(x, y - 20, spr_pillarenemyspawner)
		alarm[1] = 22
	}
	
	exit;
}

do_enemy_generics()
collide()
