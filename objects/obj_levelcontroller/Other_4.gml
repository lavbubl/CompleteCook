if global.secret
{
	with obj_collect
		create_ghost_obj()
	with obj_bigcollect
		create_ghost_obj()
}

if room != global.start_room && !killed_enemy
	global.combo.wasted = true
