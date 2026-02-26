image_alpha = global.panic.active ? 1 : 0.5

if sprite_index == spr_pizzaportalend
{
	with obj_player
	{
		x = other.x
		y = other.y
		hsp = 0
		vsp = 0
	}
}
