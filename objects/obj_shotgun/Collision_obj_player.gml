if other.state == states.grab || other.state == states.punch
{
	fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/breakblock", x, y)
	fmod_studio_event_instance_oneshot_3d("event:/sfx/player/shotgunload", x, y)
	with other
	{
		reset_anim(spr_player_shotgun_pickup)
		image_speed = 0.35
		state = states.actor
		has_shotgun = true
		hsp = 0
		vsp = 0
		movespeed = 0
	}
	instance_destroy()
}
