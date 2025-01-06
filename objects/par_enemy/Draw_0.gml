depth = -50

var _x = x
var _y = y

if (obj_player.state = states.piledriver && follow_player)
{
	_y += 48
	if obj_player.sprite_index == spr_player_piledriver
	{
		_x += pd_frame_offset[floor(obj_player.image_index)] * 8 * obj_player.xscale
		if (obj_player.image_index > 5)
			depth = -210
	}
}

if (obj_player.state = states.swingding && follow_player)
{
	if obj_player.sprite_index == spr_player_swingding
	{
		_x += pd_frame_offset[floor(obj_player.image_index)] * 24 * obj_player.xscale
		if (obj_player.image_index > 5)
			depth = -210
	}
}

draw_sprite_ext(sprite_index, image_index, _x, _y, xscale - (warp * xscale), yscale + warp, image_angle, image_blend, image_alpha)

if (flash)
{
	shader_set(shd_flash)
	draw_sprite_ext(sprite_index, image_index, _x, _y, xscale - (warp * xscale), yscale + warp, image_angle, image_blend, image_alpha)
	shader_reset()
}
