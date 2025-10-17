if escape_frozen
{
	visible = false
	
	if (abs(obj_player.x - self.x) <= 500 && abs(obj_player.y - self.y) <= 100 && alarm[1] == -1 && global.panic.active)
	{
		with create_effect(x, y - 20, spr_pillarenemyspawner)
			image_speed = 0.5
		alarm[1] = 16
	}
	
	exit;
}

do_enemy_generics()
collide()
