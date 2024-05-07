with (other)
{
	if (state != states.rocket && state != states.actor && state != states.rocketslide && state != states.gotoplayer)
	{
		xscale = other.image_xscale
		state = states.rocket
		tv_push_prompt_once(tv_create_prompt("This is the rocket transformation text", tvprompt.transfo, spr_tv_rocket, 3), "rocket")
		sprite_index = spr_rocketstart
		image_index = 0
		if (movespeed < 8)
			movespeed = 8
		x = other.x
		y = (other.y + 4)
	}
}
