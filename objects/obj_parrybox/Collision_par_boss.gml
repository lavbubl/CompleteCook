if !other.hurtplayer
	exit;

with obj_player
{
	state = states.parry
	var ix = irandom_range(1, 3)
	reset_anim(asset_get_index($"spr_player_parry{ix}"))
	movespeed = -5
	flash = 10
	particle_create(x, y, particles.parry)
}

with other
{
	var xh = lerp(bbox_left, bbox_right, 0.5)
	obj_player.xscale = x - xh > 0 ? 1 : -1
	
	particle_create(x, y, particles.parry)
}

event_user(0)
