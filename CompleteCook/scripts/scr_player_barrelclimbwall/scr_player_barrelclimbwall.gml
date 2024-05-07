function scr_player_barrelclimbwall()
{
	move = (key_left + key_right)
	hsp = 0
	if (sprite_index == spr_player_barrelslipnslide && floor(image_index) == (image_number - 1))
		sprite_index = spr_player_barrelroll
	if (!key_attack)
	{
		movespeed = 0
		state = states.barreljump
		sprite_index = spr_player_barrelfall
	}
	if (grounded && vsp > 0)
	{
		state = states.barrelslide
		if scr_solid((x + xscale), y)
			xscale *= -1
		movespeed = (xscale * 10)
	}
	with (instance_place(x, (y + vsp), obj_destructibles))
		instance_destroy()
	with (instance_place(x, (y + vsp), obj_baddie))
	{
		if destroyable
			instance_destroy()
	}
	exit;
}

