if !other.has_shotgun
	exit;

other.has_shotgun = false

with other
{
	with instance_create(x, y, obj_enemycorpse)
	{
		sprite_index = spr_shotgun_debris
		hsp = 0
		vsp = random_range(-10, -14)
	}

	scr_sound_3d(sfx_outtransfo, x, y)
	
	if state == states.shotgunshoot
		state = states.normal
}
