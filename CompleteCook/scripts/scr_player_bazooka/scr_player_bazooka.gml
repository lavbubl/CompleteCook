function scr_player_bazooka()
{
	hsp = movespeed * xscale
	var spd = key_up ? 0.5 : 1
	vsp = Approach(vsp, 0, spd)
	movespeed = Approach(movespeed, 0, 0.2)
	image_speed = 0.35
	if ((floor(image_index) == 7 or vsp >= 0) && sprite_index != spr_playerV_bazooka)
	{
		image_index = 0
		sprite_index = spr_playerV_bazooka
	}
	if (floor(image_index) == 12 && sprite_index == spr_playerV_bazooka)
	{
		jumpAnim = 1
		jumpstop = 1
		hsp = -10 * xscale
		movespeed = -10
		vsp = -6
		with (instance_create(x + (xscale * 10), y, obj_vigilantebazooka))
			image_xscale = other.xscale
		state = states.jump
	}
}