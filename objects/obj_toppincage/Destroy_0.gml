if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	var _pos_arr = [[0, -32], [0, 32], [-10, 0], [0, 0], [10, 0]]
	var _i = 0
	repeat 5
	{
		with create_debris(x + _pos_arr[_i][0], y + _pos_arr[_i][1], spr_toppincage_debris)
		{
			image_index = _i
			depth = -100
		}
		_i++
	}
	//scr_sound(sfx_breakblock)
	
    ds_list_add(global.ds_saveroom, id)
}
