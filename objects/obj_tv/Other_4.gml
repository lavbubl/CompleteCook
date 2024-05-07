if (special_prompts == -4 && room != Realtitlescreen && room != characterselect)
{
	special_prompts = ds_map_create()
	ini_open(concat("saveData", global.currentsavefile, ".ini"))
	ds_map_set(special_prompts, "knight", ini_read_real("Prompts", "knight", 0))
	ds_map_set(special_prompts, "boxxedpep", ini_read_real("Prompts", "boxxedpep", 0))
	ds_map_set(special_prompts, "mort", ini_read_real("Prompts", "mort", 0))
	ds_map_set(special_prompts, "squished", ini_read_real("Prompts", "squished", 0))
	ds_map_set(special_prompts, "skateboard", ini_read_real("Prompts", "skateboard", 0))
	ds_map_set(special_prompts, "cheeseball", ini_read_real("Prompts", "cheeseball", 0))
	ds_map_set(special_prompts, "shotgun", ini_read_real("Prompts", "shotgun", 0))
	ds_map_set(special_prompts, "ghost", ini_read_real("Prompts", "ghost", 0))
	ds_map_set(special_prompts, "firemouth", ini_read_real("Prompts", "firemouth", 0))
	ds_map_set(special_prompts, "fireass", ini_read_real("Prompts", "fireass", 0))
	ds_map_set(special_prompts, "bombpep", ini_read_real("Prompts", "bombpep", 0))
	ds_map_set(special_prompts, "rocket", ini_read_real("Prompts", "rocket", 0))
	ini_close()
}
if (room == Realtitlescreen)
{
	if (special_prompts != -4)
		ds_map_destroy(special_prompts)
	special_prompts = -4
}
if (room == entrance_1)
{
	global.srank = 11500
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == medieval_1 && global.snickchallenge == 0)
{
	global.srank = 10300
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == chateau_1)
{
	global.srank = 9300
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == ruin_1 && global.snickchallenge == 0)
{
	global.srank = 11200
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == ufo_1)
{
	global.srank = 10950
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == desert_1)
{
	global.srank = 13400
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == farm_1)
{
	global.srank = 10300
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == graveyard_1)
{
	global.srank = 11855
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == dungeon_1 && global.snickchallenge == 0)
{
	global.srank = 10300
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == strongcold_10 && global.snickchallenge == 0)
{
	global.srank = 9000
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == dragonlair_1)
{
	global.srank = 4500
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == beach_1)
{
	global.srank = 14000
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == forest_1)
{
	global.srank = 14000
	global.arank = (global.srank - (global.srank / 4))
	global.brank = (global.srank - ((global.srank / 4) * 2))
	global.crank = (global.srank - ((global.srank / 4) * 3))
}
if (room == custom_lvl_room)
	alarm[1] = 4
