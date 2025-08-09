var saved_death = ds_list_find_index(global.ds_saveroom, id) != -1
var tile_size = 64

for (var xx = x; xx < bbox_right; xx += tile_size)
{
	for (var yy = y; yy < bbox_bottom; yy += tile_size)
	{
		tile_layer_delete_at(xx, yy)
		tile_layer_delete_at(xx + 32, yy)
		tile_layer_delete_at(xx, yy + 32)
		tile_layer_delete_at(xx + 32, yy + 32)
		
		if !saved_death
		{
			repeat 8
			{
				with create_debris(xx + random_range(0, 64), yy + random_range(0, 64), spr_eyedebris)
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
