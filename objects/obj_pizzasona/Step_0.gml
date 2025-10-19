otherindex += 0.35;

if (x != obj_player.x)
{
	image_xscale = sign(obj_player.x - x);
}

switch (state)
{
	case states.normal:
		sprite_index = idlespr;
		break;
	case states.throwing:
		if anim_ended()
		{
			image_index = image_number - 1;
		}
		if (floor(image_index) >= 3)
		{
			if !throwingcollects
			{
				alarm[1] = 1
				throwingcollects = true
			}
			if scoretogive == 0
			{
				state = states.transition;
				sprite_index = transitionspr;
				image_index = 0;
			}
		}
		break;
	case states.transition:
		if anim_ended()
		{
			state = states.jump;
			sprite_index = idlespr;
			movespeed = 4;
			with create_ghost_obj()
				y = other.adjusted_y
			with create_ghost_obj() //platform ghost
			{
				sprite_index = spr_movingplatform
				image_index = other.otherindex
				x = other.x - 49
				y = other.adjusted_y + 46
			}
		}
		break;
	case states.jump:
		movespeed += 0.25;
		y -= movespeed;
		if (y < -500)
			instance_destroy();
		break;
}

adjusted_y = y - 42