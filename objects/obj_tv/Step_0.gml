var p = obj_player

visible = hud_get_visible()

if !visible
	state = tv_states.off
	
if global.boss_room
	visible = false

switch (state)
{
	case tv_states.off:
		sprite_index = spr_tv_off
		if !visible
			image_index = 0
		if anim_ended()
			state = tv_states.normal
		break;
	case tv_states.normal:
		if p.has_shotgun
			sprite_index = spr_tv_shotgun
		else if global.panic.active
			sprite_index = spr_tv_panic
		else if global.combo.count >= 50
			sprite_index = spr_tv_highcombo
		else if global.combo.count >= 3
			sprite_index = spr_tv_combo
		else if sprite_index != spr_tv_idleangry && sprite_index != spr_tv_idlelook
			sprite_index = spr_tv_idle
		
		tv_do_transfos(p.state)
		
		if idletimer > 0
			idletimer--
		else if sprite_index == spr_tv_idle
		{
			idletimer = 240
			reset_anim(choose(spr_tv_idleangry, spr_tv_idlelook))
		}
		
		if anim_ended() && (sprite_index == spr_tv_idleangry || sprite_index == spr_tv_idlelook)
			sprite_index = spr_tv_idle
		
		if p.state == states.mach3
		{
			if (abs(obj_player.hsp) >= 16)
				tv_expression(spr_tv_mach4)
			else
				tv_expression(spr_tv_mach3)
		}
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
		switch (sprite_index)
		{
			case spr_tv_mach3:
				if (p.state != states.mach3 && p.state != states.climbwall && p.sprite_index != spr_player_machslideboost3)
					tv_expression(spr_tv_idle)
				if (abs(obj_player.hsp) >= 16 && p.state == states.mach3)
					tv_expression(spr_tv_mach4)
				break;
			case spr_tv_mach4:
				if (obj_player.state != states.mach3 && p.state != states.climbwall)
					tv_expression(spr_tv_idle)
				if (abs(obj_player.hsp) < 16)
					tv_expression(spr_tv_mach3)
				break;
			case spr_tv_hurt:
				if p.state == states.hurt
					alarm[0] = 120
				break;
		}
		break;
}

switch (combo.state)
{
	case -1:
		combo.vsp = 0
		combo.y = approach(combo.y, -500, 4)
		if global.combo.count > 0
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
	case 2:
		var resetpoint = 0
		if (global.combo.timer >= 30)
			resetpoint = 0
		else if (global.combo.timer >= 15)
			resetpoint = 3
		else
			resetpoint = 7
		combo.vsp += 0.25
		combo.y += combo.vsp
		if (combo.y > 0)
		{
			combo.y = -resetpoint
			combo.vsp = 0
		}
		break;
}

combo.x = wave(-10, 10, 2, 20)
combo.ghost.x = lerp(combo.ghost.x, combo.x - 56 + ((global.combo.timer / 60) * 115), 0.5)
combo.ghost.y = combo.y
combo.ghost.image_index = wrap(sprite_get_number(spr_tv_c_ghost), combo.ghost.image_index + 0.35)

if global.combo.timer <= 0
	combo.state = -1

var y_goto = ystart
if (obj_player.x > room_width - 250 && obj_player.y < 175)
	y_goto = -500
	
y = approach(y, y_goto, 25)
