depth = -50

var xx = x
var yy = y

if hitstun > 0
{
	var range = 5
	xx += irandom_range(-range, range)
	yy += irandom_range(-range, range)
}

if state == states.stun && !vulnerable
	image_alpha = wave(1, 0.5, 0.5, 0)
else
	image_alpha = 1

draw_sprite_ext(sprite_index, image_index, xx, yy, xscale - (warp * xscale), yscale + warp, image_angle, image_blend, image_alpha)

if flash || (vulnerable && round(wave(0, 1, 0.25, 0)) == 1)
{
	shader_set(shd_flash)
	draw_sprite_ext(sprite_index, image_index, xx, yy, xscale - (warp * xscale), yscale + warp, image_angle, image_blend, image_alpha)
	shader_reset()
}
