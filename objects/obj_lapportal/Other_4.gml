if ds_list_find_index(global.ds_saveroom, id) != -1
{
	instance_destroy();
	exit;
}

ini_open($"saves/saveData{global.savefile}.ini"); //note, truncate $"saves/saveData{global.savefile}.ini" to global.savestring
if ini_read_real(global.level_data.level_name, "score", 0) == 0
	sprite_index = spr_pizzaportal_outline;
ini_close();
