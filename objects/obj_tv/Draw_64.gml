draw_sprite(spr_tv_c_ghost, combo.ghost.image_index, x + combo.ghost.x, y + combo.ghost.y + 147)
draw_sprite(spr_tv_c_bubble, 0, x + combo.x, y + combo.y + 157)

draw_self()

if state == tv_states.transition
	draw_sprite(spr_tv_trans, t_index, x, y)
