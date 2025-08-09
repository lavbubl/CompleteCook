function tv_expression(spr)
{
	switch (spr)
	{
		case spr_tv_idle:
			state_togo = tv_states.normal
			break;
		case spr_tv_hurt:
		case spr_tv_collect:
			state_togo = tv_states.expr
			alarm[0] = 120
			expr_sprite = spr
			if spr == spr_tv_collect && irandom(100) >= 50
				scr_sound_pitched(choose(v_pep_shuk, v_pep_paranoid, v_pep_paParanoid), 0.9, 1.1)
			break;
		default:
			state_togo = tv_states.expr
			expr_sprite = spr
			break;
	}
	state = tv_states.transition
	t_index = 0
}

function tv_do_transfos(_state)
{
	var _tv_spr = spr_tv_idle
	switch _state
	{
		default:
			return;
			break;
		case states.fireass:
			_tv_spr = spr_tv_fireass
			break;
		case states.ball:
			_tv_spr = spr_tv_ball
			break;
	}
	sprite_index = _tv_spr
}
