if (global.hardmode && (!((room == strongcold_endscreen or room == rank_room or room == timesuproom or room == Realtitlescreen or room == characterselect))))
{
	if (!instance_exists(obj_hardmode_ghost))
		instance_create(obj_player1.x, obj_player1.y, obj_hardmode_ghost)
}
