function tv_expression(spr)
{
	switch (spr)
	{
		case spr_tv_idle:
			state_togo = tv_states.normal
			break;
		case spr_tv_hurt:
		case spr_tv_bighurt1:
		case spr_tv_bighurt2:
		case spr_tv_bighurt3:
		case spr_tv_bighurt4:
		case spr_tv_bighurt5:
		case spr_tv_bighurt6:
		case spr_tv_bighurt7:
		case spr_tv_bighurt8:
		case spr_tv_bighurt9:
		case spr_tv_bighurt10:
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

function asset_tv_reset(_letter)
{
	spr_tv_idle = asset_player_get("idle", _letter, "spr_tv")
	spr_tv_idle1 = asset_player_get("idle1", _letter, "spr_tv")
	spr_tv_idle2 = asset_player_get("idle2", _letter, "spr_tv")
	spr_tv_mach3 = asset_player_get("mach3", _letter, "spr_tv")
	spr_tv_mach4 = asset_player_get("mach4", _letter, "spr_tv")
	spr_tv_collect = asset_player_get("collect", _letter, "spr_tv")
	spr_tv_combo = asset_player_get("combo", _letter, "spr_tv")
	spr_tv_highcombo = asset_player_get("highcombo", _letter, "spr_tv")
	spr_tv_panic = asset_player_get("panic", _letter, "spr_tv")
	spr_tv_hurt = asset_player_get("hurt", _letter, "spr_tv")
	spr_tv_bighurt1 = asset_player_get("bighurt1", _letter, "spr_tv")
	spr_tv_bighurt2 = asset_player_get("bighurt2", _letter, "spr_tv")
	spr_tv_bighurt3 = asset_player_get("bighurt3", _letter, "spr_tv")
	spr_tv_bighurt4 = asset_player_get("bighurt4", _letter, "spr_tv")
	spr_tv_bighurt5 = asset_player_get("bighurt5", _letter, "spr_tv")
	spr_tv_bighurt6 = asset_player_get("bighurt6", _letter, "spr_tv")
	spr_tv_bighurt7 = asset_player_get("bighurt7", _letter, "spr_tv")
	spr_tv_bighurt8 = asset_player_get("bighurt8", _letter, "spr_tv")
	spr_tv_bighurt9 = asset_player_get("bighurt9", _letter, "spr_tv")
	spr_tv_bighurt10 = asset_player_get("bighurt10", _letter, "spr_tv")
}
