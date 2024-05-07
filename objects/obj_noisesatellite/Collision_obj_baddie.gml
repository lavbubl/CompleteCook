with (other)
{
	if ((other.state == states.stun && other.thrown == true) or (other.state == states.grabbed && obj_player.state == states.superslam))
		instance_destroy()
}
