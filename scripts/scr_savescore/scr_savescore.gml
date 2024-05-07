function scr_savescore(level)
{
	if ((global.collect + global.collectN) >= global.srank)
	{
		global.rank = "s"
		if (scr_is_prank())
			global.rank = "p"
		if (global.snickchallenge == 1)
			global.SAGEsnicksrank = 1
	}
	else if ((global.collect + global.collectN) > global.arank)
		global.rank = "a"
	else if ((global.collect + global.collectN) > global.brank)
		global.rank = "b"
	else if ((global.collect + global.collectN) > global.crank)
		global.rank = "c"
	else
		global.rank = "d"
	audio_stop_sound(mu_pizzatime)
	audio_stop_sound(mu_chase)
	ini_open_from_string(obj_savesystem.ini_str)
	if (ini_read_real("Highscore", level, 0) < global.collect)
		ini_write_real("Highscore", level, global.collect)
	if (ini_read_real("Treasure", level, 0) == 0)
		ini_write_real("Treasure", level, global.treasure)
	if (global.secretfound > 3)
		global.secretfound = 3
	if (ini_read_real("Secret", level, 0) < global.secretfound)
		ini_write_string("Secret", level, global.secretfound)
	if (ini_read_real("Toppin", (level + "1"), 0) == 0)
		ini_write_real("Toppin", (level + "1"), global.shroomfollow)
	if (ini_read_real("Toppin", (level + "2"), 0) == 0)
		ini_write_real("Toppin", (level + "2"), global.cheesefollow)
	if (ini_read_real("Toppin", (level + "3"), 0) == 0)
		ini_write_real("Toppin", (level + "3"), global.tomatofollow)
	if (ini_read_real("Toppin", (level + "4"), 0) == 0)
		ini_write_real("Toppin", (level + "4"), global.sausagefollow)
	if (ini_read_real("Toppin", (level + "5"), 0) == 0)
		ini_write_real("Toppin", (level + "5"), global.pineapplefollow)
	scr_write_rank(level)
	obj_savesystem.ini_str = ini_close()
	exit;
}
function scr_write_rank(level)
{
	var _rank = ini_read_string("Ranks", level, "d")
	var _map = ds_map_create()
	ds_map_set(_map, "d", 0)
	ds_map_set(_map, "c", 1)
	ds_map_set(_map, "b", 2)
	ds_map_set(_map, "a", 3)
	ds_map_set(_map, "s", 4)
	ds_map_set(_map, "p", 5)
	if (ds_map_find_value(_map, global.rank) >= ds_map_find_value(_map, _rank))
		ini_write_string("Ranks", level, global.rank)
	ds_map_destroy(_map)
}
