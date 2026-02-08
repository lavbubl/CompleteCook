if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
    repeat 8
    {
        with (create_debris(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), spr_metalblockdebris))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
            image_speed = 0
            image_index = random_range(0, (image_number - 1))
        }
    }
    sleep(5)
    particle_create(x + 32, y + 32, particles.bang)
	shake_camera(20, 40 / room_speed)
    scr_sound(sfx_breakmetal)
    ds_list_add(global.ds_saveroom, id)
}