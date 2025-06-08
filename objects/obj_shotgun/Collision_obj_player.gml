if other.state == states.grab || other.state == states.punch
{
	scr_sound_3d(choose(sfx_breakblock1, sfx_breakblock2), x, y)
	scr_sound_3d(sfx_shotgunload, x, y)
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
