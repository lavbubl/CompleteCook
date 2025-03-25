depth = -200

pal_swap_set(pal_combo, global.combo.wasted ? 1 : 2, false)
draw_sprite(spr_tv_c_ghost, combo.ghost.image_index, x + combo.ghost.x, y + combo.ghost.y + 117)
pal_swap_reset()

draw_sprite(spr_tv_c_bubble, 0, x + combo.x, y + combo.y + 117)

var _tx = x + combo.x - 64
var _ty = y + combo.y + 105
draw_set_align(fa_left, fa_top)
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

if obj_player.pal_select == 12
	pattern_draw(sprite_index, image_index, x, y, obj_player.pattern_spr, image_xscale, image_yscale)

pal_swap_set(pal_peppino, obj_player.pal_select, false)
draw_self()
pal_swap_reset()

if state == tv_states.transition
	draw_sprite(spr_tv_trans, t_index, x, y)
