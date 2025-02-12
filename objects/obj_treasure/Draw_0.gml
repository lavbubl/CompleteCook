var o = 0

if collected
{
	draw_sprite(spr_taunteffect, 4, x, y)
	o = -50
}

draw_sprite(sprite_index, image_index, x, y + o)
