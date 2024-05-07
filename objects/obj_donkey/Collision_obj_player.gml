if (cooldown == 0)
{
	scr_soundeffect(sfx_cowkick)
	other.x = (x - (image_xscale * 35))
	other.y = y
	sprite_index = spr_cowkick
	image_index = 0
	with (other)
	{
		other.cooldown = 100
		sprite_index = spr_rockethitwall
		vsp = -11
		xscale = (-other.image_xscale)
		movespeed = 10
		image_index = 0
		state = states.slipbanan
		instance_create(x, y, obj_bangeffect)
	}
}
