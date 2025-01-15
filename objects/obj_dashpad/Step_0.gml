collide()

image_blend = available ? c_white : c_gray

if (place_meeting(x, y, obj_player) && available)
{
	with obj_player
	{
		state = states.mach3
		reset_anim(spr_player_dashpad)
		var h = bbox_bottom - y
		x = other.x + 32
		y = other.y - h
		xscale = sign(other.image_xscale)
		vsp = 0
		
		if (movespeed < 14)
			movespeed = 14
		else
			movespeed += 0.5
	}
	
	scr_sound(sfx_dashpad)
	available = false
	alarm[0] = 30
}
