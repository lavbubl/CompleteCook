with other
{
    global.combo.timer = 60
	
	movespeed = 0
	hsp = 0
	vsp = 0
	state = states.actor
	
	if other.visible
	{
		other.visible = false
		image_speed = 0.35
		reset_anim(spr_player_keyget)
		scr_sound(sfx_collecttoppin)
	}
	
	if anim_ended()
	{
		instance_destroy(other)
		state = states.normal
		haskey = true
		instance_create(other.x, other.y, obj_keyfollow)
	}
}
