if (!spanwed_score && save_exists)
{
	spanwed_score = true
	alarm[1] = 60
	with instance_create(x, bbox_top, obj_gatescore)
		number = other.save_data.score_num
}
