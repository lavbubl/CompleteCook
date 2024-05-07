with (other)
{
	/*
	if (character == "V")
		scr_hurtplayer(object_index)
	else
	*/
	if scr_transformationcheck()
	{
		if (state != states.firemouth && state != states.parry && hurted == 0)
		{
			tv_push_prompt_once(tv_create_prompt("This is the firemouth transformation text", tvprompt.transfo, spr_tv_firemouth, 3), "firemouth")
			is_firing = 0
			hsp = 0
			movespeed = 0
			state = states.firemouth
			image_index = 0
			sprite_index = spr_firemouthintro
			state = states.firemouth
			bombpeptimer = 3
			instance_destroy(other)
		}
	}
}
