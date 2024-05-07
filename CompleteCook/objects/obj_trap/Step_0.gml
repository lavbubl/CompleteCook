with (obj_trapghost)
{
	if (point_distance(obj_player1.x, obj_player1.y, other.x, other.y) < other.ghost_distance_threshold && (state == states.normal or trapid == noone or (point_distance(obj_player1.x, obj_player1.y, trapid.x, trapid.y) > point_distance(obj_player1.x, obj_player1.y, other.x, other.y) && trapid.object_index != obj_tvtrap)))
	{
		state = states.transitioncutscene
		trapid = other.id
	}
}
