if (ds_list_find_index(global.ds_dead_enemies, id) != -1 || ds_list_find_index(global.ds_escapesaveroom, id) != -1)
{
	do_particles = false
	instance_destroy()
	exit;
}

var _margin = 400
if (x > room_width + _margin ||
	x < -_margin ||
	y > room_height + _margin ||
	y < -_margin)
	instance_destroy()
