if follow
{
	move_towards_point(obj_player.x, obj_player.y, movespeed);
	movespeed++;
}
else if distance_to_object(obj_player) < 25
	follow = true;