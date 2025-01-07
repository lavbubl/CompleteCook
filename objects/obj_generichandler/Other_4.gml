ds_list_clear(global.col_obj_list)
ds_list_clear(global.ds_hurt_boxes)

var o = 0
repeat (array_length(solids_to_add))
{
	with (solids_to_add[o])
	    ds_list_add(global.col_obj_list, id)
	o++
}
