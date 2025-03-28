if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	repeat 8
    {
        with create_debris(x + random_range(0, 64), y + random_range(0, 64), spr_destroyable_debris)
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
			image_speed = 0.35
        }
    }
    repeat 3
        create_effect(x + random_range(0, sprite_width), y + random_range(0, sprite_height), spr_destroyable_smoke)
	sleep(5)
	scr_sound_3d(sfx_bumpwall, x, y)
	ds_list_add(global.ds_saveroom, id)
}
