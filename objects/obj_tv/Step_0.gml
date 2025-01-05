switch (state)
{
	case tv_states.normal:
		sprite_index = spr_tv_idle
		if (obj_player.state == states.mach3)
			tv_expression(spr_tv_mach3)
		break;
	case tv_states.transition:
		if t_index + 0.35 < sprite_get_number(spr_tv_trans)
			t_index += 0.35
		else
		{
			state = state_togo
			sprite_index = expr_sprite
		}
		break;
	case tv_states.expr:
		if (obj_player.state != states.mach3)
			tv_expression(spr_tv_idle)
		break;
}

switch (combo.state)
{
	case -1:
		combo.vsp = 0
		combo.y = approach(combo.y, -500, 4)
		if (combo_val)
			combo.state++
		break;
	case 0:
		combo.vsp += 0.5
		combo.y += combo.vsp
		if (combo.y >= 20)
			combo.state++
		break;
	case 1:
		combo.y = lerp(combo.y, 0, 0.05)
		if (combo.y < 1)
		{
			combo.y = 0
			combo.vsp = 0
			combo.state++
		}
		break;
}

combo.x = wave(-10, 10, 2, 20)
combo.ghost.x = combo.x
combo.ghost.y = combo.y
combo.ghost.image_index += 0.35
combo.ghost.image_index = wrap(sprite_get_number(spr_tv_c_ghost), combo.ghost.image_index)

if (!combo_val)
	combo.state = -1
