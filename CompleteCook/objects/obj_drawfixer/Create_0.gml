if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}
depth = -7
finisher_alpha = 0
kidsparty_lightning = 0
dark_lightning = 0
flash = 0
surf = surface_create(960, 540)
surface_set_target(surf)
draw_clear_alpha(c_black, 0)
surface_reset_target()
surf2 = surface_create(960, 540)
surface_set_target(surf2)
draw_clear_alpha(c_black, 0)
surface_reset_target()
bg_alpha = 0.7
circle_alpha_out = 0.4
circle_alpha_in = 1
circle_size_out = 178
circle_size_in = 128
use_dark = 0
dark_arr = ["Tiles_1", "Tiles_2", "Tiles_3", "Tiles_4"]
objdark_arr = [obj_followcharacter, obj_metalblock, obj_destructibles, obj_collect, obj_bigcollect, obj_giantcollect, obj_secretportal]
