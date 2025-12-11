with other {
	if instance_exists(other.baddieID) && state != states.ball {
		state = states.ball
		xscale = other.image_xscale
		movespeed = 10
		vsp = 0
		sprite_index = spr_playerP_ball
	}
}