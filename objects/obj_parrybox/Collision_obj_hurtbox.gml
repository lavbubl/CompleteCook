if other.inactive
	exit;

with other
{
	var xh = lerp(bbox_left, bbox_right, 0.5)
	obj_player.xscale = x - xh > 0 ? 1 : -1
	
	if (follow_obj != -4)
	{
		if enemy_can_die(follow_obj)
		{
			with follow_obj
			{
				sprite_index = sprs.stun
				do_enemygibs()
				shake_camera(3, 3 / room_speed)
				scr_sound_3d(sfx_punch, x, y)
				
				alarm[0] = 5
			}
			
			instance_destroy()
		}
	}
	
	if object_index == obj_pizzardelectricity
	{
		image_xscale *= -1
		hurtplayer = false
	}
}

event_user(0)
