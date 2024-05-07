with (other)
{
	if (state == states.handstandjump or state == states.lungeattack or state == states.punch)
	{
		image_index = 0
		sprite_index = spr_shotgunpullout
		scr_soundeffect(sfx_shotgungot)
		instance_destroy(other)
		shotgunAnim = 1
		state = states.shotgun
		tv_push_prompt_once(tv_create_prompt("This is the shotgun powerup text", tvprompt.transfo, spr_tv_shotgun, 3), "shotgun")
		global.heattime = 60
	}
}
