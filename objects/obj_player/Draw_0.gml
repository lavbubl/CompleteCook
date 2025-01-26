image_blend = c_white

if (sprite_index == spr_player_exitdoor)
	image_blend = make_color_hsv(0, 0, (1 - ((image_number - image_index) / image_number)) * 255)

image_alpha = 1

if (i_frames > 0 && state != states.hurt)
	image_alpha = round(wave(0, 1, 0.01, 0))

draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha)

if (flash > 0)
{
	shader_set(shd_flash)
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha)
	shader_reset()
}
