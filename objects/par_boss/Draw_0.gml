depth = -50

var _x = x
var _y = y

draw_sprite_ext(sprite_index, image_index, _x, _y, xscale - (warp * xscale), yscale + warp, image_angle, image_blend, image_alpha)

if (flash)
{
	shader_set(shd_flash)
	draw_sprite_ext(sprite_index, image_index, _x, _y, xscale - (warp * xscale), yscale + warp, image_angle, image_blend, image_alpha)
	shader_reset()
}
