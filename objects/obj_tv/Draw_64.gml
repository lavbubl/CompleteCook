draw_sprite(spr_tv_c_ghost, combo.ghost.image_index, x + combo.ghost.x, y + combo.ghost.y + 147)
draw_sprite(spr_tv_c_bubble, 0, x + combo.x, y + combo.y + 157)

var _tx = x + combo.x - 64
var _ty = y + combo.y + 174
draw_set_align(fa_left, fa_bottom)
draw_reset_color()
draw_set_font(global.combo.font)
var _str = string(global.combo.count)
var num = string_length(_str)
for (var i = num; i > 0; i--)
{
	var char = string_char_at(_str, i)
	draw_text(_tx, _ty, char)
	_tx -= 22
	_ty -= 8
}

draw_sprite(spr_tv_bg, 0, x, y)
draw_self()

if state == tv_states.transition
	draw_sprite(spr_tv_trans, t_index, x, y)
