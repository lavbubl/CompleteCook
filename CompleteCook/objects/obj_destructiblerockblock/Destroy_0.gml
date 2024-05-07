if (ds_list_find_index(global.saveroom, id) == -1)
{
	scr_rockblock_tag()
	if place_meeting((x + 1), y, obj_rockblock)
	{
		with (instance_place((x + 1), y, obj_rockblock))
		{
			timer = other.timer
			alarm[1] = timer
		}
	}
	if place_meeting((x - 1), y, obj_rockblock)
	{
		with (instance_place((x - 1), y, obj_rockblock))
		{
			timer = other.timer
			alarm[1] = timer
		}
	}
	if place_meeting(x, (y + 1), obj_rockblock)
	{
		with (instance_place(x, (y + 1), obj_rockblock))
		{
			timer = other.timer
			alarm[1] = timer
		}
	}
	if place_meeting(x, (y - 1), obj_rockblock)
	{
		with (instance_place(x, (y - 1), obj_rockblock))
		{
			timer = other.timer
			alarm[1] = timer
		}
	}
	if place_meeting((x + 1), y, obj_destructiblerockblock)
	{
		with (instance_place((x + 1), y, obj_destructiblerockblock))
		{
			timer = other.timer
			alarm[1] = timer
		}
	}
	if place_meeting((x - 1), y, obj_destructiblerockblock)
	{
		with (instance_place((x - 1), y, obj_destructiblerockblock))
		{
			timer = other.timer
			alarm[1] = timer
		}
	}
	if place_meeting(x, (y + 1), obj_destructiblerockblock)
	{
		with (instance_place(x, (y + 1), obj_destructiblerockblock))
		{
			timer = other.timer
			alarm[1] = timer
		}
	}
	if place_meeting(x, (y - 1), obj_destructiblerockblock)
	{
		with (instance_place(x, (y - 1), obj_destructiblerockblock))
		{
			timer = other.timer
			alarm[1] = timer
		}
	}
	repeat (6)
		create_debris((x + 32), (y + 32), spr_tntblockdebris)
	ds_list_add(global.saveroom, id)
}
