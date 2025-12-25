var saved_death = ds_list_find_index(global.ds_saveroom, id) != -1
var tile_size = 64
var o = tile_size / 2

for (var xx = bbox_left; xx < bbox_right; xx += tile_size)
{
	for (var yy = bbox_top; yy < bbox_bottom; yy += tile_size)
	{
		tile_layer_delete_at(xx, yy)
		tile_layer_delete_at(xx + o, yy)
		tile_layer_delete_at(xx, yy + o)
		tile_layer_delete_at(xx + o, yy + o)
		
		if makecracks
		{
			var c = instance_create(xx, yy + tile_size, obj_cutoff_big)
			c.image_yscale = -1
			c.image_angle = 90
			instance_create(xx, yy, obj_cutoff_big).image_yscale = -1
			instance_create(xx + tile_size, yy + tile_size, obj_cutoff_big).image_angle = 90
			instance_create(xx, yy + tile_size, obj_cutoff_big)
		}
		
		if !saved_death
		{
			repeat 8
			{
				with create_debris(xx + random_range(0, 64), yy + random_range(0, 64), particlespr)
				{
				    hsp = random_range(-5, 5)
				    vsp = random_range(-10, 10)
				    image_index = random_range(0, (image_number - 1))
				}
			}
		}
	}
}

if !saved_death
{
    sleep(5)
    particle_create(obj_player.x, obj_player.y, particles.bang)
	shake_camera(20, 40 / room_speed)
    scr_sound(sfx_breakmetal)
    ds_list_add(global.ds_saveroom, id)
}
