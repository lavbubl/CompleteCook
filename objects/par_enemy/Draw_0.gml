depth = -50

var _x = x
var _y = y

if state == states.hit || (obj_player.state == states.punchenemy && follow_player)
	_y -= 20

if alarm[0] >= 0
{
	var range = 5
	_x += irandom_range(-range, range)
	_y += irandom_range(-range, range)
}

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

if state == states.stun && stun_timer >= 100
{
	draw_sprite(spr_enemybird, bird_ix, x, y - 40)
	bird_ix = wrap(sprite_get_number(spr_enemybird), bird_ix + 0.35)
}
else
	bird_ix = 0

draw_sprite_ext(sprite_index, image_index, _x, _y, xscale - (warp * xscale), yscale + warp, image_angle, image_blend, image_alpha)

if (flash)
{
	shader_set(shd_flash)
	draw_sprite_ext(sprite_index, image_index, _x, _y, xscale - (warp * xscale), yscale + warp, image_angle, image_blend, image_alpha)
	shader_reset()
}
