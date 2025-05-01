if other.inactive
	exit;

with obj_player
{
	state = states.parry
	var ix = irandom_range(1, 3)
	reset_anim(asset_get_index($"spr_player_parry{ix}"))
	movespeed = -5
}

with other
{
	var xh = lerp(bbox_left, bbox_right, 0.5)
	obj_player.xscale = x - xh > 0 ? 1 : -1
	
	if (follow_obj != -4)
	{
		if enemy_can_die(follow_obj)
		{
			particle_create(xh, follow_obj.y + 20, particles.genericpoof)
			particle_create(xh, follow_obj.y + 20, particles.parry)
			
			instance_destroy(follow_obj)
			
			instance_destroy()
		}
	}
	else
		particle_create(x, y, particles.parry)
	
	if object_index == obj_pizzardelectricity
	{
		image_xscale *= -1
		hurtplayer = false
	}
}
			
sleep(50)
scr_sound_pitched(sfx_parry)
instance_destroy()