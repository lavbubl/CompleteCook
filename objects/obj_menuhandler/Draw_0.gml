for (var i = 0; i < array_length(tvs); i++) 
{
    var cur_tv = tvs[i]
	
	with cur_tv
	{
		if sprite_index != noone
			draw_sprite(sprite_index, image_index, x, y)			 //image_speed
		image_index = wrap(sprite_get_number(sprite_index), image_index + 0.35)
	}
}
