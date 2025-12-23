if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	repeat (8 * max(abs(image_xscale), abs(image_yscale)))
    {
        with create_debris(x + random_range(0, sprite_width), y + random_range(0, sprite_height), particlespr)
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
            image_index = random_range(0, image_number - 1)
            image_speed = 0
        }
    }
	
	sleep(5)
    scr_sound_3d(choose(sfx_breakblock1, sfx_breakblock2), x, y)
	
	ds_list_add(global.ds_saveroom, id)
}

var tile_size = 32

for (var xx = x; xx < bbox_right; xx += tile_size)
{
	for (var yy = y; yy < bbox_bottom; yy += tile_size)
	{
		tile_layer_delete_at(xx, yy)
		tile_layer_delete_at(xx + 32, yy)
		tile_layer_delete_at(xx, yy + 32)
		tile_layer_delete_at(xx + 32, yy + 32)
	}
}
