if (!spanwed_score && save_exists)
{
	spanwed_score = true
	with instance_create(x, bbox_top, obj_gatescore)
	{
		number = other.score_num
		rank_ix = other.rank
	}
}
