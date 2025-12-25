if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	repeat 2
    {
        with create_debris(x + random_range(0, sprite_width), y + random_range(0, sprite_height), particlespr)
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
        }
    }
    
    if (particlespr == spr_destroyable_debris)
        create_effect(x + random_range(0, sprite_width), y + random_range(0, sprite_height), spr_destroyable_smoke)
	
	sleep(5)
    scr_sound_3d(choose(sfx_breakblock1, sfx_breakblock2), x, y)
	tile_layer_delete_at(bbox_left, bbox_top)
	if makecracks
	{
		var c = instance_create(bbox_left, bbox_bottom, obj_cutoff)
		c.image_yscale = -1
		c.image_angle = 90
		instance_create(bbox_left, bbox_top, obj_cutoff).image_yscale = -1
		instance_create(bbox_right, bbox_bottom, obj_cutoff).image_angle = 90
		instance_create(bbox_left, bbox_bottom, obj_cutoff)
	}
	ds_list_add(global.ds_saveroom, id)
}
