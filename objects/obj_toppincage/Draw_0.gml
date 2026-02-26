draw_self()
draw_sprite(spr_toppincage_help, help_ix, x, y);

help_ix += image_speed
if help_ix >= sprite_get_number(spr_toppincage_help)
	help_ix = 0
