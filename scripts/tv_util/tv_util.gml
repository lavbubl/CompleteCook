function tv_expression(spr)
{
	switch (spr)
	{
		case spr_tv_idle:
			state_togo = tv_states.normal
			break;
		default:
			state_togo = tv_states.expr
			expr_sprite = spr
			break;
	}
	state = tv_states.transition
	t_index = 0
}