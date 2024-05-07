with (obj_collect)
{
	if place_meeting(x, y, other)
	{
		image_speed = 0.35
		image_alpha = 1
	}
}
if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat (6)
		create_debris((x + 32), (y + 32), spr_icedebris)
	instance_create((x + 32), (y + 32), obj_parryeffect)
	var val = heat_calculate(10)
	if (other.object_index == obj_player1)
		global.collect += val
	else
		global.collectN += val
	with (instance_create((x + 16), y, obj_smallnumber))
		number = string(val)
	global.heattime += 10
	global.heattime = clamp(global.heattime, 0, 60)
	global.combotime += 10
	global.combotime = clamp(global.combotime, 0, 60)
	ds_list_add(global.saveroom, id)
}
scr_destroy_tiles(32, "Tiles_1")
scr_destroy_tiles(32, "Tiles_2")
scr_destroy_tiles(32, "Tiles_3")
