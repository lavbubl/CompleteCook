depth = -1

pattern_draw(sprite_index, image_index, x, y, obj_player.pattern_spr, image_xscale, image_yscale)

pal_swap_set(pal_peppino, obj_player.pal_select, false)
draw_self()
pal_swap_reset()
