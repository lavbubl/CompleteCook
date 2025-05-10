image_blend = c_white

if sprite_index == spr_player_walkfront
	image_blend = make_color_hsv(0, 0, (1 - ((image_number - image_index) / image_number)) * 255)

image_alpha = 1

if (i_frames > 0 && state != states.hurt)
	image_alpha = round(wave(0, 1, 0.01, 0))

if pal_select == 12
	pattern_draw(sprite_index, image_index, x, y, pattern_spr, xscale * visual_size, image_yscale * visual_size, image_angle, image_blend, image_alpha)

pal_swap_set(pal_peppino, pal_select, false)
draw_sprite_ext(sprite_index, image_index, x, y, xscale * visual_size, image_yscale * visual_size, image_angle, image_blend, image_alpha)
pal_swap_reset()

if flash > 0
{
	shader_set(shd_flash)
	draw_sprite_ext(sprite_index, image_index, x, y, xscale * visual_size, image_yscale * visual_size, image_angle, image_blend, image_alpha)
	shader_reset()
}
